local menuHeight  = hs.screen.allScreens()[1]:frame().y
local lastFull    = 0
local lastHalf    = 0
local lastWidth   = 0
local lastThird   = 0
local lastQuarter = 0
local lastSixty   = 0
local gap         = 1
local gap2        = 25

local points  = {}
local sizes   = {}

local points2 = {
  a = {x = 0.00, y = 0.00},
  b = {x = 0.50, y = 0.00},
  c = {x = 0.50, y = 0.50},
  d = {x = 0.00, y = 0.50},

  e = {x = 0.33, y = 0.00},
  f = {x = 0.66, y = 0.00},

  g = {x = 0.33, y = 0.00},
  h = {x = 0.66, y = 0.00},
}
local sizes2 = {
  height  = {h = 1.00, w = 0.50},
  width   = {h = 0.50, w = 1.00},
  third   = {h = 1.00, w = 0.33},
  sixty   = {h = 1.00, w = 0.67},
  quarter = {h = 0.50, w = 0.50},
  sixth   = {h = 0.50, w = 0.33},
}

local screens = hs.screen.allScreens()
local watcher = hs.screen.watcher.new(function(x)
    print("Screen changed " .. x)
    alert("Screen changed")
    screens = hs.screen.allScreens()
end)
watcher:start()

function refresh(win)
  local mon = win:screen():frame()

  -- |a    b    |
  -- |          |
  -- |c    d    |

  points = {
    a = {
      x = mon.x,
      -- x = 0,
      y = mon.y,
    },
    b = {
      x = mon.x + mon.w / 2 + gap,
      -- x = 0.5,
      y = mon.y,
    },
    c = {
      x = mon.x + mon.w / 2 + gap,
      -- x = 0.5,
      y = mon.y - menuHeight + mon.h / 2 + gap2,
    },
    d = {
      x = mon.x,
      -- x = 0,
      y = mon.y - menuHeight + mon.h / 2 + gap2,
    },
    e = {
      x = mon.x + mon.w / 3 + gap2,
      y = mon.y,
    },
    f = {
      x = mon.x + mon.w / 3 * 2 + gap,
      y = mon.y,
    },
    g = {
      x = mon.x + mon.w / 3 + gap2,
      y = mon.y - menuHeight + mon.h / 2 + gap2,
    },
    h = {
      x = mon.x + mon.w / 3 * 2 + gap,
      y = mon.y - menuHeight + mon.h / 2 + gap2,
    },
    m = {
      x = mon.x + mon.w / 6,
      y = mon.y + mon.h / 6,
    },
    k = {
      x = mon.x + mon.w * 0.45,
      y = mon.y,
    },
  }
  sizes = {
    full = {
      h = mon.h,
      w = mon.w,
    },
    height = {
      h = mon.h,
      w = mon.w / 2 - gap ,
    },
    quarter = {
      h = mon.h / 2 - gap + 2,
      w = mon.w / 2 - gap,
    },
    width = {
      h = mon.h / 2 - gap,
      w = mon.w,
    },
    third = {
      h = mon.h,
      w = mon.w / 3 - gap,
    },
    sixty = {
      h = mon.h,
      w = mon.w * 0.55 - gap,
    },
  }
end

-- hs.hotkey.bind(hyper, "space", function()
--   local win = hs.window.focusedWindow()
--   if win == nil then
--     return hs.alert.show("Select a window first.", 1)
--   end

--   win:maximize()
-- end)

local prevSizes = {}
local prevCount = 0

function showStored()
    local stored = nil
    print("Windows stored:")
    for k, v in pairs(prevSizes) do
        stored = hs.window.get(k)
        if stored then
            print("- " .. k .. ": " .. v.x)
        else
            print("- " .. k .. ": NOT EXISTS")
        end
    end
end

function cleanLoaded()
    local winId = 0
    print("Cleaning stored windows...")
    for k, v in pairs(prevSizes) do
        stored = hs.window.get(k)
        if stored then
            print("- Exists " .. k)
        else
            prevSizes[k] = nil
            print("- Gone " .. k)
        end
    end
    print("Done")
end

function windowMaximize()
    local win = hs.window.focusedWindow()
    if win == nil then
        return alert("Select a window first.", 1)
    end

    local windowId    = win:id()
    local screen      = win:screen()
    local screenFrame = screen:frame()
    local windowFrame = win:frame()

    if windowFrame == screenFrame then
        print("Frames are the same")
        local prev = prevSizes[windowId]
        if prev then
            print("  Previous exists")
            win:setFrame(prev)
            prevSizes[windowId] = nil
            print("  Removed windowId " .. windowId)
        else
            print("  No previous. Setting it at 10%/80%")
            local newFrame = hs.geometry.copy(win:frame())
            newFrame.x = screenFrame.w * 0.1
            newFrame.y = screenFrame.h * 0.1
            newFrame.w = screenFrame.w * 0.8
            newFrame.h = screenFrame.h * 0.8
            win:setFrame(newFrame)
        end
    else
        print("Not the same frame")
        prevSizes[windowId] = hs.geometry.copy(win:frame())
        print("  Stored windowId " .. windowId)
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

function windowHalf()
  local win = hs.window.focusedWindow()
  if win == nil then
    return alert("Select a window first.", 1)
  end

  local rect = win:frame()
  refresh(win)

  rect = sizes.height

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

function windowSixty()
  local win = hs.window.focusedWindow()
  if win == nil then
    return alert("Select a window first.", 1)
  end

  local rect = win:frame()
  rect = sizes2.sixty

  if lastSixty == 0 then
    rect.x = points2.a.x
    rect.y = points2.a.y
  else
    rect.x = points2.e.x
    rect.y = points2.e.y
  end

  lastSixty = 1 - lastSixty
  win:moveToUnit(rect)
end

function windowThird()
  local win = hs.window.focusedWindow()
  if win == nil then
    return alert("Select a window first.", 1)
  end

  local rect = win:frame()
  refresh(win)

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

function windowHorizontally()
  local win = hs.window.focusedWindow()
  if win == nil then
    return alert("Select a window first.", 1)
  end

  local rect = win:frame()
  refresh(win)

  if lastWidth == 0 then
    rect.x = points.a.x
    rect.y = points.a.y
  else
    rect.x = points.d.x
    rect.y = points.d.y
  end

  rect.w = sizes.width.w
  rect.h = sizes.width.h

  lastWidth = 1 - lastWidth
  win:setFrame(rect)
end

function windowQuarter()
  local win = hs.window.focusedWindow()
  if win == nil then
    return alert("Select a window first.", 1)
  end

  local rect = win:frame()
  refresh(win)

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
