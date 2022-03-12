function conveyer_create(y, height, speed, delay)
  local cycle_duration = flr(10 / speed)
  return {
    y = y,
    height = height,
    items = {},
    next_spawn = 0,
    delay = delay,
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
    local item = make_garbage_item(all_garbage[1 + flr(rnd(#all_garbage))], 128, (self.y + flr(rnd(self.height))) * 8)
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
      if item.x < 0 then
        add(fall_items, item)
        add(to_delete, item)
      end
    end

    for i = 1, #to_delete do
      del(self.items, to_delete[i])
    end
  end

  self.belt:update()

  return fall_items
end
