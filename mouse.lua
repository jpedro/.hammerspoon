local mouseCircle = nil
local mouseCircleTimer = nil

function mouseHighlight()
  -- Delete an existing highlight if it exists
  if mouseCircle ~= nil then
    mouseCircle:delete()
    if mouseCircleTimer then
      mouseCircleTimer:stop()
    end
    mouseCircle = nil
  end

  -- Get the current co-ordinates of the mouse pointer
  mousepoint = hs.mouse.getAbsolutePosition()
  -- Prepare a big red circle around the mouse pointer
  local max = 300
  mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x - max, mousepoint.y - max, max * 2, max * 2))
  mouseCircle:setStrokeColor({["red"]=0,["blue"]=1,["green"]=0.6,["alpha"]=1})
  mouseCircle:setFill(false)
  mouseCircle:setStrokeWidth(270)
  mouseCircle:show()

  -- Set a timer to delete the circle after 100ms
  mouseCircleTimer = hs.timer.doAfter(0.3, function()
    mouseCircle:delete()
    mouseCircle = nil
  end)
end
