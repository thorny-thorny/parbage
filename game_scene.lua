local boss_intro_texts = {
  { "you are late again!", "well, what are you", "waiting for?" },
  { "use ⬅️➡️⬆️⬇️ to move", "around and 🅾️ to pick", "and drop items" },
  { "sort garbage from", "conveyer belt into", "the bins" },
  { "don't let it pile", "up or factory will", "blow up!" },
  { "oh and if you find", "any treasure, you", "can keep it" },
  { "just put it in your", "bag and take away", "after the shift" },
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

local boss_overflow_ending_texts = {
  { "what have you done!" },
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

local boss_treasure_garbage_texts = {
  { "did you just", "throw away", "*?" },
  { "this", "*", "looks pretty valuable" },
  { "are you nuts?" },
}

local boss_anti_treasure_garbage_texts = {
  { "are you taking", "*", "with you?" },
  { "this is not a", "treasure!" },
}

local boss_got_garbage_texts = {
  { "get this shit", "away from my face!" },
  { "do you want to", "get fired?" },
  { "grrrrrr" },
}

local boss_got_treasure_texts = {
  { "nice!" },
  { "wink wink" },
  { "i like this", "*" },
  { "do you have", "some more?" },
}

function game_scene_create()
  play_track(tracks.silence)

  return {
    shift_time = 0,
    shift_total = 4600,
    piles_limit = 190,
    boss_level = 0,
    boss_max = 1000,
    boss_weights = {
      item_dropped = 8,
      bribe = -50,
      wrong_bin = 20,
    },
    conveyer = conveyer_create(8, 4, 2, 200, 10),
    conveyer_upgrades = {
      { time = 500, speed = 3, delay = 150 },
      { time = 1000, speed = 4, delay = 100 },
      { time = 2000, speed = 5, delay = 50 },
      { time = 3000, speed = 10, delay = 20 },
      { time = 4000, speed = 10, delay = 10 },
    },
    sorted = 0,
    intro_texts_left = #boss_intro_texts,
    ending_texts = {},
    ending_texts_left = 0,
    boss_note = nil,
    boss_note_left = 0,
    ending_is_good = false,
    ending_is_overflow = false,
    button_disabled = 0,
    env = env_create(),
    boss = boss_create(22, 52),
    hand = hand_create(),
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
  if self.button_disabled > 0 then
    self.button_disabled -= 1
  end

  if self.intro_texts_left == 0 and self.ending_texts_left == 0 then
    local prev_time = self.shift_time
    self.shift_time += 1

    for i = 1, #self.conveyer_upgrades do
      local upgrade = self.conveyer_upgrades[i]
      if prev_time < upgrade.time and self.shift_time >= upgrade.time then
        self.conveyer:set_speed(upgrade.speed)
        self.conveyer.delay = upgrade.delay
      end
    end

    if self.env:get_piles_amount() >= self.piles_limit then
      self.ending_texts = boss_overflow_ending_texts
      self.ending_texts_left = #boss_good_ending_texts
      self.ending_is_overflow = true
      self.button_disabled = 50
      play_track(tracks.silence)
    elseif self.shift_time >= self.shift_total then
      self.ending_texts = boss_good_ending_texts
      self.ending_texts_left = #boss_good_ending_texts
      self.ending_is_good = true
      self.button_disabled = 50
      play_track(tracks.silence)
    elseif self.boss_level >= self.boss_max then
      self.ending_texts = boss_bad_ending_texts
      self.ending_texts_left = #boss_bad_ending_texts
      self.ending_is_good = false
      self.button_disabled = 50
      play_track(tracks.silence)
    end

    local fall_items = self.conveyer:update()
    for i = 1, #fall_items do
      local item = fall_items[i]
      item.x += -2 + flr(rnd(5))
      add(self.env.falling_items, item)
    end
  end

  self.boss:update()
  local env_info = self.env:update()
  local disposed_item = self.hand:update(self.env, self.conveyer, self.boss)
  local fallen_items = env_info.new_stuck_items
  local treasures = env_info.treasures

  if #fallen_items > 0 then
    self.boss_level += #fallen_items * self.boss_weights.item_dropped
    self.boss_note = strs_replace(boss_litter_texts[flr(1 + rnd(#boss_litter_texts))], "*", fallen_items[1].garbage.name)
    self.boss_note_left = 50
    play_sound(sounds.item_fall)
  end

  if disposed_item then
    local item_type = fget(disposed_item.item.garbage.sprite)
    if item_type ~= disposed_item.bin_type then
      local texts
      if disposed_item.bin_type == garbage_flags.treasure then
        texts = boss_anti_treasure_garbage_texts
      elseif disposed_item.bin_type == garbage_flags.boss then
        if item_type == garbage_flags.treasure then
          texts = boss_got_treasure_texts
        else
          texts = boss_got_garbage_texts
        end
      elseif item_type == garbage_flags.recycling then
        texts = boss_recycling_garbage_texts
      elseif item_type == garbage_flags.organic then
        texts = boss_organic_garbage_texts
      elseif item_type == garbage_flags.burn then
        texts = boss_burn_garbage_texts
      else
        texts = boss_treasure_garbage_texts
      end

      if item_type == garbage_flags.treasure and disposed_item.bin_type == garbage_flags.boss then
        self.boss_level = max(0, flr(self.boss_level + self.boss_weights.bribe))
        play_sound(sounds.bribed_boss)
      else
        self.boss_level += self.boss_weights.wrong_bin
        if disposed_item.bin_type == garbage_flags.boss then
          play_sound(sounds.angered_boss)
        else
          play_sound(sounds.wrong_bin)
        end
      end
      self.boss_note = strs_replace(texts[flr(1 + rnd(#texts))], "*", disposed_item.item.garbage.name)
      self.boss_note_left = 50
    else
      self.sorted += 1
      play_sound(sounds.right_bin)
    end

    if disposed_item.bin_type == garbage_flags.treasure then
      add(self.env.bag_items, disposed_item.item)
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
    show_button = self.button_disabled == 0
    if btnp(🅾️) and show_button then
      if self.intro_texts_left > 0 then
        self.intro_texts_left -= 1
        if self.intro_texts_left == 0 then
          play_track(tracks.factory)
        end
      else
        self.ending_texts_left -= 1
        if self.ending_texts_left == 0 then
          if self.ending_is_overflow then
            show_overflow()
          else
            if self.ending_is_good then
              show_outro(true, { treasures = treasures, sorted = self.sorted, total = self.conveyer.total })
            else
              show_outro(false, nil)
            end
          end
        end
      end
    end

    if self.intro_texts_left > 0 then
      text = boss_intro_texts[#boss_intro_texts + 1 - self.intro_texts_left]
    else
      text = self.ending_texts[#self.ending_texts + 1 - self.ending_texts_left]
    end
  end

  self.boss.level = min(2, flr(self.boss_level * 3 / self.boss_max))
  if self.ending_is_overflow then
    self.boss.level = 2
  end
  self.overlay:update(self.shift_time / self.shift_total, self.boss_level / self.boss_max, treasures, text, show_button)
end
