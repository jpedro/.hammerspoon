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

function windowMaximize()
  local win = hs.window.focusedWindow()
  if win == nil then
    return hs.alert.show("Select a window first.", 1)
  end

  win:maximize()
end

function windowHalf()
  local win = hs.window.focusedWindow()
  if win == nil then
    return hs.alert.show("Select a window first.", 1)
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

function windowTwoThirds()
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
end

function windowOneThird()
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
end

function windowHorizontally()
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
end

function windowQuarter()
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
end
