function make_button_animation()
  return animation_create(0, 2, 4)
end

function draw_animated_button(x, y, animation)
  rectfill(x + 2, y + 1, x + 4, y + 4, 5)
  print("🅾️", x, y + 1, 5)
  print("🅾️", x, y + 2, 5)
  print("🅾️", x, y + animation:get(), 7)
end

function str_replace(str, pattern, replace)
  local parts = split(str, pattern, false)
  local result = ""
  for i = 1, #parts do
    result = result..parts[i]
    if i < #parts then
      result = result..replace
    end
  end

  return result
end

function strs_replace(strs, pattern, replace)
  local results = {}
  for i = 1, #strs do
    add(results, str_replace(strs[i], pattern, replace))
  end

  return results
end
