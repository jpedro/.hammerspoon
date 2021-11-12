local hyper = {"cmd", "alt", "ctrl"}

hs.hotkey.bind("alt", ".",      mouseHighlight)
hs.hotkey.bind("cmd", "´",      mouseHighlight)
hs.hotkey.bind("cmd", "'",      mouseHighlight)
hs.hotkey.bind(hyper, "space",  windowMaximize)
hs.hotkey.bind(hyper, "left",   windowHalf)
hs.hotkey.bind(hyper, "right",  windowTwoThirds)
hs.hotkey.bind(hyper, "down",   windowOneThird)
hs.hotkey.bind(hyper, "up",     windowQuarter)
hs.hotkey.bind(hyper, "-",      windowHorizontally)


hs.hotkey.bind(hyper, "return", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(hyper, "delete", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind(hyper, "p", function()
  hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind(hyper, "o", function()
  hs.application.launchOrFocus("Opera")
end)

hs.hotkey.bind(hyper, "b", function()
  hs.application.launchOrFocus("Brave Browser")
end)

hs.hotkey.bind(hyper, ".", function()
  hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind(hyper, "t", function()
  hs.application.launchOrFocus("Microsoft Teams")
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
