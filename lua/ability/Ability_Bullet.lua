local Ability_Bullet = Ability:extends()

function Ability_Bullet:onSpellStart()
    local entity = self.entity
    local dir = entity.dir
    local x, y
    if dir > 0 then
        x = entity.x + entity.w + 3
    else
        x = entity.x - entity.w - 3
    end
    y = entity.y + entity.h / 2
    local bullet = projectileFactory.create({
        caster = entity,
        x = x,
        y = y,
        w = 20,
        h = 5,
        timerLife = 3,
        v = 800,
        dir = dir,
        color = { 0, 0.5, 0.6, 1 },
        layerMask = layerMask.playerBullet,
    })
    bullet:show()
end

function Ability_Bullet:onGetCd()
    return 0.6
end

function Ability_Bullet:onGetAbilityCastPoint()
    return 0.3
end

function Ability_Bullet:onGetAbilityCastAnimation()
    return "ACT_CAST_ABILITY_1"
end

function Ability_Bullet:onProjectileHit(data)
    local target = data.target
    local projectile = data.projectile
    if target.layerMask == layerMask.brick then
        return true
    else
        --击中敌人
        if self.entity.teamId ~= target.teamId then
            target:popEvent("Hp_Damage", { damage = 1 })
            target:popEvent("HitBack",{other = projectile})
            target:addComponent(Modifier_Stun)
            return true
        end
        return false
    end
end

return Ability_Bullet