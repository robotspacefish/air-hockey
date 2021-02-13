pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function create_puck(x, y)
  return create_object("puck", x, y, 1, 1, {
    upd = function(self)

      for i = 1, #player_objects do
        local p = player_objects[i]

        if check_for_collision(self, p) then
          self.vx = 0 -- reset
          self.vy = 0
          self.vx += p.vx
          self.vy += p.vy
        end
      end
      -- if (self.y < 8) then
      --   self.y = 8
      --   self.vy += acceleration
      -- end

      -- if (self.y > 104) then
      --   self.y = 104 - self.h
      --   self.vy -= acceleration
      -- end

      -- if (self.x < left_boundary) then
      --   self.x = left_boundary
      --   self.vx += acceleration
      -- end

      -- if (self.x > right_boundary) then
      --   self.x = right_boundary - self.w
      --   self.vx -= acceleration
      -- end

      -- local acc = 0

      -- -- self.x += self.vx + acceleration


      -- if check_for_collision(self, p1) then
      --   self.vx = 0
      --   self.vy = 0
      --   self.vx += p1.vx
      --   self.vy += p1.vy
      -- end

      -- local max = 5
      -- self.vx = mid(-max, self.vx, max)
      -- self.vy = mid(-max, self.vy, max)

      -- self.x += self.vx
      -- self.y += self.vy
    end
  })
end