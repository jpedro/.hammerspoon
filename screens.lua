local hyper  = {"cmd", "alt", "ctrl"}
local lastScreen = 0

function send2(num)
  hs.alert.show(" Send to screen " .. num .. " ")
  hs.window.focusedWindow():moveToScreen(hs.screen.allScreens()[num], nil, true)
end

-- function len(t)
--   local max = 0
--   for i, _ in pairs(t) do
--     if type(i) == "number" and i > max then
--       max = i
--     end
--   end
--   return max
-- end

function loop2()
  local screens = hs.screen.allScreens()
  local curr = hs.window.focusedWindow():screen():id()
  local found = false
  -- local first = nil

  for k, _ in pairs(screens) do
    local id = screens[k]:id()
    -- Found was the previous index. So next is the current. Just send it.
    if found then
      send2(k)
      return
    end

    if id == curr then
      found = true
    end
    -- hs.alert.show(k .. ": " .. id, 10)
  end
  -- Fallback on the 1st one
  send2(1)
end

hs.hotkey.bind(hyper, "up", function()
  loop2()
end)


hs.hotkey.bind(hyper, "ø", function()
  local screens = hs.screen.allScreens()
  local style = hs.alert.defaultStyle
  style.textSize = 120
  -- style.fadeOutDuration = 1
  style.fillColor = {["red"]=0,["blue"]=1,["green"]=0.6,["alpha"]=1}
  style.strokeColor = {["alpha"]=0}

  for k, v in pairs(screens) do
    -- hs.alert.show("  Screen " .. k .. "  ", hs.alert.defaultStyle, screens[k], 5)
    hs.alert.show("  Screen " .. k .. "  ", style, screens[k])
  end
  -- hs.window.focusedWindow():moveToScreen(hs.screen.allScreens()[2], nil, true)
  -- local max = # all
  -- last_screen = last_screen + 1
  -- if last_screen > max then last_screen = 1 end
  -- send2(window.focusedwindow(), last_screen)
  -- alert.show("Sent to screen " .. last_screen, 2)
end)

hs.hotkey.bind(hyper, "f", function()
  send2(1)
end)

hs.hotkey.bind(hyper, "g", function()
  send2(2)
end)

hs.hotkey.bind(hyper, "h", function()
  send2(3)
end)
