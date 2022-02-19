local hyper  = {"cmd", "alt", "ctrl"}
local lastScreen = 0

function send2(num)
    local screen = hs.screen.allScreens()[num]
    hs.alert.show("Sent to screen " .. screen:id())
    -- hs.window.focusedWindow():moveToScreen(screen, nil, true)
    -- hs.alert.show("Sent to screen " .. screen)
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
      hs.alert.show("Sending to screen " .. k)
      send2(k)
      return
    end

    if id == curr then
      found = true
    end
    -- hs.alert.show(k .. ": " .. id, 10)
  end
  -- Fallback on the 1st one
  hs.alert.show("Sending to screen " .. 1)
  -- send2(1)
end

hs.hotkey.bind(hyper, "@", function()
  loop2()
end)

-- local brightnessCount = 0
-- hs.hotkey.bind(hyper, "u", function()
--   -- newBright = 0.5 * (brightnessCount % 3)
--   newBright = 0.34 + 0.33 * (brightnessCount % 3)
--   -- newBright = 1 - 0.33 * (lastBrightness % 3)
--   hs.screen.mainScreen():setBrightness(newBright)
--   brightnessCount = brightnessCount + 1
--   hs.alert.show("Brightness: " .. math.floor(newBright * 100) .. "%")
-- end)

-- hs.hotkey.bind(hyper, "y", function()
--   local cycles = hs.battery.cycles()
--   local name = hs.battery.name()
--   local cap = hs.battery.designCapacity()
--   local health = hs.battery.health()
--   local maxCapacity = hs.battery.maxCapacity()
--   -- local healthCondition = hs.battery.healthCondition()
--   hs.alert.show(cycles .. ", " .. cap .. ", " .. health .. ", " .. maxCapacity .. ", " .. name)
-- end)

hs.hotkey.bind(hyper, "y", function()
  local screens  = hs.screen.allScreens()
  -- local defStyle = hs.alert.defaultStyle
  -- local newStyle = hs.alert.defaultStyle
  -- newStyle.fillColor = {["red"]=0,["blue"]=1,["green"]=0.6,["alpha"]=1}
  -- newStyle.strokeColor = {["alpha"]=0}
  -- newStyle.textSize = 120
  -- newStyle.textColor = {["red"]=0,["blue"]=0,["green"]=0,["alpha"]=1}

  for k, v in pairs(screens) do
    bright = screens[k]:name() or "-"
    message = "  Screen " .. k .. " (" .. bright .. ")  "
    hs.alert.show(message, screens[k])
  end

  -- hs.alert.defaultStyle = defStyle
end)

-- hs.hotkey.bind(hyper, "@", function()
--   -- hs.window.focusedWindow():moveToScreen(hs.screen.allScreens()[2], nil, true)
--   -- local max = # all
--   -- last_screen = last_screen + 1
--   -- if last_screen > max then last_screen = 1 end
--   -- send2(window.focusedwindow(), last_screen)
--   alert.show("Sent to screen " .. "last_screen", 2)
-- end)

-- hs.hotkey.bind(hyper, "f", function()
--   send2(1)
-- end)

-- hs.hotkey.bind(hyper, "g", function()
--   send2(2)
-- end)

-- hs.hotkey.bind(hyper, "h", function()
--   send2(3)
-- end)
