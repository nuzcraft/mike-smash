if arg[2] == "debug" then
    require("lldebugger").start()
end

function love.load()
    tick = require "tick"
    Object = require "classic"
    require "rectangle"

    r1 = Rectangle()
    r2 = Rectangle()
end

function love.update(dt)
    tick.update(dt)
    r1.update(r1, dt)
end

function love.draw()
    r1.draw(r1)
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
