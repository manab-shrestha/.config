return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-file-line-error",
        },
      }

      if vim.fn.executable("sioyek") == 1 then
        vim.g.vimtex_view_method = "sioyek"
        vim.g.vimtex_view_sioyek_exe = "sioyek"
        vim.g.vimtex_view_sioyek_options = "--reuse-window"
        vim.g.vimtex_callback_progpath = vim.v.progpath
      elseif vim.fn.executable("zathura") == 1 then
        vim.g.vimtex_view_method = "zathura"
      else
        vim.g.vimtex_view_method = "general"
        vim.g.vimtex_view_general_viewer = "xdg-open"
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = {
          settings = {
            texlab = {
              build = {
                executable = "latexmk",
                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                onSave = true,
              },
              chktex = { onOpenAndSave = true },
              diagnosticsDelay = 300,
              formatterLineLength = 100,
            },
          },
        },
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "texlab" },
    },
  },
}
