local NearAttack = Component:extends()
local defaultBulletColor = { 1, 0, 0, 1 }
function NearAttack:onPopEvent(type, data)
    local entity = self.entity
    if type == "attack" then
        local bulletEntity = Entity:new()
        bulletEntity:addComponent(GameObject)
        bulletEntity:addComponent(RenderRect)
        bulletEntity:addComponent(TimeToLive)
        local bulletWidth = 60
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
            y = entity.y,
            w = bulletWidth,
            h = entity.h,
            timeLife = 0.5,
            color = entity.bulletColor or defaultBulletColor,
            layerMask = entity.bulletLayer or layerMask.enemyBullet,
        })
        bulletEntity:show()
    end
end

return NearAttack