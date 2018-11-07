local hyper = {"shift", "cmd", "alt", "ctrl"}
hs.window.animationDuration = 0;

-- TODO
-- bind 1:${hyper} throw 0 resize
-- bind 2:${hyper} throw 1 resize
-- bind 3:${hyper} throw 2 resize

---------------------------------------
-- Window management
---------------------------------------

-- 1. Define positions
positions = {
  maximized = hs.layout.maximized,
  centered = {x=0.15, y=0.15, w=0.7, h=0.7},

  left30 = {x=0, y=0, w=0.30, h=1},
  left50 = hs.layout.left50,
  left70 = {x=0, y=0, w=0.70, h=1},

  right30 = {x=0.70, y=0, w=0.30, h=1},
  right50 = hs.layout.right50,
  right70 = {x=0.30, y=0, w=0.70, h=1},
}

-- 2. Map keys to positions
keysToPositions = {
  {key="g", units={positions.left70}},
  {key="h", units={positions.left50, positions.left70, positions.left30}},
  {key="j", units={positions.centered, positions.maximized}},
  {key="l", units={positions.right50, positions.right70, positions.right30}},
  {key=";", units={positions.right70}},
}

-- 3. Bind mappings
-- https://aaronlasseigne.com/2016/02/16/switching-from-slate-to-hammerspoon/
function bindKey(key, fn)
  hs.hotkey.bind(hyper, key, fn)
end

hs.fnutils.each(keysToPositions, function(entry)
  bindKey(entry.key, function()
    local units = entry.units
    local screen = hs.screen.mainScreen()
    local window = hs.window.focusedWindow()
    local windowGeo = window:frame()

    local index = 0
    hs.fnutils.find(units, function(unit)
      index = index + 1

      local geo = hs.geometry.new(unit):fromUnitRect(screen:frame()):floor()
      return windowGeo:equals(geo)
    end)
    if index == #units then index = 0 end

    window:moveToUnit(units[index + 1])
  end)
end)

------------------------------------
-- Hyper i to show window hints
------------------------------------

hs.hotkey.bind(hyper, "i", function()
    hs.hints.windowHints()
end)

------------------------------------
-- Hyper wasd to switch window focus
------------------------------------

hs.hotkey.bind(hyper, "w", function()
    hs.window.focusedWindow():focusWindowNorth()
end)

hs.hotkey.bind(hyper, "s", function()
    hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(hyper, "d", function()
    hs.window.focusedWindow():focusWindowEast()
end)

hs.hotkey.bind(hyper, "a", function()
    hs.window.focusedWindow():focusWindowWest()
end)

---------------------------------------
-- Launch and focus applications
-- https://github.com/trishume/dotfiles/blob/master/hammerspoon/hammerspoon.symlink/init.lua
---------------------------------------
hs.fnutils.each({
  { key = "b", app = "Firefox" },
  { key = "v", app = "MacVim" },
  { key = "c", app = "Code" },
  { key = "o", app = "Microsoft Outlook" },
  { key = "t", app = "iTerm2" },
  { key = "s", app = "Slack" },
  { key = "d", app = "Spotify" },
  { key = "i", app = "iTunes" },
  { key = "n", app = "Notion" },
}, function(object)
  bindKey(object.key, function()
    local app = hs.appfinder.appFromName(object.app)
    if app then app:activate() end
  end)
end)

------------------------------------
---- Reload config on write
------------------------------------

function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")
