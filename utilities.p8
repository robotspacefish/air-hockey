pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function create_object(typ, x, y, other_props)
  local obj = {
    typ = typ,
    x = x,
    y = y,
    dx = 0,
    dy = 0
    -- upd = function(self)
    -- end,
    -- drw = function(self)
    -- end
  }

  -- add other props
  local k, v
  for k,v in pairs(other_props) do
    obj[k] = v
  end

  return obj
end


function debug(str, x, y, c)
  print(str, x, y, c)
end