function hand_create(x, y)
  return {
    x = x,
    y = y,
    vx = 0,
    vy = 0,
    max_v = 4,
    can_grab = false,
    can_drop = false,
    item = nil,
    update = hand_update,
    draw = hand_draw,
    can_grab_garbage = hand_can_grab_garbage,
  }
end

function hand_can_grab_garbage(self, garbage)
  return abs(self.x - garbage.x) <= 4 and abs(self.y - garbage.y) <= 4
end

function hand_update(self, env, conveyer)
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

  local conv_item = nil
  local pile_item = nil
  local bin_type = env:get_bin_type(self.x, self.y)
  self.can_drop = self.item and bin_type > 0
  self.can_grab = false
  for i = 1, #conveyer.items do
    if self:can_grab_garbage(conveyer.items[i]) then
      conv_item = conveyer.items[i]
      self.can_grab = true
    end
  end
  for i = 1, #env.piles do
    local stack = env.piles[i]
    for j = 1, #stack do
      if self:can_grab_garbage(stack[j]) then
        pile_item = stack[j]
        self.can_grab = true
      end
    end
  end

  if btnp(🅾️) then
    if self.item then
      if self.can_drop then
        self.item = nil
      else
        if self.item.y >= conveyer.y * 8 and self.item.y <= (conveyer.y + conveyer.height - 1) * 8 then
          add(conveyer.items, self.item)
        else
          add(env.falling_items, self.item)
        end
        self.item = nil
      end
    else
      if conv_item then
        self.item = conv_item
        del(conveyer.items, conv_item)
      elseif pile_item then
        self.item = pile_item
        env:remove_pile_item(pile_item)
      end
    end
  end

  if self.item then
    self.item.x = self.x
    self.item.y = self.y
  end
end

function hand_draw(self)
  local sprite = 51

  if self.item then
    sprite = 48
    self.item:draw()
  end

  if self.can_drop then
    sprite = 49
  elseif self.can_grab then
    sprite = 50
  end

  spr(sprite, self.x, self.y)
end
