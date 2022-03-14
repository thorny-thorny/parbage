function boss_create(x, y)
  return {
    x0 = x,
    x = x,
    y = y,
    level = 0,
    walk_animation = animation_create(0, 24, 3),
    flipped = false,
    draw = boss_draw,
    update = boss_update,
  }
end

function boss_update(self)
  self.walk_animation:update()

  local half_steps = flr(self.walk_animation.steps / 2)
  local direction = self.walk_animation:get() - half_steps
  local delta_x = 0
  if direction < 0 then
    delta_x = -(direction + half_steps)
    self.flipped = false
  else
    delta_x = direction - half_steps
    self.flipped = true
  end

  self.x = self.x0 + delta_x
end

function boss_draw(self)
  local x = self.x - 4 * 3

  spr(66 - self.level, x + 8, self.y, 1, 1, self.flipped)
  spr(81, x, self.y + 8, 3, 1, self.flipped)
  spr(98, x + 8, self.y + 16, 1, 1, self.flipped)
end
