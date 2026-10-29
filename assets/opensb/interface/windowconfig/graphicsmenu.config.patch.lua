-- gadgets
local function jcopy(base) return sb.jsonMerge(base, {}) end

local function clone(base, a, b)
  local copy = jcopy(base[a])
  base[b] = copy
  return copy
end

local function shift(thing, x, y)
  thing.position[1] = thing.position[1] + (tonumber(x) or 0)
  thing.position[2] = thing.position[2] + (tonumber(y) or 0)
  return thing
end

local function moveto(thing, otherthing)
  thing.position[1] = otherthing.position[1]
  thing.position[2] = otherthing.position[2]
  return thing
end

-- patch function, called by the game
function patch(config)
  local layout = config.paneLayout
  layout.panefeature.positionLocked = false
  layout.panefeature.anchor = "center"
  if layout.bgShine then
    layout.bgShine.zlevel = -10
  end
  config.zoomList = {
    0.75, 0.85, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9,
    2.0, 2.2, 2.4, 2.6, 2.8, 3.0, 3.5, 4.0, 5.0, 6.0, 8.0, 10.0, 12.0, 16.0, 20.0, 24.0, 32.0
  }
  -- Create the camera pan speed widgets
  shift(clone(layout, "zoomLabel", "cameraSpeedLabel"), 100).value = "CAMERA PAN SPEED"
  shift(clone(layout, "zoomSlider", "cameraSpeedSlider"), 100)
  shift(clone(layout, "zoomValueLabel", "cameraSpeedValueLabel"), 100)
  config.cameraSpeedList = jarray()
  for i = 1, 50 do config.cameraSpeedList[i] = i / 10 end

  -- Create the interface scale widgets
  shift(clone(layout, "zoomLabel", "interfaceScaleLabel"), 0, 28).value = "INTERFACE SCALE"
  shift(clone(layout, "zoomSlider", "interfaceScaleSlider"), 0, 28)
  shift(clone(layout, "zoomValueLabel", "interfaceScaleValueLabel"), 0, 28)
  config.interfaceScaleList = {
    0, -- 0 = AUTO!
    0.1, 0.2, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9,
    2.0, 2.25, 2.5, 2.75, 3.0, 3.5, 4.0, 5.0
  }

  -- Create anti-aliasing toggle
  shift(clone(layout, "multiTextureLabel", "antiAliasingLabel"), 98).value = "SUPER-SAMPLED AA"
  shift(clone(layout, "multiTextureCheckbox", "antiAliasingCheckbox"), 99)
  -- Create new lighting toggle
  shift(clone(layout, "multiTextureLabel", "newLightingLabel"), 0, -11).value = "NEW LIGHTING"
  shift(clone(layout, "multiTextureCheckbox", "newLightingCheckbox"), 0, -11)
  -- Create hardware cursor toggle
  shift(clone(layout, "multiTextureLabel", "hardwareCursorLabel"), 98, -11).value = "HARDWARE CURSOR"
  shift(clone(layout, "multiTextureCheckbox", "hardwareCursorCheckbox"), 99, -11)
  
  -- Create shader menu button
  shift(moveto(clone(layout, "accept", "showShadersMenu"), layout.interfaceScaleSlider), 112, -2).caption = "Shaders"
  

  shift(layout.title, 0, 24)
  shift(layout.resLabel, 0, 28)
  shift(layout.resSlider, 0, 28)
  shift(layout.resValueLabel, 0, 28)
  return config
end
