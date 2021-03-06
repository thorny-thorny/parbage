function env_create()
  local pile_step = 4
  local piles = {}
  for i = 1, 128 / pile_step do
    add(piles, {})
  end

  return {
    pile_step = pile_step,
    piles = piles,
    falling_items = {},
    bag_items = {},
    get_bin_type = env_get_bin_type,
    remove_pile_item = env_remove_pile_item,
    get_piles_amount = env_get_piles_amount,
    update = env_update,
    draw = env_draw,
  }
end

function env_get_piles_amount(self)
  local total = 0
  for i = 1, #self.piles do
    total += #(self.piles[i])
  end

  return total
end

function env_get_bin_type(self, x, y)
  local sprite = mget(flr(x / 8), flr(y / 8))
  return fget(sprite)
end

function env_remove_pile_item(self, item)
  for i = 1, #self.piles do
    local stack = self.piles[i]
    local adjust_index = 0
    for j = 1, #stack do
      if stack[j] == item then
        adjust_index = j
      end
    end
    if adjust_index > 0 then
      for j = adjust_index, #stack do
        stack[j].y += self.pile_step
      end
    end
    del(stack, item)
  end
end

function env_draw(self)
  for i = 1, #self.piles do
    local stack = self.piles[i]
    for j = 1, #stack do
      stack[j]:draw()
    end
  end

  for i = 1, #self.falling_items do
    self.falling_items[i]:draw()
  end
end

function env_update(self)
  local stuck_items = {}
  for i = 1, #self.falling_items do
    local item = self.falling_items[i]
    item.y = item.y + 2
    item:update()
    local item_stack_index = flr((128 - item.y) / self.pile_step)
    local stack = self.piles[max(1, flr(item.x / self.pile_step))]
    if item_stack_index <= #stack + 1 then
      add(stuck_items, item)

      item.y = 128 - (#stack + 1) * self.pile_step - 2 + flr(rnd(5))
      add(stack, item)
    end
  end

  for i = 1, #stuck_items do
    del(self.falling_items, stuck_items[i])
  end

  for i = 1, #self.piles do
    local natural_i = #self.piles + 1 - i
    local stack = self.piles[natural_i]
    local next_stack = self.piles[natural_i + 1]
    if next_stack then
      if #stack > #next_stack + 1 then
        local item = stack[#stack]
        item.x = (natural_i - 1) * self.pile_step - 2 + flr(rnd(5))
        item.y = 128 - (#next_stack + 1) * self.pile_step - 2 + flr(rnd(5))
        add(next_stack, item)
        deli(stack, #stack)
      end
    end
  end

  for i = 1, #self.piles do
    local stack = self.piles[i]
    for j = 1, #stack do
      stack[j]:update()
    end
  end

  local treasures = 0
  for i = 1, #self.bag_items do
    if fget(self.bag_items[i].garbage.sprite) == garbage_flags.treasure then
      treasures += 1
    end
  end

  return {
    new_stuck_items = stuck_items,
    treasures = treasures,
  }
end
