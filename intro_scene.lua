function intro_scene_create()
  return {
    dx = 0,
    dy = 0,
    update = intro_scene_update,
    draw = intro_scene_draw,
  }
end

function intro_scene_draw(self)
  map(32, 0)

  for i = 1, 4 do
    for j = 1, 3 do
      spr(132 + (j - 1) + (i - 1) * 16, self.dx - 24 + (j - 1) * 8, 76 + (i - 1) * 8)
    end
  end

  print("new day - new shift", 0, 113, 7)
  print("🅾️ to continue", 0, 121, 7)
end

function intro_scene_update(self)
  if self.dx < 100 then
    self.dx += 1
  end

  if btnp(🅾️) then
    show_game()
  end
end
