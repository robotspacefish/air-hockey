pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

speed = 1

function create_player(n, c, x, y)
  return create_object("player", x, y, {
    n = n,
    c = c,
    score = 0,
    drw = function(self)
      pal(12, self.c)
      spr(2, self.x, self.y, 2, 2)
      pal()
    end,
    upd = function(self)
      local n = self.n
      local y1_boundary

      if self.n == 0 then
        y1_boundary = 56
        y2_boundary = tile_to_px(13)
      else
         y1_boundary = tile_to_px(1)
         y2_boundary = 56 -- middle of table minus half player width
      end

      -- TODO add wall bump

      if (btn(0, n) and self.x > tile_to_px(3)) self.x -= speed -- left
      if (btn(1, n) and self.x < tile_to_px(11)) self.x += speed -- right


      if (btn(2, n) and self.y > y1_boundary) self.y -= speed -- up
      if (btn(3, n) and self.y < y2_boundary) self.y += speed -- down
    end
  })
end

