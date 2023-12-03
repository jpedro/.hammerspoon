--[ Defines ]-------------------------------------------------------------

hyper =  {"⌘", "⌥", "⌃"}	-- caps lock held down
shyper = {"⌘", "⌥", "⇧", "⌃"}	-- caps lock held down, with shift
hs.window.animationDuration = 0


--[ Functions ]---------------------------------------------------------
function findOrLaunch(a)
	local app = hs.application.find(a)
	if not app then
		hs.application.launchOrFocus(a)
	end
	return hs.application.find(a)
end

function fancyNotify(t,m)
     hs.notify.new({title=t, informativeText=m}):send()
end


--[ Bindings ]---------------------------------------------------------

-- hyper shortcuts
hs.fnutils.each({
	{ key = "a", func = function()
      myTerm = findOrLaunch("iterm")
      myTerm:selectMenuItem({"Shell","New Window"})
      end
  },
  { key = "q", func = function()
      ffox = hs.appfinder.appFromName("Firefox")
      ffox:selectMenuItem({"File","New Window"})
      ffox:activate()
      end
  },
  { key = "z", func = function()
      finder = hs.appfinder.appFromName("Finder")
      finder:selectMenuItem({"File","New Finder Window"})
      finder:activate()
      end
  }
}, function(object) hs.hotkey.bind(hyper, object.key, object.func) end)

-- shyper shoutcuts
hs.fnutils.each({
  { key = "space", func = function()
      os.execute("pmset displaysleepnow")
      end
  }
}, function(object) hs.hotkey.bind(shyper, object.key, object.func) end)



--[ grid ]---------------------------------------------------------------------
-- home made grid system works with hammerspoon's grid

hs.grid.setGrid('2x2')
hs.grid.setMargins('0x0')

function moveWindow(x, y, w, h)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w*x)
	f.y = max.y + (max.h*y)
	f.w = max.w*w
	f.h = max.h*h
	win:setFrame(f)
end

-- bind hotkeys to grid
hs.hotkey.bind(hyper,"y", function() moveWindow(0.0,0.0,0.5,0.5) end)
hs.hotkey.bind(hyper,"u", function() moveWindow(0.0,0.0,1.0,0.5) end)
hs.hotkey.bind(hyper,"i", function() moveWindow(0.5,0.0,0.5,0.5) end)
hs.hotkey.bind(hyper,"h", function() moveWindow(0.0,0.0,0.5,1.0) end)
hs.hotkey.bind(hyper,"j", function() moveWindow(0.0,0.0,1.0,1.0) end)
hs.hotkey.bind(hyper,"k", function() moveWindow(0.5,0.0,0.5,1.0) end)
hs.hotkey.bind(hyper,"n", function() moveWindow(0.0,0.5,0.5,0.5) end)
hs.hotkey.bind(hyper,"m", function() moveWindow(0.0,0.5,1.0,0.5) end)
hs.hotkey.bind(hyper,",", function() moveWindow(0.5,0.5,0.5,0.5) end)

--[ window dragging ]----------------------------------------------------------
dragging_window = nil
click_event = hs.eventtap.new({hs.eventtap.event.types.leftMouseDragged}, function(e)
	if dragging_window == nil  then
		-- check mouse is in titlebar
		local m = hs.mouse.getAbsolutePosition()
		local f = hs.window:focusedWindow():frame()
		local screen = hs.window:focusedWindow():screen()
		local max = screen:frame()
		if m.x > f.x and m.x < (f.x + f.w) then
			if m.y > f.y and m.y < (f.y + 21) then
				dragging_window = hs.window.focusedWindow()
				dragging_window_time = hs.timer.localTime()
			end
		end
	end
end)
unclick_event = hs.eventtap.new({hs.eventtap.event.types.leftMouseUp}, function(e)
	if dragging_window ~= nil then
		local m = hs.mouse.getAbsolutePosition()
		local f = hs.window:focusedWindow():frame()
		local screen = hs.window:focusedWindow():screen()
		local max = screen:frame()
		if m.x < 50 then
			if m.y < 200 then
				moveWindow(0.0,0.0,0.5,0.5)
			elseif m.y > (max.h-200) then
				moveWindow(0.0,0.5,0.5,0.5)
			else
				moveWindow(0.0,0.0,0.5,1.0)
			end
		elseif m.x > (max.w-50) then
			if m.y < 200 then
				moveWindow(0.5,0.0,0.5,0.5)
			elseif m.y > (max.h-200) then
				moveWindow(0.5,0.5,0.5,0.5)
			else
				moveWindow(0.5,0.0,0.5,1.0)
			end
		elseif m.y < 25 and m.x>200 and m.x < (max.w-200) then
				moveWindow(0.0,0.0,1.0,1.0)
		end
	end
	dragging_window = nil
end)
click_event:start()
unclick_event:start()


--[ hourly alarm ]----------------------------------------------------------
hs.timer.doAt("0:00","1h", function() hs.alert("Ding Dong") end)

--[ fan ]-------------------------------------------------------------------
--[[
	my mac has a very noisy fan, this just puts the CPU temperature and fan
	speeds in the title bar
]]--
local menu_bar = hs.menubar.new()
menu_bar:setTitle("¯\\_(ツ)_/¯")
hs.timer.doAt("0:00","1m", function()
	local d = hs.execute("/Users/sduff/bin/osx-cpu-temp -f"):gsub("[\r\n]","")
	menu_bar:setTitle(d)
end)

--[ hazel-lite ]------------------------------------------------------------
--[[
	Hazel-lite file system cleanup and management

	Ideas
	- Downloads/Desktop
		- Tag files
		- _Actions
		- Delete old files, Archive files to monthly folders
		- Move dmg to Trash, then open them
		- Add mp3 files to iTunes (music directory)
		- Drop folder that automatically zips and files away
		- IFTTT download top photo from earthporn/unsplash to dropbox, and then sync dropbox to make wallpapers
		- monitor a folder for images, then create a shrunk version, then move them to website git directory, then add them to the git build. remove the exif info as well, add copyright, etc... Needs Exiftool (https://www.sno.phy.queensu.ca/~phil/exiftool/) or Imagemagick's mogrify (https://stackoverflow.com/questions/229446/how-do-i-add-exif-data-to-an-image)
		- Move Desktop files to Downloads
		- Delete files older than 1 week
		- Archive certain files to Evernote/Dropbox/etc...
		- Save to Evernote drop-folder
		- Move torrent files to VirtualMachine
		- Sync ebooks in dropbox
		- Regularly clear tmp folders
		- Regularly clear Outlook tempfiles (/private/var/folders/y3/g8b0sww1685gtyvx20c7ghpxrdx1c3/T/com.microsoft.Outlook) (maybe symlink ~/Outlook to this folder for future versions)
		- Delete files that were downloaded from localhost
		- Archive downloaded software (app, iso, dmg, deb, exe, pkg, rpm)
		- Move downloaded videos (mov, mp4, avi) to its own directory
		- Move epub,mobi,pdf to an ebooks directory, well named (use mdls to extract pdf metadata, or pdfminer, https://github.com/euske/pdfminer)
		- mdls - https://www.macissues.com/2014/05/12/how-to-look-up-file-metadata-in-os-x/
		- Weekly empty of Trash

	Resources
	- https://github.com/scottcs/dot_hammerspoon/blob/master/.hammerspoon/modules/hazel.lua
	- https://www.reddit.com/r/apple/comments/1wlxtr/do_you_use_hazel_what_are_some_of_your_coolest/

	- http://getawesomeness.herokuapp.com/get/osx
	- http://awesomeawesome.party/awesome-macOS


	Other efficiency
  - https://msol.io/blog/tech/work-more-efficiently-on-your-mac-for-developers/
  - http://stevelosh.com/blog/2012/10/a-modern-space-cadet/ (The Grand daddy)

  Something about launch or cycle
  - https://github.com/szymonkaliski/Dotfiles/blob/b5a640336efc9fde1e8048c2894529427746076f/Dotfiles/hammerspoon/init.lua#L442-L485

--]]

--[ Huzzah - we're ready! ]----------------------------------------------------
fancyNotify("Hammertime","Captain Hammer!")
