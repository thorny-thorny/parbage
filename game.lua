local stats = {
  good = 0,
  bad = 0,
}

-- local pile = {
-- }

local boss = boss_create(20, 20)

local coin = coin_create(40, 100)

local conveyer = conveyer_create(5, 4, 1, 50)

local hand = hand_create(0, 0)

-- function make_pile_item(sprite)
--   return {
--     sprite = sprite,
--     dx = -2 + flr(rnd(5)),
--     dy = -2 + flr(rnd(5)),
--   }
-- end

-- function add_pile(sprite)
--   local pile_item = make_pile_item(sprite)
--   if #pile == 0 then
--     add(pile, {})
--   end

--   add(pile[1], pile_item)
-- end

-- function update_pile()
--   for i = 1, #pile do
--     local natural_i = #pile + 1 - i
--     local stack = pile[natural_i]
--     local next_stack = pile[natural_i + 1]
--     if not next_stack then
--       if #stack > 1 then
--         add(pile, { make_pile_item(stack[#stack].sprite) })
--         deli(stack, #stack)
--       end
--     else
--       if #stack > #next_stack + 1 then
--         add(next_stack, make_pile_item(stack[#stack].sprite))
--         deli(stack, #stack)
--       end
--     end
--   end
-- end

function can_pick_item(hand, item)
  return abs(item.x - hand.x) <= 4 and abs(item.y - hand.y) <= 4
end

function can_drop_item(hand)
  local sprite = mget(hand.x / 8, hand.y / 8)
  return fget(sprite, 0)
end

function _update()
  -- update_pile()
  boss:update()
  coin:update()
  conveyer:update()
  hand:update()
end

function _draw()
  cls(0)
  map(0, 0)

  conveyer:draw()
  hand:draw()

  -- for i = 1, #pile do
  --   local stack = pile[i]
  --   for j = 1, #stack do
  --     local item = stack[j]
  --     spr(item.sprite, -8 + 4 * i + item.dx, 128 - 4 * j + item.dy)
  --   end
  -- end

  map(16, 0, 0, 0)

  boss:draw()
  coin:draw()

  print('good '..stats.good..' / bad '..stats.bad, 0, 0, 7)
end
