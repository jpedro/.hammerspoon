local dir = os.getenv("HOME") .. "/.hammerspoon/"
local watcher = hs.pathwatcher.new(dir, function(files)
    local reload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            reload = true
            hs.reload()
            return
        end
    end
    if reload then
        hs.reload()
    end
end)

watcher:start()
