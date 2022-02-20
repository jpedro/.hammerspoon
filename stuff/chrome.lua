-- hs.hotkey.bind(hyper, "1",      function() chromeProfile("Pedro")          end)
-- hs.hotkey.bind(hyper, "2",      function() chromeProfile("Pedro (Nordcloud)")  end)
-- hs.hotkey.bind(hyper, "3",      function() chromeProfile("Pedro (HM)")     end)

local function startsWith(text, find)
  return text:sub(1, #find) == find
end

local function endsWith(text, find)
  return find == "" or text:sub(-#find) == find
end

function chromeProfile(profile)
  for i, window in ipairs(hs.window.allWindows()) do
    local title = window:title()
    found = string.find(title, "Google Chrome", 1, true)
    value = has and "true" or "false"
    print("==> Window: '" .. title .. "' isChrome: " .. value)

    if found then
      found = endsWith(title, profile)
      value = found and "true" or "false"
      print("==> Window: '" .. title .. "' hasProfile: " .. value)
      if found then
        window:focus()
        print("==> And we are done")
        return
      end
    end
  end
end
