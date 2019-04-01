local sceneMgr = {}

function sceneMgr.switchTo(mapPath)
    sceneMgr.clear()
    local j = 0
    for line in love.filesystem.lines(mapPath) do
        j = j + 1
        local t = utils.split(line, ",")
        for i, v in ipairs(t) do
            local x, y = i * gVariables.worldCellSize, j * gVariables.worldCellSize
            local entity = nil

            if v == "1" then
                entity = brickFactory.create()
                entity:setData({ x = x, y = y })
            elseif v == "hero" then
                entity = heroFactory.create()
                entity:setData({
                    x = x,
                    y = y,
                })
                heroMgr.set(entity)
            elseif v == "zombie" then
                entity = zombieFactory:create()
                entity:setData({ x = x, y = y })
            elseif v == "slime" then
                entity = slimeFactory:create()
                entity:setData({ x = x, y = y })
            elseif utils.startwith(v, "door") then
                local ts = utils.split(v, ":")
                entity = doorFactory:create()
                entity:setData({ x = x, y = y, mapPath = ts[2] })
            end

            if entity then
                entity:show()
                sceneMgr.addEntity(entity)
            end
        end
    end
end

function sceneMgr.addEntity(entity)
    sceneMgr.entityList = sceneMgr.entityList or {}
    table.insert(sceneMgr.entityList, entity)
end

function sceneMgr.clear()
    if sceneMgr.entityList then
        for _, entity in ipairs(self.entityList) do
            entity:hide()
        end
        sceneMgr.entityList = nil
    end
end

return sceneMgr