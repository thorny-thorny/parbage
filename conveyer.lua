function conveyer_create(y, height, speed, delay, treasure_inverse_chance)
  local cycle_duration = flr(10 / speed)
  return {
    y = y,
    height = height,
    items = {},
    next_spawn = 0,
    delay = delay,
    treasure_inverse_chance = treasure_inverse_chance,
    move_cycle = 0,
    move_duration = cycle_duration,
    belt = belt_create(y, height, cycle_duration),
    update = conveyer_update,
    draw = conveyer_draw,
  }
end

function conveyer_draw(self)
  self.belt:draw()
  for i = 1, #self.items do
    self.items[i]:draw()
  end
end

function conveyer_update(self)
  local fall_items = {}

  if self.next_spawn <= 0 then
    local set = all_garbage
    if flr(rnd(self.treasure_inverse_chance)) == 0 then
      set = all_treasures
    end

    local garbage = set[flr(1 + rnd(#set))]
    local item = garbage_item_create(garbage, 128 + garbage.width * 4, self.y * 8 + flr(rnd((self.height + 1 - garbage.height) * 8)))
    add(self.items, item)
    self.next_spawn = 1 + flr(rnd(self.delay))
  else
    self.next_spawn -= 1
  end

  self.move_cycle += 1
  if self.move_cycle >= self.move_duration then
    self.move_cycle = 0
    
    local to_delete = {}
    for i = 1, #self.items do
      local item = self.items[i]
      item.x -= 1
      if item.x <= 0 then
        add(fall_items, item)
        add(to_delete, item)
      end
    end

    for i = 1, #to_delete do
      del(self.items, to_delete[i])
    end
  end

  for i = 1, #self.items do
    self.items[i]:update()
  end

  self.belt:update()

  return fall_items
end
