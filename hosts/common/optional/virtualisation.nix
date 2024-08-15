{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        virt-viewer
        spice 
        spice-gtk
        spice-protocol
    ];

    programs.virt-manager.enable = true;

    virtualisation = {
        libvirtd = {
            enable = true;
            qemu = {
                package = pkgs.qemu_kvm;
                swtpm.enable = true;
                ovmf.enable = true;
                ovmf.packages = [ pkgs.OVMFFull.fd ];
            };
        };
        spiceUSBRedirection.enable = true;
    };
}
