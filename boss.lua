function boss_create(x, y)
  return {
    x = x,
    y = y,
    face_animation = animation_create(0, 3, 20),
    walk_animation = animation_create(0, 2, 3),
    draw = boss_draw,
    update = boss_update,
  }
end

function boss_update(self)
  self.face_animation:update()
  self.walk_animation:update()
end

function boss_draw(self)
  spr(64 + self.face_animation:get(), self.x, self.y)
  spr(81, self.x - 8, self.y + 8)
  spr(82, self.x, self.y + 8)
  spr(83, self.x + 8, self.y + 8)
  spr(98 + self.walk_animation:get(), self.x, self.y + 16)
end
