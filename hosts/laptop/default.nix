{ inputs, configLib, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
  ]
  ++ (map configLib.relativeToRoot [
    "hosts/common/core"
    "hosts/common/optional/hyprland.nix"
    "hosts/common/optional/games"
    "hosts/common/optional/drawing_tablet.nix"
    "hosts/common/optional/virtualisation.nix"
    "hosts/common/optional/greetd.nix"
    "hosts/common/users/alyu"
  ]);

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    systemd-boot.enable = true;
  };

  networking = {
      hostName = "laptop";
      networkmanager.enable = true;
  };

  services = {
    printing.enable = true;
    displayManager.defaultSession = "hyprland";
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "altgr-intl";
      };
      videoDrivers = ["nvidia"];
    };
  };

  hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      open = false;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.nix-ld.enable = true;

  system.stateVersion = "24.05";
}
