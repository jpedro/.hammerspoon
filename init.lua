require "apps"
require "mouse"
require "windows"
require "screens"

hs.window.animationDuration = 0
hs.alert.show([[  Hammerspoon loaded  ]], 2)

local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
  hs.reload()
end):start()
