vim.api.nvim_command("colorscheme rose-pine")

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_invert_selection = '0'
vim.opt.background = "dark"

local colors = require("catppuccin.palettes").get_palette()
colors.none = "NONE"
require("catppuccin").setup({
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    transparent_background = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        neogit = true,
        harpoon = true
    },
    custom_highlights = {
        Comment = { fg = colors.overlay1 },
        LineNr = { fg = colors.overlay1 },
        CursorLine = { bg = colors.none },
        CursorLineNr = { fg = colors.lavender },
        DiagnosticVirtualTextError = { bg = colors.none },
        DiagnosticVirtualTextWarn = { bg = colors.none },
        DiagnosticVirtualTextInfo = { bg = colors.none },
        DiagnosticVirtualTextHint = { bg = colors.none },
    }
})

local hl = function(thing, opts)
    vim.api.nvim_set_hl(0, thing, opts)
end

hl("SignColumn", {
    bg = "none",
})

-- hl("ColorColumn", {
--    ctermbg = 0,
--   bg = "#2B79A0",
--})

hl("CursorLineNR", {
    bg = "None"
})

hl("Normal", {
    bg = "none"
})

hl("LineNr", {
    fg = "#696969"
})

hl("netrwDir", {
    fg = "#5eacd3"
})
