local Attach = Component:extends()

function Attach:onEnable()
    self:reg(event.onLateUpdate, function()
        local entity = self.entity
        local target = entity.targetEntity
        if target then
            local cx, cy = utils.getCenter(target)
            local x, y = utils.getTopLeft(cx, cy, entity.w, entity.h)
            entity.x = x
            entity.y = y
        end
    end)
end

return Attach