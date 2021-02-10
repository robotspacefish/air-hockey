pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function create_puck(x, y)
  return create_object("puck", x, y, 1, 1, {
    -- todo add properties
  })
end