local watcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
  hs.reload()
end)

watcher:start()
