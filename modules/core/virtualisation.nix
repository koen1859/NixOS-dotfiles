{pkgs, ...}: {
  boot = {
    kernelParams = ["intel_iommu=on" "iommu=pt"]; # for Intel
    extraModprobeConfig = ''
      options kvm ignore_msrs=1
      options vfio-pci ids=8086:7a50,10de:2803,10de:22bd
    '';
    kernelModules = ["kvm-intel" "vfio" "vfio_iommu_type1" "vfio_pci" "vfio_virqfd"];
    blacklistedKernelModules = ["nouveau"];
  };
  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemuPackage = pkgs.qemu_kvm;
  };
}
