-- local function StartsWith(text, find)
--   return text:sub(1, #find) == find
-- end

-- local function EndsWith(text, find)
--   return find == "" or text:sub(-#find) == find
-- end

-- function ChromeProfile(profile)
--   for i, window in ipairs(hs.window.allWindows()) do
--     local title = window:title()
--     local found = string.find(title, "Google Chrome", 1, true)
--     local value = found and "true" or "false"
--     print("==> Window: '" .. title .. "' isChrome: " .. value)

--     if found then
--       local hasProfile = EndsWith(title, profile)
--       value = hasProfile and "true" or "false"
--       print("==> Window: '" .. title .. "' hasProfile: " .. value)
--       if hasProfile then
--         window:focus()
--         print("==> And we are done")
--         return
--       end
--     end
--   end
-- end

function CycleChromeProfiles()
    hs.application.launchOrFocus("Google Chrome")
    local app = hs.appfinder.appFromName("Google Chrome")

    local itemHome = {"Profiles", "Pedro (Home)"}
    local itemWork = {"Profiles", "Pedro (Work)"}

    local menuHome = app:findMenuItem(itemHome)
    local menuWork = app:findMenuItem(itemWork)

    print("Home menu:")
    print(menuHome)
    PrintTable(menuHome, 0)

    print("Work menu:")
    print(menuWork)
    PrintTable(menuWork, 0)

    if (menuHome and not menuHome["ticked"]) then
        app:selectMenuItem(itemHome)
        hs.alert.show("Home profile selected")
        return
    end

    if (menuWork and not menuWork["ticked"]) then
        app:selectMenuItem(itemWork)
        hs.alert.show("Nordcloud profile selected")
        return
    end
end
