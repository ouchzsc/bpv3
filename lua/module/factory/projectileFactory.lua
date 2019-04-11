local projectileFactory = {}

function projectileFactory.create(data)
    local bulletEntity = Entity:new()
    bulletEntity:addComponent(GameObject)
    bulletEntity:addComponent(RenderRect)
    bulletEntity:addComponent(TimeToLive)
    bulletEntity:addComponent(CmdMove)
    bulletEntity:addComponent(BulletAI)
    bulletEntity:addComponent(Projectile)
    bulletEntity:setData({
        name = "bullet",
        x = data.x,
        y = data.y,
        w = data.w,
        h = data.h,
        timeLife = data.timeLife,
        v = data.v,
        dir = data.dir,
        color = data.color,
        layerMask = layerMask.trigger,
        caster = data.caster,
    })
    return bulletEntity
end

function projectileFactory.createStill(data)
    local bulletEntity = Entity:new()
    bulletEntity:addComponent(GameObject)
    bulletEntity:addComponent(RenderRect)
    bulletEntity:addComponent(TimeToLive)
    bulletEntity:addComponent(Projectile)

    bulletEntity:setData({
        name = "bullet",
        x = data.x,
        y = data.y,
        w = data.w,
        h = data.h,
        timeLife = data.timeLife,
        v = data.v,
        dir = data.dir,
        color = data.color,
        layerMask = layerMask.trigger,
        caster = data.caster,
    })
    return bulletEntity
end

function projectileFactory.createAnimated(data)
    local bulletEntity = Entity:new()
    bulletEntity:addComponent(GameObject)
    --bulletEntity:addComponent(RenderRect)
    bulletEntity:addComponent(TimeToLive)
    bulletEntity:addComponent(Projectile)
    bulletEntity:addComponent(Animator)

    bulletEntity:setData({
        name = "bullet",
        x = data.x,
        y = data.y,
        w = data.w,
        h = data.h,
        timeLife = data.timeLife,
        dir = data.dir,
        layerMask = layerMask.trigger,
        caster = data.caster,
        animcfg = data.animcfg,
    })
    return bulletEntity
end

return projectileFactory