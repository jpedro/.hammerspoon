require "apps"
require "mouse"
require "window"
require "screens"

defStyle = hs.alert.defaultStyle
-- defStyle.fillColor = {["red"]=0,["blue"]=1,["green"]=0.6,["alpha"]=0.8}
-- defStyle.strokeColor = {["red"]=1,["blue"]=1,["green"]=1,["alpha"]=0}
defStyle.strokeWidth = 6
defStyle.textSize = 40

hs.window.animationDuration = 0
hs.alert.show([[  Hammerspoon loaded  ]], 1)

local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
  hs.reload()
end):start()

local hotkeyHyper  = {"cmd", "alt", "ctrl"}
local hotkeyAlt  = {"alt"}

hs.hotkey.bind(hotkeyAlt,   ".",      mouseHighlight)
hs.hotkey.bind(hotkeyHyper, "space",  windowMaximize)
hs.hotkey.bind(hotkeyHyper, "left",   windowHalf)
hs.hotkey.bind(hotkeyHyper, "right",  windowTwoThirds)
hs.hotkey.bind(hotkeyHyper, "down",   windowOneThird)
hs.hotkey.bind(hotkeyHyper, "up",     windowQuarter)
hs.hotkey.bind(hotkeyHyper, "-",      windowHorizontally)
