local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local M = {}

local function workspace_exists(name)
	for _, ws in ipairs(mux.get_workspace_names()) do
		if ws == name then
			return true
		end
	end
	return false
end

local function create_project_layout(workspace_name, project_dir)
	-- Tab 1: nvim
	local tab_editor, pane_editor, mux_window = mux.spawn_window({
		workspace = workspace_name,
		cwd = project_dir,
	})
	pane_editor:send_text("nvim\n")

	-- Tab 2: ai (70% left) + free terminal (30% right)
	local _, pane_ai, _ = mux_window:spawn_tab({
		cwd = project_dir,
	})

	local _ = pane_ai:split({
		direction = "Right",
		size = 0.3,
		cwd = project_dir,
	})

	pane_ai:send_text("opencode\n")

	-- Focus back to Tab 1 (nvim)
	tab_editor:activate()
end

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
			action = wezterm.action_callback(function(win, inner_pane, id, label)
				if id and label then
					wezterm.log_info("Selected " .. label)
					if not workspace_exists(id) then
						create_project_layout(id, label)
					end
					win:perform_action(act.SwitchToWorkspace({ name = id }), inner_pane or pane)
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
