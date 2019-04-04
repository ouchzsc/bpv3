local projectileFactory = {}
local defaultBulletColor = { 1, 0, 0, 1 }

function projectileFactory:create(data)
    local casterEntity = data.caster
    local bulletEntity = Entity:new()
    bulletEntity:addComponent(GameObject)
    bulletEntity:addComponent(RenderRect)
    bulletEntity:addComponent(TimeToLive)
    bulletEntity:addComponent(CmdMove)
    bulletEntity:addComponent(BulletAI)
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
        layerMask = data.layerMask,
    })
    return bulletEntity
end

function projectileFactory:createStill(data)
    local casterEntity = data.caster
    local bulletEntity = Entity:new()
    bulletEntity:addComponent(GameObject)
    bulletEntity:addComponent(RenderRect)
    bulletEntity:addComponent(TimeToLive)
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
        layerMask = data.layerMask,
    })
    return bulletEntity
end

return projectileFactory