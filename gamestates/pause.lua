pause = Gamestate.new()

function pause:enter(from)
  self.from = from -- record previous state
end

function pause:draw()
  local x, y = love.graphics.getWidth()/2 , love.graphics.getHeight()/2 
  -- draw previous screen
  if self.from ~= self then
    self.from:draw()
  end

  -- overlay with pause message
  love.graphics.setColor(0,0,0, 100)
  love.graphics.rectangle('fill', x - 10, y - 10, 20, 20)
  love.graphics.setColor(255,255,255)
  love.graphics.printf('PAUSE', 0, y, x, 'center')
end

function pause:keypressed(key)
  if key == 'p' then
    return Gamestate.pop() -- return to previous state
  end
end

return pause
