function conveyer_create(y, height, speed, delay, on_fall)
  return {
    y = y,
    height = height,
    items = {},
    next_spawn = 0,
    delay = delay,
    speed = speed,
    belt = belt_create(y, height, 10 / speed),
    update = conveyer_update,
    draw = conveyer_draw,
    on_fall = on_fall,
  }
end

function conveyer_draw(self)
  self.belt:draw()
  for i = 1, #self.items do
    self.items[i]:draw()
  end
end

function conveyer_update(self)
  if self.next_spawn <= 0 then
    local item = make_garbage_item(all_garbage[1 + flr(rnd(#all_garbage))], 120 + self.speed, (self.y + flr(rnd(self.height))) * 8)
    add(self.items, item)
    self.next_spawn = 1 + flr(rnd(self.delay))
  else
    self.next_spawn -= 1
  end

  local to_delete = {}
  for i = 1, #self.items do
    local item = self.items[i]
    item.x -= self.speed
    if item.x < 0 then
      self.on_fall(item)
      add(to_delete, item)
    end
  end

  for i = 1, #to_delete do
    del(self.items, to_delete[i])
  end

  self.belt:update()
end
