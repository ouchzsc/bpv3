local heroFactory = {}

function heroFactory.create()
    local hero = Entity:new()
    --hero:addComponent(RenderRect)
    hero:addComponent(GameObject)
    hero:addComponent(PlayerCmd)
    hero:addComponent(Ability_Bullet)
    hero:addComponent(Ability_Magic1)
    hero:addComponent(PhysicsMove)
    hero:addComponent(RecoverJumpForceByLand)
    hero:addComponent(Gravity)
    hero:addComponent(AccSystem)
    hero:addComponent(RenderHitting)
    hero:addComponent(HitBack)
    hero:addComponent(Animator)

    hero:setData({
        name = 'hero',
        hp = 5,
        w = 22,
        h = 50,
        teamId = 1,
        dir = 1,
        speedBase = 300,
        speedPer = 1,
        friction = 15,
        layerMask = layerMask.player,
        maxJumpTime = 3,
        axMap = {},
        ayMap = {},
        ACT_IDLE = animations.hero_idle,
        ACT_CAST_ABILITY_1 = animations.hero_attack1,
    })
    return hero
end

return heroFactory