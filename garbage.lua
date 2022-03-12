function make_garbage(name, sprite)
  return {
    name = name,
    sprite = sprite,
  }
end

local all_garbage = {
  make_garbage("banana pill", 32),
  make_garbage("apple core", 33),
  make_garbage("can", 34),
  make_garbage("match", 35),
  make_garbage("flower", 36),
  make_garbage("papaer trash", 37),
  make_garbage("milk carton", 44),
  make_garbage("wire", 45),
  make_garbage("twine", 46),
  make_garbage("t-shirt", 52),
  make_garbage("tv", 53),
  make_garbage("phone", 54),
  make_garbage("letter", 55),
  make_garbage("chair", 56),
  make_garbage("weight", 57),
  make_garbage("pencil", 58),
  make_garbage("carrot", 59),
  make_garbage("book", 60),
  make_garbage("eraser", 61),
  make_garbage("fish hook", 62),
  make_garbage("pig", 26),
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
