local hyper = {"cmd", "alt", "ctrl"}
local shift = {"cmd", "shift"}

function showApp(name)
    return function() hs.application.launchOrFocus(name) end
end

function showHelp()
    local text = [[
 Chrome                  ⌃⌥⌘ Enter
 Slack                   ⌃⌥⌘ .
 iTerm2                  ⌃⌥⌘ @
 Code                    ⌃⌥⌘ P
 IntelliJ                ⌃⌥⌘ I
 Move to next screen     ⌃⌥⌘ L
 Working hard            ⌃⌥⌘ J
 Clear alerts            ⌃⌥⌘ K
 Reload                  ⌃⌥⌘ R
 Hammerpsoon             ⌃⌥⌘ H
 This help               ⌃⌥⌘ +]]
    alert(text, 20)
end

hs.hotkey.bind("cmd", "'",      mouseHighlight)
hs.hotkey.bind("ctrl", "<",     mouseHighlight)
hs.hotkey.bind("alt", ".",      mouseHighlight)

hs.hotkey.bind(hyper, "space",  windowMaximize)
hs.hotkey.bind(hyper, "left",   windowHalf)
hs.hotkey.bind(hyper, "right",  windowSixty)
hs.hotkey.bind(hyper, "down",   windowThird)
hs.hotkey.bind(hyper, "up",     windowQuarter)
hs.hotkey.bind(hyper, "-",      windowHorizontally)
hs.hotkey.bind(hyper, "s",      showScreens)
hs.hotkey.bind(hyper, "l",      loopScreens)
hs.hotkey.bind(hyper, "x",      showStored)
hs.hotkey.bind(hyper, "+",      showHelp)
hs.hotkey.bind(hyper, "k",      hs.alert.closeAll)
hs.hotkey.bind(hyper, "r",      hs.reload)
hs.hotkey.bind(hyper, "m",      caffeineMenuToggle)
hs.hotkey.bind(hyper, "j",      caffeineWorkToggle)

hs.hotkey.bind(hyper, "return", showApp("Google Chrome"))
hs.hotkey.bind(hyper, ".",      showApp("Slack"))
hs.hotkey.bind(hyper, "@",      showApp("iTerm"))
hs.hotkey.bind(hyper, "p",      showApp("Visual Studio Code"))
hs.hotkey.bind(hyper, "å",      showApp("Brave Browser"))
hs.hotkey.bind(hyper, "i",      showApp("IntelliJ IDEA CE"))
hs.hotkey.bind(hyper, "n",      showApp("Notes"))
hs.hotkey.bind(hyper, "h",      showApp("Hammerspoon"))

-- hs.hotkey.bind("cmd", "@",      function() showApp("iTerm")                 end)
-- hs.hotkey.bind(shift, "delete", function() showApp("iTerm")                 end)
-- hs.hotkey.bind(hyper, "delete", function() showApp("iTerm")                 end)
-- hs.hotkey.bind(hyper, "å",      function() showApp("iTerm")                 end)
-- hs.hotkey.bind(hyper, "¨",      function() showApp("iTerm")                 end)
-- hs.hotkey.bind(hyper, "t",      function() showApp("Microsoft Teams")       end)
-- hs.hotkey.bind(hyper, "o",      function() showApp("Opera")                 end)
-- hs.hotkey.bind(hyper, "n",      function() showApp("Notes")                 end)

-- expose = hs.expose.new(nil, {
--     showThumbnails=false,
--     fitWindowsMaxIterations=20,
--     fitWindowsInBackground=false,
--     backgroundColor={0.5, 0.5, 0.5, 0.5},
--     otherSpacesStripWidth=0,
--     nonVisibleStripWidth=0,
--     showThumbnails=true
-- })

-- hs.hotkey.bind('cmd', "ø", function() expose:toggleShow()                   end)
-- -- hs.hotkey.bind('cmd', "ø", 'ddd', function() expose:toggleShow()          end)
-- -- hs.hotkey.bind('cmd','å','App Expose',function()expose_browsers:toggleShow()end)


-- hs.hotkey.bind(hyper, "y",      cleanLoaded)
-- hs.hotkey.bind(hyper, "m",      function() showApp("Safari")                end)
-- hs.hotkey.bind(extra, "1", function() moveToSpace(1)            end)
-- hs.hotkey.bind(extra, "2", function() moveToSpace(2)            end)
-- hs.hotkey.bind(extra, "p", function() gotoSpace(2)              end)
-- hs.hotkey.bind(extra, "n", function() gotoSpace(358)                        end)
-- hs.hotkey.bind(extra, "0", function() gotoSpace(1036)                       end)
-- hs.hotkey.bind(shift, "å", function() showSpaces()                          end)
-- hs.hotkey.bind(shift, "ø", function() createSpace()                         end)
-- hs.hotkey.bind(shift, "æ", function() nextSpace()                           end)
-- hs.hotkey.bind(shift, "0", function() showSpacesLayout()                    end)

-- function showApp(name)
--     focused = hs.window.focusedWindow()
--     if focused then
--         app = focused:application()
--         print("App name: " .. app:name())
--         print("App title: " .. app:title())
--         -- if app:title() == name then
--         if app:title():sub(1, #name) == name then
--             -- alert("Hidding " .. name)
--             app:hide()
--             return
--         end
--     end
--     alert("Showing " .. name)
-- end
