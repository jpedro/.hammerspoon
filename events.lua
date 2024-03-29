hs.urlevent.bind("hello", function(name, params)
    print("Event name: " .. name)
    print("Event params:")
    PrintTable(params, 0)
    Alert("Received hello event.")
end)

hs.urlevent.bind("alert", function(name, params)
    print("Event name: " .. name)
    print("Event params:")
    PrintTable(params, 0)
    -- hs.alert.show("Received alert event.")
    local message = params["message"]
    if message then
        hs.alert.show(message)
    end
end)

hs.urlevent.bind("working", function(name, params)
    print("Event name: " .. name)
    print("Event params:")
    PrintTable(params, 0)
    local enabled = params["enabled"]
    WorkFlip()
    if enabled == "true" then
        print("--> Enabled")
    else
        print("--> Disabled")
    end

    -- Alert("Received working event.")
end)
