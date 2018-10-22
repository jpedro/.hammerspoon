local menuHeight  = hs.screen.allScreens()[1]:frame().y
local lastFull    = 0
local lastHalf    = 0
local lastWidth   = 0
local lastThird   = 0
local lastThird2  = 0
local lastQuarter = 0
local lastSextant = 0
local lastForty   = 0
local gap         = 5

local points = {}
local sizes  = {}

function refresh(win)
  local mon = win:screen():frame()

  points = {
    a = {
      x = mon.x,
      y = mon.y,
      },
    b = {
      x = mon.x + mon.w / 2 + gap,
      y = mon.y,
    },
    c = {
      x = mon.x + mon.w / 2 + gap,
      y = mon.y - menuHeight + mon.h / 2 + 25,
    },
    d = {
      x = mon.x,
      y = mon.y - menuHeight + mon.h / 2 + 25,
    },
    e = {
      x = mon.x + mon.w / 3 + 5,
      y = mon.y,
    },
    f = {
      x = mon.x + mon.w / 3 * 2 + gap,
      y = mon.y,
    },
    g = {
      x = mon.x + mon.w / 3 + 5,
      y = mon.y - menuHeight + mon.h / 2 + 25,
    },
    h = {
      x = mon.x + mon.w / 3 * 2 + gap,
      y = mon.y - menuHeight + mon.h / 2 + 25,
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
      w = mon.w / 2 - gap + 3,
    },
    width = {
      h = mon.h / 2 - gap,
      w = mon.w,
    },
    third = {
      h = mon.h,
      w = mon.w / 3 - gap,
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

function send2(win, num)
  if win == nil then
    hs.alert.show("Select a window first.", 1)
    return
  end

  local all = hs.screen.allScreens()

  local the = all[num]
  if the == nil then
    text = "Screen " .. num .. " does not exist.\n"
    for k, v in pairs(all) do
      text = text .. "\nScreen " .. k .. " has value " .. type(v)
    end
    hs.alert.show(text, 2)
    return
  end

  local frame = {
    x = the:frame().x,
    y = the:frame().y,
    h = win:frame().h,
    w = win:frame().w,
  }

  win:setFrame(frame)
end

local last_screen = 0
hs.hotkey.bind(hyper, "j", function()
  local all = screen.allScreens()
  hs.alert.show(all)
  -- local max = # all
  -- last_screen = last_screen + 1
  -- if last_screen > max then last_screen = 1 end
  -- send2(window.focusedwindow(), last_screen)
  -- alert.show("Sent to screen " .. last_screen, 2)
end)

hs.hotkey.bind(hyper, "f", function()
  send2(hs.window.focusedWindow(), 1)
end)

hs.hotkey.bind(hyper, "g", function()
  send2(hs.window.focusedWindow(), 2)
end)

hs.hotkey.bind(hyper, "h", function()
  send2(hs.window.focusedWindow(), 3)
end)

hs.hotkey.bind(hyper, "space", function()
  local win = hs.window.focusedWindow()
  if win == nil then
    return hs.alert.show("Select a window first.", 1)
  end

  win:maximize()
  if win then
    win:maximize()
  else
    hs.alert.show("Failed to maximize window.")
  end
end)

-- hs.hotkey.bind(hyper, "-", function()
--   local win = hs.window.focusedWindow()
--   if win == nil then
--     return hs.alert.show("Select a window first.", 1)
--   end

--   local rect = win:frame()
--   refresh(win)

--   rect = sizes.width

--   if lastWidth == 0 then
--     rect.x = points.a.x
--     rect.y = points.a.y
--   else
--     rect.x = points.d.x
--     rect.y = points.d.y
--   end

--   lastWidth = 1 - lastWidth
--   win:setFrame(rect)
-- end)

hs.hotkey.bind(hyper, "left", function()
  local win = hs.window.focusedWindow()
  if win == nil then
    return hs.alert.show("Select a window first.", 1)
  end

  local rect = win:frame()
  refresh(win)

  if lastHalf == 0 then
    rect.x = points.a.x
    rect.y = points.a.y
    rect.w = sizes.height1.w
    rect.h = sizes.height1.h
  else
    rect.x = points.b.x
    rect.y = points.b.y
    rect.w = sizes.height2.w
    rect.h = sizes.height2.h
  end

  lastHalf = 1 - lastHalf
  win:setFrame(rect)
end)

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
  refresh(win)

  if lastThird2 == 0 then
    rect.x = points.a.x
    rect.y = points.a.y
  else
    rect.x = points.e.x
    rect.y = points.e.y
  end

  rect.w = sizes.third2.w
  rect.h = sizes.third2.h

  if lastThird2 == 1 then
    lastThird2 = 0
  else
    lastThird2 = lastThird2 + 1
  end

  win:setFrame(rect)
end)

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
