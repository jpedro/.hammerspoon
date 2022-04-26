require "settings"
require "watch"
require "mouse"
require "windows"
require "screens"
-- require "chrome"
-- require "spaces"
require "keys"

local newStyle = hs.alert.defaultStyle
newStyle.fillColor = {["red"]=0,["blue"]=1,["green"]=0.6,["alpha"]=1}
newStyle.strokeColor = {["red"]=0,["blue"]=0,["green"]=0,["alpha"]=0.7}
newStyle.strokeWidth = 10
newStyle.textSize = 60
newStyle.textColor = {["red"]=1,["blue"]=1,["green"]=1,["alpha"]=1}
newStyle.fadeInDuration = 0
newStyle.fadeOutDuration = 0.5
newStyle.radius = 30
function alert(message)

    hs.alert.closeAll()
    return hs.alert.show(message)
end


local spaces = require("hs._asm.undocumented.spaces")
alert("Hammerspoon loaded (Space " .. spaces.activeSpace() .. ")", 1)

function help()
    local text = [[
Hyper                   ⌘⌥⌃ OK
Grid                    Hyper-G
Finder                  Hyper-F
Tweetbot                Hyper-T
Sublime Text            Hyper-E
iTerm2                  Hyper-V
]]
    alert(text)
end

-- help()




-- -- set up your instance(s)
-- expose = hs.expose.new(nil,{showThumbnails=false}) -- default windowfilter, no thumbnails
-- expose_app = hs.expose.new(nil,{onlyActiveApplication=true}) -- show windows for the current application
-- expose_space = hs.expose.new(nil,{includeOtherSpaces=false}) -- only windows in the current Mission Control Space
-- expose_browsers = hs.expose.new{'Safari','Google Chrome'} -- specialized expose using a custom windowfilter
-- -- for your dozens of browser windows :)

-- -- then bind to a hotkey
-- hs.hotkey.bind('ctrl-cmd','e','Expose',function()expose:toggleShow()end)
-- hs.hotkey.bind('ctrl-cmd-shift','e','App Expose',function()expose_app:toggleShow()end)
