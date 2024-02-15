local menu = hs.menubar.new()
local work = {}
local hard = {}
local icon = hs.image.imageFromPath("/Applications/Hammerspoon.app/Contents/Resources/statusicon.pdf")

function WorkFlip()
    local enabled = hs.caffeinate.get("displayIdle")
    if enabled then
        OnHardly()
    else
        OnWorking()
    end
    print("--> work:enabled: " .. tostring(enabled))
end

function OnWorking()
    hs.caffeinate.set("displayIdle", true)
    print("--> OnCaffeineWorking")
    menu:setTitle("●  Working hard")
    menu:setMenu(work)
    -- local icon = hs.image.imageFromPath("/Users/pedro/.hammerspoon/green@2x.png")
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/Custom-Icon-Design-Flatastic-10-Trafficlight-green.icns")
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/green-2.png")
    -- -- local icon = hs.image.imageFromName("User")
    -- -- icon = hs.image.imageFromPath("/Applications/Hammerspoon.app/Contents/Resources/statusicon.pdf")
    -- -- local icon = hs.image.imageFromName(hs.image.systemImageNames["User"])
    -- -- icon:setSize(16)
    -- -- icon:setSize({h = 6, w = 6})
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/circle-8.png")
    local icon2 = hs.image.imageFromPath("/Users/pedro/.hammerspoon/green@2x.png")
    menu:setIcon(icon2)
    print(icon2)

    local enabled = hs.caffeinate.get("displayIdle")
    print("--> caffeine:enabled: " .. tostring(enabled))
    hs.alert.closeAll()
end

function OnHardly()
    -- setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
    print("--> OnHardly")
    hs.caffeinate.set("displayIdle", false)
    menu:setTitle("◯  Hardly working")
    menu:setMenu(hard)

    -- local icon = hs.image.imageFromPath("/Applications/AnyBar.app/Contents/Resources/red@2x.png")
    -- local icon = hs.image.imageFromPath("/Users/pedro/.hammerspoon/green.png")
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/Custom-Icon-Design-Flatastic-10-Trafficlight-red.icns")
    -- local icon = hs.image.imageFromName("UserGuest")
    -- local icon = hs.image.imageFromName(hs.image.systemImageNames["Network"])
    -- icon:setSize({h = 19, w = 15})
    -- menu:setIcon(icon)
    -- menu:setIcon("/Users/pedro/.hammerspoon/green.png")
    print(icon)

    local enabled = hs.caffeinate.get("displayIdle")
    print("--> caffeine:enabled: " .. tostring(enabled))
    Alert("You are hardly working...")
end

function WorkHide()
    print("--> WorkHide")
    menu:removeFromMenuBar()
end

function WorkQuit()
    print("--> WorkQuit")
    menu:delete()
end

function WorkShow()
    print("--> WorkShow")
    menu:returnToMenuBar()
    OnWorking()
end

function WorkToggle()
    local visible = menu:isInMenuBar()
    print("--> WorkShow:isInMenuBar: " .. tostring(visible))
    if visible then
        WorkHide()
    else
        WorkShow()
    end
end

function WorkTest()
    menu:setIcon(icon)
    menu:setTitle("Space currentSpace | Fan: fanSpeed | Temp: temp")
end

work = {
    {
        title = "●  Working hard",
        checked = true,
        disabled = true,
        -- image = icon,
    },
    {
        title = "◯  Hardly working",
        checked = false,
        fn = OnHardly,
    },
    {
        title = "-"
    },
    {
        title = "Hide",
        fn = WorkHide,
    },
    {
        title = "Reload",
        -- image = icon,
        fn = hs.reload
    },
    {
        title = "-",
    },
    {
        title = "Quit",
        fn = WorkQuit,
    },
}

hard = {
    {
        title = "● Working hard",
        checked = false,
        fn = OnWorking,
    },
    {
        title = "◯ Hardly working",
        checked = true,
        disabled = true,
    },
    {
        title = "-"
    },
    {
        title = "Hide",
        fn = WorkHide
    },
    {
        title = "Reload",
        -- image = icon,
        fn = hs.reload
    },
    {
        title = "-"
    },
    {
        title = "Quit",
        fn = WorkQuit
    },
}
