hs.urlevent.bind("hello", function(name, params)
    print("Event name: " .. name)
    print("Event params:")
    PrintTable(params, 0)
    Alert("Received hello event.")
end)
