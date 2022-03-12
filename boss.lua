function boss_create(x, y)
  return {
    x = x,
    y = y,
    face_cycle = 0,
    face_steps = 3,
    face_duration = 20,
    walk_cycle = 0,
    walk_steps = 2,
    walk_duration = 3,
    draw = boss_draw,
    update = boss_update,
  }
end

function boss_update(self)
  self.walk_cycle = (self.walk_cycle + 1) % (self.walk_steps * self.walk_duration)
  self.face_cycle = (self.face_cycle + 1) % (self.face_steps * self.face_duration)
end

function boss_draw(self)
  spr(64 + (self.face_cycle / self.face_duration), self.x, self.y)
  spr(81, self.x - 8, self.y + 8)
  spr(82, self.x, self.y + 8)
  spr(83, self.x + 8, self.y + 8)
  spr(98 + (self.walk_cycle / self.walk_duration), self.x, self.y + 16)
end
