function intro_scene_create()
  return {
    dx = 0,
    dy = 0,
    dx_limit = 100,
    button_animation = make_button_animation(),
    update = intro_scene_update,
    draw = intro_scene_draw,
  }
end

function intro_scene_draw(self)
  map(32, 0)
  map(80, 0)
  map(64, 0)

  spr(198, self.dx - 24, 76, 3, 4)

  print("new day - new shift", 0, 113, 7)
  if self.dx >= self.dx_limit then
    draw_animated_button(120, 121, self.button_animation)
  end

  print("help wojak with his work", 0, 121, 7)
end

function intro_scene_update(self)
  self.button_animation:update()

  if self.dx < self.dx_limit then
    self.dx += 1
  end

  if btnp(🅾️) then
    show_game()
  end
end
