pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function create_puck(x, y)
  return create_object("puck", x, y, 1, 1, {
    upd = function(self)
      -- boundaries check
      if (self.y < 8) then
        self.y = 8
        self.vy += acceleration
      end

      if (self.y > 104 + self.h) then
        self.y = 104 + self.h
        self.vy -= acceleration
      end

      if (self.x < left_boundary) then
        self.x = left_boundary
        self.vx += acceleration
      end

      if (self.x > right_boundary + self.w) then
        self.x = right_boundary + self.w
        self.vx -= acceleration
      end

      -- check for collision with player
      for i = 1, #player_objects do
        local p = player_objects[i]

        if check_for_collision(self, p) then
          self.vx += p.vx
          self.vy += p.vy
        end
      end

      local max = 1
      self.vx = mid(-max, self.vx, max)
      self.vy = mid(-max, self.vy, max)

      self.x += self.vx
      self.y += self.vy
    end
  })
end