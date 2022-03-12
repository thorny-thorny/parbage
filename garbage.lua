function make_garbage(name, sprite)
  return {
    name = name,
    sprite = sprite,
  }
end

local all_garbage = {
  make_garbage("banana", 32),
  make_garbage("apple", 33),
  make_garbage("soda", 34),
  make_garbage("match", 35),
  make_garbage("flower", 36),
  make_garbage("paper", 37),
}

function make_garbage_item(garbage, x, y)
  return {
    garbage = garbage,
    x = x,
    y = y,
    draw = garbage_item_draw,
  }
end

function garbage_item_draw(self)
  spr(self.garbage.sprite, self.x, self.y)
end
