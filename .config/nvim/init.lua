-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("nvim-treesitter").install({ "apex" })
vim.filetype.add({
	extension = {
		cmp = "aura",
		design = "aura",
		auradoc = "aura",
		cls = "apex",
		apex = "apex",
		trigger = "apex",
		soql = "soql",
	},
})
vim.treesitter.language.register("apex", { "cls", "trigger" })
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "CursorHold", "FocusGained", "BufEnter" }, {
	pattern = "*",
	callback = function()
		if vim.fn.mode() ~= "c" then -- Avoid checking time while in command mode
			vim.cmd("checktime")
		end
	end,
})
