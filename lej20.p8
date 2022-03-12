pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
#include animation.lua
#include utils.lua
#include garbage.lua
#include boss.lua
#include coin.lua
#include belt.lua
#include conveyer.lua
#include hand.lua
#include env.lua
#include overlay.lua
#include menu_scene.lua
#include intro_scene.lua
#include game_scene.lua
#include outro_scene.lua
#include scene_controller.lua

show_menu()

__gfx__
000000005666666666666665666666566666656666665666666566666656666665666666000000000000000000000000000dd000666666666666666666666666
00000000566666666666666566666656666665666666566666656666665666666566666600000000000000000000000000d66d00666666666677766666666666
0070070056666666666666656666665666666566666656666665666666566666656666660000000000000000000030000d6006d0666696666775776666666666
0007700056666666666666656666665666666566666656666665666666566666656666660000000000000000000333000d6006d0666999667775777666666666
0007700056666666666666656666665666666566666656666665666666566666656666660000000000000000033333b000d66d00669999967775557666666666
007007005666666666666665666666566666656666665666666566666656666665666666000000000000000000333b00000dd000666999666777776666666666
00000000566666666666666566666656666665666666566666656666665666666566666600000000000000000003b00000000000666696666677766666666666
00000000566666666666666566666656666665666666566666656666665666666566666600000000000000000000000000000000666666666666666655555555
55555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006666666666666666
666666666666666600000000000000000000000000000000000000000000cc000000e0000000000000000000000000000000800000000000662fff2666666666
656665665656565600000000000000000000000000000000000000000000c0c000003000000660000eeeeee0000aa000000090000000000066f2f2f666666666
555655566566656600000000000000000000000000000000000000000000c00000e030e000077000e88eeeee0a0aa0a00000900000000ee06752257666666666
656665665656565600000000000000000000000000000000000000000cc0c0000003330000077000e8eeeee00aaaaaa00009990000000ee06ffffff666666666
666666666666666600000000000000000000000000000000000000000cccc00000003e00077770000eeeeee00a8aa8a0000aaa00000090006f4f44f666666666
5555555555555555000000000000000000000000000000000000000000cc0000000e33000777000000e00e000aaaaaa0000aaa000008880064f5544666666666
00000000000000000000000000000000000000000000000000000000000000000000300000000000000000000000000000099900000888006666666666666666
0000004400888800000ccc00000000000030000000000000000000000000000000000000000070000002200000000000000cc000000000000008880099999999
440044940888888000c555c00000000000330800000000000000000000000000000000000003370000aa220000222200000770000000dd000080008099999999
944449440077770000ccccc00000000000038780000070000000900000009000000090000033937002a2200000022000007777700d0d0d000800008099999999
999999400007700000ccccc0000000000000380000777600000999000009990000009000033939370022990000099000007777070dddd0000808008099999999
000994000007700000ccccc000080000000300000677667000999990000999000000900073999330009992200029290000777707000d00000808008099999999
009994000077770000ccccc000900000003033000067770000099900000999000000900007393300022929200229222000777707000dd0dd0800880099999999
999094400887788000ccccc0090000000000033000070000000090000000900000009000007330000229222002292220007777700000ddd00080000899999999
9000094400888800000ccc0000000000000000000000000000000000000000000000000000070000002222000022220000777700000000000008888099999999
00777000002220000000000000707000000000005555555500000000000d000000000090000000000000000000000030000800000000000000000d0044444444
0777770002222200070700000070707000000000566666650055550000ddd0000000009000000000000e00000000003000878000000000000000d0d044444444
777777002222220070707000007070700ee000bb5666d565005d65000d7d7d0000000090000000000009000000000933088878000000000000000dd044444444
707777702022222007077700007777700eee0bbb5666d6650056d500d77d77d0000000900000000000090000000099902888878000000000000000d044444444
00777777002222220077777070777770000e7b0056ddd665005d65000d7ddddd008888900055555000090000000999000288887800eeee00000000d044444444
07777777022222220007777707777770000eb70056ddd6650056d50000d777d000999990005000500009000000090000002888870eeee00000d000d044444444
00007770000022200077077700777700000e7b005555555500555500000d7d00009000900555055500060000009000000002887800000000000d00d044444444
00000700000002000000007700077000000ebb0055556565000000000000d0000090009000000000000100000000000000002780000000000000dd0044444444
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
0000000000000000000000000000000000000000000000000000000000c1111111111111111111c000c1111111111111111111c000c111110000000000000000
0000000000000000000000000000000000ccccccccccccccccccccc000c1111111111111111111c000c1111111111111111111c000c111110000000000000000
0000000000000000000000000000000000c1111111111111111111c000c1111111111111111111c000c1111111111111111111c00c1111110000000000000000
0000000000000000000000000000000000c1111111111111111111c000c1111111111111111111c000c1111111111111111111c0c11111110000000000000000
0000000000000000000000000000000000c1111111111111111111c000c1111111111111111111c000c1111111111111111111c00c1111110000000000000000
0000000000000000000000000000000000c1111111111111111111c000c1111111111111111111c000c1111111111111111111c000c111110000000000000000
0000000000000000000000000000000000c1111111111111111111c000c1111111111111111111c000ccccccccccccccccccccc000c111110000000000000000
0000000000000000000000000000000000c1111111111111111111c000c1111111111111111111c000000000000000000000000000c111110000000000000000
666666666666666666666666666666660000000000000000000000000000000000000000000000000000700700006600000000001c1c1c1c0000000077777777
66666666666666666666666666666666000000000000000000000000000000000000000000000000070700706000660000000600c1c1c1c10000000077777777
666666666666666666666666666666660000000000000000000000000000000000000000000000007000000060006600006006001c1c1c1c0000000077777777
66666666666666666666666666666666000000000000000000000000000000000000000000000000000000076066660660660660c1c1c1c10000000077777777
6666ffffffffffffffffffffffff666600000000000110000000000000000000000000000000000000000070606d6666606666601c1c1c1c0000000077777777
6666fffffff11111ffffffffffff666600000000001111000000000000000000000000000000000000700700666d66d6606d6d60cccccccc0000000077777777
6666ffffff11111111ffffffffff6666000000000111115000000000000000000000000000000000070000006d6d66d6606d6d60cccccccc0000000077777777
6666fffff1111111111fffffffff6666000000000155555000000000000000000000000000000000700007006d66666666666666cccccccc0000000077777777
6666fffff11111555511ffffffff6666000000005557777000000000000000005557777000000000007000076666666655555555666dd666ccccccccaaaaaaaa
6666ffff111155777555ffffffff666600000000577117170000000000000000577777770000000000000070666666665dd5d5d566dddd66ccccccccaaaaaaaa
6666ffff1115577777775fffffff666600000000071717170000000000000000077717170000000000700700666666665dd5d5d56dddddd6ccccccccaaaaaaaa
6666fff11155770077700fffffff66660000000007717777000000000000000007117771000000000700700066666666555555556dddddd6ccccccccaaaaaaaa
6666ffff15577777777777ffffff66660000000007777117000000000000000007c7717cc00000007007007066666666555555556dddddd6ccccccccaaaaaaaa
6666ffff55777700777700ffffff66660000000000717777000aaa0000000000007777770000000000000700666666665dd5d5d56dddddd6cacacacaaaaaaaaa
6666ffff577770700770707fffff6666000aa0000077117000aaaaa00000000c007111700c00000000007000666666665dd5d5d56dddddd6acacacacaaaaaaaa
6666ffff577777007777077fffff666600aaaa000007777000aaaaa00000000000777700000000000007000066666666555555556dddddd6aaaaaaaaaaaaaaaa
6666fffff57777777077777fffff666600aaaa000011110100aff000000000000011110000000000007000005666666566666666555555551111111133333333
6666ffffff7777777707777fffff666600fff0001111111100fff0000000000001111110000000000700000055555555666556665dddddd51111111133333333
6666fffffff77777777077ffffff6666000ff00111111111111f00000000000011111111000000007000000056666665665665665ddd6dd511111111333b3333
6666fffffff7777070077fffffff66660000111100111100110000000000000010111101000000000000700755555555656556565dd6dd6511111111333b3b33
6666ffffffff7777777777ffffff66660000011000111100000000000000000110111101100000000007000056666665656556565d6dd6d5111111113b3b3b33
6666ffffffff0777700077ffffff66660000000000111100000000000000001100111100110000000070000755555555665665665ddd6dd5111111113b3b3b33
6666ffffffff070777777fffffff666600000000011111000000000000000ff0011111001ff000000700007056666665666556665dd6ddd5111111113b333333
6666ffffffff77707777ffffffff666600000000011111100000000000000ff0011111100ff00000700707005555555566666666555555551111111133333333
6666ffffffff77770000ffffffff666600000000aa5555500000000000000000005555000000000066666666666666666d6d6d6d66666666ccccccccbbbbbbbb
6666fffffff770777770ffffffff666600000000a5500550000000000000000000505500000000006666666665666656d6d6d6d666666666ccccccccbbb3b3bb
6666fffffff777770770ffffffff666600000000055005500000000000000000055055000000000065555556666666666d6d6d6d66866866ccccccccbbbb3bbb
6666ffffffff07770770ffffffff666600000000055005500000000000000000055055000000000065d55d5666666666d6d6d6d666688666ccccccccbbbbbbbb
66666666666666666666666666666666000000000550550000000000000000000550550000000000655dd556666666666d6d6d6d66688666ccccccccbbbbbbbb
66666666666666666666666666666666000000000550250000000000000000000550550000000000655dd55666666666d6d6d6d666866866ccccccccb3b3bbbb
6666666666666666666666666666666600000000222072200000000000000000222022200000000065d55d56656666566d6d6d6d66666666ccccccccbb3bbbbb
555555555555555555555555555555550000000077700770000000000000000077707770000000006555555666666666d6d6d6d666666666ccccccccbbbbbbbb
__gff__
0000000000000000000000000000000000000000000000000000020000000000020201040201000000000000040101000000000001040401040404020104040000000000010101020202040404080800000000000101010202020404040808000000000001010102020204040408080000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
000000002f2f2f2f2f2f2f2f2f2f2f2f808182830e1f1f1f1f1f1f1f1f1f1f1faeaeaeaeaeaeaeaeaeaeaeaeaeaeaeae9f9f9f9f9f9f8f8f8f8f8f8f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002f2f2f2f2f2f2f2f2f2f2f2f909192931e1f1f1f1f1f1f1f1f1f1f1faeaeaeaeaeaeaeaeaeaeaeaeaeaeaeae9f9f9f9f9f9f9f8f8f8f8f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002f2f2f2f2f2f2f2f2f2f2f2fa0a1a2a30d1f1f1f1f1f1f1f1f1f1f1faeaeaeaeae8d8d8d8d8d8d8d8daeaeae9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002f2f2f2f2f2f2f2f2f2f2f2fb0b1b2b30f0f0f0f0f0f0f0f0f0f0f0faeae8d8d8dbebebebebebebebe8d8d8d9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000007475757575757575757575768d8dbebebebebe9e9e9e9ebebebebebe9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000007d7878787878787878787879bebebebebe9e9e9f9f9f9f9e9ebebebe9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000007778787878787878787878799e9e9e9e9e9f9f9f9f9f9f9f9f9e9e9e9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000007a7b7b7b7b7b7b7b7b7b7b7c9f9f9f9f9f9f9f9f8f8f8f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000000000000000000000000000009f9f9f9f9f9f9f8f8f8f8f8b9c9f9f9c9f9f9f9f9f9f9f9f9f9f9f8b9c9f9f9c00000000000000000000008b9c00009c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000000000000000000000000000009f9fafafafafafaf8fbd8f9bacacac9c9f9fafafafafafaf9fbd9f9bacacac9c0000afafafafafaf00bd009bacacac9c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000afafafafafafafafafadab9badadad9cafafafafafafafafafadab9badadad9cafafafafafafafafafadab9badadad9c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000afafafafafafafafafbbab9b9b9b9b9cafafafafafafafafafbbab9b9b9b9b9cafafafafafafafafafbbab9b9b9b9b9c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f00000000000000000000000000000000bfbfbfbfbfbfbfbfbfbaabbaba9dba9cbfbfbfbfbfbfbfbfbfbbabbaba9dba9cbfbfbfbfbfbfbfbfbfbbabbaba9dba9c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f4445463f4748493f4a4b4c3f4d4e3f00000000000000000000000000000000bcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f5455563f5758593f5a5b5c3f5d5e3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f6465663f6768693f6a6b6c3f6d6e3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0110002000150233001b30002152223001410000152001521e000001522d3002d3001f00004152041520415200152246002000002152236000515215300160000015214000213000915209352000000000009352
00100100362502f2502c2502b2502b2501245013450164501a4501c4501e4501f4502245023450234502345023450204501e45018450144500e4500b45008450074500645007450094500a450094500845000000
__music__
00 01424344

