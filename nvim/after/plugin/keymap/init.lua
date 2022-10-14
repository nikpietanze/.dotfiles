local Remap = require("nik.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

-- move code up or down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- yank
nmap("<leader>Y", '"+Y')
nnoremap("Y", "yg$")
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

-- delete
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

-- greatest remap ever
xnoremap("<leader>p", '"_dP')

-- esc
inoremap("<C-c>", "<Esc>")

-- beginning/end of line
nnoremap("W", "$")
nnoremap("B", "^")

nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
