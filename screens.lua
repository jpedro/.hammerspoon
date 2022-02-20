function sendToScreen(id)
    hs.window.focusedWindow():moveToScreen(hs.screen.allScreens()[id], nil, true)
    hs.alert.closeAll()
    hs.alert.show("Sent to screen " .. id)
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
    local screens  = hs.screen.allScreens()
    local defStyle = hs.alert.defaultStyle
    local newStyle = hs.alert.defaultStyle
    newStyle.fillColor = {["red"]=0,["blue"]=1,["green"]=0.6,["alpha"]=1}
    newStyle.strokeColor = {["alpha"]=0}
    newStyle.textSize = 60
    newStyle.textColor = {["red"]=1,["blue"]=1,["green"]=1,["alpha"]=1}

    for k, v in pairs(screens) do
        local name = screens[k]:name() or "-"
        message = "  Screen " .. k .. " (" .. name .. ")  "
        hs.alert.show(message, screens[k])
    end
    hs.alert.defaultStyle = defStyle
end
