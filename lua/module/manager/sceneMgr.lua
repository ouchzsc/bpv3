local sceneMgr = {}

function sceneMgr.load(cls, path)
    if sceneMgr.curScene then
        sceneMgr.curScene:clear()
    end
    local scene = sceneFactory:create(cls, path):getComponent(cls)
    scene:load()
    sceneMgr.curScene = scene
end

return sceneMgr