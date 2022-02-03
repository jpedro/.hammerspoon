require "watch"
require "style"
require "mouse"
require "window"
require "screens"
require "chrome"
require "hotkeys"
require "spaces"


local spaces = require("hs._asm.undocumented.spaces")
hs.alert.show(" Hammerspoon loaded [" .. spaces.activeSpace() .. "]", 1)
