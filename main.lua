function love.load()
    love.graphics.setBackgroundColor(70, 70, 70)
    font = love.graphics.newFont("/resources/Meyrin.ttf",50)

    mouse = {}
    mouse.x = 0
    mouse.y = 0
    mouse.p = false
    mouse.previous = false

    door_left = {}
    door_left.x = 100
    door_left.y = 20
    door_left.w = 200
    door_left.h = 400
    door_right = {}
    door_right.x = 305
    door_right.y = 20
    door_right.w = 200
    door_right.h = 400

    background = {}
    background.x = 100
    background.y = 20
    background.w = 405
    background.h = 400

    btn_door = {}
    btn_door.open = false
    btn_door.x = 700
    btn_door.y = 500
    btn_door.w = 50
    btn_door.h = 50
end

function love.update(dt)
    if (btn_door.open
    and door_left.x > -100) then
        door_left.x = door_left.x - 4
    end
    if (btn_door.open
    and door_right.x < background.x + background.w) then
        door_right.x = door_right.x + 4
    end

    if (not btn_door.open
    and door_left.x < 100) then
        door_left.x = door_left.x + 4
    end
    if (not btn_door.open
    and door_right.x > 305) then
        door_right.x = door_right.x - 4
    end

    if (mouse.p and not mouse.previous
    and mouse.x > btn_door.x
    and mouse.x < btn_door.x + btn_door.w
    and mouse.y > btn_door.y
    and mouse.y < btn_door.y + btn_door.h) then
        btn_door.open = not btn_door.open
    end

    if (mouse.p) then
        mouse.previous = true
    else
        mouse.previous = false
    end
end

function love.draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", background.x, background.y, background.w, background.h)
    love.graphics.setColor(150, 150, 150)
    love.graphics.rectangle("fill", door_left.x, door_left.y, door_left.w, door_left.h)
    love.graphics.rectangle("fill", door_right.x, door_right.y, door_right.w, door_right.h)

    if (btn_door.open) then
        love.graphics.setColor(255, 150, 150)
    else
        love.graphics.setColor(220, 70, 70)
    end
    love.graphics.rectangle("fill", btn_door.x, btn_door.y, btn_door.w, btn_door.h)

    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 45, 495, 200, 50)
    love.graphics.setColor(220, 70, 70)
    love.graphics.setFont(font)
    love.graphics.printf("0 kg", 50, 500, 200, "center")
end

function love.mousepressed(x, y, button, istouch)
   mouse.x = x
   mouse.y = y
   mouse.p = true
end

function love.mousereleased(x, y, button, istouch)
   mouse.x = x
   mouse.y = y
   mouse.p = false
end

function love.mousemoved(x, y, dx, dy, istouch)
   mouse.x = x
   mouse.y = y
end