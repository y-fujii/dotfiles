dofile("/usr/share/hypr/hyprland.lua")

hl.on("hyprland.start", function ()
	hl.exec_cmd("foot")
	hl.exec_cmd("fcitx5")
end)

hl.monitor({
	output = "",
	scale = 2,
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
	group = {
		drag_into_group = 2,
		groupbar = {
			gradients = true,
			font_size = 12,
			height = 24,
			indicator_height = 0,
			gaps_in = 0,
			gaps_out = 0,
			col = {
				active = "0x80808080",
				inactive = "0x80000000",
			},
		},
	},
})

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("foot"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind("SUPER + W", hl.dsp.window.float())
hl.bind("SUPER + G", hl.dsp.group.toggle())
hl.bind("SUPER + H", hl.dsp.group.prev())
hl.bind("SUPER + L", hl.dsp.group.next())
hl.bind("SUPER + SHIFT + H", hl.dsp.group.move_window({ forward = false }))
hl.bind("SUPER + SHIFT + L", hl.dsp.group.move_window({ forward = true  }))

if hl.plugin.hyprwinwrap ~= nil then
	hl.plugin.hyprwinwrap.window({ class = "hyprwinwrapped" })
end
