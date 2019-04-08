local Hp = Component:extends()

function Hp:onPopEvent(type, data)
    if type == "Hp_Damage" then
        local dmg = data.damage
        local entity = self.entity
        local hp = entity.hp - dmg
        if hp < 0 then
            hp = 0
        end
        entity.hp = hp
        if hp == 0 then
            entity:hide()
        end
    end
end

return Hp