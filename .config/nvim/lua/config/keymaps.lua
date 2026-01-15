--local map = vim.keymap.set
local wk = require("which-key")
local Job = require("plenary.job")
local function print_results_table(results)
	vim.defer_fn(function()
		local _result = {}
		for lineitem in results do
			table.insert(_result, { lineitem .. "\n" })
		end
		-- TODO: Resolve error and increase table output duration.
		vim.api.nvim_echo(_result, false, {})
	end, 0)
end
local function sf_job(_args, start_msg)
	return Job:new({
		command = "sf",
		args = _args,
		cwd = ".",
		on_start = function()
			print(start_msg)
		end,
		on_exit = function(j, _return_code)
			--print(j:result())
			print_results_table(j:result())
		end,
		on_stderr = function(_error, data, _self)
			print(data)
		end,
		on_stdout = function(_error, data, _self)
			print(data)
		end,
	})
end
-- TODO: Create Salesforce group (going to be adding a whole lot more commands soon.)
wk.add({
	mode = { "n" },
	{
		"<leader>sr",
		function()
			local currentFilePath = vim.api.nvim_buf_get_name(0)
			sf_job(
				{ "project", "retrieve", "start", "-d", currentFilePath, "--ignore-conflicts" },
				"Retrieving from org..."
			):start()
		end,
		desc = "Retrieve Source from Org",
	},
	{
		"<leader>sd",
		function()
			local currentFilePath = vim.api.nvim_buf_get_name(0)
			sf_job({ "project", "deploy", "start", "-d", currentFilePath, "--ignore-conflicts" }, "Deploying to org..."):start()
		end,
		desc = "Deploy Source to Org",
	},
})
