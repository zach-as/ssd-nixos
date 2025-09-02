{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  inherit (lib) types;

  /*
    nixvim = import (
      builtins.fetchGit {
        url = "https://github.com/nix-community/nixvim";
        # When using a different channel, you can use 'ref = "nixos-<version>"' to set it here
      }
    );
  */
in
{
  /*
    imports = [
      nixvim.homeManagerModules.nixvim
    ];
  */
  home.packages = with pkgs; [
    mkcert
    xh
    nixfmt-rfc-style
    nix-init
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;

    # Enable xsel as the clipboard provider
    clipboard.providers.xsel.enable = true;

    opts = {
      number = true;
      shiftwidth = 2;
      tabstop = 2;
      wildmenu = true;
      wildmode = "longest:full,full";
      autoindent = true;
      undofile = true;
      expandtab = true;
    };

    # Set the leader key
    globals.mapleader = "<alt>";

    keymaps = [
      {
        key = "<F2>";
        action = "<cmd>Neotree toggle<cr>";
        mode = [
          "n"
          "v"
        ];
      }
      {
        key = "<space>e";
        action.__raw = "vim.diagnostic.open_float";
        mode = [
          "n"
          "v"
        ];
      }
      {
        key = "<leader>c";
        action = ''"+yy'';
        mode = [ "n" ];
      }
      {
        key = "<leader>c";
        action = ''"+y'';
        mode = [ "v" ];
      }
      {
        key = "<leader>p";
        action = ''"+p'';
        mode = [
          "n"
          "v"
        ];
      }
    ];

    extraPlugins = with pkgs.vimPlugins; [
      Ionide-vim
    ];

    # Launch Neotree on file open
    /*
      autoCmd = [
        {
          event = [
          ];
          command = "Neotree toggle";
        }
      ];
    */

    plugins = {
      web-devicons.enable = true;
      leap.enable = true;
      sleuth.enable = true;
      neo-tree.enable = true;
      oil.enable = true;
      nix.enable = true;
      colorizer.enable = true;
      fugitive.enable = true;
      gitignore.enable = false;
      direnv.enable = true;

      conform-nvim = {
        enable = true;
        autoLoad = true;
        settings = {
          formatters_by_ft = {
            javascript = [
              "prettier"
            ];
            typescript = [
              "prettier"
            ];
          };
          format_on_save = {
            timeout_ms = 1500;
            lsp_format = "fallback";
          };
        };
      };

      vim-matchup = {
        enable = true;
        treesitter.enable = true;
      };

      rest = {
        enable = true;
        enableTelescope = true;
      };

      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent = {
            enable = true;
          };
        };
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
        };
      };

      lsp = {
        enable = true;
        servers = {
          ts_ls.enable = true;
          svelte.enable = true;
          tailwindcss.enable = true;
          basedpyright.enable = true;
          nixd.enable = true;
          eslint.enable = true;
        };
        keymaps = {
          lspBuf = {
            K = "hover";
            gD = "references";
            gd = "definition";
            gi = "implementation";
            gt = "type_definition";
          };
          diagnostic = {
            "<leader>j" = "goto_next";
            "<leader>k" = "goto_prev";
          };
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          completion = {
            keyword_length = 2;
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };
    };
  };

}
