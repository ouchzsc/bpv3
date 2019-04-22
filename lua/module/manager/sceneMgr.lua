local sceneMgr = {}

function sceneMgr.load(cls, path)
    if sceneMgr.curScene then
        sceneMgr.curScene:hide()
    end
    local sceneEntity = Entity:new()
    sceneEntity:addComponent(cls)
    sceneEntity:setData({ mapPath = path })
    sceneEntity:show()
    sceneMgr.curScene = sceneEntity
end

return sceneMgr