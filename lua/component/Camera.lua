local Camera = Component:extends()

function Camera:onEnable()
    local entity = self.entity
    self:reg(event.onDraw, function()
        local x, y, w, h = entity.x or 0, entity.y or 0, entity.w, entity.h
        local scale = math.min(love.graphics.getWidth() / w, love.graphics.getHeight() / h)
        entity.scale = scale
        local items, len = world:queryRect(x, y, w, h)
        love.graphics.push()
        love.graphics.scale(scale, scale)
        love.graphics.translate(-x, -y)
        love.graphics.rectangle("line", x, y, w, h)
        for i = 1, len do
            items[i]:popEvent("beforeCameraDraw")
            items[i]:popEvent("cameraDraw")
            items[i]:popEvent("cameraDrawUI")
            items[i]:popEvent("afterCameraDraw")
        end
        love.graphics.pop()
    end)
end

return Camera