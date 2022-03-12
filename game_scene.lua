function game_scene_create()
  return {
    shift_time = 0,
    shift_total = 1000,
    env = env_create(),
    boss = boss_create(20, 20),
    conveyer = conveyer_create(5, 4, 3, 50),
    hand = hand_create(0, 0),
    overlay = overlay_create(),
    update = game_scene_update,
    draw = game_scene_draw,
  }
end

function game_scene_draw(self)
  map(0, 0)

  self.boss:draw()
  self.conveyer:draw()
  self.env:draw()
  self.overlay:draw()
  self.hand:draw()
end

function game_scene_update(self)
  self.shift_time += 1
  if self.shift_time >= self.shift_total then
    show_outro(true)
  end

  local fall_items = self.conveyer:update()
  for i = 1, #fall_items do
    local item = fall_items[i]
    item.x += -2 + rnd(5)
    add(self.env.falling_items, item)
  end

  self.boss:update()
  self.env:update()
  self.hand:update(self.env, self.conveyer)
  self.overlay:update(self.shift_time / self.shift_total, 0.5)
end
