Droplet = {}

Droplet.new = function()
  local self = {}

  self.x = love.math.random(0, WW)
  self.y = -50
  self.yv = love.math.random(300, 500)

  self.draw = function()
    love.graphics.rectangle("fill", self.x, self.y, 5, 10)
  end

  self.update = function(dt)
    self.y = self.y + self.yv * dt
  end

  return self
end
