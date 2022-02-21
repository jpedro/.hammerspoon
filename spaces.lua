local spaces = require("hs._asm.undocumented.spaces")
local currentId = spaces.activeSpace()


hs.hotkey.bind({"cmd", "shift"}, "7",      function()
    local text = spaces.debug.layout()
    -- local text = spaces.types
    -- local text = spaces.debug.spaceInfo(1)
    print(text)
end)

hs.hotkey.bind({"cmd", "shift"}, "9", function()
    local win = hs.window.focusedWindow()
    spaces.moveWindowToSpace(win:id(), 1036)
    alert("Move to space 1036")
end)

function newSpace()
    local spaceId = spaces.createSpace()
    alert("Created space " .. spaceId)
end

function gotoSpace(id)
    spaces.changeToSpace(id, false)
    alert("In space " .. spaces.activeSpace())
end

function nextSpace()
    local currentId = spaces.activeSpace()
    local nextId = showSpaces()
    if nextId == 0 then
        return
    end

    print("--> spaces.changeToSpace: " .. nextId)
    spaces.changeToSpace(nextId, false)
    alert("In space " .. spaces.activeSpace())
end

function moveToSpace(id)
    local spaceId = spaces.query()[id]
    spaces.moveWindowToSpace(hs.window.focusedWindow():id(), spaceId)
    spaces.changeToSpace(spaceId)
end

function showSpaces()
    local win = hs.window.focusedWindow()
    local screenId  = win:screen():spacesUUID()
    local currentId = spaces.activeSpace()
    -- print("----------------- SHOW SPACES")
    print("SCREEN: " .. screenId)
    print("SPACE:  " .. currentId)
    local found   = false
    local firstId = 0
    local nextId  = 0
    local layout  = spaces.layout()
    for id, screen in pairs(layout) do
        if id == screenId then
            -- print("-----------------")
            print("==> Screen " .. id)
            for key, val in pairs(screen) do
                local mark = "   "
                if firstId == 0 then
                    firstId = val
                    mark = " F "
                end
                if found and nextId == 0 then
                    nextId = val
                    mark = " N "
                end
                if val == currentId then
                    found = true
                    mark = ">>>"
                end
                print(mark .. " Space " .. key .. ": " .. val)
            end
        else
            print("... Screen " .. screenId)
            for key, val in pairs(screen) do
                print("    Space " .. key .. ": " .. val)
            end
        end
    end

    if nextId == 0 then
        nextId = firstId
        -- print("    Using firstId " .. nextId)
    end

    print("-----------------")
    print("REPORT")
    print("    currentId: " .. currentId)
    print("      firstId: " .. firstId)
    print("       nextId: " .. nextId)
    return nextId
end
