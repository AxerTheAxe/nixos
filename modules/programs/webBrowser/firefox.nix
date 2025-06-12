{
    hostOptions,
    inputs,
    pkgs,
    ...
}:
{
    hm.programs.firefox = {
        enable = true;
        profiles.${hostOptions.user.userName} = {
            bookmarks = {
                force = true;
                settings = [
                    {
                        name = "Bookmarks";
                        toolbar = true;
                        bookmarks = [
                            {
                                name = "Youtube";
                                url = "https://www.youtube.com";
                            }

                            {
                                name = "ProtonMail";
                                url = "https://mail.proton.me";
                            }

                            {
                                name = "Gmail";
                                url = "https://mail.google.com/mail/u/0/#inbox";
                            }

                            {
                                name = "Codeberg";
                                url = "https://codeberg.org";
                            }

                            {
                                name = "GitHub";
                                url = "https://github.com";
                            }

                            {
                                name = "Minesweeper";
                                url = "https://minesweeper.online";
                            }
                        ];
                    }
                ];
            };

            extensions.packages = with inputs.firefox-addons.packages.${hostOptions.system.platform}; [
                ublock-origin
                bitwarden
                duckduckgo-privacy-essentials
                vimium
                firefox-color
                stylus
                indie-wiki-buddy
            ];

            search = {
                force = true;
                default = "ddg";
                engines = {
                    "NixOS Options" = {
                        urls = [
                            {
                                template = "https://search.nixos.org/options";
                                params = [
                                    {
                                        name = "type";
                                        value = "options";
                                    }
                                    {
                                        name = "query";
                                        value = "{searchTerms}";
                                    }
                                ];
                            }
                        ];

                        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                        definedAliases = [ "@no" ];
                    };

                    "NixOS Packages" = {
                        urls = [
                            {
                                template = "https://search.nixos.org/packages";
                                params = [
                                    {
                                        name = "type";
                                        value = "packages";
                                    }
                                    {
                                        name = "query";
                                        value = "{searchTerms}";
                                    }
                                ];
                            }
                        ];

                        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                        definedAliases = [ "@np" ];
                    };

                    "Home Manager Options" = {
                        urls = [
                            {
                                template = "https://home-manager-options.extranix.com";
                                params = [
                                    {
                                        name = "type";
                                        value = "options";
                                    }
                                    {
                                        name = "query";
                                        value = "{searchTerms}";
                                    }
                                ];
                            }
                        ];

                        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                        definedAliases = [ "@ho" ];
                    };

                    "ProtonDB Games" = {
                        urls = [
                            {
                                template = "https://www.protondb.com/search?";
                                params = [
                                    {
                                        name = "type";
                                        value = "games";
                                    }
                                    {
                                        name = "q";
                                        value = "{searchTerms}";
                                    }
                                ];
                            }
                        ];

                        icon = "${pkgs.super-tiny-icons}/share/icons/SuperTinyIcons/svg/steam.svg";
                        definedAliases = [ "@pg" ];
                    };

                    wikipedia.metaData.hidden = true;
                    bing.metaData.hidden = true;
                    google.metaData.hidden = true;
                    ddg.metaData.hideOneOffButton = true;
                    ebay.metaData.hideOneOffButton = true;
                    amazon.metaData.hideOneOffButton = true;
                };
            };

            # Yikes!
            settings = {
                "browser.newtabpage.activity-stream.showSearch" = false;
                "browser.newtabpage.activity-stream.showSponsored" = false;
                "browser.newtabpage.activity-stream.feeds.topsites" = false;
                "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
                "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
                "browser.newtabpage.activity-stream.showSponsoredTopStories" = false;
                "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
                "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
                "browser.newtabpage.activity-stream.showWeather" = false;
                "browser.urlbar.showSearchSuggestionsFirst" = false;
                "browser.urlbar.suggest.recentsearches" = false;
                "browser.urlbar.suggest.bookmark" = false;
                "browser.urlbar.suggest.history" = false;
                "browser.urlbar.suggest.engines" = false;
                "browser.urlbar.suggest.openpage" = false;
                "browser.urlbar.suggest.quicksuggest.sponsored" = false;
                "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
                "browser.urlbar.suggest.topsites" = false;
                "browser.warnOnQuitShortcut" = false;
                "browser.urlbar.shortcuts.bookmarks" = false;
                "browser.urlbar.shortcuts.history" = false;
                "browser.urlbar.shortcuts.tabs" = false;
                "browser.toolbars.bookmarks.visibility" = "newtab";
                "media.eme.enabled" = true;
                "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
                "media.hardwaremediakeys.enabled" = false;
                "privacy.trackingprotection.enabled" = true;
                "privacy.fingerprintingProtection" = true;
                "privacy.donottrackheader.enabled" = true;
                "privacy.globalprivacycontrol.enabled" = true;
                "network.cookie.cookieBehavior" = 1;
                "signon.rememberSignons" = false;
                "extensions.formautofill.addresses.enabled" = false;
                "extensions.formautofill.creditCards.enabled" = false;
                "privacy.history.custom" = true;
                "places.history.enabled" = false;
                "browser.formfill.enable" = false;
                "datareporting.healthreport.uploadEnabled" = false;
                "dom.security.https_only_mode" = true;
                "network.trr.mode" = 3;
                "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","ublock0_raymondhill_net-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","jid1-zadieub7xozojw_jetpack-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","firefoxcolor_mozilla_com-browser-action","_cb31ec5d-c49a-4e5a-b240-16c767444f62_-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","urlbar-container","downloads-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"vertical-tabs":[],"PersonalToolbar":["personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","jid1-zadieub7xozojw_jetpack-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action","ublock0_raymondhill_net-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","firefoxcolor_mozilla_com-browser-action","_cb31ec5d-c49a-4e5a-b240-16c767444f62_-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","TabsToolbar","toolbar-menubar","unified-extensions-area","vertical-tabs"],"currentVersion":20,"newElementCount":6}'';
            };
        };
    };
}
