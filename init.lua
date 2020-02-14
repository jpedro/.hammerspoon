require "apps"
require "mouse"
require "windows"
require "screens"


defStyle = hs.alert.defaultStyle
-- defStyle.fillColor = {["red"]=0,["blue"]=1,["green"]=0.6,["alpha"]=1}
-- defStyle.strokeColor = {["red"]=1,["blue"]=1,["green"]=1,["alpha"]=0}
defStyle.strokeWidth = 6
defStyle.textSize = 90

hs.window.animationDuration = 0
hs.alert.show([[  Hammerspoon loaded  ]], 2)

local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
  hs.reload()
end):start()
