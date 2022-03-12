function outro_scene_create(good)
  return {
    good = good,
    dx = 100,
    dy = 0,
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

  for i = 1, 4 do
    for j = 1, 3 do
      spr(start_sprite + (j - 1) + (i - 1) * 16, self.dx - 24 + (j - 1) * 8, 76 + (i - 1) * 8)
    end
  end

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
  print("🅾️ to continue", 0, 121, 7)
end

function outro_scene_update(self)
  self.rain_animation:update()

  if self.dx > 0 then
    self.dx -= 1
  end

  if btnp(🅾️) then
    show_menu()
  end
end
