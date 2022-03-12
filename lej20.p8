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
0000004400888800000ccc0000000000003000000000000000000000000000000000000000000000000220000000000000000000000000000000000099999999
440044940888888000c555c00000000000330800000000000000000000000000000000000077700000aa22000022220000000000000000000000000099999999
944449440077770000ccccc00000000000038780000070000000900000009000000090000770770002a220000002200000000000000000000000000099999999
999999400007700000ccccc000000000000038000077760000099900000999000000900077707770002299000009900000000000000000000000000099999999
000994000007700000ccccc000080000000300000677667000999990000999000000900077700070009992200029290000000000000000000000000099999999
009994000077770000ccccc000900000003033000067770000099900000999000000900007777700022929200229222000000000000000000000000099999999
999094400887788000ccccc009000000000003300007000000009000000090000000900000777000022922200229222000000000000000000000000099999999
9000094400888800000ccc0000000000000000000000000000000000000000000000000000000000002222000022220000000000000000000000000099999999
00777000002220000000000000707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
07777700022222000707000000707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
77777700222222007070700000707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
70777770202222200707770000777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
00777777002222220077777070777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
07777777022222220007777707777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
00007770000022200077077700777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
00000700000002000000007700077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444444
00088880000ffff0000ffff000000000444444444444444444444444444444444444444444444444444444444444444444444444444444444444444400000000
00288882002ffff2002ffff200000000411111111111111111111114433333333333333333333334455555555555555555555554444744444444444400000000
0882882800f2ff2f00f2ff2f00000000412121212121212121212114431111111111111111111134458080808080808080808054447774444444444400000000
075282570752f2570752f25700000000411212121212121212121214434444444444444444444434450808080808080808080854444744222244444400000000
088888880eefffee0fffffff000000004121212121212121212121144311111111111111111111344580808080808090808080544444422aa224444400000000
084844880e4f44ee0f4f44ff00000000411212121212121212121214434444444444444444444434450808080908090808080854444422aaaa24444400000000
0485544804f5544f04f5544f0000000041212121212121212121211443111111111111111111113445809080809090908080805444422aaaa224444400000000
0488884804ffff4f04ffff4f0000000001121212121212121212121443444444444444444444443445090908090909090808085444442aaa2244444400000000
000fff00000000111117177111000000012121212121212121212110031111111111111111111130059090909090909090909050444444222444444400000000
0000f0010000f111111717111110000001111111111111111111111003444444444444444444443005090a0a0909090909090950444449999224444400000000
00001111000fff101111711101fff0000121212121212121212121100311111111111111111111300590a0a0a0a0a0a0a0a09050444422922922444400000000
00000111000ff00011111111000fff00011111111111111111111110034444444444444444444430050a0a0a0a0a0a0a0a0a0a50444229222292244400000000
0000000100000001111111111000f00001cccccccccccccccccccc10033333333333333333333330055555555555555555555550444229222292244400000000
0000001100000011111111111100000001c1111cccc11c1cc1111c1003bbbbbbbbbbbbbbbbbbbb3005dddddddddddddddddddd50442229222222244400000000
0000001100000011111111111100000001cccccccc1cc11ccccccc1003b333333bbbbbb333333b3005d5555dd555555dd5555d50442222222222244400000000
0000001100000011111111111000000001cccccccccc111ccccccc1003bbbbbbbbbbbbbbbbbbbb3005dddddddddddddddddddd50442222222222244400000000
0000000000000001111111111111111101ccc111cccccccccccccc1003bbbbbbbbbbb3bbbbbbbb3005ddddddddd8dddddd5ddd50442222222222204400000000
0000000000000000616666161111111101cccc11ccccccccc1cccc1003bb3bbbbbbb993bb3bb3b3005ddd5ddd8d8d8ddd5dddd50402222222222044400000000
0000000000000000011111116166661601ccc1c1cccccc1ccc1ccc1003bb3b3bbbb999bbb3b3bb3005dd5dd5d888d8d8dddd5d50440222222200444400000000
0000000000000000011111101111111101cc1cccccccc11cccc1cc1003bbb33bbb999bbb3333bb3005d5dd5d88998889ddd5dd504440000000444aa400000000
0000000000000000011001100110011001cc1111cccc11111111cc1003b33333b99bbbb333333b3005ddddd8999989998ddddd504aaa44444444400400000000
0000000000000022211021100110011001cccccccccccccccccccc1003bbbbbbbbbbbbbbbbbbbb3005dddddddddddddddddddd5040aaa4444444444400000000
0000000000000022220222202102211001cccccccccccccccccccc1003333333333333333333333005555555555555555555555044000444444aaa4400000000
00000000000000002202220022022220011111111111111111111110000000000000000000000000000000000000000000000000444444444440004400000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000011110000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000111115000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000155555000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000005557777000000000000000005557777000000000000000000000000000000000000000000000000000000000
00000111110000000000000000000000000000005770070700000000000000005777777700000000000000000000000000000000000000000000000000000000
00001111111100000000000000000000000000000707070700000000000000000777070700000000000000000000000000000000000000000000000000000000
00011111111110000000000000000000000000000770777700000000000000000700777000000000000000000000000000000000000000000000000000000000
000111115555110000000000000000000000000007777007000000000000000007c7707cc0000000000000000000000000000000000000000000000000000000
001111557775550000000000000000000000000000707777000aaa00000000000077777700000000000000000000000000000000000000000000000000000000
00111557777777500000000000000000000aa0000077007000aaaaa00000000c007000700c000000000000000000000000000000000000000000000000000000
0111557700777000000000000000000000aaaa000007777000aaaaa0000000000077770000000000000000000000000000000000000000000000000000000000
0015577777777777000000000000000000aaaa000011110100aff000000000000011110000000000000000000000000000000000000000000000000000000000
0055777700777700000000000000000000fff0001111111100fff000000000000111111000000000000000000000000000000000000000000000000000000000
00577770700770707000000000000000000ff00111111111111f0000000000001111111100000000000000000000000000000000000000000000000000000000
00577777007777077000000000000000000011110011110011000000000000001011110100000000000000000000000000000000000000000000000000000000
00057777777077777000000000000000000001100011110000000000000000011011110110000000000000000000000000000000000000000000000000000000
00007777777707777000000000000000000000000011110000000000000000110011110011000000000000000000000000000000000000000000000000000000
0000077777777077000000000000000000000000011111000000000000000ff0011111001ff00000000000000000000000000000000000000000000000000000
0000077770700770000000000000000000000000011111100000000000000ff0011111100ff00000000000000000000000000000000000000000000000000000
0000007777777777000000000000000000000000aa55555000000000000000000055550000000000000000000000000000000000000000000000000000000000
0000000777700077000000000000000000000000a550055000000000000000000050550000000000000000000000000000000000000000000000000000000000
00000007077777700000000000000000000000000550055000000000000000000550550000000000000000000000000000000000000000000000000000000000
00000077707777000000000000000000000000000550055000000000000000000550550000000000000000000000000000000000000000000000000000000000
00000077770000000000000000000000000000000550550000000000000000000550550000000000000000000000000000000000000000000000000000000000
00000770777770000000000000000000000000000550250000000000000000000550550000000000000000000000000000000000000000000000000000000000
00000777770770000000000000000000000000002220722000000000000000002220222000000000000000000000000000000000000000000000000000000000
00000007770770000000000000000000000000007770077000000000000000007770777000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101020202040404080800000000000101010202020404040808000000000001010102020204040408080000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
3f4445463f4748493f4a4b4c3f4d4e3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f5455563f5758593f5a5b5c3f5d5e3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f6465663f6768693f6a6b6c3f6d6e3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
