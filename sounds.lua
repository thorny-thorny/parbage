local tracks = {
  silence = nil,
  menu = nil,
  intro = nil,
  factory = 0,
  outro_good = nil,
  outro_bad = 1,
}

local sounds = {
  wrong_bin = 4,
  right_bin = 5,
  angered_boss = 4,
  bribed_boss = 5,
  item_fall = 6,
}

function play_track(track)
  if track then
    music(track)
  else
    music(-1)
  end
end

function play_sound(sound)
  if sound then
    sfx(sound)
  end
end
