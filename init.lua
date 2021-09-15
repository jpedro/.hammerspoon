require "mouse"
require "window"
require "screens"
require "hotkeys"

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

-- local hyper = {"cmd", "alt", "ctrl"}
-- local alt   = {"alt"}

-- hs.hotkey.bind(alt,   ".",      mouseHighlight)
-- hs.hotkey.bind(hyper, "space",  windowMaximize)
-- hs.hotkey.bind(hyper, "left",   windowHalf)
-- hs.hotkey.bind(hyper, "right",  windowTwoThirds)
-- hs.hotkey.bind(hyper, "down",   windowOneThird)
-- hs.hotkey.bind(hyper, "up",     windowQuarter)
-- hs.hotkey.bind(hyper, "-",      windowHorizontally)

-- hs.hotkey.bind("cmd", "´", mouseHighlight)
