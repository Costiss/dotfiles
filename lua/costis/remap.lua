vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")



vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Costis --


local function is_nodejs_extendion(file_extension)
    local supported_extensions = { "ts", "js", "json", "jsx", "tsx" }
    for _, extension in ipairs(supported_extensions) do
        if extension == file_extension then
            return true
        end
    end
    return false
end


vim.keymap.set("n", "<C-s>", function()
    local file_extension = vim.fn.expand("%:e")

    local file_path = vim.fn.expand("%:p")
    local working_directory = vim.fn.getcwd()
    local relative_path = vim.fn.pathshorten(file_path, working_directory)


    if is_nodejs_extendion(file_extension) then
        vim.lsp.buf.format()
        vim.cmd("w")
        -- vim.cmd("!eslintd  " .. file .. " --fix")
        print(relative_path)
    else
        vim.lsp.buf.format()
        vim.cmd("w")
    end
end);


vim.keymap.set("n", "<leader>f", function()
    local file_extension = vim.fn.expand("%:e")
    if is_nodejs_extendion(file_extension) then
        vim.lsp.buf.format()
        vim.cmd("silent !prettierd %")
    else
        vim.lsp.buf.format()
    end
end)
