{pkgs, ...}: let
  pythonVim = pkgs.neovimBuilder {
    config = {
      vim = {
        viAlias = false;
        vimAlias = true;
        lsp = {
          enable = true;
          formatOnSave = true;
          lightbulb.enable = true;
          lspsaga.enable = false;
          nvimCodeActionMenu.enable = true;
          trouble.enable = true;
          lspSignature.enable = true;
          rust.enable = false;
          nix = true;
          python = true;
          shell = true;
          terraform = false;
          clang = false;
          sql = true;
          ts = true;
          deno = false;
          elm = false;
          go = false;
          hare = false;
        };
      };
      vim.visuals = {
        enable = true;
        nvimWebDevicons.enable = true;
        lspkind.enable = true;
        indentBlankline = {
          enable = true;
          fillChar = "";
          eolChar = "";
          showCurrContext = true;
        };
        cursorWordline = {
          enable = true;
          lineTimeout = 0;
        };
      };
      vim.statusline.lualine = {
        enable = true;
        theme = "jellybeans";
      };
      vim.theme = {
        enable = true;
        name = "nightfox";
        style = "terafox";
      };
      vim.autopairs.enable = true;
      vim.autocomplete = {
        enable = true;
        type = "nvim-cmp";
      };
      vim.filetree.nvimTreeLua.enable = true;
      vim.tabline.nvimBufferline.enable = true;
      vim.treesitter = {
        enable = true;
        autotagHtml = true;
        context.enable = true;
      };
      vim.keys = {
        enable = true;
        whichKey.enable = true;
      };
      vim.telescope = {
        enable = true;
      };
      vim.markdown = {
        enable = true;
        glow.enable = true;
      };
      vim.git = {
        enable = true;
        gitsigns.enable = true;
      };
    };
  };
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      curl
      httpie
      starship
      pythonVim
      ranger
    ];
    shellHook = ''
      # if [[ ! $HOST_PATH == *"starship"* ]];
      # then
         source <(starship init bash --print-full-init)
      # fi
    '';
  }
