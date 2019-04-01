local BulletAttack = Component:extends()
local defaultBulletColor = { 1, 0, 0, 1 }
function BulletAttack:onPopEvent(type, data)
    local entity = self.entity
    if type == "attack" then
        local bulletEntity = Entity:new()
        bulletEntity:addComponent(GameObject)
        bulletEntity:addComponent(RenderRect)
        bulletEntity:addComponent(TimeToLive)
        bulletEntity:addComponent(CmdMove)
        bulletEntity:addComponent(BulletAI)
        local bulletWidth = 20
        local startDis = -10
        local dir = entity.dir or 1
        local bulletX
        if dir > 0 then
            bulletX = entity.x + entity.w + startDis
        else
            bulletX = entity.x - startDis - bulletWidth
        end
        bulletEntity:setData({
            name = "bullet",
            x = bulletX,
            y = entity.y + entity.h / 2,
            w = bulletWidth,
            h = 5,
            timeLife = 3,
            v = 400,
            dir = dir,
            color = entity.bulletColor or defaultBulletColor,
            layerMask = entity.bulletLayer or layerMask.enemyBullet,
        })
        bulletEntity:show()
    end
end

return BulletAttack