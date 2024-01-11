-- local spaces = require("hs_asm.undocumented.spaces")
local spaces = require("hs._asm.undocumented.spaces")
local currentId = spaces.activeSpace()


-- hs.hotkey.bind({"cmd", "shift"}, "7",      function()
--     local text = spaces.debug.layout()
--     -- local text = spaces.types
--     -- local text = spaces.debug.spaceInfo(1)
--     print(text)
-- end)

function ShowSpacesLayout()
    local text = spaces.debug.layout()
    print(text)
    hs.alert("Space currentId: " .. currentId)
    hs.alert("NextSpaceId: " .. NextSpace())
end

-- hs.hotkey.bind({"cmd", "shift"}, "9", function()
--     local win = hs.window.focusedWindow()
--     spaces.moveWindowToSpace(win:id(), 1036)
--     alert("Move to space 1036")
-- end)

function CreateSpace()
    local spaceId = spaces.createSpace()
    Alert("Created space " .. spaceId)
end

-- function gotoSpace(id)
--     spaces.changeToSpace(id, false)
--     alert("In space " .. spaces.activeSpace())
-- end

function NextSpace()
    local thisID = spaces.activeSpace()
    local nextID = ShowSpaces()
    -- hs.alert.show("thisID " .. thisID .. " --> nextID " .. nextID)

    if nextID == 0 then
        return
    end

    print("--> spaces.nextSpace: " .. nextID)
    local spacesIDArray = spaces.changeToSpace(nextID, false)
    hs.alert.show("In space " .. spaces.activeSpace())
    print("--> spacesIDArray:")
    print(spacesIDArray)
    print("--> thisID:" .. thisID)
    return nextID
end

-- function moveToSpace(id)
--     local spaceId = spaces.query()[id]
--     spaces.moveWindowToSpace(hs.window.focusedWindow():id(), spaceId)
--     spaces.changeToSpace(spaceId)
-- end

function ShowSpaces()
    local win      = hs.window.focusedWindow()
    local screenID = win:screen():spacesUUID()
    local spaceID  = spaces.activeSpace()

    print("")
    print("SCREEN: " .. screenID)
    print("SPACE:  " .. spaceID)
    local found   = false
    local firstId = 0
    local nextId  = 0
    local layout  = spaces.layout()
    for id, screen in pairs(layout) do
        if id == screenID then
            print("-----------------")
            print("* Current screen " .. id)
            print("  Spaces:")
            for key, val in pairs(screen) do
                local mark = "     "

                local first = " "
                local current = " "
                local next = " "

                if firstId == 0 then
                    firstId = val
                    first = "F"
                end
                if found and nextId == 0 then
                    nextId = val
                    next = "N"
                end
                if val == spaceID then
                    found = true
                    current = "C"
                end
                print("  " .. key .. ". " .. first .. current .. next .. "  " .. val)
            end
        else
            print("-----------------")
            print("  Screen " .. id)
            for key, val in pairs(screen) do
                print("    Space " .. key .. ": " .. val)
            end
        end
    end

    if nextId == 0 then
        nextId = firstId
        -- print("    Using firstId " .. nextId)
    end

    print("")
    print("  CURRENT: " .. spaceID)
    print("    FIRST: " .. firstId)
    print("     NEXT: " .. nextId)
    return nextId
end
