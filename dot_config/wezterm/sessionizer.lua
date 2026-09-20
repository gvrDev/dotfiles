local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

M.toggle = function(window, pane)
	local home_dev = (os.getenv("HOME") or "") .. "/dev"

	-- Search directly for directories containing a .git folder
	local success, stdout, stderr = wezterm.run_child_process({
		"fd",
		"-H",
		"-I",
		"^.git$",
		"--max-depth",
		"4",
		"--prune",
		home_dev,
	})

	if not success then
		wezterm.log_error("Failed to run fd: " .. stderr)
		return
	end

	local projects = {}
	for line in stdout:gmatch("[^\r\n]+") do
		-- Clean trailing slashes, then strip /.git
		local path = line:gsub("/+$", "")
		local project_dir = path:gsub("/%.git$", "")
		local id = project_dir:match("([^/]+)$") or project_dir

		table.insert(projects, { label = project_dir, id = id })
	end

	window:perform_action(
		act.InputSelector({
			action = wezterm.action_callback(function(win, _, id, label)
				if id and label then
					wezterm.log_info("Selected " .. label)
					win:perform_action(act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }), pane)
				else
					wezterm.log_info("Cancelled")
				end
			end),
			fuzzy = true,
			title = "Select project",
			choices = projects,
		}),
		pane
	)
end

return M
