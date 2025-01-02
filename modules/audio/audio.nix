{
    config,
    lib,
    pkgs,
    ...
}:
let
    output.options = with lib; {
        name = mkOption {
            type = types.str;
            default = "";
            description = "Name of the output to configure.";
        };
        volume = mkOption {
            type = types.int;
            default = 100;
            description = "Output volume precentage.";
        };
        virtual = mkOption {
            type = types.listOf (types.submodule output);
            default = [ ];
            description = "List of outputs that will link to the parrent.";
        };
        default = mkOption {
            type = types.bool;
            default = false;
            description = "Set an output to default.";
        };
    };
in
{
    imports = [ ../system/pipewire.nix ];
    options.audio = with lib; {
        enable = mkEnableOption "Enable general audio configuration.";

        outputs = mkOption {
            type = types.listOf (types.submodule output);
            default = [ ];
            description = "Audio output configuration.";
        };
    };

    config =
        let
            audio = config.audio;
        in
        with lib;
        mkIf audio.enable {
            hm.systemd.user.services.audio = {
                Install.WantedBy = [
                    "default.target"
                    "graphical-session.target"
                ];
                Service =
                    let
                        runtimeInputs = with pkgs; [
                            jq
                            pulseaudio
                        ];
                    in
                    {
                        RemainAfterExit = true;
                        ExecStart =
                            let
                                name = "audio";
                            in
                            with pkgs;
                            writeShellApplication {
                                inherit name runtimeInputs;
                                text = ''
                                    set_volume() {
                                        pactl set-sink-volume "$1" "$2%"
                                        return "$?"
                                    }

                                    set_default() {
                                        pactl set-default-sink "$1"
                                        return "$?"
                                    }

                                    create_virtual() {
                                        declare -r id=$(pactl load-module module-combine-sink sink_name="$1" slaves="$2")
                                        echo "$id" >> /run/user/"$(id -u)"/virtual-output-ids
                                    }

                                    get_json_element() {
                                        echo "$1" | jq -rc "$2"
                                    }

                                    process_output() {
                                        declare -r output="$1"

                                        declare -r sinkName=$(get_json_element "$output" ".name")
                                        declare -r volume=$(get_json_element "$output" ".volume")
                                        declare -r default=$(get_json_element "$output" ".default")

                                        set_volume "$sinkName" "$volume"

                                        if [[ "$default" == "true" ]]; then
                                            set_default "$sinkName"
                                        fi

                                        declare -r virtualOutputs=$(echo "$output" | jq -rc ".virtual[]?")
                                        for virtualOutput in $virtualOutputs; do
                                            declare virtualSinkName; virtualSinkName=$(get_json_element "$virtualOutput" ".name")
                                            create_virtual "$virtualSinkName" "$sinkName"
                                            process_output "$virtualOutput"
                                        done
                                    }

                                    main() {
                                        declare -r outputsJSON='${builtins.toJSON audio.outputs}'

                                        declare -r outputs=$(get_json_element "$outputsJSON" ".[]?")
                                        for output in $outputs; do
                                            process_output "$output"
                                        done
                                    }
                                    set -e
                                    main "$@"
                                '';
                            }
                            + "/bin/${name}";

                        ExecStop =
                            let
                                name = "audio-cleanup";
                            in
                            with pkgs;
                            writeShellApplication {
                                inherit name runtimeInputs;
                                text = ''
                                    idfile="/run/user/1000/virtual-output-ids"
                                    ids=$(cat $idfile)
                                    for id in $ids; do
                                        pactl unload-module "$id"
                                    done
                                    echo "" > $idfile
                                '';
                            }
                            + "/bin/${name}";
                    };
            };
        };
}
