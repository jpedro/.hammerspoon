local hyper = {"cmd", "alt", "ctrl"}

-- hs.hotkey.bind("cmd", "´",      mouseHighlight)
-- hs.hotkey.bind("cmd", "'",      mouseHighlight)
-- hs.hotkey.bind(hyper, "return", app("Google Chrome"))
hs.hotkey.bind("alt", ".",      mouseHighlight)
hs.hotkey.bind(hyper, "space",  windowMaximize)
hs.hotkey.bind(hyper, "left",   windowHalf)
hs.hotkey.bind(hyper, "right",  windowTwoThirds)
hs.hotkey.bind(hyper, "down",   windowOneThird)
hs.hotkey.bind(hyper, "up",     windowQuarter)
hs.hotkey.bind(hyper, "-",      windowHorizontally)

function toggleApp(name)
    focused = hs.window.focusedWindow()
    if focused then
      app = focused:application()
      if app:title() == name then
        app:hide()
        return
      end
    end

    hs.application.launchOrFocus(name)
end

hs.hotkey.bind(hyper, "return", function() toggleApp("Google Chrome")      end)
hs.hotkey.bind(hyper, "delete", function() toggleApp("iTerm")              end)
hs.hotkey.bind(hyper, "o",      function() toggleApp("Opera")              end)
hs.hotkey.bind(hyper, "b",      function() toggleApp("Brave Browser")      end)
hs.hotkey.bind(hyper, "p",      function() toggleApp("Visual Studio Code") end)
hs.hotkey.bind(hyper, "m",      function() toggleApp("Safari")             end)
hs.hotkey.bind(hyper, ".",      function() toggleApp("Slack")              end)
hs.hotkey.bind(hyper, "t",      function() toggleApp("Microsoft Teams")    end)
hs.hotkey.bind(hyper, "i",      function() toggleApp("IntelliJ IDEA CE")   end)
hs.hotkey.bind(hyper, "n",      function() toggleApp("Notes")              end)
-- hs.hotkey.bind(hyper, "o", function()
--     hs.application.launchOrFocus("Opera")
-- end)
-- hs.hotkey.bind(hyper, "1",      function() chromeProfile("Pedro")          end)
-- hs.hotkey.bind(hyper, "2",      function() chromeProfile("Pedro (Nordcloud)")  end)
-- hs.hotkey.bind(hyper, "3",      function() chromeProfile("Pedro (HM)")     end)
