local zombieFactory = {}

function zombieFactory.create()
    local zombie = Entity:new()
    zombie:addComponent(RenderRect)
    zombie:addComponent(RecoverJumpForceByLand)
    zombie:addComponent(Gravity)
    zombie:addComponent(AccSystem)
    zombie:addComponent(GameObject)
    zombie:addComponent(PhysicsMove)
    zombie:addComponent(ZombieAI)
    zombie:addComponent(PopHitEvent)
    zombie:addComponent(RenderHitting)
    zombie:addComponent(HitBack)
    zombie:addComponent(NearAttack)
    zombie:addComponent(EnemyHp)
    zombie:addComponent(HitDamage)
    zombie:addComponent(DeadOnEvent)
    zombie:addComponent(RenderAnim)
    zombie:setData({
        name = "zombie",
        hp = 4,
        maxHp = 4,
        w = 30,
        h = 50,
        maxVx = 50,
        layerMask = layerMask.zombie,
        animcfg = {
            imgPath = "img/zombieattack.png",
            width = 20,
            height = 25,
            space = 2,
            cnt = 4,
            fps = 6,
            scale = 2
        },
        --        animcfg = {
        --            imgPath = "img/zombiewalk.png",
        --            width = 15,
        --            height = 25,
        --            space = 9,
        --            cnt = 3,
        --            fps = 3,
        --            scale = 2
        --        },
    })
    return zombie
end

return zombieFactory