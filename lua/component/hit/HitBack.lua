local HitBack = Component:extends()
local time = 0.2
local backVx, backVy = 800, -50
function HitBack:onPopEvent(type, data)
    local entity = self.entity
    if type == "beHit" then
        local col, other = data.col, data.other
        if other.x > entity.x then
            self.vx = -backVx
        else
            self.vx = backVx
        end
        self.vy = backVy
        self:scheduleTimer("cancle", time, function()
            self.vx = nil
            self.vy = nil
        end)
    end
end

function HitBack:onEnable()
    self:reg(event.onAfterLateUpdate, function(dt)
        if self.vx and self.vy then
            self.entity.vx = self.vx
            self.entity.vy = self.vy
        end
    end)
end

return HitBack