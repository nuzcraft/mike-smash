if arg[2] == "debug" then
    require("lldebugger").start()
end

function love.load()
    x = 100
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        x = x + 100 * dt
    elseif love.keyboard.isDown("left") then
        x = x - 100 * dt
    end
end

function love.draw()
    love.graphics.rectangle("line", x, 50, 200, 150)
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
