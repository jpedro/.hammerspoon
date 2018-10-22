local hyper  = {"cmd", "alt", "ctrl"}

hs.hotkey.bind(hyper, "return", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(hyper, "delete", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind(hyper, "p", function()
  hs.application.launchOrFocus("Sublime Text")
end)

hs.hotkey.bind(hyper, ";", function()
  hs.application.launchOrFocus("Franz")
end)

hs.hotkey.bind(hyper, "i", function()
  hs.application.launchOrFocus("IntelliJ IDEA")
end)

hs.hotkey.bind(hyper, ".", function()
  hs.application.launchOrFocus("Slack")
end)
