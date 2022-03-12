function coin_create(x, y)
  return {
    x = x,
    y = y,
    rotation_cycle = 0,
    rotation_steps = 3,
    rotation_duration = 3,
    draw = coin_draw,
    update = coin_update,
  }
end

function coin_update(self)
  self.rotation_cycle = (self.rotation_cycle + 1) % (self.rotation_steps * self.rotation_duration)
end

function coin_draw(self)
  spr(38 + (self.rotation_cycle / self.rotation_steps), self.x, self.y)
end
