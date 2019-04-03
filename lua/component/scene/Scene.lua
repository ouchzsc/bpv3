local Scene = Component:extends()

function Scene:load()
    local mapPath = self.entity.mapPath
    local j = 0
    for line in love.filesystem.lines(mapPath) do
        j = j + 1
        local t = utils.split(line, ",")
        for i, v in ipairs(t) do
            local x, y = i * gVariables.worldCellSize, j * gVariables.worldCellSize
            local entity = self:createEntity(v, x, y)
            if entity then
                entity:show()
                self:addEntity(entity)
            end
        end
    end
    if self.afterLoad then
        self.afterLoad()
    end
end

function Scene:clear()
    local entity = self.entity
    if entity.entityList then
        for _, childEntity in ipairs(entity.entityList) do
            childEntity:hide()
        end
        entity.entityList = nil
    end
end

function Scene:addEntity(childEntity)
    self.entity.entityList = self.entity.entityList or {}
    table.insert(self.entity.entityList, childEntity)
end

function Scene:createEntity(v, x, y)
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
    return entity
end

return Scene