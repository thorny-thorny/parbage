function hand_create(x, y)
  return {
    x = x,
    y = y,
    vx = 0,
    vy = 0,
    max_v = 4,
    update = hand_update,
    draw = hand_draw,
  }
end

function hand_update(self)
  self.x += self.vx
  self.y += self.vy

  if btn(⬅️) then
    self.vx = max(self.vx - 1, -self.max_v)
  elseif btn(➡️) then
    self.vx = min(self.vx + 1, self.max_v)
  else
    if self.vx ~= 0 then
      self.vx -= self.vx / abs(self.vx)
    end
  end

  if btn(⬆️) then
    self.vy = max(self.vy - 1, -self.max_v)
  elseif btn(⬇️) then
    self.vy = min(self.vy + 1, self.max_v)
  else
    if self.vy ~= 0 then
      self.vy -= self.vy / abs(self.vy)
    end
  end

  -- hand.can_act = false
  -- can_drop_item(hand)
  -- for i = 1, #items do
  --   if i ~= hand.item_index and can_pick_item(hand, items[i]) then
  --     hand.can_act = true
  --   end
  -- end

  -- if btnp(🅾️) then
  --   if hand.item_index ~= 0 then
      -- if can_drop_item(hand) then
      --   items[hand.item_index] = make_item()
      --   hand.item_index = 0
      --   stats.good += 1
      -- else
      --   hand.item_index = 0
      -- end
    -- else
      -- for i = 1, #items do
      --   if can_pick_item(hand, items[i]) then
      --     hand.item_index = i
      --   end
      -- end
    -- end
  -- end
end

function hand_draw(self)
  spr(48, self.x, self.y)
end
