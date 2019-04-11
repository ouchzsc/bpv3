local effectFactory = {}

function effectFactory.create(data)
    local entity = Entity:new()
    entity:addComponent(Animator)
    entity:addComponent(GameObject)
    entity:addComponent(Attach)
    entity.ACT_IDLE = data.animcfg
    entity.w = data.animcfg.width * data.animcfg.scale
    entity.h = data.animcfg.height * data.animcfg.scale
    entity.sortingOrder = 1
    entity.name = "effect"
    entity.targetEntity = data.targetEntity
    entity.layerMask = layerMask.trigger
    return entity
end

return effectFactory