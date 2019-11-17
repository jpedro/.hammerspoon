local hyper = {"cmd", "alt", "ctrl"}

hs.hotkey.bind(hyper, "return", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(hyper, "delete", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind(hyper, "@", function()
  hs.application.launchOrFocus("IntelliJ IDEA CE")
end)

hs.hotkey.bind(hyper, "p", function()
  hs.application.launchOrFocus("Sublime Text")
end)

hs.hotkey.bind(hyper, ",", function()
  hs.application.launchOrFocus("Franz")
end)

hs.hotkey.bind(hyper, ".", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind(hyper, "n", function()
  hs.application.launchOrFocus("Notes")
end)

-- hs.hotkey.bind(hyper, "t", function()
--   hs.application.launchOrFocus("Trello")
-- end)

-- hs.hotkey.bind(hyper, "s", function()
--   hs.application.launchOrFocus("Stremio")
-- end)
