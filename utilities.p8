pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function create_object(typ, x, y, size, sprite, other_props)
  local obj = {
    typ = typ,
    x = x,
    y = y,
    dx = 0,
    dy = 0,
    r = size*8/2,
    spr = sprite,
    size = size,
    -- upd = function(self)
    -- end,
    draw = function(self)
      spr(self.spr, self.x, self.y)
    end,
    update = function(self)
      if (self.typ == "player") self.upd(self)
    end
    -- get_center = function(self)
    --   return self.x + self.size/2
    -- end
  }

  -- add other props
  local k, v
  for k,v in pairs(other_props) do
    obj[k] = v
  end

  return obj
end

function is_circle_collision(x1, y1, r1, x2, y2, r2)
  local x_dist = (x2+r2) - (x1 + r1)
  local y_dist = (y2+r2) - (y1 + r1)
  local dist = sqrt(x_dist * x_dist + y_dist * y_dist)

  local radii_sum = r1 + r2

  if (dist > radii_sum) return false

  return true
end

function tile_to_px(t)
  return t * 8
end

function debug(str, x, y, c)
  print(str, x, y, c)
end

function toggle_debug_mode()
  if (mode == "debug") then
    mode = ""
  else
    mode = "debug"
  end
end

function display_debug()
  local p1_c = "false"
  local p2_c = "false"
  local puck_c = "false"

  if (p1.has_collided) p1_c = "true"
  if (p2.has_collided) p2_c = "true"
  if (puck.has_collided) puck_c = "true"

  debug(mode, 0, 0, 8)
  debug("p1:"..p1_c, 0, 100, 7)
  debug("p2:"..p2_c, 0, 108, 7)
end