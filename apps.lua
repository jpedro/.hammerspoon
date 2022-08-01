local hyper = {"cmd", "alt", "ctrl"}
local extra = {"cmd", "shift"}
local terms = {"cmd", "alt"}

hs.hotkey.bind("alt", ".",      mouseHighlight)
hs.hotkey.bind(hyper, "space",  windowMaximize)
hs.hotkey.bind(hyper, "left",   windowHalf)
hs.hotkey.bind(hyper, "right",  windowSixty)
hs.hotkey.bind(hyper, "down",   windowThird)
hs.hotkey.bind(hyper, "up",     windowQuarter)
hs.hotkey.bind(hyper, "-",      windowHorizontally)
hs.hotkey.bind(hyper, "y",      showScreens)
hs.hotkey.bind(hyper, "h",      help)
hs.hotkey.bind(hyper, "@",      loopScreens)
hs.hotkey.bind(hyper, "x",      showLoaded)
-- hs.hotkey.bind(hyper, "y",      cleanLoaded)

function toggleApp(name)
    -- focused = hs.window.focusedWindow()
    -- if focused then
    --     app = focused:application()
    --     print("App name: " .. app:name())
    --     print("App title: " .. app:title())
    --     -- if app:title() == name then
    --     if app:title():sub(1, #name) == name then
    --         -- alert("Hidding " .. name)
    --         app:hide()
    --         return
    --     end
    -- end

    -- alert("Showing " .. name)
    hs.application.launchOrFocus(name)
end

hs.hotkey.bind({"ctrl"}, "<",   function() mouseHighlight()                 end)
hs.hotkey.bind({"cmd"}, "'",   function() mouseHighlight()                 end)

-- function() toggleApp("iTerm")               end)
hs.hotkey.bind(hyper, "return", function() toggleApp("Google Chrome")       end)
hs.hotkey.bind(hyper, "delete", function() toggleApp("iTerm")               end)
hs.hotkey.bind(hyper, "¨",      function() toggleApp("iTerm")               end)
hs.hotkey.bind(hyper, "å",      function() toggleApp("iTerm")               end)
hs.hotkey.bind(hyper, "o",      function() toggleApp("Opera")               end)
hs.hotkey.bind(hyper, "b",      function() toggleApp("Tor Client")          end)
hs.hotkey.bind(hyper, "p",      function() toggleApp("Visual Studio Code")  end)
hs.hotkey.bind(hyper, "m",      function() toggleApp("Safari")              end)
hs.hotkey.bind(hyper, ".",      function() toggleApp("Slack")               end)
hs.hotkey.bind(hyper, "t",      function() toggleApp("Microsoft Teams")     end)
hs.hotkey.bind(hyper, "i",      function() toggleApp("IntelliJ IDEA CE")    end)
hs.hotkey.bind(hyper, "n",      function() toggleApp("Notes")               end)
hs.hotkey.bind(hyper, "k",      function() hs.reload()                      end)

hs.hotkey.bind(terms, "delete", function() toggleApp("iTerm")               end)

-- hs.hotkey.bind(extra, "1", function() moveToSpace(1)            end)
-- hs.hotkey.bind(extra, "2", function() moveToSpace(2)            end)
-- hs.hotkey.bind(extra, "p", function() gotoSpace(2)              end)
hs.hotkey.bind(extra, "n", function() gotoSpace(358)                        end)
hs.hotkey.bind(extra, "0", function() gotoSpace(1036)                       end)
hs.hotkey.bind(extra, "å", function() showSpaces()                          end)
hs.hotkey.bind(extra, "ø", function() newSpace()                            end)
