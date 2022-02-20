
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


-- function len(t)
--   local max = 0
--   for i, _ in pairs(t) do
--     if type(i) == "number" and i > max then
--       max = i
--     end
--   end
--   return max
-- end

