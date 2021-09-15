local extra = {"ctrl", "alt"}
local spaces = require("hs._asm.undocumented.spaces")

function MoveWindowToSpace(sp)
    local win = hs.window.focusedWindow()      -- current window
    local uuid = win:screen():spacesUUID()     -- uuid for current screen
    local spaceID = spaces.layout()[uuid][sp]  -- internal index for sp
    spaces.moveWindowToSpace(win:id(), spaceID) -- move window to new space
    spaces.changeToSpace(spaceID)              -- follow window to new space
end

function moveWindowOneSpace(direction)
  local keyCode = direction == "left" and 123 or 124

  return hs.osascript.applescript([[
    tell application "System Events"
      keystroke (key code ]] .. keyCode .. [[ using control down)
    end tell
  ]])
end

-- hs.hotkey.bind(extra, "left", function() MoveWindowToSpace(1) end)
-- hs.hotkey.bind(extra, "right", function() MoveWindowToSpace(2) end)
hs.hotkey.bind(extra, "left", function() moveWindowOneSpace("left") end)
hs.hotkey.bind(extra, "right", function() moveWindowOneSpace("right") end)
