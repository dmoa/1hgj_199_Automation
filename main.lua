function love.load()
  WW = love.graphics.getWidth()
  WH = love.graphics.getHeight()
  require("Factory")
  require("Droplet")
  factories = {}
  for i = 1, 5 do
    for j = 1, 3 do
      local factory = Factory.new(100 * i, j * 100)
      table.insert(factories, factory)
    end
  end
  factories[1].activated = 1
  factoriesactivated = 1
  coinimg = love.graphics.newImage("coin.png")
  money = 300
  font = love.graphics.newFont(50)
  moneytext = love.graphics.newText(font, money)
  music = love.audio.newSource("music.mp3", "stream")
  love.audio.play(music)
  rain = {}
  for i = 1, 20 do
    table.insert(rain, Droplet.new())
  end
end

opacity = 0
function love.draw()
  for k, v in ipairs(factories) do
    v.draw()
  end
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(coinimg, 300, 500)
  love.graphics.print("500 gold to buy factory")
  love.graphics.print("press space to buy new factory", 0, 15)
  love.graphics.print("controlling automated factories, you find some relaxation in your job", 0, 30)
  love.graphics.draw(moneytext, 350, 495)
  for i, v in pairs(rain) do
    rain[i].draw(dt)
  end
  love.graphics.setColor(1, 1, 1, opacity)
  love.graphics.rectangle("fill", 0, 0, WW, WH)
end

timer = 0.3
crazy = 1
function love.update(dt)
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
  for k, v in ipairs(factories) do
    if v.activated == 1 then
      money = money + 5 * dt
    end
  end
  if love.keyboard.isDown("space") and money > 500 and factoriesactivated < 15 then
    factoriesactivated = factoriesactivated + 1
    factories[factoriesactivated].activated = 1
    money = money - 500
  end
  if factoriesactivated == 15 then
    for i, v in ipairs(rain) do
      rain[i].update(dt)
    end
    for i = 1, crazy do
      table.insert(rain, Droplet.new())
    end
    timer = timer - dt
    if timer < 0 then
      timer = 0.3
      crazy = crazy + 1
    end
    opacity = opacity + 0.05 * dt
  end
  moneytext = love.graphics.newText(font, math.floor(money))
end
