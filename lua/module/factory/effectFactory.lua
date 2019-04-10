local effectFactory = {}

function effectFactory.create(data)
    local entity = Entity:new()
    entity:addComponent(Animator)
    entity.ACT_IDLE = data.animcfg
    entity.x = data.x
    entity.y = data.y
    data.parent:addChild(entity)
    return entity
end

return effectFactory