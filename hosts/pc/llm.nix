{pkgs, ...}: {
  home.packages = with pkgs; [
    LLM
    ollama-cuda
    (alpaca.override
      {
        ollama = ollama-cuda;
      })
  ];
}
