pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

acceleration = 1
max_bounce = 2

function create_player(n, c, x, y)
  return create_object("player", x, y, {
    n = n,
    c = c,
    bounce = 0,
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

      if self.n == 0 then -- player 2
        y1_boundary = 56
        y2_boundary = tile_to_px(13)
      else -- player 1
         y1_boundary = tile_to_px(1)
         y2_boundary = 56 -- middle of table minus half player width
      end

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

      -- TODO clean up/ refactor
      -- bounce along boundaries
      if self.x < left_boundary then
        self.x = left_boundary
        self.dx += acceleration
        self.dx = mid(-max_bounce, self.dx, max_bounce)
        self.x += self.dx
      end

      if self.x > right_boundary then
        self.x = right_boundary
        self.dx -= acceleration
        self.dx = mid(-max_bounce, self.dx, max_bounce)
        self.x += self.dx
      end

      if self.n == 1 then -- player 1
        if self.y < y1_boundary then -- 8
          self.y = y1_boundary
          self.dy += acceleration
          self.dy = mid(-max_bounce, self.dy, max_bounce)
          self.y += self.dy
        end

        if self.y > y2_boundary then -- 56
          self.y = y2_boundary
          self.dy -= acceleration
          self.dy = mid(-max_bounce, self.dy, max_bounce)
          self.y += self.dy
        end
      else -- player 2
         if self.y < y1_boundary then -- 56
          self.y = y1_boundary
          self.dy += acceleration
          self.dy = mid(-max_bounce, self.dy, max_bounce)
          self.y += self.dy
        end

        if self.y > y2_boundary then  -- 104
          self.y = y2_boundary
          self.dy -= acceleration
          self.dy = mid(-max_bounce, self.dy, max_bounce)
          self.y += self.dy
        end
      end
    end
  })
end

