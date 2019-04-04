local PlayerCmd = Component:extends()

function PlayerCmd:onEnable()
    local entity = self.entity
    self:reg(event.onCmdUpdate, function(dt)
        entity.cmdX, entity.cmdY = utils.getAxisWasd()
        local x, y = love.mouse.getPosition()
        local camScale = camMgr.get().scale
        if camScale == nil then
            return
        end
        local wx, wy = x / camScale + camMgr.get().x, y / camScale + camMgr.get().y
        entity.dir = 1
        if wx < entity.x then
            entity.dir = -1
        end
    end)
end

return PlayerCmd