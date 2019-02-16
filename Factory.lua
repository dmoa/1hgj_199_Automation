Factory = {}
factoryimg = love.graphics.newImage("factory.png")
Factory.new = function(x, y)
  local self = {}

  self.x = x
  self.y = y

  self.activated = 0.5

  self.draw = function()
    love.graphics.setColor(self.activated, self.activated, self.activated)
    love.graphics.draw(factoryimg, self.x, self.y)
  end

  self.update = function(dt)
  end

  return self
end
