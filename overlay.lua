function overlay_create()
  return {
    shift_progress = 0,
    boss_level = 0,
    boss_text = nil,
    show_button = false,
    button_animation = make_button_animation(),
    draw = overlay_draw,
    update = overlay_update,
  }
end

function overlay_update(self, shift_progress, boss_level, boss_text, show_button)
  self.shift_progress = shift_progress
  self.boss_level = boss_level
  self.boss_text = boss_text
  self.show_button = show_button
  self.button_animation:update()
end

function draw_scale(position, value, color)
  rectfill(44, position * 8 + 1, 124, position * 8 + 6, 0)
  rectfill(45, position * 8 + 2, 45 + flr((123 - 45) * min(1, value)), position * 8 + 5, color)
end

function overlay_draw(self)
  map(16, 0, 0, 0, 16, 4)
  draw_scale(0, self.shift_progress, 3)
  draw_scale(1, self.boss_level, 8)
  print("12", 44, 18, 0)

  if self.boss_text then
    map(16, 4, 0, 32, 16, 4)
    for i = 1, #self.boss_text do
      print(self.boss_text[i], 38, 37 + 8 * (i - 1), 7)
    end

    if self.show_button then
      draw_animated_button(116, 53, self.button_animation)
    end
  end
end
