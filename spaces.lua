local extra = {"ctrl", "alt"}
local spaces = require("hs._asm.undocumented.spaces")

local currentId = spaces.activeSpace()

-- window.animationDuration = 0.2

function moveSpace(num)
  local win = hs.window.focusedWindow()
  local nextId = nextId()
  if nextId == nil then
    return
  end

  spaces.moveWindowToSpace(win:id(), nextId)
  spaces.changeToSpace(nextId)
  -- hs.alert.show("Window moved to space " .. nextId .. ".", 2)
  currentId = nextId
end

function nextId()
  local win = hs.window.focusedWindow()
  local layout = spaces.layout()
  -- local uuid = win:screen():spacesUUID()
  -- local spaceId = layout[uuid][num]
  local firstId = 0

  print("==> currentId " .. currentId)
  for id, space in pairs(layout) do
    local previousId = 0
    for key, val in pairs(space) do
      print("==> Key " .. key)
      print("==> Val " .. val)
      -- Save the first spaceId
      if previousId == 0 then
        firstId = val
        print("==> Found firstID " .. firstId)
      end

      -- If the previous is the current, jump to this instead
      if previousId == currentId then
        print("==> Going to jump to " .. val)
        return val
      end
      previousId = val
      print("==> previousId is now " .. previousId)
    end
  end

  print("==> Using the firstId " .. firstId)
  return firstId
end

function moveWindowOneSpace(direction)
  local keyCode = direction == "left" and 123 or 124
  hs.alert.show(" Moving window to " .. direction .. ".", 1)

  return hs.osascript.applescript([[
    tell application "System Events"
      keystroke (key code ]] .. keyCode .. [[ using control down)
    end tell
  ]])
end

hs.hotkey.bind(extra, "left", function()
  moveSpace()
end)
hs.hotkey.bind(extra, "right", function()
  moveSpace()
end)
-- hs.hotkey.bind(extra, "left", function() moveWindowOneSpace("left") end)
-- hs.hotkey.bind(extra, "right", function() moveWindowOneSpace("right") end)
