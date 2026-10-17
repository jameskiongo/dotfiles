local themes = { "zenwritten", "darkvoid", "nightfox", "kanagawa" }
local state_file = vim.fn.stdpath("state") .. "/colorscheme"
local current = 1

local function set(idx, silent)
	local name = themes[idx]
	local ok, err = pcall(vim.cmd.colorscheme, name)
	if not ok then
		return vim.notify("Colorscheme failed: " .. err, vim.log.levels.ERROR)
	end
	current = idx
	pcall(vim.fn.writefile, { name }, state_file)
	if not silent then
		vim.notify("Theme: " .. name)
	end
end

local function cycle(step)
	set((current - 1 + step) % #themes + 1)
end

local function pick()
	vim.ui.select(themes, { prompt = "Colorscheme" }, function(_, idx)
		if idx then
			set(idx)
		end
	end)
end

return {
	name = "theme-switcher",
	dir = vim.fn.stdpath("config"), -- local pseudo-plugin, nothing to install
	lazy = false,
	priority = 900,
	config = function()
		local ok, lines = pcall(vim.fn.readfile, state_file)
		local saved = ok and lines[1] or themes[1]
		local idx = vim.fn.index(themes, saved) + 1 -- 0 if not found
		if idx == 0 then
			idx = 1
		end
		set(idx, true)
	end,
	keys = {
		{
			"<leader>uc",
			function()
				cycle(1)
			end,
			desc = "Next colorscheme",
		},
		{
			"<leader>uC",
			function()
				cycle(-1)
			end,
			desc = "Previous colorscheme",
		},
		{ "<leader>up", pick, desc = "Pick colorscheme" },
	},
}
