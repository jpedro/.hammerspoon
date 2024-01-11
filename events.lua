hs.urlevent.bind("hello", function(name, params)
    print("Event name: " .. name)
    print("Event params:")
    PrintTable(params, 0)
    Alert("Received hello event.")
end)

hs.urlevent.bind("working", function(name, params)
    print("Event name: " .. name)
    print("Event params:")
    PrintTable(params, 0)
    local enabled = params["enabled"]
    CaffeineFlip()
    if enabled == "true" then
        print("--> Enabled")
    else
        print("--> Disabled")
    end

    -- Alert("Received working event.")
end)
