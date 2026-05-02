-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local cxx = vim.fn.executable("g++-15") == 1 and "g++-15" or "g++"
vim.opt.makeprg = cxx .. " % -std=c++20 -Wall -Wextra -pedantic -o %<"

vim.filetype.add({
  extension = { cu = "cuda", cuh = "cuda" },
})
