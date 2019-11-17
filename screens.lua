local hyper  = {"cmd", "alt", "ctrl"}

function send2(num)
  hs.alert.show(" Send to screen " .. num .. " ")
  hs.window.focusedWindow():moveToScreen(hs.screen.allScreens()[num], nil, true)
end

hs.hotkey.bind(hyper, "j", function()
  local all = screen.allScreens()
  hs.alert.show(all)
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
