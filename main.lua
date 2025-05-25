if arg[2] == "debug" then
    require("lldebugger").start()
end

local r1, r2

function love.load()
    tick = require "tick"
    Object = require "classic"
    local Rectangle = require "rectangle"
    local Circle = require "circle"

    r1 = Rectangle(100, 100, 200, 50)
    r2 = Circle(350, 80, 40)

    myImage = love.graphics.newImage("sheep.png")
    love.graphics.setBackgroundColor(1, 1, 1)
end

function love.update(dt)
    tick.update(dt)
    r1:update(dt)
    r2:update(dt)
end

function love.draw()
    love.graphics.setColor(0, 0, 0)
    r1:draw()
    r2:draw()
    love.graphics.setColor(1, 0.78, 0.15, 0.5)
    love.graphics.draw(myImage, 100, 100)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(myImage, 200, 100)
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
