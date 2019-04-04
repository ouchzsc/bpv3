local MapDoor = Component:extends()

function MapDoor:onPopEvent(type, data)
    if type == "onCollision" then
        local other = data.other
        if other.layerMask == layerMask.player then
            sceneMgr.load(Scene1, self.entity.mapPath)
        end
    end
end

return MapDoor