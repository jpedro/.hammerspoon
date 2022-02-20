require "settings"
require "watch"
require "mouse"
require "windows"
require "screens"
require "chrome"
require "hotkeys"
require "spaces"


local spaces = require("hs._asm.undocumented.spaces")
hs.alert.show("Hammerspoon loaded [Space " .. spaces.activeSpace() .. "]", 1)
