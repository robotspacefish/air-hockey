pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

#include utilities.p8
#include player.p8

function _init()
  friction = 0.90
  left_boundary = tile_to_px(3)
  right_boundary = tile_to_px(11)

  p1 = create_player(1, 8,tile_to_px(7), tile_to_px(2))
  p2 = create_player(0, 11,tile_to_px(7), tile_to_px(12))
  game_objects = {}
  add(game_objects, p1)
  add(game_objects, p2)

end

function _draw()
  cls()
  rectfill(16, 0, 111, 128, 12) -- table bg
  map(0, 0, 0,0,16,16)

  for i = 1, #game_objects do
    game_objects[i]:drw()
  end
end

function _update()
  for i = 1, #game_objects do
    game_objects[i]:upd()
  end
end

__gfx__
000000000088880000000cccccc0000066655556666555566666666665555666666666666666666600000dddddd0000000000555555000000000000000000000
0000000008a99a80000cc666666cc000666555566665556555555555565556666666666666666666000dd666666dd00000055666666550000000000000000000
007007008a9999a800c6666666666c0066655556666556555555555555655666666666666666666600d6666666666d0000566666666665000000000000000000
00077000899999980c6666cccc6666c06665555666656555555555555556566655556666666655550d6666dddd6666d0056666cccc6666500000000000000000
00077000899999980c666c5555c666c06665555666665555555555555555666655565666666565550d666d5555d666d005666c5555c666500000000000000000
007007008a9999a8c666c55cc55c666c666555566666666666666666666666665565566666655655d666d55dd55d666d5666c55cc55c66650000000000000000
0000000008a99a80c66c55c67c55c66c666555566666666666666666666666665655566666655565d66d55d67d55d66d566c55c67c55c6650000000000000000
0000000000888800c66c5c6667c5c66c666555566666666666666666666666666555566666655556d66d5d6667d5d66d566c5c6667c5c6650000000000000000
0000000000000000c66c5c6666c5c66c655556666666666666666666111111117777777700000000d66d5d6666d5d66d566c5c6666c5c6650000000000000000
0000000000000000c66c55c66c55c66c655556666666666666666666111111110000000000000000d66d55d66d55d66d566c55c66c55c6650000000000000000
0000000000000000c666c55cc55c666c655556666666666666666666111111110000000000000000d666d55dd55d666d5666c55cc55c66650000000000000000
00000000000000000c666c5555c666c06555566655555555111111111111111100000000000000000d666d5555d666d005666c5555c666500000000000000000
00000000000000000c6666cccc6666c06555566655555555111111111111111100000000000000000d6666dddd6666d0056666cccc6666500000000000000000
000000000000000000c6666666666c0065555666555555551111111166666666000000000000000000d6666666666d0000566666666665000000000000000000
0000000000000000000cc666666cc000655556665555555511111111666666660000000000000000000dd666666dd00000055666666550000000000000000000
000000000000000000000cccccc0000065555666666666661111111166666666000000007777777700000dddddd0000000000555555000000000000000000000
__gff__
0000000001010101010100000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000091515151616161615151508000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040100000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000041919191919191919191914000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000041818181818181818181814000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000040000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000050606061717171706060607000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
