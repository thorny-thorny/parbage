local boss_intro_texts = {
  { "you are late again!", "well, what are you", "waiting for?" },
  { "use ⬅️➡️⬆️⬇️ to move", "around and 🅾️ to pick", "and drop items" },
  { "sort garbage from", "conveyer belt into", "the bins" },
  { "don't drop it on", "the floor, keep the", "zone clean!" },
  { "oh and if you find", "any treasure, you", "can keep it" },
  { "or hand it to me", "to keep it safe...", "ehehehe" },
  { "enought talking", "get working!" },
}

local boss_good_ending_texts = {
  { "your shift is over", "go home" },
}

local boss_bad_ending_texts = {
  { "look at this mess!", "you are a terrible", "sorter" },
  { "no payment for you", "today, go home" },
}

local boss_litter_texts = {
  { "pick up that", "*!" },
  { "hey pick it up!" },
  { "stop littering!" },
  { "i saw what you", "did there" },
}

local boss_recycling_garbage_texts = {
  { "*", "is recyclible!" },
  { "this is recyclible", "wrong bin!" },
}

local boss_organic_garbage_texts = {
  { "*", "is organic!" },
  { "this is organic", "wrong bin!" },
}

local boss_burn_garbage_texts = {
  { "put that", "*", "into oven!" },
  { "you must burn it", "wrong bin!" },
}

local garbage_flags = {
  recycling = 1,
  organic = 2,
  burn = 4,
  treasure = 8,
}

function game_scene_create()
  return {
    intro_texts_left = #boss_intro_texts,
    ending_texts = {},
    ending_texts_left = 0,
    shift_time = 0,
    shift_total = 1000,
    boss_level = 0,
    boss_max = 100,
    boss_note = nil,
    boss_note_left = 0,
    ending_is_good = false,
    env = env_create(),
    boss = boss_create(20, 36),
    conveyer = conveyer_create(8, 4, 3, 50),
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
  self.overlay:draw()
  self.env:draw()

  if self.intro_texts_left == 0 and self.ending_texts_left == 0 then
    self.hand:draw()
  end
end

function game_scene_update(self)
  if self.intro_texts_left == 0 and self.ending_texts_left == 0 then
    self.shift_time += 1
    if self.shift_time >= self.shift_total then
      self.ending_texts = boss_good_ending_texts
      self.ending_texts_left = #boss_good_ending_texts
      self.ending_is_good = true
    elseif self.boss_level >= self.boss_max then
      self.ending_texts = boss_bad_ending_texts
      self.ending_texts_left = #boss_bad_ending_texts
      self.ending_is_good = false
    end

    local fall_items = self.conveyer:update()
    for i = 1, #fall_items do
      local item = fall_items[i]
      item.x += -2 + rnd(5)
      add(self.env.falling_items, item)
    end
  end

  self.boss:update()
  local fallen_items = self.env:update()
  local disposed_item = self.hand:update(self.env, self.conveyer)

  if #fallen_items > 0 then
    self.boss_level += #fallen_items * 10
    self.boss_note = strs_replace(boss_litter_texts[flr(1 + rnd(#boss_litter_texts))], "*", fallen_items[1].garbage.name)
    self.boss_note_left = 50
  end

  if disposed_item then
    local item_type = fget(disposed_item.item.garbage.sprite)
    if item_type ~= disposed_item.bin_type and disposed_item.bin_type ~= garbage_flags.treasure then
      local texts
      if item_type == garbage_flags.recycling then
        texts = boss_recycling_garbage_texts
      elseif item_type == garbage_flags.organic then
        texts = boss_organic_garbage_texts
      else
        texts = boss_burn_garbage_texts
      end

      self.boss_level += 20
      self.boss_note = strs_replace(texts[flr(1 + rnd(#texts))], "*", disposed_item.item.garbage.name)
      self.boss_note_left = 50
    end
  end

  if self.boss_note_left > 0 then
    self.boss_note_left -= 1
  else
    self.boss_note = nil
  end

  local text = self.boss_note
  local show_button = false
  if self.intro_texts_left > 0 or self.ending_texts_left > 0 then
    show_button = true
    if btnp(🅾️) then
      if self.intro_texts_left > 0 then
        self.intro_texts_left -= 1
      else
        self.ending_texts_left -= 1
        if self.ending_texts_left == 0 then
          show_outro(self.ending_is_good)
        end
      end
    end

    if self.intro_texts_left > 0 then
      text = boss_intro_texts[#boss_intro_texts + 1 - self.intro_texts_left]
    else
      text = self.ending_texts[#self.ending_texts + 1 - self.ending_texts_left]
    end
  end
  self.overlay:update(self.shift_time / self.shift_total, self.boss_level / self.boss_max, text, show_button)
end
