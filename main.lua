pad = {}
pad.x = 0
pad.y = 0
pad.l = 20
pad.h = 80
pad.score = 0

pad2 = {}
pad2.x = 0
pad2.y = 0
pad2.l = 20
pad2.h = 80
pad2.score = 0

balle = {}
balle.x = 400
balle.y = 300
balle.l = 20
balle.h = 20
balle.vx = 5
balle.vy = 5

joueur1 = true


function centrerBalle()
    balle.x = width/2 - balle.l/2
    balle.y = height/2 - balle.h/2
    
    balle.vx = 5
    balle.vy = 5
    
    if joueur1 == false then
        balle.vx = -balle.vx
        balle.vy = -balle.vy
    end

    
end

function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()    

    pad.y = height/2-pad.h/2
    pad2.x = width-pad2.l
    pad2.y = height/2-pad2.h/2

    joueur1 = true

    centrerBalle()
    
end

function love.update()
    if love.keyboard.isDown("s") and pad.y < height-pad.h then
        pad.y = pad.y + 5
    end
    if love.keyboard.isDown("z") and pad.y > 0 then
        pad.y = pad.y - 5
    end

    if love.keyboard.isDown("down") and pad2.y < height-pad2.h then
        pad2.y = pad2.y + 5
    end
    if love.keyboard.isDown("up") and pad2.y > 0 then
        pad2.y = pad2.y - 5
    end

    balle.x = balle.x + balle.vx
    balle.y = balle.y + balle.vy

    if balle.x <= 0 then
        pad.score = pad.score + 1
        joueur1=true
        centrerBalle()
    end
    if balle.x >= width - balle.l then
        pad2.score = pad2.score + 1
        joueur1=false
        centrerBalle()
    end
    if balle.y <= 0 then
        balle.vy = -balle.vy
    end
    if balle.y >= height - balle.h then
        balle.vy = -balle.vy
    end

    if balle.x <= pad.x + pad.l then
        if balle.y + balle.h >= pad.y and balle.y <= pad.y + pad.h then
            balle.vx = -balle.vx
            balle.x = pad.x + pad.l
        end            
    end

    if balle.x + balle.l >= pad2.x then
        if balle.y + balle.h >= pad2.y and balle.y <= pad2.y + pad2.h then
            balle.vx = -balle.vx
            balle.x = pad2.x - pad2.l
        end
    end
end

function love.draw()
    love.graphics.line(width/2, 0, width/2, height)
    love.graphics.print(pad.score, width/2 - pad.h, pad.h/2, 0, 5)
    love.graphics.print(pad2.score, width/2 + pad2.h/2, pad2.h/2, 0, 5)


    love.graphics.rectangle("fill", pad.x, pad.y, pad.l, pad.h)
    love.graphics.rectangle("fill", pad2.x, pad2.y, pad2.l, pad2.h)

    love.graphics.rectangle("fill", balle.x, balle.y, balle.l, balle.h)
end