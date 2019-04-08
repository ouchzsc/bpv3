local layerMask = {}

local player, playerBullet, zombie, enemyBullet, brick, trigger, slime, projectile = 0, 1, 2, 3, 4, 5, 6, 7

local function getLayerTag(layer)
    return bit.lshift(1, layer)
end

local function bitOrLayer(...)
    local c = 0
    for k, v in pairs({ ... }) do
        c = bit.bor(getLayerTag(v), c)
    end
    return c
end

function layerMask.init()
    layerMask.trigger = {}
    layerMask.trigger.tag = getLayerTag(trigger)
    layerMask.trigger.col = 0
    layerMask.trigger.dmg = 0

    layerMask.player = {}
    layerMask.player.tag = getLayerTag(player)
    layerMask.player.col = bitOrLayer(brick)
    layerMask.player.dmg = 0

    layerMask.zombie = {}
    layerMask.zombie.tag = getLayerTag(zombie)
    layerMask.zombie.col = bitOrLayer(brick)
    layerMask.zombie.dmg = 0

    layerMask.slime = {}
    layerMask.slime.tag = getLayerTag(slime)
    layerMask.slime.col = bitOrLayer(brick)
    layerMask.slime.dmg = bitOrLayer(player)

    layerMask.playerBullet = {}
    layerMask.playerBullet.tag = getLayerTag(playerBullet)
    layerMask.playerBullet.col = bitOrLayer(brick)
    layerMask.playerBullet.dmg = bitOrLayer(zombie, slime)

    layerMask.enemyBullet = {}
    layerMask.enemyBullet.tag = getLayerTag(enemyBullet)
    layerMask.enemyBullet.col = bitOrLayer(brick)
    layerMask.enemyBullet.dmg = bitOrLayer(player)

    layerMask.brick = {}
    layerMask.brick.tag = getLayerTag(brick)
    layerMask.brick.col = bitOrLayer(player, playerBullet, zombie, enemyBullet, brick, slime)
    layerMask.brick.dmg = 0

    layerMask.projectile = {}
    layerMask.projectile.tag = getLayerTag(projectile)
    layerMask.projectile.col = 0
    layerMask.projectile.dmg = 0

end

function layerMask.collideWith(a, b)
    a, b = a or layerMask.brick, b or layerMask.brick
    return bit.band(a.tag, b.col) ~= 0
end

function layerMask.hurt(a, b)
    utils.assetNotNil(a.layerMask, a.name .. " layerMask")
    utils.assetNotNil(b.layerMask, b.name .. " layerMask")
    return bit.band(a.layerMask.dmg, b.layerMask.tag) ~= 0
end

function layerMask.getLayer(name)
    local newlm = {}
    local oldlm = layerMask[name]
    for k, v in pairs(oldlm) do
        newlm[k] = v
    end
    return newlm
end

function layerMask.filter(item, other)
    if layerMask.collideWith(item.layerMask, other.layerMask) then
        return "slide"
    else
        return "cross"
    end
end

return layerMask