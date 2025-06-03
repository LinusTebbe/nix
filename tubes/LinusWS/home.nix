{
  home.stateVersion = "25.05";

  programs.plasma = {
    enable = true;
    configFile = {
      "kxkbrc"."Layout"."LayoutList" = "eu";
      "kxkbrc"."Layout"."Use" = true;
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
        text = "discord --start-minimized";
        runAlways = true;
      };
      "start_spotify" = {
        text = "spotify & xdotool search --sync --onlyvisible --class \"spotify\" windowminimize";
        runAlways = true;
      };
    };
  };
}
