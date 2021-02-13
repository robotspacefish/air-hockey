pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

acceleration = 1
max_bounce = 2

function create_player(typ, n, c, x, y)
  return create_object(typ, x, y, 2, 2, {
    n = n,
    c = c,
    bounce = 0,
    score = 0,
    draw = function(self)
      pal(12, self.c)
      spr(self.spr, self.x, self.y, self.size, self.size)
      pal()
    end,
    upd = function(self)
      local n = self.n

      -- debug controls
      if mode == "debug" then
        if (btn(0,n)) self.x -= acceleration -- left
        if (btn(1,n) ) self.x += acceleration -- right
        if (btn(2,n)) self.y -= acceleration -- up
        if (btn(3,n)) self.y += acceleration -- down
      else
        local y1_boundary

        self.vx *= friction
        self.vy *= friction

        if self.n == 0 then -- player 2
          y1_boundary = 65 -- middle of table + 1 for adjustment
          y2_boundary = 104
        else -- player 1
          y1_boundary = 8
          y2_boundary = 49 -- middle of table minus player height + 1
        end

        if (btn(0, n)) self.vx -= acceleration -- left

        if (btn(1, n) ) self.vx += acceleration -- right

        if (btn(2, n)) self.vy -= acceleration -- up
        if (btn(3, n)) self.vy += acceleration -- down

        -- limit dx/dy
        local max = 3
        self.vx = mid(-max, self.vx, max)
        self.vy = mid(-max, self.vy, max)

        -- apply dx/dy
        self.x += self.vx
        self.y += self.vy

        -- TODO clean up/ refactor
        -- bounce along boundaries
        if self.x < left_boundary then
          self.x = left_boundary
          self.vx += acceleration
          self.vx = mid(-max_bounce, self.vx, max_bounce)
          self.x += self.vx
        end

        if self.x > right_boundary then
          self.x = right_boundary
          self.vx -= acceleration
          self.vx = mid(-max_bounce, self.vx, max_bounce)
          self.x += self.vx
        end

        if self.n == 1 then -- player 1
          if self.y < y1_boundary then -- 8
            self.y = y1_boundary
            self.vy += acceleration
            self.vy = mid(-max_bounce, self.vy, max_bounce)
            self.y += self.vy
          end

          if self.y > y2_boundary then -- 56
            self.y = y2_boundary
            self.vy -= acceleration
            self.vy = mid(-max_bounce, self.vy, max_bounce)
            self.y += self.vy
          end
        else -- player 2
          if self.y < y1_boundary then -- 56
            self.y = y1_boundary
            self.vy += acceleration
            self.vy = mid(-max_bounce, self.vy, max_bounce)
            self.y += self.vy
          end

          if self.y > y2_boundary then  -- 104
            self.y = y2_boundary
            self.vy -= acceleration
            self.vy = mid(-max_bounce, self.vy, max_bounce)
            self.y += self.vy
          end
        end
      end
    end,
    reverse = function(self)

    end
  })
end

