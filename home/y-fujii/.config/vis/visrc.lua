require("vis")
require("ctags")
local quickfix = require("quickfix")
quickfix.makeprg = {"cargo build"}

vis.events.subscribe(vis.events.INIT, function()
	vis:command("set theme custom")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
end)
