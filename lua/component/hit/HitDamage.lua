local HitDamage = Component:extends()

function HitDamage:onPopEvent(type, data)
    local entity = self.entity
    if type == "beHit" then
        local col, other = data.col, data.other
        entity.hp = entity.hp or 0
        if entity.hp >= 1 then
            entity.hp = entity.hp - 1
        end
        entity:popEvent("damage", entity.hp)
    end
end

return HitDamage