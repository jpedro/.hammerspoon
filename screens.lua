function SendToScreen(id)
    hs.window.focusedWindow():moveToScreen(hs.screen.allScreens()[id], nil, true)
    Alert("Sent to screen: " .. id)
end

function LoopScreens()
    -- local window = hs.window.focusedWindow()
    -- hs.grid.pushWindowDown(window)
    -- return
    local screens = hs.screen.allScreens()
    local current = hs.window.focusedWindow():screen():id()
    local found = false

    for k, _ in pairs(screens) do
        local id = screens[k]:id()
        print("Screen " .. k .. " with id: " .. id)
        if found then
            SendToScreen(k)
            return
        end
        if id == current then
            found = true
        end
    end
    SendToScreen(1)
end

function ShowScreens()
    hs.alert.closeAll()
    local brightness = hs.brightness.get()
    if brightness then
        hs.alert.show("Brightness" .. brightness, 20)
    end
    local screens = hs.screen.allScreens()
    for id, value in pairs(screens) do
        local name = screens[id]:name() or "-"
        local uuid = screens[id]:getUUID() or "-"
        local message = "  Screen " .. id .. ": " .. name -- .. "\n" .. uuid
        hs.alert.show(message, screens[id], 20)
        hs.alert.show(uuid, screens[id], 20)
    end
end
