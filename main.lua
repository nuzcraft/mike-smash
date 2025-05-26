if arg[2] == "debug" then
    require("lldebugger").start()
end

local r1, r2

function love.load()
    tick = require "tick"
    Object = require "classic"
    local Rectangle = require "rectangle"

    r1 = Rectangle(10, 100, 100, 100)
    r2 = Rectangle(250, 120, 150, 120)

    myImage = love.graphics.newImage("sheep.png")
    love.graphics.setBackgroundColor(1, 1, 1)
end

function love.update(dt)
    tick.update(dt)
    r1:update(dt)
    -- r2:update(dt)
end

function love.draw()
    local mode
    if checkCollision(r1, r2) then
        mode = "fill"
    else
        mode = "line"
    end
    love.graphics.setColor(1, 0, 0)
    r1:draw(mode)
    love.graphics.setColor(0, 0, 1)
    r2:draw(mode)
    love.graphics.setColor(1, 0.78, 0.15, 0.5)
    love.graphics.draw(myImage, 100, 100)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(myImage, 200, 100)
end

function checkCollision(a, b)
    local a_left = a.x
    local a_right = a.x + a.width
    local a_top = a.y
    local a_bottom = a.y + a.height
    local b_left = b.x
    local b_right = b.x + b.width
    local b_top = b.y
    local b_bottom = b.y + b.height

    return a_right > b_left and
        a_left < b_right and
        a_bottom > b_top and
        a_top < b_bottom
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
