local hyper = {"cmd", "alt", "ctrl"}
-- local shift = {"cmd", "shift"}

function ShowApp(name)
    return function()
        hs.application.launchOrFocus(name)
    end
end

function ShowHelp()
    local text = [[
 Chrome                  ⌃⌥⌘ Enter
 Slack                   ⌃⌥⌘ .
 iTerm2                  ⌃⌥⌘ @
 Code                    ⌃⌥⌘ P
 IntelliJ                ⌃⌥⌘ I
 Move to next screen     ⌃⌥⌘ L
 Working hard            ⌃⌥⌘ J
 Clear alerts            ⌃⌥⌘ K
 Reload                  ⌃⌥⌘ R
 Hammerpsoon             ⌃⌥⌘ H
 This help               ⌃⌥⌘ +]]
    alert(text, 20)
end

hs.hotkey.bind("cmd", "'",      MouseHighlight)
hs.hotkey.bind("ctrl", "<",     MouseHighlight)
hs.hotkey.bind("alt", ".",      MouseHighlight)

hs.hotkey.bind(hyper, "space",  WindowMaximize)
hs.hotkey.bind(hyper, "left",   WindowHalf)
hs.hotkey.bind(hyper, "right",  WindowSixty)
hs.hotkey.bind(hyper, "b",      ShowWindow)
hs.hotkey.bind(hyper, "down",   WindowThird)
hs.hotkey.bind(hyper, "up",     WindowQuarter)
hs.hotkey.bind(hyper, "-",      WindowHorizontally)
hs.hotkey.bind(hyper, "s",      ShowScreens)
hs.hotkey.bind(hyper, "l",      LoopScreens)
hs.hotkey.bind(hyper, "x",      ShowStored)
hs.hotkey.bind(hyper, "+",      ShowHelp)
hs.hotkey.bind(hyper, "k",      hs.alert.closeAll)
hs.hotkey.bind(hyper, "r",      hs.reload)
hs.hotkey.bind(hyper, "m",      CaffeineMenuToggle)
hs.hotkey.bind(hyper, "j",      CaffeineWorkToggle)

hs.hotkey.bind(hyper, "return", ShowApp("Google Chrome"))
hs.hotkey.bind(hyper, ".",      ShowApp("Slack"))
hs.hotkey.bind(hyper, "@",      ShowApp("iTerm"))
hs.hotkey.bind(hyper, "p",      ShowApp("Visual Studio Code"))
hs.hotkey.bind(hyper, "å",      ShowApp("Brave Browser"))
hs.hotkey.bind(hyper, "i",      ShowApp("IntelliJ IDEA CE"))
hs.hotkey.bind(hyper, "n",      ShowApp("Notes"))
hs.hotkey.bind(hyper, "h",      ShowApp("Hammerspoon"))
