function catcher(event)
    print(event)
    if event:getFlags()['fn'] and event:getCharacters() == "s" then
    -- if event:getFlags()['fn'] then
        print("fn-h!")
        alert("Hammerspoon fn key intersecpted", 5)
        return true, {hs.eventtap.event.newKeyEvent({}, "left", true)}
        -- return false
    end
    return false
 end

 local tapper = hs.eventtap.new({hs.eventtap.event.types.keyDown}, catcher)
 print(tapper)
 tapper:start()
