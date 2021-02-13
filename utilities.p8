pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function create_object(typ, x, y, size, sprite, other_props)
  local obj = {
    typ = typ,
    x = x,
    y = y,
    vx = 0,
    vy = 0,
    r = size * 8 / 2,
    spr = sprite,
    size = size,
    w = size * 8,
    h = size * 8,
    has_collided = false,
    draw = function(self)
      spr(self.spr, self.x, self.y)
    end,
    x2 = function(self)
      return self.x + self.w
    end,
    y2 = function(self)
      return self.y + self.h
    end,
    cx = function(self)
      return self.x + self.r
    end,
    cy = function(self)
      return self.y + self.r
    end,
    top_right = function(self)
      return self.x
    end,
    end
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

function check_for_collision(obj1, obj2)
  if is_circle_collision(obj1.x, obj1.y, obj1.r, obj2.x, obj2.y, obj2.r) then
    obj1.has_collided = true
    obj2.has_collided = true
    return true
  else
    obj1.has_collided = false
    obj2.has_collided = false
    return false
  end
end

function collision_top_left(o1, o2)
  return o1.x
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

  local c = 10
  debug("p1", 0, 8, c)
  debug("x:"..p1.x,0, 16, c)
  debug("y:"..p1.y,0, 24, c)
  debug("vx:"..p1.vx,0, 32, c)
  debug("vy:"..p1.vy,0, 40, c)
  debug(p1_c, 0, 48, c)
  debug("----", 0, 48+8, 8)
  debug("p2", 0, 56+8, c)
  debug("x:"..p2.x,0, 64+8, c)
  debug("y:"..p2.y,0, 72+8, c)
  debug("vx:"..p2.vx,0, 80+8, c)
  debug("vy:"..p2.vy,0, 88+8, c)
  debug(p2_c, 0, 96+8, c)
end