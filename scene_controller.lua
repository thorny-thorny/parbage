local scene = nil

function show_menu()
  scene = menu_scene_create()
end

function show_intro()
  scene = intro_scene_create()
end

function show_outro(good)
  scene = outro_scene_create(good)
end

function show_overflow()
  scene = overflow_scene_create()
end

function show_game()
  scene = game_scene_create()
end

function _update()
  if scene then
	  scene:update()
  end
end

function _draw()
  cls()
  if scene then
	  scene:draw()
  end
end
