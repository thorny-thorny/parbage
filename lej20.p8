pico-8 cartridge // http://www.pico-8.com
version 35
__lua__
#include sounds.lua
#include animation.lua
#include utils.lua
#include garbage.lua
#include boss.lua
#include belt.lua
#include conveyer.lua
#include hand.lua
#include env.lua
#include overlay.lua
#include menu_scene.lua
#include intro_scene.lua
#include game_scene.lua
#include outro_scene.lua
#include overflow_scene.lua
#include scene_controller.lua

show_menu()

__gfx__
0000000056666666666666656666665666666566666656666665666666566666656666660008880000000d00000003000000dd00000000006666666666666666
000000005666666666666665666666566666656666665666666566666656666665666666008000800000d0d000003330000d55d0000000006666666666666666
0070070056666666666666656666665666666566666656666665666666566666656666660800008000000dd00033333b00d5005d000000006677776666666666
00077000566666666666666566666656666665666666566666656666665666666566666608080080000000d0000333b000d5005d000000006777777666666666
00077000566666666666666566666656666665666666566666656666665666666566666608080080000000d000003b00000d55d0000000007775777766666666
0070070056666666666666656666665666666566666656666665666666566666656666660800880000d000d0000000000000dd00000000007775777766666666
00000000566666666666666566666656666665666666566666656666665666666566666600800008000d00d00000000000000000000000007775557766666666
000000005666666666666665666666566666656666665666666566666656666665666666000888800000dd000000000000000000000000007777777755555555
5555555555555555055555505555550000555555055555500000aa000000a7000000aa00000066660eeeeee00000e0000000080000000ee06777777666666666
666666666666666605dddd5057bb75000057bb75057bb75000a0a90a00a0770a00a0a90700007777e88eeeee000030000000090000000ee06677776666666666
656665665656565605dddd5057b775000057b775057b775000a9999900a7799900a9997700007777e8eeeee000e030e000000900000090006666666666666666
555655566566656605dddd5057bb75000057bb75057bb75000989989007e9989009897e9000077770eeeeee00003330000009990000888006666666666666666
656665665656565605dddd505777750000577775057777500099999900799999009977990077777700e00e0000003e000000aaa0000888006666666666666666
6666666666666666055656505565650000556565055656500000000000000000000000000777777700000000000e33000000aaa000000000662fff2666666666
555555555555555505656550565655000056565505656550000000000000000000000000077777770000000000003000000099900000000066f2f2f666666666
00000000000000000555555055555500005555550555555000000000000000000000000000777770000000000000000000000000000000006752257666666666
0000004400888800000ccc00000009000003000000000700009999000099770000999900000070000002200000000000000cc000000000006ffffff699999999
440044940888888000c555c000009000000330800007776009aa999009a7779009aa99900003370000aa220000222200000770000000dd006f4f44f699999999
944449440077770000ccccc00009000000003878006776679aa999a99a7779a99aa999770033937002a2200000022000007777700d0d0d0064f5544699999999
999999400007700000ccccc00080000000000380000677709a9999a9977799a99a999777033939370022990000099000007777070dddd0006666666699999999
000994000007700000ccccc00000000000003000000070009a9999a9777999a99a99777973999330009992200029290000777707000d00006666666699999999
009994000077770000ccccc00000000000030330000000009a999aa977999aa99a9777a907393300022929200229222000777707000dd0dd6666666699999999
999094400887788000ccccc00000000000000033000000000999aa900999aa9009777a90007330000229222002292220007777700000ddd06699996699999999
9000094400888800000ccc00000000000000000000000000009999000099990000779900000700000022220000222200007777000000000069aa999699999999
007770000033300000707000003030000ee000bb0000000000000cc0000d000000009000000000000000e0000000300000080000000eeee09aa999a944444444
0777770003bbb30007070700030303000eee0bbb0000000000000c0c00ddd000000090000000000000009000000030000087800000eeee009a9999a944444444
777777003bbbb3007070777030303b30000e7b000000000000000c000d7d7d000000900000000000000090000009330008887800000000009a9999a944444444
7077777030bbbb30070777770303bbb3000eb7000000000000cc0c00d77d77d00000900000000000000090000099900028888780000000009a999aa944444444
0077777700bbbbb300777777003bbbb3000e7b000000000000cccc000d7ddddd8888900000000000000090000999000002888878000000006999aa9644444444
077777770333bbb3000777770003bbb3000ebb0000000000000cc00000d777d09999900000000000000060000900000000288887000000006699996644444444
0000777000003b300777777003333b30000000000000000000000000000d7d009000900000000000000010009000000000028878000000006666666644444444
000007000000030000000700000003000000000000000000000000000000d0009000900000000000000000000000000000002780000000005555555544444444
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
55555555555555555555555555555555005550000005550000000000000000000000000000000000000000000000000000000000000000000000000000000000
5dddddddddddddd55777777777777775056555000056555000000000000000000000000000000000000000000000000000000000000000000000000000000000
5dddddddddddddd55777733373377775565555555565555500000000000000000000000000000000000000000000000000000000000000000000000000000000
5dddddddddddddd55777733333337775565555555565555500000000000000000000000000000000000000000000000000000000000000000000000000000000
5dddddddddddddd55777337131737775555555555555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
5dddddddddddddd55777333333377775055555000055555000000000000000000000000000000000000000000000000000000000000000000000000000000000
5dddddddddddddd55773332333337775005550000005550000000000000000000000000000000000000000000000000000000000000000000000000000000000
5dddddddddddddd55773332222227775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5dddddddddddddd55773333222227775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5dddddddddddddd55777333333377775000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
555555555555656555555555555565b5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000104040400000000000400000008000001020204040000020201040201080000040000040100000000000001000101040004020104000000000000010101020202040404080800000000000101010202020404040808000000000001010102020204040408080000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000400040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
000000002f2f2f2f2f2f2f2f2f2f2f2f808182830e1f1f1f1f1f1f1f1f1f1f1faeaeaeaeaeaeaeaeaeaeaeaeaeaeaeae9f9f9f9f9f9f8f8f8f8f8f8f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002f2f2f2f2f2f2f2f2f2f2f2f909192931e1f1f1f1f1f1f1f1f1f1f1faeaeaeaeaeaeaeaeaeaeaeaeaeaeaeae9f9f9f9f9f9f9f8f8f8f8f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002f2f2f2f2f2f2f2f2f2f2f2fa0a1a2a32e1f1f1f1f1f1f1f1f1f1f1faeaeaeaeae8d8d8d8d8d8d8d8daeaeae9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002f2f2f2f2f2f2f2f2f2f2f2fb0b1b2b33e0f0f0f0f0f0f0f0f0f0f0faeae8d8d8dbebebebebebebebe8d8d8d9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
011000200c0430e2153e3150e413246150c0433e3151a3150c0433e3150e4130e215246150e4133e3150c0430c0430e2150e41300000246150c043000000e4130c043000000e4130c043246150c0430e4130c043
00100101362502f2502c2502b2502b2501245013450164501a4501c4501e4501f4502245023450234502345023450204501e45018450144500e4500b45008450074500645007450094500a450094500845000000
4819000016630126300d6300a6300a6300e630136301863017630116300e6300f6301263016630196301963016630136300f6300c6300e6301363016630196301a6301a630186301463012630106301263016630
001000002724327243272432724327243000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001a21300203002030020300203002030020300203002030020300203002030020300203002030020300203002030020300203002030020300203002030020300203002030020300203002030020300203
001000001e5202d530005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
011000000952300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503
__music__
03 00444344
03 02424344

