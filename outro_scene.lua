function outro_scene_create(good)
  return {
    good = good,
    dx = 100,
    dy = 0,
    button_animation = make_button_animation(),
    rain_animation = animation_create(0, 3, 2),
    update = outro_scene_update,
    draw = outro_scene_draw,
  }
end

function outro_scene_draw(self)
  local map_x = 48
  local start_sprite = 132
  if not self.good then
    map_x = 64
    start_sprite = 135
  end

  map(map_x, 0)

  spr(start_sprite, self.dx - 24, 76, 3, 4, true)

  if not self.good then
    for i = 1, 16 do
      for j = 1, 14 do
        spr(138 + 16 * self.rain_animation:get(), (i - 1) * 8, (j - 1) * 8)
      end
    end
  end

  local text = "feels good man"
  if not self.good then
    text = "feels bad man"
  end

  print(text, 0, 113, 7)
  if self.dx <= 0 then
    draw_animated_button(120, 121, self.button_animation)
  end
end

function outro_scene_update(self)
  self.rain_animation:update()
  self.button_animation:update()

  if self.dx > 0 then
    self.dx -= 1
  end

  if btnp(🅾️) then
    show_menu()
  end
end
