local Ability_NearAttack = Ability:extends()

function Ability_NearAttack:onSpellStart()
    local entity = self.entity
    local dir = entity.dir
    local x, y
    if dir > 0 then
        x = entity.x + entity.w + 3
    else
        x = entity.x - entity.w - 3
    end
    y = entity.y + entity.h / 2
    local bullet = projectileFactory:createStill({
        caster = entity,
        x = x,
        y = y,
        w = 100,
        h = 100,
        timerLife = 0.5,
        v = 800,
        dir = dir,
        color = { 1, 0.5, 0.6, 1 },
        layerMask = layerMask.playerBullet,
    })
    bullet:show()
end

function Ability_NearAttack:onGetAbilityCastAnimation()
    return "ACT_CAST_ABILITY_1"
end

return Ability_NearAttack