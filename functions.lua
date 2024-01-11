
function PrintTable(table, indent)
    local padding = string.rep("  ", indent)
    for k, v in pairs(table) do
        print(padding .. "- Key: " .. k)
        print(padding .. "  Type: " .. type(v))
        if type(v) == "table" then
            PrintTable(v, indent + 1)
        elseif type(v) == "boolean" then
            v = (v and "true" or "false")
            print(padding .. "  Value: " .. v)
        else
            print(padding .. "  Value: " .. v)
        end
    end
end
