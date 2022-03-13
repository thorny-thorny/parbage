function overflow_scene_create()
  return {
    update = overflow_scene_update,
    draw = overflow_scene_draw,
  }
end

function overflow_scene_draw(self)
  map(32, 0)
  print("", 0, 113, 7)
end

function overflow_scene_update(self)
  if btnp(🅾️) then
    show_menu()
  end
end
