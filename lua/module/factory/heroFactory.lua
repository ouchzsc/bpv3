local heroFactory = {}

function heroFactory.create()
    local hero = Entity:new()
    --hero:addComponent(RenderRect)
    hero:addComponent(GameObject)
    hero:addComponent(PlayerCmd)
    hero:addComponent(Ability_Bullet)
    hero:addComponent(PhysicsMove)
    hero:addComponent(RecoverJumpForceByLand)
    hero:addComponent(Gravity)
    hero:addComponent(AccSystem)
    hero:addComponent(PopHitEvent)
    hero:addComponent(RenderHitting)
    hero:addComponent(HitBack)
    hero:addComponent(HitDamage)
    hero:addComponent(DeadOnEvent)
    hero:addComponent(Animator)

    hero:setData({
        name = 'hero',
        hp = 5,
        w = 22,
        h = 50,
        dir = 1,
        maxVx = 100,
        friction = 15,
        layerMask = layerMask.player,
        maxJumpTime = 3,
        bulletColor = { 0, 0.5, 0.6, 1 },
        bulletLayer = layerMask.playerBullet,
        axMap = {},
        ayMap = {},
        ACT_IDLE = animations.hero_idle,
        ACT_CAST_ABILITY_1 = animations.hero_attack1,
    })
    return hero
end

return heroFactory