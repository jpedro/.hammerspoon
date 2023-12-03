local menuHeight   = hs.screen.allScreens()[1]:frame().y
-- local lastFull    = 0
local lastHalf     = 0
local lastHozintal = 0
local lastThird    = 0
local lastQuarter  = 0
local lastSixty    = 0
local gap          = 1
-- local gap2         = 25

local points       = {}
local sizes        = {}

-- local points2 = {
--   a = {x = 0.00, y = 0.00},
--   b = {x = 0.50, y = 0.00},
--   c = {x = 0.50, y = 0.50},
--   d = {x = 0.00, y = 0.50},

--   e = {x = 0.33, y = 0.00},
--   f = {x = 0.66, y = 0.00},

--   g = {x = 0.33, y = 0.00},
--   h = {x = 0.66, y = 0.00},
-- }
-- local sizes2 = {
--   height  = {h = 1.00, w = 0.50},
--   width   = {h = 0.50, w = 1.00},
--   third   = {h = 1.00, w = 0.33},
--   sixty   = {h = 1.00, w = 0.67},
--   quarter = {h = 0.50, w = 0.50},
--   sixth   = {h = 0.50, w = 0.33},
-- }

local screens      = hs.screen.allScreens()
local watcher      = hs.screen.watcher.new(function(x)
    print("Screen changed " .. x)
    alert("Screen changed")
    screens = hs.screen.allScreens()
    PrintTable(screens, 0)
end)
watcher:start()

function Refresh(win)
    local screen = win:screen():frame()

    -- |a    b    |
    -- |          |
    -- |c    d    |

    -- a: x: screen starting x
    --    y: screen starting y

    -- b: x: screen half width
    --    y: screen starting y

    points = {
        -- origin + origin
        a = {
            x = screen.x,
            y = screen.y,
        },

        -- origin + half height
        b = {
            x = screen.x + screen.w / 2 + gap,
            y = screen.y,
        },

        -- half width + half height
        c = {
            x = screen.x + screen.w / 2 + gap,
            y = screen.y + screen.h / 2 + gap,
        },

        -- origin + half height
        d = {
            x = screen.x,
            y = screen.y + screen.h / 2 + gap,
        },

        -- 1st third + origin
        e = {
            x = screen.x + screen.w / 3 + gap,
            y = screen.y,
        },

        -- 2nd third + origin
        f = {
            x = screen.x + screen.w / 3 * 2 + gap,
            y = screen.y,
        },

        -- 1st third + half height
        g = {
            x = screen.x + screen.w / 3 + gap,
            -- y = screen.y - menuHeight + screen.h / 2 + gap,
            y = screen.y + screen.h / 2 + gap,
        },

        -- 2nd third + half height
        h = {
            x = screen.x + screen.w / 3 * 2 + gap,
            -- y = screen.y - menuHeight + screen.h / 2 + gap,
            y = screen.y + screen.h / 2 + gap,
        },

        s = {
            x = screen.x + screen.w * 0.6 + gap,
            y = screen.y,
        },

        -- m = {
        --     x = screen.x + screen.w / 6,
        --     y = screen.y + screen.h / 6,
        -- },
        -- k = {
        --     x = screen.x + screen.w * 0.45,
        --     y = screen.y,
        -- },
    }

    sizes = {
        full = {
            h = screen.h,
            w = screen.w,
        },
        half = {
            h = screen.h,
            w = screen.w / 2 - gap,
        },
        quarter = {
            h = screen.h / 2 - gap + 2,
            w = screen.w / 2 - gap,
        },
        horizontal = {
            h = screen.h / 2 - gap,
            w = screen.w,
        },
        third = {
            h = screen.h,
            w = screen.w / 3 - gap,
        },
        sixty = {
            h = screen.h,
            w = screen.w * 0.6 - gap,
        },
        forty = {
            h = screen.h,
            w = screen.w * 0.4 - gap,
        },
    }

    print("---")
    print("Sizes for screen:")
    PrintTable(sizes, 0)
    print("---")
    print("Points for screen:")
    PrintTable(points, 0)
end

local prevSizes = {}
-- local prevCount = 0

function ShowStored()
    local text = "Windows stored:"
    local stored = nil
    print("Windows stored:")
    for k, v in pairs(prevSizes) do
        stored = hs.window.get(k)
        if stored then
            text = text .. "- " .. k .. ": " .. v.x .. ": " .. stored:title()
            print("- " .. k .. ": " .. v.x)
        else
            text = text .. "- " .. k .. ": NOT EXISTS"
            print("- " .. k .. ": NOT EXISTS")
        end
    end
    alert(text)
end

function CleanLoaded()
    print("Cleaning stored windows...")
    for k, v in pairs(prevSizes) do
        local stored = hs.window.get(k)
        if stored then
            print("-- Exists " .. k)
        else
            prevSizes[k] = nil
            print("-- Gone " .. k)
        end
    end
    print("Done")
end

function WindowMaximize()
    local win = hs.window.focusedWindow()
    if win == nil then
        return alert("Select a window first.", 1)
    end

    local windowId    = win:id()
    local screen      = win:screen()
    local screenFrame = screen:frame()
    local windowFrame = win:frame()

    if windowFrame == screenFrame then
        print("Frames are the same size")
        local prev = prevSizes[windowId]
        if prev then
            print("-- Found previously stored frame")
            win:setFrame(prev)
            prevSizes[windowId] = nil
            print("-- Removed previous frame for windowId: " .. windowId)
        else
            print("-- No previous. Setting it at 10%/80%")
            local newFrame = hs.geometry.copy(win:frame())
            newFrame.x = screenFrame.w * 0.1
            newFrame.y = screenFrame.h * 0.1
            newFrame.w = screenFrame.w * 0.8
            newFrame.h = screenFrame.h * 0.8
            win:setFrame(newFrame)
        end
    else
        print("-- Not the same frame")
        prevSizes[windowId] = hs.geometry.copy(win:frame())
        print("-- Stored frame for windowId: " .. windowId)
        win:maximize()
    end
end

-- function windowMaximize2()

--     local win = hs.window.focusedWindow()
--     if win == nil then
--         return hs.alert.show("Select a window first.", 1)
--     end

--     if prevSizes[win:id()] then
--         hs.alert.show("PREVIOUS EXISTS")
--         win:setFrame(prevSizes[win:id()])
--         prevSizes[win:id()] = nil
--     else
--         hs.alert.show("NO PREVIOUS")
--         prevSizes[win:id()] = hs.geometry.copy(win:frame())
--         win:maximize()
--     end

--   -- function len(table)
--   --   local count = 0
--   --   for n in pairs(table) do
--   --     count = count + 1
--   --   end
--   --   return count
--   -- end

--   -- local id = win:id()
--   -- local last = saved[id]
--   -- if last == nil then
--   --   saved[id] = {}
--   --   saved[id]["rect"] = win:frame()
--   --   local rect = saved[id]["rect"]
--   --   print("==> Saved current window")
--   --   print("    rect.x " .. rect.x)
--   --   print("    rect.y " .. rect.y)
--   --   print("    rect.h " .. rect.h)
--   --   print("    rect.w " .. rect.w)
--   --   print("==> Saved: " .. len(saved) .. ".")
--   --   win:maximize()

--   -- else
--   --   local rect = last["rect"]
--   --   print("==> Found previous window")
--   --   print("    rect.x " .. rect.x)
--   --   print("    rect.y " .. rect.y)
--   --   print("    rect.h " .. rect.h)
--   --   print("    rect.w " .. rect.w)
--   --   win:setFrame(rect)
--   --   saved[id] = nil
--   --   print("==> Saved: " .. len(saved) .. ".")
--   -- end
-- end

function ShowWindow()
    local win = hs.window.focusedWindow()
    if win == nil then
        return alert("Select a window first.", 1)
    end

    Refresh(win)
    local rect = win:frame()

    local screen = win:screen():frame()
    print("---")
    print("Screen rect:")
    PrintTable(screen, 0)

    print("---")
    print("Window rect:")
    PrintTable(rect, 0)

    print("---")
    print("Points a:")
    PrintTable(points.a, 0)

    print("---")
    print("Sizes sixty:")
    PrintTable(sizes.sixty, 0)
end

function WindowHalf()
    local win = hs.window.focusedWindow()
    if win == nil then
        return alert("Select a window first.", 1)
    end

    Refresh(win)
    local rect = win:frame()

    rect = sizes.half

    if lastHalf == 0 then
        rect.x = points.a.x
        rect.y = points.a.y
    else
        rect.x = points.b.x
        rect.y = points.b.y
    end

    lastHalf = 1 - lastHalf
    win:setFrame(rect)
end

function WindowSixty()
    local win = hs.window.focusedWindow()
    if win == nil then
        return alert("Select a window first.", 1)
    end

    Refresh(win)
    local rect = win:frame()

    print("---")
    print("Moving sixty")

    if lastSixty == 0 then
        print("Moving to a")
        rect = sizes.sixty
        rect.x = points.a.x
        rect.y = points.a.y
    else
        print("Moving to s")
        rect = sizes.forty
        rect.x = points.s.x
        rect.y = points.s.y
    end

    PrintTable(rect, 0)

    lastSixty = 1 - lastSixty
    win:setFrame(rect)
end

function WindowThird()
    local win = hs.window.focusedWindow()
    if win == nil then
        return alert("Select a window first.", 1)
    end

    Refresh(win)
    local rect = win:frame()

    if lastThird == 0 then
        rect.x = points.a.x
        rect.y = points.a.y
    elseif lastThird == 1 then
        rect.x = points.e.x
        rect.y = points.e.y
    else
        rect.x = points.f.x
        rect.y = points.f.y
    end

    rect.w = sizes.third.w
    rect.h = sizes.third.h

    if lastThird == 2 then
        lastThird = 0
    else
        lastThird = lastThird + 1
    end

    win:setFrame(rect)
end

function WindowHorizontally()
    local win = hs.window.focusedWindow()
    if win == nil then
        return alert("Select a window first.", 1)
    end

    Refresh(win)
    local rect = win:frame()

    if lastHozintal == 0 then
        rect.x = points.a.x
        rect.y = points.a.y
    else
        rect.x = points.d.x
        rect.y = points.d.y
    end

    rect.w = sizes.horizontal.w
    rect.h = sizes.horizontal.h

    lastHozintal = 1 - lastHozintal
    win:setFrame(rect)
end

function WindowQuarter()
    local win = hs.window.focusedWindow()
    if win == nil then
        return alert("Select a window first.", 1)
    end

    Refresh(win)
    local rect = win:frame()

    if lastQuarter == 0 then
        rect.x = points.a.x
        rect.y = points.a.y
    elseif lastQuarter == 1 then
        rect.x = points.b.x
        rect.y = points.b.y
    elseif lastQuarter == 2 then
        rect.x = points.c.x
        rect.y = points.c.y
    else
        rect.x = points.d.x
        rect.y = points.d.y
    end

    rect.w = sizes.quarter.w
    rect.h = sizes.quarter.h

    if lastQuarter == 3 then
        lastQuarter = 0
    else
        lastQuarter = lastQuarter + 1
    end

    win:setFrame(rect)
end
