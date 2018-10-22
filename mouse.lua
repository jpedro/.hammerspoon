local mouseCircle = nil
local mouseCircleTimer = nil

function mouseHighlight()
  -- Delete an existing highlight if it exists
  if mouseCircle then
    mouseCircle:delete()
    if mouseCircleTimer then
      mouseCircleTimer:stop()
    end
  end

  -- Get the current co-ordinates of the mouse pointer
  mousepoint = hs.mouse.getAbsolutePosition()
  -- Prepare a big red circle around the mouse pointer
  local max = 100
  mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x - max, mousepoint.y - max, max * 2, max * 2))
  mouseCircle:setStrokeColor({["red"]=0,["blue"]=0,["green"]=1,["alpha"]=1})
  mouseCircle:setFill(false)
  mouseCircle:setStrokeWidth(20)
  mouseCircle:show()

  -- Set a timer to delete the circle after 100ms
  mouseCircleTimer = hs.timer.doAfter(0.1, function()
    mouseCircle:delete()
  end)
end
hs.hotkey.bind({"cmd","alt"}, "d", mouseHighlight)
