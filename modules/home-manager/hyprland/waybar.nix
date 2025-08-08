{
  outputs,
  ...
}:

let
  inherit (outputs.nixosModules.theme) colors fonts;
in
{
  mainBar = {
    layer = "top";
    position = "top";
    height = 30;
    spacing = 4;
    modules-right = [
      "pulseaudio#source"
      "pulseaudio#sink"
      "bluetooth"
      "network"
      "battery"
    ];
    modules-left = [
      "hyprland/workspaces"
      "hyprland/submap"
    ];
    modules-center = [ "clock" ];
    "network" = {
      "interface" = "wlp1s0";
      "format" = "{ifname}";
      "format-wifi" = "{essid} ({signalStrength}%) ";
      "format-ethernet" = "{ipaddr}/{cidr} 󰊗";
      "format-disconnected" = "";
      "tooltip-format" = "{ifname} via {gwaddr} 󰊗";
      "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
      "tooltip-format-ethernet" = "{ifname} ";
      "tooltip-format-disconnected" = "Disconnected";
      "max-length" = 50;

    };
    "pulseaudio#source" = {
      "format-source" = "{volume}% ";
      "format-source-muted" = "{volume}% ";
      "format" = "{format_source}";
      "max-volume" = 100;
      "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      "on-click-middle" = "pavucontrol";
      "on-scroll-up" = "wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 1%+";
      "on-scroll-down" = "wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 1%-";
    };
    "pulseaudio#sink" = {
      "format" = "{volume}% {icon}";
      "format-bluetooth" = "{volume}% {icon}";
      "format-muted" = "";
      "format-icons" = {
        "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
        "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
        "headphone" = "";
        "hands-free" = "";
        "headset" = "";
        "phone" = "";
        "phone-muted" = "";
        "portable" = "";
        "car" = "";
        "default" = [
          ""
          ""
        ];
      };
      "scroll-step" = 1;
      "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      "on-click-middle" = "pavucontrol";
      "ignored-sinks" = [ "Easy Effects Sink" ];
    };
    bluetooth = {
      format = " {status}";
      "format-connected" = " {device_alias}";
      "format-connected-battery" = " {device_alias} {device_battery_percentage}%";
      "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      "tooltip-format-connected" =
        "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
      "tooltip-format-enumerate-connected-battery" =
        "{device_alias}\t{device_address}\t{device_battery_percentage}%";
    };
    clock = {
      tooltip-format = "<tt><small>{calendar}</small></tt>";
      format-alt = "{:%A %Y-%m-%d}";
      calendar = {
        mode = "year";
        mode-mon-col = 3;
        weeks-pos = "left";
        format = with colors; {
          months = "<span color='${green-400}'><b>{}</b></span>";
          days = "<span color='${white-400}'><b>{}</b></span>";
          weeks = "<span color='${purple-400}'><b>{}</b></span>";
          weekdays = "<span color='${yellow-400}'><b>{}</b></span>";
          today = "<span color='${red-400}'><b><u>{}</u></b></span>";
        };
      };
    };
  };
  /*
    style = with colors; ''
      * {
        font-family: ${fonts.monospace};
        background-color: ${bg-400};
      }

      #workspaces button.active {
        color: ${fg-300};
      }

      .module {
        padding: 0 10px;
        border-radius: 10px;
        background-color: ${bg-300};
        color: ${fg-300};
      }
    '';
  */
}
