local belt_anim = 0
local gear_anim = 0
local item = nil
local hand = {
  x = 0,
  y = 0,
  vx = 0,
  vy = 0,
}

local stats = {
  good = 0,
  bad = 0,
}

function update_item()
  if not item or item.x <= -8 then
    if item then
      stats.bad += 1
    end

    item = {
      sprite = 32 + rnd(3),
      x = 128,
      y = 40 + rnd(24),
      grabbed = false,
    }
  elseif item.grabbed then
    item.x = hand.x - 4
    item.y = hand.y + 4
  else
    item.x -= 2
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

  if btnp(🅾️) and item then
    if item.grabbed then
      local sprite = mget(hand.x / 8, hand.y / 8)
      if fget(sprite, 0) then
        item = nil
        stats.good += 1
      else
        item.grabbed = false
      end
    else
      if abs(item.x - hand.x) <= 4 and abs(item.y - hand.y) <= 4 then
        item.grabbed = true
      end
    end
  end
end

function _update()
  belt_anim = (belt_anim + 1) % 8
  gear_anim = (gear_anim + 1) % 4
  update_hand()
  update_item()
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
  if item then
    spr(item.sprite, item.x, item.y)
  end
  spr(48, hand.x, hand.y)
  print('good '..stats.good..' / bad '..stats.bad, 0, 0, 7)
end
