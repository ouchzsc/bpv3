local test = {}

function test.f6()
end

function test.f7()
    --ui.panelMain.gridView:hide()
    test.testCam()
end

function test.testCam()
    local entity = camModule.get()
    local x, y, w, h = entity.x or 0, entity.y or 0, entity.w, entity.h
    local scaleX = love.graphics.getWidth() / w
    local scaleY = love.graphics.getHeight() / h
    local scale = math.min(scaleX, scaleY)
    local tx, ty = -x + (love.graphics.getWidth() / scale - w) / 2, -y + (love.graphics.getHeight() / scale - h) / 2
    print("-------------------------")
    print("love.graphics.getWidth()", love.graphics.getWidth())
    print("love.graphics.getHeight()", love.graphics.getHeight())
    print("x,y,w,h", x, y, w, h)
    print("scaleX,scaleY", scaleX, scaleY)
    print("sw,sh", scale * w, scale * h)
    print("tx,ty", tx, ty)
    return scale, tx, ty
end

return test