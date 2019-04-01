local slimeFactory = {}

function slimeFactory:create()
    local entity = Entity:new()
    entity:addComponent(RenderRect)
    entity:addComponent(RecoverJumpForceByLand)
    entity:addComponent(Gravity)
    entity:addComponent(AccSystem)
    entity:addComponent(GameObject)
    entity:addComponent(PhysicsMove)
    entity:addComponent(SlimeAI)
    entity:addComponent(PopHitEvent)
    entity:addComponent(RenderHitting)
    entity:addComponent(HitBack)
    entity:addComponent(EnemyHp)
    entity:addComponent(HitDamage)
    entity:addComponent(DeadOnEvent)
    entity:setData({
        name = "slime",
        hp = 10,
        maxHp = 10,
        w = 25,
        h = 25,
        maxVx = 150,
        friction = 50,
        color = { 1, 0.5, 0.5, 1 },
        layerMask = layerMask.slime,
    })
    return entity
end

return slimeFactory