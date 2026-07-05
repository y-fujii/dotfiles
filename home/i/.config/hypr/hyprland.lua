dofile("/usr/share/hypr/hyprland.lua")

hl.on("hyprland.start", function ()
	hl.exec_cmd("foot")
	hl.exec_cmd("fcitx5")
end)

hl.monitor({
	output = "",
	scale = "2",
})

hl.config({
	input = {
		kb_layout = "jp",
		kb_options = "ctrl:nocaps,japan:hztg_escape",
	},
	general = {
		gaps_in = 1,
		gaps_out = 0,
		border_size = 0,
		snap = {
			enabled = true,
		},
	},
	decoration = {
		rounding = 0,
		shadow = {
			enabled = false,
		},
		blur = {
			enabled = false,
		},
	},
})

hl.bind("SUPER + Q", hl.dsp.exec_cmd("foot"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

if hl.plugin.hyprwinwrap ~= nil then
	hl.plugin.hyprwinwrap.window({ class = "hyprwinwrapped" })
end
