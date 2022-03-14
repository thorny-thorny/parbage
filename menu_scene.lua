function menu_scene_create()
  play_track(tracks.menu)

  return {
    button_animation = make_button_animation(),
    update = menu_scene_update,
    draw = menu_scene_draw,
  }
end

function menu_scene_draw(self)
  map(32, 0)
  map(80, 0)
  map(64, 0)

  rectfill(28, 32, 100, 92, 0)

  print("\^w\^tparbage", 38, 38, 7)
  print("start", 60, 56, 7)
  print("by softsound", 40, 68, 5)
  print("and thorny", 44, 74, 5)
  print("low effort jam 20", 31, 84, 5)
  draw_animated_button(48, 55, self.button_animation)
end

function menu_scene_update(self)
  self.button_animation:update()
  if btnp(🅾️) then
    show_intro()
  end
end
