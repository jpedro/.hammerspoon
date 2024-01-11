local menu = hs.menubar.new()
local work = {}
local hard = {}

function CaffeineFlip()
    local enabled = hs.caffeinate.get("displayIdle")
    if enabled then
        OnCaffeineHard()
    else
        OnCaffeineWork()
    end
    print("--> caffeine:enabled: " .. tostring(enabled))
end

function OnCaffeineWork()
    hs.caffeinate.set("displayIdle", true)
    print("--> OnCaffeineWorking")
    menu:setTitle("●  Working hard")
    menu:setMenu(work)
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/Custom-Icon-Design-Flatastic-10-Trafficlight-green.ico")
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/Custom-Icon-Design-Flatastic-10-Trafficlight-green.icns")
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/green-2.png")
    -- -- local icon = hs.image.imageFromName("User")
    -- -- icon = hs.image.imageFromPath("/Applications/Hammerspoon.app/Contents/Resources/statusicon.pdf")
    -- -- local icon = hs.image.imageFromName(hs.image.systemImageNames["User"])
    -- -- icon:setSize(16)
    -- -- icon:setSize({h = 6, w = 6})
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/circle-8.png")
    -- caffeine:setIcon(icon)
    -- print(icon)

    local enabled = hs.caffeinate.get("displayIdle")
    print("--> caffeine:enabled: " .. tostring(enabled))
end

function OnCaffeineHard()
    -- setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
    print("--> OnCaffeineHardly")
    hs.caffeinate.set("displayIdle", false)
    menu:setTitle("◯  Hardly working")
    menu:setMenu(hard)

    -- local icon = hs.image.imageFromPath("/Applications/AnyBar.app/Contents/Resources/red@2x.png")
    -- icon = hs.image.imageFromPath("/Applications/Hammerspoon.app/Contents/Resources/statusicon.pdf")
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/Custom-Icon-Design-Flatastic-10-Trafficlight-red.ico")
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/Custom-Icon-Design-Flatastic-10-Trafficlight-red.icns")
    -- local icon = hs.image.imageFromName("UserGuest")
    -- local icon = hs.image.imageFromName(hs.image.systemImageNames["Network"])
    -- icon:setSize({h = 12, w = 12})
    -- caffeine:setIcon(icon)
    -- print(icon)

    local enabled = hs.caffeinate.get("displayIdle")
    print("--> caffeine:enabled: " .. tostring(enabled))
end

function CaffeineHide()
    print("--> caffeineHide")
    menu:removeFromMenuBar()
end

function CaffeineQuit()
    print("--> CaffeineHide")
    menu:delete()
end

function CaffeineShow()
    print("--> CaffeineShow")
    menu:returnToMenuBar()
    OnCaffeineWork()
end

function CaffeineToggle()
    local visible = menu:isInMenuBar()
    print("--> Caffeine:isInMenuBar: " .. tostring(visible))
    if visible then
        CaffeineHide()
    else
        CaffeineShow()
    end
end

work = {
    {
        title = "●  Working hard",
        checked = true,
        disabled = true,
    },
    {
        title = "◯  Hardly working",
        checked = false,
        fn = OnCaffeineHard,
    },
    {
        title = "-"
    },
    {
        title = "Hide",
        fn = CaffeineHide,
    },
    {
        title = "-",
    },
    {
        title = "Quit",
        fn = CaffeineQuit,
    },
}

hard = {
    {
        title = "● Working hard",
        checked = false,
        fn = OnCaffeineWork,
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
        fn = CaffeineHide
    },
    {
        title = "-"
    },
    {
        title = "Quit",
        fn = CaffeineQuit
    },
}
