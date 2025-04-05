{lib, ...}: {
  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      completeopt = ["menu" "menuone" "noselect"];
      updatetime = 100;

      swapfile = false; # Disable the swap file
      modeline = true; # Tags such as 'vim:ft=sh'
      modelines = 100; # Sets the type of modelines
      undofile = true; # Automatically save and restore undo history
      incsearch = true; # Incremental search: show match for partly typed search command
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case
      #   patterns
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper
      #   case characters
      cursorline = true; # Highlight the screen line of the cursor
      cursorcolumn = false; # Highlight the screen column of the cursor
      signcolumn = "yes"; # Whether to show the signcolumn
      colorcolumn = "100"; # Columns to highlight
      laststatus = 3; # When to use a status line for the last window
      fileencoding = "utf-8"; # File-content encoding for the current buffer
      termguicolors = true; # Enables 24-bit RGB color in the |TUI|
      spelllang = lib.mkDefault ["en_us"]; # Spell check languages
      spell = true; # Highlight spelling mistakes (local to window)
      wrap = false; # Prevent text from wrapping

      synmaxcol = 240; # Max column for syntax highlight
      showmatch = true; # when closing a bracket, briefly flash the matching one
      matchtime = 1; # duration of that flashing n deci-seconds
      startofline = true; # motions like "G" also move to the first char
      report = 9001; # disable "x more/fewer lines" messages
    };
    globals.mapleader = " ";
  };
}
