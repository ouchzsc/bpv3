local Ability1 = Ability:extends()

function Ability1:onSpellStart()
    local entity = self.entity
    local dir = entity.dir
    local x, y
    if dir > 0 then
        x = entity.x + entity.w + 3
    else
        x = entity.x - entity.w - 3
    end
    y = entity.y + entity.h / 2
    local bullet = projectileFactory:create({
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

function Ability1:onGetCd()
    return 0.6
end

function Ability1:onGetAbilityCastPoint()
    return 0.3
end

function Ability1:onGetAnimCfg()
    return animations.hero_attack1
end

return Ability1