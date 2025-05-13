{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-fonts.code-new-roman
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    montserrat
  ];
}
