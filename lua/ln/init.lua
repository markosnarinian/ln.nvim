local M = {}

M.config = {
	absolute_events = { "WinLeave", "InsertEnter", "TermEnter", "CmdlineEnter" },
	relative_events = { "WinEnter", "InsertLeave", "TermLeave", "CmdlineLeave" },
	neotree_force_relative = true,
}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	vim.o.number = true
	vim.o.relativenumber = false
	vim.wo.relativenumber = true

	local group = vim.api.nvim_create_augroup("ln", { clear = true })

	vim.api.nvim_create_autocmd(M.config.absolute_events, {
		group = group,
		callback = function(ev)
			vim.wo.number = vim.go.number
			vim.wo.relativenumber = false
			if ev.event == "CmdlineEnter" then
				vim.cmd("redraw")
			end
		end,
	})

	vim.api.nvim_create_autocmd(M.config.relative_events, {
		group = group,
		callback = function(ev)
			vim.wo.number = vim.go.number
			vim.wo.relativenumber = true
			if ev.event == "CmdlineLeave" then
				vim.cmd("redraw")
			end
		end,
	})
end

return M
