if arg[2] == "debug" then
    require("lldebugger").start()
end

function love.load()
    x = 100
    fruits = {"apple", "banana"}
    table.insert(fruits, "orange")
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
    for i, frt in ipairs(fruits) do
        love.graphics.print(frt, 100, 100 + i * 50)
    end
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
