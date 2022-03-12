function animation_create(start, steps, duration)
  return {
    cycle = start,
    steps = steps,
    duration = duration,
    update = animation_update,
    get = animation_get,
  }
end

function animation_update(self)
  self.cycle = (self.cycle + 1) % (self.steps * self.duration)
end

function animation_get(self)
  return flr(self.cycle / self.duration)
end
