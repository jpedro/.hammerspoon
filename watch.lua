local watcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
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
    -- hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
    -- hs.reload()
end)

watcher:start()
