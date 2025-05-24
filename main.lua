if arg[2] == "debug" then
    require("lldebugger").start()
end

function love.draw()
    love.graphics.setBackgroundColor(0.5, 0.5, 0.5)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Hello World!", 400, 300)
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end