local hyper = {"cmd", "alt", "ctrl"}

hs.hotkey.bind(hyper, "return", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(hyper, "delete", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind(hyper, "p", function()
  hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind(hyper, "b", function()
  -- hs.application.launchOrFocus("Sublime Text")
  hs.application.launchOrFocus("Brave Browser")
end)

hs.hotkey.bind(hyper, ".", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind(hyper, ",", function()
  hs.application.launchOrFocus("Franz")
end)

hs.hotkey.bind(hyper, "i", function()
  hs.application.launchOrFocus("IntelliJ IDEA CE")
end)

hs.hotkey.bind(hyper, "n", function()
  hs.application.launchOrFocus("Notes")
end)
