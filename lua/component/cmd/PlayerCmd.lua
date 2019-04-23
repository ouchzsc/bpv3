local PlayerCmd = Component:extends()

function PlayerCmd:onEnable()
    local entity = self.entity
    self:reg(event.onCmdUpdate, function(dt)
        if love.mouse.isDown(1) then
            self.entity:popEvent("attack")
        end
        entity.cmdX, entity.cmdY = utils.getAxisWasd()
        local x, y = love.mouse.getPosition()
        local camScale = camModule.get().scale
        if camScale == nil then
            return
        end
        local wx, wy = x / camScale + camModule.get().x, y / camScale + camModule.get().y
        entity.dir = 1
        if wx < entity.x then
            entity.dir = -1
        end
    end)
end

return PlayerCmd