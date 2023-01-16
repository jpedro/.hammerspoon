local caffeine = hs.menubar.new()
local working  = {}
local hardly   = {}

function onCaffeineWorking()
    hs.caffeinate.set("displayIdle", true)
    print("--> onCaffeineWorking")
    caffeine:setTitle("Working hard  ●")
    -- caffeine:setTitle("⬤")
    caffeine:setMenu(working)
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/Custom-Icon-Design-Flatastic-10-Trafficlight-green.ico")
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/Custom-Icon-Design-Flatastic-10-Trafficlight-green.icns")
    -- local icon = hs.image.imageFromPath("/Users/pedro/Desktop/green-2.png")
    -- -- local icon = hs.image.imageFromName("User")
    -- -- icon = hs.image.imageFromPath("/Applications/Hammerspoon.app/Contents/Resources/statusicon.pdf")
    -- -- local icon = hs.image.imageFromName(hs.image.systemImageNames["User"])
    -- -- icon:setSize(16)
    -- -- icon:setSize({h = 6, w = 6})
    -- caffeine:setIcon(icon)
    -- print(icon)

    local enabled = hs.caffeinate.get("displayIdle")
    print("--> caffeine:enabled: " .. tostring(enabled))
end

function onCaffeineHardly()
    -- setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
    print("--> onCaffeineHardly")
    hs.caffeinate.set("displayIdle", false)
    caffeine:setTitle("Hardly working  ◯")
    caffeine:setMenu(hardly)

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

function caffeineHide()
    print("--> caffeineHide")
    caffeine:removeFromMenuBar()
end

function caffeineShow()
    print("--> caffeineShow")
    caffeine:returnToMenuBar()
    onCaffeineWorking()
end

function caffeineFlip()
    local visible = caffeine:isInMenuBar()
    print("--> caffeine:isInMenuBar: " .. tostring(visible))
    if visible then
        -- print("    --> caffeineHide")
        -- caffeine:removeFromMenuBar()
        caffeineHide()
    else
        caffeineShow()
        -- print("    --> caffeineShow")
        -- caffeine:returnToMenuBar()
        -- onCaffeineWorking()
    end
end

working = {
    {
        title = "Working hard",
        checked = true,
        disabled = true
    },
    {
        title = "Hardly working",
        -- fn = onCaffeineWorking,
        fn = onCaffeineHardly,
    },
    {
        title = "-"
    },
    {
        title = "Close",
        fn = caffeineHide
    },
}

hardly = {
    {
        title = "Working hard",
        fn = onCaffeineWorking,
        -- fn = onCaffeineHardly,
    },
    {
        title = "Hardly working",
        checked = true,
        disabled = true
    },
    {
        title = "-"
    },
    {
        title = "Close",
        fn = caffeineHide
    },
}

caffeineShow()

-- function setCaffeineDisplay(awake)
--     if awake then
--         caffeine:setTitle("Working hard")
--         -- caffeine:setTitle("△")
--         -- caffeine:setTitle("○")
--         -- caffeine:setTitle("⟁")
--         -- caffeine:setTitle("🕓")
--         -- caffeine:setTitle("⬤")
--         -- caffeine:setTitle("◼️")
--     else
--         -- caffeine:setIcon("⬤")
--         -- caffeine:setTitle("You are not supposed to see this")
--         caffeine:setTitle("Hardly working")
--         -- caffeine:setTitle("●")
--         -- caffeine:setTitle("▼")
--         -- caffeine:setTitle("◯")
--         -- caffeine:setMenu({disabled = true, checked = true})
--     end
-- end

-- function caffeineClicked()
--     setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
-- end

-- if caffeine then
--     hs.caffeinate.set("displayIdle", true)
--     -- caffeine:setClickCallback(caffeineClicked)
--     -- hs.caffeinate.toggle("displayIdle")
--     setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
--     -- setCaffeineDisplay(true)
-- end

-- local caffeine = hs.menubar.new()
-- function setCaffeineDisplay(state)
--     if state then
--         caffeine:setTitle("💪")
--     else
--         caffeine:setTitle("💤")
--     end
-- end

-- function caffeineClicked()
--     setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
-- end

-- if caffeine then
--     caffeine:setClickCallback(caffeineClicked)
--     setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
-- end
