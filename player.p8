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
      if (btn(0, n)) self.x -= speed -- left
      if (btn(1, n)) self.x += speed -- right
      if (btn(2, n)) self.y -= speed -- up
      if (btn(3, n)) self.y += speed -- down
    end
  })
end