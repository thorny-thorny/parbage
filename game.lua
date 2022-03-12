local stats = {
  good = 0,
  bad = 0,
}

local boss = boss_create(20, 20)

local env = env_create()

function drop_from_conveyer(item)
  item.x += -2 + rnd(5)
  add(env.falling_items, item)
end

local conveyer = conveyer_create(5, 4, 2, 10, drop_from_conveyer)

local hand = hand_create(0, 0)


function _update()
  boss:update()
  conveyer:update()
  env:update()
  hand:update(env, conveyer)
end

function _draw()
  cls(0)
  map(0, 0)

  boss:draw()
  conveyer:draw()
  env:draw()
  hand:draw()

  map(16, 0, 0, 0)

  print('good '..stats.good..' / bad '..stats.bad, 0, 0, 7)
end
