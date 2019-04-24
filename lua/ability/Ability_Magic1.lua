local Ability_Magic1 = Ability:extends()

function Ability_Magic1:onSpellStart()
    local entity = self.entity

    local mx, my = love.mouse.getPosition()
    local iteminfo,len = world:querySegmentWithCoords(mx,my,mx,my+2000,function (item)
        return item.layerMask == layerMask.brick
    end)
    print(iteminfo,len)
    if iteminfo then
        --utils.print_r(iteminfo)
    else
        print("nil")
    end

    local dir = entity.dir
    local x, y
    if dir > 0 then
        x = entity.x + 200
    else
        x = entity.x - 200
    end
    y = entity.y
    local w = animations.effect1.width * animations.effect1.scale
    local h = animations.effect1.height * animations.effect1.scale
    local effect = effectFactory.createStill({
        animcfg = animations.effect1,
        targetEntity = self.entity,
        x = x,
        y = y + entity.h - h,
        w = w,
        h = h,
        timeLife = 1,
        layerMask = layerMask.bullet,
        teamId = 2,
        caster = self.entity
    })
    effect:showBy(sceneModule.curScene)
end

function Ability_Magic1:onGetName()
    return "MagicAb"
end

function Ability_Magic1:onGetAbilityCastPoint()
    return 0.2
end

function Ability_Magic1:onProjectileHit(data)
    local target = data.target
    local projectile = data.projectile

    if target.layerMask == layerMask.brick then
        return true
    end

    if target.layerMask == layerMask.trigger then
        return false
    end

    --击中敌人
    if target.layerMask == layerMask.player and self.entity.teamId ~= target.teamId then
        target:popEvent("Hp_Damage", { damage = 1 })
        target:popEvent("HitBack", { other = projectile })
    end
    return false
end

return Ability_Magic1