require "settings"
require "watch"
require "mouse"
require "windows"
require "screens"
-- require "chrome"
require "spaces"
require "hotkeys"


local spaces = require("hs._asm.undocumented.spaces")
hs.alert.show("Hammerspoon loaded (Space " .. spaces.activeSpace() .. ")", 1)

function help()
    local text = [[
Hyper                   ⌘⌥⌃ OK
Grid                    Hyper-G
Finder                  Hyper-F
Tweetbot                Hyper-T
Sublime Text            Hyper-E
iTerm2                  Hyper-V
]]
    hs.alert.closeAll()
    hs.alert.show(text)
end

-- help()
