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
0000000056666666666666656666665666666566666656666665666666566666656666660777777000000d000000090000cccc00000000006666666666666666
000000005666666666666665666666566666656666665666666566666656666665666666004554000000d0d000099990000cc000000000006666666666666666
0070070056666666666666656666665666666566666656666665666666566666656666660044450000000dd009999999000cc000000000006677776666666666
00077000566666666666666566666656666665666666566666656666665666666566666600554400000000d09999999a00c7cc00000000006777777666666666
00077000566666666666666566666656666665666666566666656666665666666566666600445500000000d0a9999aaa007ccc00000000007775777766666666
0070070056666666666666656666665666666566666656666665666666566666656666660054440000d000d0a99aaaa0007ccc00000000007775777766666666
00000000566666666666666566666656666665666666566666656666665666666566666600455400000d00d00aaaa00000ccc100000000007775557766666666
000000005666666666666665666666566666656666665666666566666656666665666666077777700000dd000aa0000000ccc100000000007777777755555555
5555555555555555055555505555550000555555055555500000aa000000a7000000aa00000055550eeeeee00000e0000000080000000ee06777777666666666
666666666666666605dddd5057bb75000057bb75057bb75000a0a90a00a0770a00a0a90700007777e88eeeee000030000000090000000ee06677776666666666
656665665656565605dddd5057b775000057b775057b775000a9999900a7799900a9997700007777e8eeeee000e030e000000900000090006666666666666666
555655566566656605dddd5057bb75000057bb75057bb75000989989007e9989009897e9000075750eeeeee00003330000009990000888006666666666666666
656665665656565605dddd505777750000577775057777500099999900799999009977990077575700e00e0000003e000000aaa0000888006666666666666666
6666666666666666055656505565650000556565055656500000000000000000000000000777777700000000000e33000000aaa000888880662fff2666666666
555555555555555505656550565655000056565505656550000000000000000000000000077777770000000000003000000099900088888066f2f2f666666666
00000000000000000555555055555500005555550555555000000000000000000000000000777770000000000000000000000000008888806752257666666666
0000004400888800000ccc000000090000030000000d0000009999000099770000999900000070000000000000000000000cc000990000006ffffff699999999
440044940888888000c555c0000090000003308000ddd00009aa999009a7779009aa999000033700000000000000000000077000009988806f4f44f699999999
944449440077770000ccccc000090000000038780d7d7d009aa999a99a7779a99aa99977003393700000000000000000007777709999888864f5544699999999
999999400007700000ccccc00080000000000380d77d77d09a9999a9977799a99a99977703393937000000000000000000777707000988886666666699999999
000994000007700000ccccc000000000000030000d7ddddd9a9999a9777999a99a99777973999330000000000000000000777707099000886666666699999999
009994000077770000ccccc0000000000003033000d777d09a999aa977999aa99a9777a907393300000000000000000000777707000000886666666699999999
999094400887788000ccccc00000000000300033000d7d000999aa900999aa9009777a9000733000000000000000000000777770000888886699996699999999
9000094400888800000ccc0000000000003000000000d000009999000099990000779900000700000000000000000000007777000088888069aa999699999999
007770000033300000707000003030000000000000000000000000000000000000000000000000000000e0000000300000080000000000009aa999a944444444
0777770003bbb3000707070003030300000000000000000000000000000000000000000000000000000090000000300000878000000000009a9999a944444444
777777003bbbb3007070777030303b30000000000000000000000000000000000000000000000000000090000009330008887800000000009a9999a944444444
7077777030bbbb30070777770303bbb3000000000000000000000000000000000000000000000000000090000099900028888780000000009a999aa944444444
0077777700bbbbb300777777003bbbb3000000000000000000000000000000000000000000000000000090000999000002888878000000006999aa9644444444
077777770333bbb3000777770003bbb3000000000000000000000000000000000000000000000000000060000900000000288887000000006699996644444444
0000777000003b300777777003333b30000000000000000000000000000000000000000000000000000010009000000000028878000000006666666644444444
00000700000003000000070000000300000000000000000000000000000000000000000000000000000000000000000000002780000000005555555544444444
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
0000000000000001111111110000000001ccc111cccccccccccccc1003bbbbbbbbbbb3bbbbbbbb3005ddddddddd8dddddd5ddd50442222222222204400000000
0000000000000000616666160000000001cccc11ccccccccc1cccc1003bb3bbbbbbb993bb3bb3b3005ddd5ddd8d8d8ddd5dddd50402222222222044400000000
0000000000000000011111110000000001ccc1c1cccccc1ccc1ccc1003bb3b3bbbb999bbb3b3bb3005dd5dd5d888d8d8dddd5d50440222222200444400000000
0000000000000000011111100000000001cc1cccccccc11cccc1cc1003bbb33bbb999bbb3333bb3005d5dd5d88998889ddd5dd504440000000444aa400000000
0000000000000000011001100000000001cc1111cccc11111111cc1003b33333b99bbbb333333b3005ddddd8999989998ddddd504aaa44444444400400000000
0000000000000022211021100000000001cccccccccccccccccccc1003bbbbbbbbbbbbbbbbbbbb3005dddddddddddddddddddd5040aaa4444444444400000000
0000000000000022220222200000000001cccccccccccccccccccc1003333333333333333333333005555555555555555555555044000444444aaa4400000000
00000000000000002202220000000000011111111111111111111110000000000000000000000000000000000000000000000000444444444440004400000000
0000000000000001111111110000000000000000000000000000000000c1111111111111111111c000c1111111111111111111c000c111110000000000000000
0000000000000000111111110000000000ccccccccccccccccccccc000c1111111111111111111c000c1111111111111111111c000c111110000000000000000
0000000000000000616666160000000000c1111111111111111111c000c1111111111111111111c000c1111111111111111111c00c1111110000000000000000
0000000000000000111111110000000000c1111111111111111111c000c1111111111111111111c000c1111111111111111111c0c11111110000000000000000
0000000000000000011001100000000000c1111111111111111111c000c1111111111111111111c000c1111111111111111111c00c1111110000000000000000
0000000000000000011001100000000000c1111111111111111111c000c1111111111111111111c000c1111111111111111111c000c111110000000000000000
0000000000000022210221100000000000c1111111111111111111c000c1111111111111111111c000ccccccccccccccccccccc000c111110000000000000000
0000000000000022220222200000000000c1111111111111111111c000c1111111111111111111c000000000000000000000000000c111110000000000000000
666666666666666666666666666666660000000000000000000000000000000000000000000000000000700755556655000000001c1c1c1c0000000077777777
66666666666666666666666666666666000000000000000000000000000000000000000000000000070700706555665500000600c1c1c1c10000000077777777
666666666666666666666666666666660000000000000000000000000000000000000000000000007000000065556655006006001c1c1c1c0000000077777777
66666666666666666666666666666666000000000000000000000000000000000000000000000000000000076566665660660660c1c1c1c10000000077777777
6666ffffffffffffffffffffffff66660000000000011000000000000000000000011000000000000000007065666666606666601c1c1c1c0000000077777777
6666fffffff11111ffffffffffff66660000000000111100000000000000000000111100000000000070070066666666606d6d60cccccccc0000000077777777
6666ffffff11111111ffffffffff66660000000001111150000000000000000001111150000000000700000066666666606d6d60cccccccc0000000077777777
6666fffff1111111111fffffffff6666000000000155555000000000000000000155555000000000700007006666666666666666cccccccc0000000077777777
6666fffff11111555511ffffffff6666000000005557777000000000000000005557777000000000007000076666666655555555666dd666ccccccccaaaaaaaa
6666ffff111155777555ffffffff666600000000577117170000000000000000577777770000000000000070666666665dd5d5d566dddd66ccccccccaaaaaaaa
6666ffff1115577777775fffffff666600000000071717170000000000000000077717170000000000700700666666665dd5d5d56dddddd6ccccccccaaaaaaaa
6666fff11155770077700fffffff66660000000007717777000000000000000007117771000000000700700066666666555555556dddddd6ccccccccaaaaaaaa
6666ffff15577777777777ffffff66660000000007777117000000000000000007c7717cc00000007007007066666666555555556dddddd6ccccccccaaaaaaaa
6666ffff55777700777700ffffff66660000000000717777000aaa0000000000007777770000000000000700666666665dd5d5d56dddddd6cacacacaaaaaaaaa
6666ffff577770700770707fffff6666000aa0000077117000aaaaa00000000c007111700c00000000007000666666665dd5d5d56dddddd6acacacacaaaaaaaa
6666ffff577777007777077fffff666600aaaa000007777000aaaaa00000000000777700000000000007000066666666555555556dddddd6aaaaaaaaaaaaaaaa
6666fffff57777777077777fffff666600aaaa000011111000aff000000000000011110000000000007000005666666566666666555555551111111133333333
6666ffffff7777777707777fffff666600fff0001111111100fff0000000000001111110000000000700000055555555666556665dddddd51111111133333333
6666fffffff77777777077ffffff6666000ff00111111111111f00000000000011111111000000007000000056666665665665665ddd6dd511111111333b3333
6666fffffff7777070077fffffff66660000111100111100110000000000000010111101000000000000700755555555656556565dd6dd6511111111333b3b33
6666ffffffff7777777777ffffff66660000011000111100000000000000000110111101100000000007000056666665656556565d6dd6d5111111113b3b3b33
6666ffffffff0777700077ffffff66660000000000111100000000000000001100111100110000000070000755555555665665665ddd6dd5111111113b3b3b33
6666ffffffff700777777fffffff666600000000011111000000000000000ff0011111001ff000000700007056666665666556665dd6ddd5111111113b333333
6666ffffffff77707777ffffffff666600000000011111100000000000000ff0011111100ff00000700707005555555566666666555555551111111133333333
6666ffffffff77770007ffffffff666600000000aa5555500000000000000000005555000000000066666666666666666d6d6d6d66666666ccccccccbbbbbbbb
6666ffffffff70777770ffffffff666600000000a5500550000000000000000000505500000000006666666665666656d6d6d6d666666666ccccccccbbb3b3bb
6666fffffff707777770ffffffff666600000000055005500000000000000000055055000000000065555556666666666d6d6d6d66655666ccccccccbbbb3bbb
6666fffffff777777770ffffffff666600000000055005500000000000000000055055000000000065d55d5666666666d6d6d6d666556666ccccccccbbbbbbbb
66666666666666666666666666666666000000000550550000000000000000000550550000000000655dd556666666666d6d6d6d66565666ccccccccbbbbbbbb
66666666666666666666666666666666000000000550250000000000000000000550550000000000655dd55666666666d6d6d6d666656666ccccccccb3b3bbbb
6666666666666666666666666666666600000000222072200000000000000000222022200000000065d55d56656666566d6d6d6d66566666ccccccccbb3bbbbb
555555555555555555555555555555550000000077700770000000000000000077707770000000006555555666666666d6d6d6d666666666ccccccccbbbbbbbb
5555555555555555555555555555555500555000000555000000000000000000000000000eeeee00000bbbbb0000000000000000000000000000000000000cc0
5dddddddddddddd5577777777777777505655500005655500000000000000000000000000eeeeee000bbbbbb0000000000000000000000000022220000000c0c
5dddddddddddddd5577773337337777556555555556555550000000000000000000000000eeeeeee0bbbbbbb0000000000000000000000000002200000000c00
5dddddddddddddd5577773333333777556555555556555550000000000000000000000000eeeeeeebbbbbbbb0000000000000000000000000009900000cc0c00
5dddddddddddddd5577733713173777555555555555555550000000000011000000000000eeeeeeebbbbbbbb0000000000000000000000000029290000cccc00
5dddddddddddddd5577733333337777505555500005555500000000000111100000000000000eeeebbbbb00000000000000000000000000002292220000cc000
5dddddddddddddd5577333233333777500555000000555000000000001111150000000000000eeeebbbbb0000000000000000000000000000229222000000000
5dddddddddddddd5577333222222777500000000000000000000000001555550000000000000eeeebbbbb0000000000000000000000000000022220000000000
5dddddddddddddd5577333322222777500990000000000000000000055577770000000000000eeeebbbbb0000000000000000000000000000000000000000700
5dddddddddddddd5577733333337777500990000909000900000000057711717000000000000eeeebbbbb0000000000000000000000000000000000000077750
5555555555555555555555555555555500999999999999900000000007171717000000000000eeeebbbbb0000000000000000000000000000000000000577667
555555555555656555555555555565b500990090000090900000000007717777000000000000eeeebbbbb0000000000000000000000000000000000000067770
5555555555555555555555555555555500990090000900000000000007777117000000000000eeeebbbbb0000000000000000000000000000000000000007000
0000000000000000000000000000000000000009999000000000000000777777000000000000eeeebbbbb0000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000771170000000000000eeeebbbbb0000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000777700000000000000000000000000000000000000000000000000000000000000000
000044444440000000e00e000000800000022222222200000000000111111100000ff000000777000000000000000000000000000000000000000000000eeee0
000488888884000000e00e0000aa98000020000200202000000000111111111100fff00007777700000000000000000000000000000000000000000000eeee00
004888888888400003030030000a980000200002002002000000011000111111111f000077677500000000000000000000000000000000000000000000000000
00488828828840000303033000009000020000020020022000000100001111001100000007677670000000000000000000000000000000000000000000000000
00488882288844000033030000009000222222222222222200000110001111000000000005776777000000000000000000000000000000000000000000000000
4444488888444440003303000000900022222111222112220000000f001111000000000000077777000000000000000000000000000000000000000000000000
444448888844444007cccc1000099900a2222222222222280000000f011111000000000000077000000000000000000000000000000000000000000000000000
004222222222400007cccc1000999990a22222222222222800000000011111100000000000000000000000000000000000000000000000000000000000000000
004222222222400007cccc1009099909225555222255552200000000055555500000000000000000000000000000000000000000000000000000000000022000
004444444444400007cccc1000099900255665522556655200000000055005500000000000000000000000000000000000000000000000000000000000aa2200
004444444444400007cccc10000a0a00056666522566665200000000055005500000000000000000000000000000000000000000000000000000000002a22000
004400000004400007cccc10000a0a00055665500556655000000000055005500000000000000000000000000000000000000000000000000000000000229900
004400000004400007cccc10000a0a00005555000055550000000000055055000000000000000000000000000000000000000000000000000000000000999220
004400000004400007cccc0000a000a0000000000000000000000000055025000000000000000000000000000000000000000000000000000000000002292920
004400000004400007cccc0000000000000000000000000000000000222072200000000000000000000000000000000000000000000000000000000002292220
004400000004400000cccc0000000000000000000000000000000000777007700000000000000000000000000000000000000000000000000000000000222200
__label__
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1111111111111111
1111111111111111111111111111111111111111c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c11111111111111111
11111111111111111111111111111111111111111c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1111111111111111
1111111111111111111111111111111111111111c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c11111111111111111
11111111111111111111111111111111111111111c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1111111111111111
1111111111111111111111111111111111111111cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1111111111111111
1111111111111111111111111111111111111111cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1111111111111111
1111111111111111111111111111111111111111cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1111111111111111
11111111111111111c1c1c1c1c1c1c1c1c1c1c1ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1c1c1c1c1c1c1c1c
1111111111111111c1c1c1c1c1c1c1c1c1c1c1c1ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1c1c1c1c1c1c1c1
11111111111111111c1c1c1c1c1c1c1c1c1c1c1ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1c1c1c1c1c1c1c1c
1111111111111111c1c1c1c1c1c1c1c1c1c1c1c1ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1c1c1c1c1c1c1c1
11111111111111111c1c1c1c1c1c1c1c1c1c1c1ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc1c1c1c1c1c1c1c1c
1111111111111111cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
1111111111111111cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
1111111111111111cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
1c1c1c1c1c1c1c1ccccccccccccc0000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccc
c1c1c1c1c1c1c1c1cccccccccccc0000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccc
1c1c1c1c1c1c1c1ccccccccccccc0000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccc
c1c1c1c1c1c1c1c1cccccccccccc0000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccc
1c1c1c1c1c1c1c1ccccccccccccc0000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccc
cccccccccccccccccccccccccccc0000000000000000000000000000000000000000000000000000000000000000000000000ccccccccccccccccccccccccccc
cccccccccccccccccccccccccccc0000000000777777007777770077777700777777007777770000777700777777000000000ccccccccccccccccccccccccccc
cccccccccccccccccccccccccccc0000000000777777007777770077777700777777007777770000777700777777000000000ccccccccccccccccccccccccccc
cccccccccccccccccccccccccccc0000000000770077007700770077007700770077007700770077000000770000000000000ccccccccccccccccccccccccccc
cccccccccccccccccccccccccccc0000000000770077007700770077007700770077007700770077000000770000000000000ccccccccccccccccccccccccccc
cccccccccccccccccccccccccccc0000000000777777007777770077770000777700007777770077000000777700000000000ccccccccccccccccccccccccccc
cccccccccccccccccccccccccccc0000000000777777007777770077770000777700007777770077000000777700000000000ccccccccccccccccccccccccccc
cccccccccccccccccccccccccccc0000000000770000007700770077007700770077007700770077007700770000000000000ccccccccccccccccccccccccccc
cccccccccccccccccccccccccccc0000000000770000007700770077007700770077007700770077007700770000000000000acacacacacacccccccccccccccc
cccccccccccccccccccccccccccc0000000000770000007700770077007700777777007700770077777700777777000000000cacacacacaccccccccccccccccc
cccccccccccccccccccccccccccc0000000000770000007700770077007700777777007700770077777700777777000000000aaaaaaaaaaacccccccccccccccc
cccccccccccccccccccccccccccc0000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaacccccccccccccccc
cccccccccccccccccccccccccccc0000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaacccccccccccccccc
cccccccccccccccccccccccccccc0000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaacccccccccccccccc
cccccccccccccccccccccccccccc0000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaacccccccccccccccc
cccccccccccccccccccccccccccc0000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaacccccccccccccccc
cacacacacacacacacacacacacaca0000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaacacacacacacacaca
acacacacacacacacacacacacacac0000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaaacacacacacacacac
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000000000000007777700000007707770777077707770000000000000000000000aaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000000000000077555770000070000700707070700700000000000000000000000aaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000000000000077575770000077700700777077000700000000000000000000000aaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000000000000077555770000000700700707070700700000000000000000000000aaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000000000000057777750000077000700707070700700000000000000000000000aaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000000000000005555500000000000000000000000000000000000000000000000aaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000555aaaaaaaaaaaaaaaa55555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000005d5aaaaaaaaaaaaaaaa5dd5d5d5
aaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000005d5aaaaaaaaaaaaaaaa5dd5d5d5
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000555aaaaaaaaaaaaaaaa55555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000005550505000000550055055505550055005505050550055000000000000000555aaaaaaaaaaaaaaaa55555555
aaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000050505050000050005050500005005000505050505050505000000000000005d5aaaaaaaaaaaaaaaa5dd5d5d5
aaaaaaaaaaaaaaaaaaaaaaaaaaaa00000000000055005550000055505050550005005550505050505050505000000000000005d5aaaaaaaaaaaaaaaa5dd5d5d5
aaaaaaaaaaaaaaaaaaaaaaaaaaaa0000000000005050005000000050505050000500005050505050505050500000000000000555aaaaaaaaaaaaaaaa55555555
aaaaaaaaaaaaaaaa3333333333330000000000005550555000005500550050000500550055000550505055500000000000000666666666666666666655555555
aaaaaaaaaaaaaaaa333333333333000000000000000000000000000000000000000000000000000000000000000000000000066666655666666556665dd5d5d5
aaaaaaaaaaaaaaaa333b3333333b000000000000000055505500550000005550505005505550550050500000000000000000056666566566665665665dd5d5d5
aaaaaaaaaaaaaaaa333b3b33333b0000000000000000505050505050000005005050505050505050505000000000000000000656656556566565565655555555
aaaaaaaaaaaaaaaa3b3b3b333b3b0000000000000000555050505050000005005550505055005050555000000000000000000656656556566565565655555555
aaaaaaaaaaaaaaaa3b3b3b333b3b000000000000000050505050505000000500505050505050505000500000000000000000056666566566665665665dd5d5d5
aaaaaaaaaaaaaaaa3b3333333b33000000000000000050505050555000000500505055005050505055500000000000000000066666655666666556665dd5d5d5
aaaaaaaaaaaaaaaa3333333333330000000000000000000000000000000000000000000000000000000000000000000000000666666666666666666655555555
33333333333333333333333333330000000000000000000000000000000000000000000000000000000000000000000000000555555555555555555555555555
33333333333333333333333333330000000000000000000000000000000000000000000000000000000000000000000000000dd55dddddd55dddddd55dd5d5d5
333b3333333b3333333b3333333b0000000000000000000000000000000000000000000000000000000000000000000000000dd55ddd6dd55ddd6dd55dd5d5d5
333b3b33333b3b33333b3b33333b0000000000000000000000000000000000000000000000000000000000000000000000000d655dd6dd655dd6dd6555555555
3b3b3b333b3b3b333b3b3b333b3b00050000550505000005550555055500550555055500000555055505550000055505550006d55d6dd6d55d6dd6d555555555
3b3b3b333b3b3b333b3b3b333b3b0005000505050500000500050005000505050500500000005005050555000000050505000dd55ddd6dd55ddd6dd55dd5d5d5
3b3333333b3333333b3333333b330005000505050500000550055005500505055000500000005005550505000005550505000dd55dd6ddd55dd6ddd55dd5d5d5
33333333333333333333333333330005000505055500000500050005000505050500500000005005050505000005000505000555555555555555555555555555
33333333333333333333333333330005550550055500000555050005000550050500500000055005050505000005550555000666666666666666666655555555
3333333333333333333333333333000000000000000000000000000000000000000000000000000000000000000000000000066666666666666666665dd5d5d5
333b3333333b3333333b3333333b000000000000000000000000000000000000000000000000000000000000000000000000066666666666666556665dd5d5d5
333b3b33333b3b33333b3b33333b0000000000000000000000000000000000000000000000000000000000000000000000000666666666666655666655555555
3b3b3b333b3b3b333b3b3b333b3b0000000000000000000000000000000000000000000000000000000000000000000000000666666666666656566655555555
3b3b3b333b3b3b333b3b3b333b3b3b333b3b3b333b3b3b333b3b3b333b3b3b333b3b3b336666666655555555666666666666666666666666666566665dd5d5d5
3b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333333b3333336566665656666665666666666666666666666666665666665dd5d5d5
33333333333333333333333333333333333333333333333333333333333333333333333366666666555555556666666666666666666666666666666655555555
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb66666666566666656666666666666666666dd6666666666655555555
bbb3b3bbbbb3b3bbbbb3b3bbbbb3b3bbbbb3b3bbbbb3b3bbbbb3b3bbbbb3b3bbbbb3b3bb6566665655555555666666666666666666dddd66666666665dd5d5d5
bbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbb666666665666666565555556655555566dddddd6655555565dd5d5d5
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb666666665555555565d55d5665d55d566dddddd665d55d5655555555
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb6666666656666665655dd556655dd5566dddddd6655dd55655555555
b3b3bbbbb3b3bbbbb3b3bbbbb3b3bbbbb3b3bbbbb3b3bbbbb3b3bbbbb3b3bbbbb3b3bbbb6666666655555555655dd556655dd5566dddddd6655dd5565dd5d5d5
bb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbbbb3bbbbb656666565666666565d55d5665d55d566dddddd665d55d565dd5d5d5
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb666666665555555565555556655555566dddddd66555555655555555
6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d
d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6
6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d
d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6
6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d
d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6
6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d
d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6
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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000104040100000000000100000008000001020204040000020201040201080000040000010100000000000000000000000004020100000000000000010101020202040404080800000000000101010202020404040808000000000001010102020204040408080000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000010000000001000100000001000000000100000000000000000000010100020401000000000104000000000400000000000000000000000000000000
__map__
000000002f2f2f2f2f2f2f2f2f2f2f2f808182830e1f1f1f1f1f1f1f1f1f1f1faeaeaeaeaeaeaeaeaeaeaeaeaeaeaeae9f9f9f9f9f9f8f8f8f8f8f8f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002f2f2f2f2f2f2f2f2f2f2f2f909192931e1f1f1f1f1f1f1f1f1f1f1faeaeaeaeaeaeaeaeaeaeaeaeaeaeaeae9f9f9f9f9f9f9f8f8f8f8f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002f2f2f2f2f2f2f2f2f2f2f2fa0a1a2a32e1f1f1f1f1f1f1f1f1f1f1faeaeaeaeae8d8d8d8d8d8d8d8d8daeae9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000002f2f2f2f2f2f2f2f2f2f2f2fb0b1b2b33e0f0f0f0f0f0f0f0f0f0f0faeae8d8d8dbebebebebebebebebe8d8d9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000007475757575757575757575768d8dbebebebebe9e9e9e9e9ebebebebe9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000007d7878787878787878787879bebebebebe9e9e9f9f9f9f9f9e9ebebe9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000007778787878787878787878799e9e9e9e9e9f9f9f9f9f9f9f9f9f9e9e9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000007a7b7b7b7b7b7b7b7b7b7b7c9f9f9f9f9f9f9f9f8f8f8f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000000000000000000000000000009f9f9f9f9f9f9f8f8f8f8f8f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f00000000000000000000008b9c00009c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f000000000000000000000000000000009f9f9f9f9f9f9f8f8f8f8f8f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f000000000000000000bd009bacacac9c0000afafafafafaf00000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f000000000000000000000000000000009f9f9f9f9f9f9f8f8f8f8f8f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f000000000000000000adab9badadad9cafafafafafafafafaf000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f000000000000000000000000000000009f9f9f9f9f9f9f9f8f8f8f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f000000000000000000bbab9b9b9bbd9cafafafafafafafafaf000000000000000000000000000000000000000000000000000000000000000000000000000000
3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f000000000000000000000000000000009f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f000000000000000000bbabbaba9dba9cbfbfbfbfbfbfbfbfbf000000000000000000000000000000000000000000000000000000000000000000000000000000
3f4445463f4748493f4a4b4c3f4d4e3f000000000000000000000000000000009f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9f9fbcbcbcbcbcbcbcbcbcbcbcbcbcbcbcbc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f5455563f5758593f5a5b5c3f5d5e3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3f6465663f6768693f6a6b6c3f6d6e3f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011000200c0430e2153e3150e413246150c0433e3151a3150c0433e3150e4130e215246150e4133e3150c0430c0430e2150e41300000246150c043000000e4130c043000000e4130c043246150c0430e4130c043
00100101362502f2502c2502b2502b2501245013450164501a4501c4501e4501f4502245023450234502345023450204501e45018450144500e4500b45008450074500645007450094500a450094500845000000
4819000016630126300d6300a6300a6300e630136301863017630116300e6300f6301263016630196301963016630136300f6300c6300e6301363016630196301a6301a630186301463012630106301263016630
001000002724327243272432724327243000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001a21300203002030020300203002030020300203002030020300203002030020300203002030020300203002030020300203002030020300203002030020300203002030020300203002030020300203
001000001e5202d530005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
001000000952300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503005030050300503
010800001b6061e6161e6261e6361e6461e6561e6661e6761e6561e6461e6361e6361e6261e6261e6261e6161e6161e6161e6161e6061e6060000600006000060000600006000060000600006000060000600006
480e0010110501100011000110001a0501a0001a00010000110501000010000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
03 00444344
03 02424344
03 08424344
