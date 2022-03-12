function belt_create(y, height, duration)
  return {
    y = y,
    height = height,
    belt_animation = animation_create(0, 8, duration),
    gears_animation = animation_create(0, 2, duration * 2),
    draw = belt_draw,
    update = belt_update,
  }
end

function belt_draw(self)
  for x = 1, 120 do
    for y = 1, self.height do
      spr(1 + self.belt_animation:get(), (x - 1) * 8, (self.y + y - 1) * 8)
    end
  end
  
  for x = 1, 120 do
    spr(16 + self.gears_animation:get(), (x - 1) * 8, (self.y + self.height) * 8)
  end
end

function belt_update(self)
  self.belt_animation:update()
  self.gears_animation:update()
end
