{
  home.stateVersion = "25.05";

  xsession.numlock.enable = true;

  programs = {
    git = {
      userEmail = "linus@tebbe.dev";
      userName = "LinusTebbe";
    };
    plasma = {
      enable = true;
      overrideConfig = true;
      configFile = {
        "kxkbrc"."Layout"."LayoutList" = "eu";
        "kxkbrc"."Layout"."Use" = true;
        "kcminputrc"."Libinput/13364/53296/Keychron  Keychron Link "."PointerAcceleration" = 0.000;
        "kcminputrc"."Libinput/13364/53296/Keychron  Keychron Link "."PointerAccelerationProfile" = 1;
      };
      dataFile = {
      };
      workspace = {
        clickItemTo = "select";
        lookAndFeel = "org.kde.breezedark.desktop";
        cursor = {
          theme = "Breeze";
          size = 20;
        };
      };
      fonts = {
        general = {
          family = "JetBrains Mono";
          pointSize = 10;
        };
      };
      shortcuts = {
        "services/org.kde.spectacle.desktop"."RectangularRegionScreenShot" = "Print";
        "services/org.kde.spectacle.desktop"."_launch" = "Meta+Shift+S";
      };
      panels = [
        {
          location = "bottom";
          height = 44;
          screen = "all";
          widgets = [
            {
              name = "org.kde.plasma.kickoff";
              config = {
                General = {
                  icon = "nix-snowflake-white";
                  alphaSort = true;
                };
              };
            }
            {
              iconTasks = {
                launchers = [
                  "applications:org.kde.dolphin.desktop"
                  "applications:org.kde.konsole.desktop"
                  "applications:google-chrome.desktop"
                ];
              };
            }
            {
              systemTray.items = {
                shown = [
                  "org.kde.plasma.bluetooth"
                  "org.kde.plasma.networkmanagement"
                  "org.kde.plasma.volume"
                ];
                hidden = [
                ];
              };
            }
            {
              digitalClock = {
                calendar = {
                  firstDayOfWeek = "monday";
                  showWeekNumbers = true;
                };
                time = {
                  format = "24h";
                  showSeconds = "always";
                };
                date.format.custom = "dd.MM.yyyy";
              };
            }
          ];
          hiding = "none";
        }
      ];
      powerdevil = {
        AC = {
          powerButtonAction = "lockScreen";
          autoSuspend.action = "nothing";
          turnOffDisplay.idleTimeout = "never";
          dimDisplay.enable = false;
          powerProfile = "performance";
        };
      };
      session = {
        sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };
      startup.startupScript = {
        "start_discord" = {
          text = "discord --start-minimized </dev/null &>/dev/null &";
          runAlways = true;
        };
        "start_spotify" = {
          text = "spotify & xdotool search --sync --onlyvisible --class \"spotify\" windowminimize";
          runAlways = true;
        };
        "start_telegram" = {
          text = "telegram-desktop -startintray </dev/null &>/dev/null &";
          runAlways = true;
        };
      };
    };
  };
}
