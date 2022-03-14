function menu_scene_create()
  play_track(tracks.menu)

  return {
    selection = 0,
    total = 1,
    update = menu_scene_update,
    draw = menu_scene_draw,
  }
end

function menu_scene_draw(self)
  print("parbage", 40, 40, 7)
  print("start", 50, 60, 7)

  print(">", 40, 60 + self.selection * 10, 7)
end

function menu_scene_update(self)
  local delta = 0
  if btnp(⬆️) then
    delta = -1
  elseif btnp(⬇️) then
    delta = 1
  end

  self.selection = (self.selection + self.total + delta) % self.total

  if btnp(🅾️) then
    if self.selection == 0 then
      show_intro()
    elseif self.selection == 1 then
      show_outro(true)
    elseif self.selection == 2 then
      show_outro(false)
    end
  end
end
