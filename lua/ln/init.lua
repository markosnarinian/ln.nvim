local M = {}

M.config = {}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

vim.o.number = true
vim.o.relativenumber = false
vim.wo.relativenumber = true

vim.api.nvim_create_autocmd({ "WinLeave" }, {
	callback = function()
		vim.wo.number = vim.go.number
		vim.wo.relativenumber = false
	end,
})
vim.api.nvim_create_autocmd({ "WinEnter" }, {
	callback = function()
		vim.wo.number = vim.go.number
		vim.wo.relativenumber = true
	end,
})

return M
