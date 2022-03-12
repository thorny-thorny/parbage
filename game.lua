local belt_anim = 0
local gear_anim = 0

local hand = {
  x = 0,
  y = 0,
  vx = 0,
  vy = 0,
  can_act = false,
  item_index = 0,
}

local stats = {
  good = 0,
  bad = 0,
}

local pile = {
}

local boss = boss_create(20, 20)

function make_pile_item(sprite)
  return {
    sprite = sprite,
    dx = -2 + rnd(5),
    dy = -2 + rnd(5),
  }
end

function add_pile(sprite)
  local pile_item = make_pile_item(sprite)
  if #pile == 0 then
    add(pile, {})
  end

  add(pile[1], pile_item)
end

function update_pile()
  for i = 1, #pile do
    local natural_i = #pile + 1 - i
    local stack = pile[natural_i]
    local next_stack = pile[natural_i + 1]
    if not next_stack then
      if #stack > 1 then
        add(pile, { make_pile_item(stack[#stack].sprite) })
        deli(stack, #stack)
      end
    else
      if #stack > #next_stack + 1 then
        add(next_stack, make_pile_item(stack[#stack].sprite))
        deli(stack, #stack)
      end
    end
  end
end

function make_item()
  return {
    sprite = 32 + rnd(3),
    x = 128 + rnd(256),
    y = 40 + rnd(24),
  }
end

function can_pick_item(hand, item)
  return abs(item.x - hand.x) <= 4 and abs(item.y - hand.y) <= 4
end

function can_drop_item(hand)
  local sprite = mget(hand.x / 8, hand.y / 8)
  return fget(sprite, 0)
end

local items = {}
for i = 0, 20 do
  add(items, make_item())
end

function update_items()
  for i = 1, #items do
    local item = items[i]
    if i == hand.item_index then
      item.x = hand.x - 4
      item.y = hand.y + 4
    elseif item.x <= -8 then
      add_pile(item.sprite)
      stats.bad += 1
      items[i] = make_item()
    else
      item.x -= 2
    end
  end
end

function update_hand()
  hand.x += hand.vx
  hand.y += hand.vy

  local max_v = 4

  if btn(⬅️) then
    hand.vx = max(hand.vx - 1, -max_v)
  elseif btn(➡️) then
    hand.vx = min(hand.vx + 1, max_v)
  else
    if hand.vx ~= 0 then
      hand.vx -= hand.vx / abs(hand.vx)
    end
  end

  if btn(⬆️) then
    hand.vy = max(hand.vy - 1, -max_v)
  elseif btn(⬇️) then
    hand.vy = min(hand.vy + 1, max_v)
  else
    if hand.vy ~= 0 then
      hand.vy -= hand.vy / abs(hand.vy)
    end
  end

  hand.can_act = can_drop_item(hand)
  for i = 1, #items do
    if i ~= hand.item_index and can_pick_item(hand, items[i]) then
      hand.can_act = true
    end
  end

  if btnp(🅾️) then
    if hand.item_index ~= 0 then
      if can_drop_item(hand) then
        items[hand.item_index] = make_item()
        hand.item_index = 0
        stats.good += 1
      else
        hand.item_index = 0
      end
    else
      for i = 1, #items do
        if can_pick_item(hand, items[i]) then
          hand.item_index = i
        end
      end
    end
  end
end

function _update()
  belt_anim = (belt_anim + 1) % 8
  gear_anim = (gear_anim + 1) % 4
  update_hand()
  update_items()
  update_pile()
  boss:update()
end

function _draw()
  cls(0)
  map(0, 0)
  for x = 0, 16 do
    for y = 0, 16 do
      if mget(x, y) == 1 then
        spr(1 + belt_anim / 2, x * 8, y * 8)
      elseif mget(x, y) == 16 then
        spr(16 + gear_anim / 2, x * 8, y * 8)
      end
    end
  end

  for i = 1, #items do
    local item = items[i]
    spr(item.sprite, item.x, item.y)
  end

  for i = 1, #pile do
    local stack = pile[i]
    for j = 1, #stack do
      local item = stack[j]
      spr(item.sprite, -8 + 4 * i + item.dx, 128 - 4 * j + item.dy)
    end
  end

  local hand_sprite = 48
  if hand.can_act then
    hand_sprite = 49
  end
  spr(hand_sprite, hand.x, hand.y)

  map(16, 0, 0, 0)
  
  boss:draw()

  print('good '..stats.good..' / bad '..stats.bad, 0, 0, 7)
end
