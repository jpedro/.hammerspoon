require "util"
require "settings"
require "watch"
require "mouse"
require "windows"
require "screens"
require "caffeine"
-- require "style"
-- require "catcher"
-- require "spaces"
require "chrome"
require "events"
require "keys"

CaffeineShow()

Alert("Hammerspoon up and running", 2)

hs.alert("Focused space: " .. hs.spaces.focusedSpace())
