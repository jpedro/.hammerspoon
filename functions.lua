
function PrintTable(table, indent)
    local padding = string.rep("  ", indent)
    for k, v in pairs(table) do
        print(padding .. "- Key: " .. k)
        if type(v) == "table" then
            PrintTable(v, indent + 1)
        else
            print(padding .. "- Val: " .. v)
        end
    end
end
