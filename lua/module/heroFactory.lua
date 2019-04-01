local heroFactory = {}

function heroFactory.create()
    local hero = Entity:new()
    hero:addComponent(RenderRect)
    hero:addComponent(GameObject)
    hero:addComponent(PlayerCmd)
    hero:addComponent(PhysicsMove)
    hero:addComponent(RecoverJumpForceByLand)
    hero:addComponent(Gravity)
    hero:addComponent(AccSystem)
    hero:addComponent(PopHitEvent)
    hero:addComponent(RenderHitting)
    hero:addComponent(HitBack)
    --hero:addComponent(NearAttack)
    hero:addComponent(BulletAttack)
    hero:addComponent(HitDamage)
    hero:addComponent(DeadOnEvent)
    hero:addComponent(RenderAnim)

    hero:setData({
        name = 'hero',
        hp = 5,
        w = 22,
        h = 50,
        maxVx = 100,
        friction = 15,
        layerMask = layerMask.player,
        maxJumpTime = 3,
        bulletColor = { 0, 0.5, 0.6, 1 },
        bulletLayer = layerMask.playerBullet,
        axMap = {},
        ayMap = {},
        animcfg = {
            imgPath = "img/idle.png",
            width = 11,
            height = 25,
            space = 1,
            cnt = 5,
            fps = 5,
            scale = 2,
        },
    })
    return hero
end

return heroFactory