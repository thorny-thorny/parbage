function outro_scene_create(good, stats)
  if good then
    play_track(tracks.outro_good)
  else
    play_track(tracks.outro_bad)
  end

  return {
    good = good,
    stats = stats,
    dx = 100,
    dy = 0,
    button_animation = make_button_animation(),
    rain_animation = animation_create(0, 3, 2),
    update = outro_scene_update,
    draw = outro_scene_draw,
  }
end

function outro_scene_draw(self)
  local start_sprite = 132
  if self.good then
    map(48, 0)
    if self.stats.treasures == 0 then
      start_sprite = 198
    end
  else
    start_sprite = 135
  end

  map(80, 0)
  map(64, 0)

  spr(start_sprite, self.dx - 24, 76, 3, 4, true)

  if not self.good then
    for i = 1, 16 do
      for j = 1, 14 do
        spr(138 + 16 * self.rain_animation:get(), (i - 1) * 8, (j - 1) * 8)
      end
    end
  end

  local text1 = ""
  local text2 = ""
  if self.good then
    if self.stats.treasures == 0 then
      text1 = "you got no treasures but job is"
      text2 = "done. "..tostr(self.stats.sorted).."/"..tostr(self.stats.total).." items sorted"
    else
      text1 = "feels good man! you got "..tostr(self.stats.treasures).." trea-"
      text2 = "sures, "..tostr(self.stats.sorted).."/"..tostr(self.stats.total).." items sorted"
    end
  elseif not self.good then
    text1 = "feels bad man"
  end

  print(text1, 0, 113, 7)
  print(text2, 0, 121, 7)
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
