pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

acceleration = 1

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

      self.dx *= friction
      self.dy *= friction

      if self.n == 0 then
        y1_boundary = 56
        y2_boundary = tile_to_px(13)
      else
         y1_boundary = tile_to_px(1)
         y2_boundary = 56 -- middle of table minus half player width
      end

      -- TODO add wall bump

      if (btn(0, n)) self.dx -= acceleration -- left

      if (btn(1, n) ) self.dx += acceleration -- right

      if (btn(2, n)) self.dy -= acceleration -- up
      if (btn(3, n)) self.dy += acceleration -- down

      -- limit dx/dy
      local max = 3
      self.dx = mid(-max, self.dx, max)
      self.dy = mid(-max, self.dy, max)

      -- apply dx/dy
      self.x += self.dx
      self.y += self.dy

      -- boundaries
      if (self.x < left_boundary) self.x = left_boundary
      if (self.x > right_boundary) self.x = right_boundary
      if (self.y < y1_boundary) self.y = y1_boundary
      if (self.y > y2_boundary) self.y = y2_boundary
    end
  })
end

