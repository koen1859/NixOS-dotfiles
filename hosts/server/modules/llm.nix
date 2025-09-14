{pkgs, ...}: {
  home.packages = with pkgs; [
    ollama-cuda
  ];
}
