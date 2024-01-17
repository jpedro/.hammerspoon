require "util"
require "settings"
require "watch"
require "mouse"
require "windows"
require "screens"
require "work"
-- require "style"
-- require "catcher"
-- require "spaces"
require "chrome"
require "events"
require "keys"

WorkShow()

Alert("Hammerspoon up and running", 2)

hs.alert("Focused space: " .. hs.spaces.focusedSpace())
