local boot = {}

function boot.start()
    world = bump.newWorld(gVariables.worldCellSize)
    gVariables.init()
    layerMask.init()
    event.init()
    timer.init()
    animations.init()
    system:init()
    local cam = camMgr.get()
    cam:show()
    s1 = sceneFactory:create(Scene1, "config/map1.csv")
    s1:getComponent(Scene1):load()
end

return boot