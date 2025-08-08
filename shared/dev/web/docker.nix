{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    docker-compose
    arion
  ];

  # --- Docker settings ---
  virtualisation.docker = {
    enable = true;

    # enable rootless mode
    rootless = {
      enable = true;
      setSocketVariable = true;
    };

    daemon.settings = {
      # set the location to store docker config data
      data-root = "/home/zacharyas/.config/docker";

      userland-proxy = false;
      experimental = true;
      metrics-addr = "0.0.0.0:9323";
      ipv6 = true;
      fixed-cidr-v6 = "fd00::/80";
    };
  };
  users = {
    # Grant root access to docker sockets
    users.zacharyas.extraGroups = [ "docker" ];
  };

  # --- Systemd Services hosting containers ---
}
