local hyper  = {"cmd", "alt", "ctrl"}
local mover  = {"ctrl"}

local menuHeight  = hs.screen.allScreens()[1]:frame().y
local lastFull    = 0
local lastHalf    = 0
local lastW40     = 0
local lastWidth   = 0
local lastThird   = 0
local lastThird2  = 0
local lastQuarter = 0
local lastSextant = 0
local lastForty   = 0
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
    -- b40 = {
    --   x = mon.x + mon.w * 0.45 + gap,
    --   -- x = 0.5,
    --   y = mon.y,
    -- },
    -- b60 = {
    --   x = mon.x + mon.w * 0.55 + gap,
    --   -- x = 0.5,
    --   y = mon.y,
    -- },
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
    height1 = {
      h = mon.h,
      w = mon.w / 2 - gap ,
    },
    height2 = {
      h = mon.h,
      w = mon.w / 2 - gap,
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
    w40 = {
      h = mon.h,
      w = mon.w * 0.45 - gap,
    },
    w60 = {
      h = mon.h,
      w = mon.w * 0.55 - gap,
    },
    third2 = {
      h = mon.h,
      w = mon.w / 3 * 2 - gap,
    },
    center = {
      h = mon.h / 3 * 2,
      w = mon.w / 3 * 2,
    },
    sextant = {
      h = mon.h / 2 - gap,
      w = mon.w / 3 - gap,
    },
    forty = {
      h = mon.h,
      w = mon.w * 0.45 - gap,
    },
    sixty = {
      h = mon.h,

      w = mon.w * 0.55 - gap,
    },
  }
end

hs.hotkey.bind(hyper, "space", function()
  local win = hs.window.focusedWindow()
  if win == nil then
    return hs.alert.show("Select a window first.", 1)
  end

  win:maximize()
end)

hs.hotkey.bind(hyper, "left", function()
  local win = hs.window.focusedWindow()
  if win == nil then
    return hs.alert.show("Select a window first.", 1)
  end

  local rect = win:frame()
  refresh(win)

  rect = sizes.height1

  if lastHalf == 0 then
    rect.x = points.a.x
    rect.y = points.a.y
  else
    rect.x = points.b.x
    rect.y = points.b.y
  end

  -- hs.alert.show(rect.x)
  -- rect = {x=0, y=0, h=1400, w=200}
  -- hs.alert.show(rect)

  lastHalf = 1 - lastHalf
  win:setFrame(rect)
end)

-- hs.hotkey.bind(hyper, "6", function()
--   local win = hs.window.focusedWindow()
--   if win == nil then
--     return hs.alert.show("Select a window first.", 1)
--   end

--   local rect = win:frame()
--   refresh(win)

--   if lastW40 == 0 then
--     rect = sizes.w40
--     rect.x = points.a.x
--     rect.y = points.a.y
--   else
--     rect = sizes.w60
--     rect.x = points.b40.x
--     rect.y = points.b40.y
--   end

--   -- hs.alert.show(rect.x)
--   -- rect = {x=0, y=0, h=1400, w=200}
--   -- hs.alert.show(rect)

--   lastW40 = 1 - lastW40
--   win:setFrame(rect)
-- end)

hs.hotkey.bind(hyper, "up", function()
  local win = hs.window.focusedWindow()
  if win == nil then
    return hs.alert.show("Select a window first.", 1)
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
end)

hs.hotkey.bind(hyper, "right", function()
  local win = hs.window.focusedWindow()
  if win == nil then
    return hs.alert.show("Select a window first.", 1)
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
end)

-- hs.hotkey.bind(hyper, "right", function()
--   local win = hs.window.focusedWindow()
--   if win == nil then
--     return hs.alert.show("Select a window first.", 1)
--   end

--   local rect = win:frame()
--   refresh(win)

--   if lastThird2 == 0 then
--     rect.x = points.a.x
--     rect.y = points.a.y
--   else
--     rect.x = points.e.x
--     rect.y = points.e.y
--   end

--   rect.w = sizes.third2.w
--   rect.h = sizes.third2.h

--   if lastThird2 == 1 then
--     lastThird2 = 0
--   else
--     lastThird2 = lastThird2 + 1
--   end

--   win:setFrame(rect)
-- end)

hs.hotkey.bind(hyper, "down", function()
  local win = hs.window.focusedWindow()
  if win == nil then
    return hs.alert.show("Select a window first.", 1)
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

  -- rect = sizes2.third

  -- if lastThird == 0 then
  --   rect.x = points2.a.x
  --   rect.y = points2.a.y
  -- elseif lastThird == 1 then
  --   rect.x = points2.e.x
  --   rect.y = points2.e.y
  -- else
  --   rect.x = points2.f.x
  --   rect.y = points2.f.y
  -- end

  -- if lastThird2 == 0 then
  --   rect.x = points2.a.x
  --   rect.y = points2.a.y
  -- else
  --   rect.x = points2.e.x
  --   rect.y = points2.e.y
  -- end

  -- if lastThird == 2 then
  --   lastThird = 0
  -- else
  --   lastThird = lastThird + 1
  -- end

  -- hs.alert.show(rect)
  -- win:moveToUnit(rect)
end)

hs.hotkey.bind(hyper, "-", function()
  local win = hs.window.focusedWindow()
  if win == nil then
    return hs.alert.show("Select a window first.", 1)
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
end)
