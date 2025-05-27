-- require for the debugger
if arg[2] == "debug" then
    require("lldebugger").start()
end

io.stdout:setvbuf("no") -- Disable output buffering for immediate console output

function love.load()
    Object = require "libs.classic"
    require "classes.player"
    require "classes.enemy"
    require "classes.bullet"
    player = Player()
    enemy = Enemy()
    listOfBullets = {}
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)

    for i, v in ipairs(listOfBullets) do
        v:update(dt)
        v:checkCollision(enemy)
        if v.dead then
            table.remove(listOfBullets, i)
        end
    end
end

function love.draw()
    player:draw()
    enemy:draw()

    for i, v in ipairs(listOfBullets) do
        v:draw()
    end
end

function love.keypressed(key)
    player:keyPressed(key)
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

-- Error handling for the debugger
local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
