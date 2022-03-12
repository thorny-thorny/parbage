function overlay_create()
  return {
    shift_progress = 0,
    boss_level = 0,
    draw = overlay_draw,
    update = overlay_update,
  }
end

function overlay_update(self, shift_progress, boss_level)
  self.shift_progress = shift_progress
  self.boss_level = boss_level
end

function draw_scale(position, value, color)
  rectfill(44, position * 8 + 1, 124, position * 8 + 6, 0)
  rectfill(45, position * 8 + 2, 45 + flr((123 - 45) * min(1, value)), position * 8 + 5, color)
end

function overlay_draw(self)
  map(16, 0)
  draw_scale(0, self.shift_progress, 3)
  draw_scale(1, self.boss_level, 8)
  print("12", 44, 18, 0)
end
