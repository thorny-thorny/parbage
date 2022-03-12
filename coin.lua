function coin_create(x, y)
  return {
    x = x,
    y = y,
    rotation_animation = animation_create(0, 3, 3),
    draw = coin_draw,
    update = coin_update,
  }
end

function coin_update(self)
  self.rotation_animation:update()
end

function coin_draw(self)
  spr(38 + self.rotation_animation:get(), self.x, self.y)
end
