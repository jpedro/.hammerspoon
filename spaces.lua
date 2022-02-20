local spaces = require("hs._asm.undocumented.spaces")
local currentId = spaces.activeSpace()

function nextSpace()
    print("----------------- NEXT SPACE")
    local currentId = spaces.activeSpace()
    hs.alert.show("In space " .. currentId)
    -- local nextId = nextId(currentId)
    local nextId = showSpaces()
    if nextId == 0 then
        return
    end

    print("--> spaces.changeToSpace: " .. nextId)
    spaces.changeToSpace(nextId, false)
end

function MoveWindowToSpace(sp)
    local spaceID = spaces.query()[sp]
    spaces.moveWindowToSpace(hs.window.focusedWindow():id(), spaceID)
    spaces.changeToSpace(spaceID)
end
hs.hotkey.bind({"cmd", "shift"}, "1", function()
    MoveWindowToSpace(1)
end)
hs.hotkey.bind({"cmd", "shift"}, "2", function()
    MoveWindowToSpace(2)
end)

-- function moveToSpace(num)
--   local currentId = spaces.activeSpace()
--   local win = hs.window.focusedWindow()
--   local nextId = nextId(currentId)
--   if nextId == nil then
--     return
--   end

--   spaces.moveWindowToSpace(win:id(), nextId)
--   spaces.changeToSpace(nextId)
--   print("==> Window moved to space " .. nextId .. ".")
--   currentId = nextId
-- end

function showSpaces()
    local win = hs.window.focusedWindow()
    local screenId = win:screen():spacesUUID()
    local spaceId = spaces.activeSpace()
    print("----------------- SHOW SPACES")
    print("CURRENT SCREEN: " .. screenId)
    print("CURRENT SPACE:  " .. spaceId)
    local found   = false
    local firstId = 0
    local nextId  = 0
    local layout  = spaces.layout()
    for id, screen in pairs(layout) do
        if id == screenId then
            print("-----------------")
            print("==> Screen ID " .. id)
            for key, val in pairs(screen) do
                -- print("    (" .. key .. ": " .. val .. ")")
                local mark = "   "
                if firstId == 0 then
                    firstId = val
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
            print("... Skipped " .. screenId)
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

-- function nextId(currentId)
--   local win = hs.window.focusedWindow()
--   local layout = spaces.layout()
--   local firstId = 0

--   print("==> currentId " .. currentId)
--   for id, space in pairs(layout) do
--     local previousId = 0
--     for key, val in pairs(space) do
--       print("==> Key " .. key)
--       print("==> Val " .. val)
--       -- Save the first spaceId
--       if previousId == 0 then
--         firstId = val
--         print("==> Found firstID " .. firstId)
--       end

--       -- If the previous is the current, jump to this instead
--       if previousId == currentId then
--         print("==> Going to jump to " .. val)
--         return val
--       end
--       previousId = val
--       print("==> previousId is now " .. previousId)
--     end
--   end

--   print("==> Using the firstId " .. firstId)
--   return firstId
-- end

local extra = {"cmd", "shift"}
hs.hotkey.bind(extra, "n", function()
    nextSpace()
end)
hs.hotkey.bind(extra, "å", function()
    showSpaces()
end)
-- hs.hotkey.bind(extra, "right", function()
--     moveToSpace()
-- end)
