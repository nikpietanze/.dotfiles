local Remap = require("nik.keymap")
local nnoremap = Remap.nnoremap
-- local inoremap = Remap.inoremap

local sumneko_root_path = "/home/nik/dev/lua/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.opt.completeopt = {
    "menu",
    "menuone",
    "noselect"
}

-- Setup nvim-cmp.
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<C-j>"] = cmp.mapping.scroll_docs(-4),
        ["<C-k>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
    },
})

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = function()
            nnoremap("K", function() vim.lsp.buf.hover { buffer = 0 } end)
            nnoremap("gd", function() vim.lsp.buf.definition { buffer = 0 } end)
            nnoremap("gT", function() vim.lsp.buf.type_definition { buffer = 0 } end)
            nnoremap("gi", function() vim.lsp.buf.implementation { buffer = 0 } end)
            nnoremap("<leader>ca", function() vim.lsp.buf.code_action { buffer = 0 } end)
            nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
            nnoremap("<leader>dj", function() vim.diagnostic.goto_next { buffer = 0 } end)
            nnoremap("<leader>dk", function() vim.diagnostic.goto_prev { buffer = 0 } end)
            nnoremap("<leader>dl", "<cmd>Telescope diagnostics<CR>")
            nnoremap("<leader>r", function() vim.lsp.buf.rename { buffer = 0 } end)
            nnoremap("<leader>f", function() vim.lsp.buf.format { async = true } end)
        end,
    }, _config or {})
end

-- configurations
require("lspconfig").html.setup(config())
require("lspconfig").cssls.setup(config())
require('lspconfig').tailwindcss.setup(config())
require("lspconfig").tsserver.setup(config())
require("lspconfig").svelte.setup(config())
require("lspconfig").vuels.setup(config())
require('lspconfig').prismals.setup(config())
require("lspconfig").jsonls.setup(config())
require("lspconfig").astro.setup(config())
require("lspconfig").omnisharp.setup(config({
    cmd = { "/home/nik/dev/microsoft/omnisharp/run", "--languageserver", "--hostPID", },
}))
require("lspconfig").gopls.setup(config({
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}))
require('lspconfig').rust_analyzer.setup { config() }
require("lspconfig").sumneko_lua.setup(config({
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
}))

local opts = {
    highlight_hovered_item = true,
    show_guides = true,
}

require("symbols-outline").setup(opts)

local snippets_paths = function()
    local plugins = { "friendly-snippets" }
    local paths = {}
    local path
    local root_path = vim.env.HOME .. "/.vim/plugged/"
    for _, plug in ipairs(plugins) do
        path = root_path .. plug
        if vim.fn.isdirectory(path) ~= 0 then
            table.insert(paths, path)
        end
    end
    return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
    paths = snippets_paths(),
    include = nil, -- Load all languages
    exclude = {},
})
