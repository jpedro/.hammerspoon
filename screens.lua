function sendToScreen(id)
    hs.window.focusedWindow():moveToScreen(hs.screen.allScreens()[id], nil, true)
    alert("Sent to screen " .. id)
end

function loopScreens()
    local screens = hs.screen.allScreens()
    local current = hs.window.focusedWindow():screen():id()
    local found = false

    for k, _ in pairs(screens) do
        local id = screens[k]:id()
        print("Screen "  .. k .. " with id: " .. id)
        if found then
            sendToScreen(k)
            return
        end
        if id == current then
            found = true
        end
    end
    sendToScreen(1)
end

function showScreens()
    hs.alert.closeAll()
    local screens  = hs.screen.allScreens()
    for id, value in pairs(screens) do
        local name = screens[id]:name() or "-"
        local uuid = screens[id]:getUUID() or "-"
        message = "  Screen " .. id .. ": " .. name -- .. "  " .. uuid
        hs.alert.show(message, screens[id], 10)
        hs.alert.show(uuid, screens[id], 20)
    end
end
