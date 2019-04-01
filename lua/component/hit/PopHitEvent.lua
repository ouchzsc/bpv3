local PopHitEvent = Component:extends()
local hittingCd = 0.8
function PopHitEvent:onPopEvent(type, data)
    local entity = self.entity
    entity.hitting = entity.hitting or false
    if entity.hitting then
        return
    end
    if type == "onCollision" then
        local col, other = data.col, data.other
        if layerMask.hurt(other, entity) then
            entity.hitting = true
            self.entity:popEvent("beHit", data)
            self:scheduleTimer("hitting", hittingCd, function()
                entity.hitting = false
                self.entity:popEvent("unHit")
            end)
        end
    end
end

return PopHitEvent