pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
#include boss.lua
#include coin.lua
#include game.lua
__gfx__
00000000566666666666665666665666665666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000566666666666665666665666665666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700566666666666665666665666665666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000566666666666665666665666665666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000566666666666665666665666665666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700566666666666665666665666665666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000566666666666665666665666665666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000566666666666665666665666665666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65666566565656560000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55565556656665660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65666566565656560000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444444444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000004400888800000ccc0000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000099999999
440044940888888000c555c000000000003308000000000000000000000000000000000000777000000000000000000000000000000000000000000099999999
944449440077770000ccccc000000000000387800000700000009000000090000000900007707700000000000000000000000000000000000000000099999999
999999400007700000ccccc000000000000038000077760000099900000999000000900077707770000000000000000000000000000000000000000099999999
000994000007700000ccccc000080000000300000677667000999990000999000000900077700070000000000000000000000000000000000000000099999999
009994000077770000ccccc000900000003033000067770000099900000999000000900007777700000000000000000000000000000000000000000099999999
999094400887788000ccccc009000000000003300007000000009000000090000000900000777000000000000000000000000000000000000000000099999999
9000094400888800000ccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000099999999
00777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
07777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
77777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
70777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
00777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
07777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
00007770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
00000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
00088880000ffff0000ffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00288882002ffff2002ffff200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0882882800f2ff2f00f2ff2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
075282570752f2570752f25700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
088888880eefffee0fffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
084844880e4f44ee0f4f44ff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0485544804f5544f04f5544f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0488884804ffff4f04ffff4f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000fff00000000111117177111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000f0010000f1111117171111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001111000fff101111711101fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000111000ff00011111111000fff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000100000001111111111000f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000011000000111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000011000000111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000011000000111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000011111111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006166661611111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000111111161666616000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000111111011111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000110011001100110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000222110211001100110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000222202222021022110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000002202220022022220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000005557777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000005770070700000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000707070700000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000770777700000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000777700700000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000070777700000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000077007000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00011111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00011111555511000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111155777555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111557777777500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01155777007770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00557777777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00577777007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00577770700770707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00057777007777077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00007777777077777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00007777777707777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000777777770777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000777707007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000077777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007077000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007707777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000077770777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000077777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f00000000000000002900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
