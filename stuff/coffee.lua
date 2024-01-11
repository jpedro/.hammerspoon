-- function SetCaffeineDisplay(awake)
--     if awake then
--         caffeine:setTitle("Working hard")
--         -- caffeine:setTitle("△")
--         -- caffeine:setTitle("○")
--         -- caffeine:setTitle("⟁")
--         -- caffeine:setTitle("🕓")
--         -- caffeine:setTitle("⬤")
--         -- caffeine:setTitle("◼️")
--     else
--         -- caffeine:setIcon("⬤")
--         -- caffeine:setTitle("You are not supposed to see this")
--         caffeine:setTitle("Hardly working")
--         -- caffeine:setTitle("●")
--         -- caffeine:setTitle("▼")
--         -- caffeine:setTitle("◯")
--         -- caffeine:setMenu({disabled = true, checked = true})
--     end
-- end

-- function CaffeineClicked()
--     SetCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
-- end

-- if caffeine then
--     hs.caffeinate.set("displayIdle", true)
--     -- caffeine:setClickCallback(caffeineClicked)
--     -- hs.caffeinate.toggle("displayIdle")
--     setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
--     -- setCaffeineDisplay(true)
-- end

-- local caffeine = hs.menubar.new()
-- function setCaffeineDisplay(state)
--     if state then
--         caffeine:setTitle("💪")
--     else
--         caffeine:setTitle("💤")
--     end
-- end

-- function caffeineClicked()
--     setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
-- end

-- if caffeine then
--     caffeine:setClickCallback(caffeineClicked)
--     setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
-- end
