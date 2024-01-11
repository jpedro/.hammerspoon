
local function reloadConfig(files)
    -- local reload = false
    for _, file in pairs(files) do
        print("Found file " .. file)
        if file:sub(-4) == ".lua" then
            print("And we are reloading due to " .. file)
            hs.reload()
            return
        end
    end
end

local homeDir = os.getenv("HOME") .. "/.hammerspoon/"
local watcher = hs.pathwatcher.new(homeDir, reloadConfig)
-- local watcher = hs.pathwatcher.new(homeDir, hs.reload)
watcher:start()
