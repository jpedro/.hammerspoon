local spaces = require("hs._asm.undocumented.spaces")
local currentId = spaces.activeSpace()

function newSpace()
    local spaceId = spaces.createSpace()
    hs.alert.show("Created space " .. spaceId)
end

function gotoSpace(id)
    spaces.changeToSpace(id, false)
    hs.alert.closeAll()
    hs.alert.show("In space " .. spaces.activeSpace())
end

function nextSpace()
    -- print("----------------- NEXT SPACE")
    local currentId = spaces.activeSpace()
    -- local nextId = nextId(currentId)
    local nextId = showSpaces()
    if nextId == 0 then
        return
    end

    print("--> spaces.changeToSpace: " .. nextId)
    hs.alert.closeAll()
    -- hs.alert.show("Go to space " .. nextId)
    spaces.changeToSpace(nextId, false)
    hs.alert.show("In space " .. spaces.activeSpace())
end

function moveToSpace(id)
    local spaceId = spaces.query()[id]
    spaces.moveWindowToSpace(hs.window.focusedWindow():id(), spaceId)
    spaces.changeToSpace(spaceId)
end

function showSpaces()
    local win = hs.window.focusedWindow()
    local screenId = win:screen():spacesUUID()
    local spaceId = spaces.activeSpace()
    -- print("----------------- SHOW SPACES")
    print("SCREEN: " .. screenId)
    print("SPACE:  " .. spaceId)
    local found   = false
    local firstId = 0
    local nextId  = 0
    local layout  = spaces.layout()
    for id, screen in pairs(layout) do
        if id == screenId then
            -- print("-----------------")
            print("==> Screen " .. id)
            for key, val in pairs(screen) do
                -- print("    (" .. key .. ": " .. val .. ")")
                local mark = "   "
                if firstId == 0 then
                    -- firstId = val
                    firstId = key
                    mark = " F "
                    -- print("    FIRST: " .. firstId)
                end
                if found and nextId == 0 then
                    nextId = val
                    mark = " N "
                    -- print("    NEXT: " .. nextId)
                end
                if val == spaceId then
                    found = true
                    mark = ">>>"
                    -- print("    FOUND: " .. val)
                end
                print(mark .. " Space " .. key .. ": " .. val)
            end
        else
            print("... Screen " .. screenId)
            for key, val in pairs(screen) do
                print("... Space " .. key .. ": " .. val)
            end
        end
    end

    if nextId == 0 then
        nextId = firstId
        -- print("    Using firstId " .. nextId)
    end

    print("-----------------")
    print("REPORT")
    print("    current: " .. spaceId)
    print("    firstId: " .. firstId)
    print("    nextId:  " .. nextId)
    return nextId
end
