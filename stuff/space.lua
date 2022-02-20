
-- hs.hotkey.bind(extra, "left", function() moveWindowOneSpace("left") end)
-- hs.hotkey.bind(extra, "right", function() moveWindowOneSpace("right") end)
-- function moveWindowOneSpace(direction)
--   local keyCode = direction == "left" and 123 or 124
--   hs.alert.show(" Moving window to " .. direction .. ".", 1)

--   return hs.osascript.applescript([[
--     tell application "System Events"
--       keystroke (key code ]] .. keyCode .. [[ using control down)
--     end tell
--   ]])
-- end
