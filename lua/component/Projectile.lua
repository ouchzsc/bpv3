local Projectile = Component:extends()

function Projectile:onPopEvent(type, data)
    if type == "onTrigger" then
        local caster = self.entity.caster
        local target = data.other
        caster:popEvent("Ability_onProjectileHit", { projectile = self.entity, target = target })
    end
end

return Projectile