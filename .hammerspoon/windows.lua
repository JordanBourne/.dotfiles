-- Window Resizing
local leftEdge = 0.025
local topEdge = 0.044
local rightEdge = 1 - leftEdge
local bottomEdge = 1 - topEdge

-- Psuedo full screen
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "Z", function()
	local windows = hs.window.allWindows()
	for _, win in ipairs(windows) do
		ResizingWorkaround(win, { x = leftEdge, y = topEdge, w = 1 - (2 * leftEdge), h = 1 - (2 * topEdge) })
	end
end)

-- Psudo Corner Locations
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "J", function()
	local win = hs.window.focusedWindow()
	-- bottom left corner
	ResizingWorkaround(win, CalculateWindowSize({ x = leftEdge, y = bottomEdge }, { w = 0.5, h = -0.5 }))
end)
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "K", function()
	local win = hs.window.focusedWindow()
	-- bottom right corner
	ResizingWorkaround(win, CalculateWindowSize({ x = rightEdge, y = bottomEdge }, { w = -0.5, h = -0.5 }))
end)
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "U", function()
	local win = hs.window.focusedWindow()
	--  top left corner
	ResizingWorkaround(win, CalculateWindowSize({ x = leftEdge, y = topEdge }, { w = 0.5, h = 0.5 }))
end)
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "I", function()
	local win = hs.window.focusedWindow()
	-- top right corner
	ResizingWorkaround(win, CalculateWindowSize({ x = rightEdge, y = topEdge }, { w = -0.5, h = 0.5 }))
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "/", function()
	-- select top two windows and split horizontally
	-- Top window left
	local windows = hs.window.orderedWindows()
	for idx, win in ipairs(windows) do
		if idx == 1 then
			ResizingWorkaround(win, { x = leftEdge, y = topEdge, w = 0.5 - leftEdge, h = 1 - (2 * topEdge) })
		end
		if idx == 2 then
			ResizingWorkaround(win, { x = 0.5, y = topEdge, w = (0.5 - leftEdge), h = 1 - (2 * topEdge) })
		end
	end
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "\\", function()
	-- select top two windows and split horizontally
	-- Top window right
	local windows = hs.window.orderedWindows()
	for idx, win in ipairs(windows) do
		print(win:application():name())
		if idx == 2 then
			ResizingWorkaround(win, { x = leftEdge, y = topEdge, w = 0.5 - leftEdge, h = 1 - (2 * topEdge) })
		end
		if idx == 1 then
			ResizingWorkaround(win, { x = 0.5, y = topEdge, w = (0.5 - leftEdge), h = 1 - (2 * topEdge) })
		end
	end
end)

function CalculateWindowSize(anchor, size)
	local result = { x = 0, y = 0, w = 0, h = 0 }
	if size.w > 0 then
		result.w = size.w
		result.x = anchor.x
	else
		result.x = anchor.x + size.w
		result.w = -1 * size.w
	end

	if size.h > 0 then
		result.h = size.h
		result.y = anchor.y
	else
		result.y = anchor.y + size.h
		result.h = -1 * size.h
	end

	return result
end

function ResizingWorkaround(win, pos)
	local winApp = win:application():name()
	-- add Applescript-capable apps you are using to the if-condition below
	if winApp == "Finder" or winApp == "Firefox" or winApp == "iTerm2" then
		local verticalOffset = 24 * (1 - pos.y) + 1
		hs.applescript(
			[[
  		use framework "AppKit"
  		set allFrames to (current application's NSScreen's screens()'s valueForKey:"frame") as list
  		set max_x to item 1 of item 2 of item 1 of allFrames
  		set max_y to item 2 of item 2 of item 1 of allFrames
  		]]
				.. "set x to "
				.. pos.x
				.. " * max_x\n"
				.. "set y to "
				.. pos.y
				.. " * max_y + "
				.. verticalOffset
				.. "\n"
				.. "set w to "
				.. pos.w
				.. " * max_x\n"
				.. "set h to "
				.. pos.h
				.. " * max_y - "
				.. verticalOffset
				.. "\n"
				.. 'tell application "'
				.. winApp
				.. '" to set bounds of front window to {x, y, x + w, y + h}'
		)
	else
		win:moveToUnit(pos)
	end
end
