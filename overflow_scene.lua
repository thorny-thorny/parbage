function overflow_scene_create()
  local items = {}

  for i = 1, 400 do
    add(items, garbage_item_create(all_garbage[flr(1 + rnd(#all_garbage))], 250, 80 + flr(rnd(20))))
  end

  play_sound(sounds.overflow)

  return {
    speed = 30,
    items = items,
    button_animation = make_button_animation(),
    update = overflow_scene_update,
    draw = overflow_scene_draw,
  }
end

function overflow_scene_draw(self)
  map(48, 0)
  map(80, 0)

  for i = 1, #self.items do
    self.items[i]:draw()
  end

  map(64, 0)

  rectfill(1, 112, 128, 128, 0)

  print("( t □ t )", 0, 113, 7)
  if self.speed <= 0 then
    draw_animated_button(120, 121, self.button_animation)
  end
end

function overflow_scene_update(self)
  self.button_animation:update()

  if self.speed > 0 then
    for i = 1, #self.items do
      self.items[i].x -= flr(rnd(self.speed))
      if flr(rnd(5)) == 0 then
        self.items[i].y += 1
      end
    end
    
    self.speed -= 1
  end

  for i = 1, #self.items do
    self.items[i]:update()
  end

  if btnp(🅾️) then
    show_menu()
  end
end
