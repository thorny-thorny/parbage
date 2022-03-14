function make_garbage(name, sprite, width, height, animation_config)
  return {
    name = name,
    sprite = sprite,
    width = width,
    height = height,
    animation_config = animation_config,
  }
end

function make_small_garbage(name, sprite, animation_config)
  return make_garbage(name, sprite, 1, 1, animation_config)
end

function make_garbage_animation_config(frames_per_sprite, frame_duration)
  local total_frames = 0
  for i = 1, #frames_per_sprite do
    total_frames += frames_per_sprite[i]
  end

  return {
    total_frames = total_frames,
    total_sprites = #frames_per_sprite,
    frame_duration = frame_duration,
    frames_per_sprite = frames_per_sprite,
  }
end

local all_garbage = {
  make_small_garbage("banana pill", 32, nil),
  make_small_garbage("apple core", 33, nil),
  make_small_garbage("soda can", 34, nil),
  make_small_garbage("match", 35, nil),
  make_small_garbage("flower", 36, nil),
  make_small_garbage("papaer trash", 37, nil),
  make_small_garbage("milk carton", 44, nil),
  make_small_garbage("wire", 45, nil),
  make_small_garbage("twine", 9, nil),
  make_small_garbage("t-shirt", 52, nil),
  make_small_garbage("letter", 55, nil),
  make_garbage("weight", 196, 2, 1, nil),
  make_small_garbage("pencil", 58, nil),
  make_small_garbage("carrot", 59, nil),
  make_small_garbage("book", 60, nil),
  make_small_garbage("eraser", 61, nil),
  make_small_garbage("fish hook", 10, nil),
  make_small_garbage("pig", 26, nil),
  make_small_garbage("sponge", 11, nil),
  make_small_garbage("gear", 12, nil),
  make_small_garbage("music note", 54, nil),
  make_small_garbage("foxglove", 27, nil),
  make_small_garbage("sock", 25, nil),
  make_small_garbage("chips", 41, nil),
  make_small_garbage("chips", 41, nil),
  make_small_garbage("hot sauce", 28, nil),
  make_small_garbage("perfume", 29, nil),

  make_garbage("trumpet", 212, 2, 1, nil),
  make_garbage("car", 228, 2, 2, nil),
  make_garbage("chicken toy", 227, 1, 2, nil),
  make_garbage("vase", 226, 1, 2, nil),
  make_garbage("chair", 224, 2, 2, nil),
  make_garbage("tv", 192, 2, 2, make_garbage_animation_config({ 100, 1 }, 1)),
  make_small_garbage("phone", 18, make_garbage_animation_config({ 30, 1, 1, 10 }, 2)),
}

local all_treasures = {
  make_small_garbage("coin", 38, make_garbage_animation_config({ 10, 1, 1 }, 2)),
  make_small_garbage("crown", 22, make_garbage_animation_config({ 10, 1, 1 }, 2)),
}

local garbage_flags = {
  recycling = 1,
  organic = 2,
  burn = 4,
  treasure = 8,
  boss = 16,
}

function garbage_item_create(garbage, x, y)
  local cycle = 0
  if garbage.animation_config then
    cycle = flr(rnd(garbage.animation_config.total_frames * garbage.animation_config.frame_duration))
  end

  return {
    garbage = garbage,
    x = x,
    y = y,
    cycle = cycle,
    update = garbage_item_update,
    draw = garbage_item_draw,
  }
end

function garbage_item_update(self)
  local animation_config = self.garbage.animation_config
  if animation_config then
    self.cycle = (self.cycle + 1) % (animation_config.total_frames * animation_config.frame_duration)
  end
end

function garbage_item_draw(self)
  local sprite = self.garbage.sprite
  local animation_config = self.garbage.animation_config
  if animation_config then
    local frame = flr(self.cycle / animation_config.frame_duration)
    local frame_acc = 0
    for i = 1, #animation_config.frames_per_sprite do
      if frame < frame_acc + animation_config.frames_per_sprite[i] then
        sprite += (i - 1) * self.garbage.width
        break
      else
        frame_acc += animation_config.frames_per_sprite[i]
      end
    end
  end

  spr(sprite, self.x - self.garbage.width * 4, self.y - self.garbage.height * 4, self.garbage.width, self.garbage.height)
end
