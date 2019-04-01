local boot = {}

function boot.start()
    world = bump.newWorld(gVariables.worldCellSize)
    gVariables.init()
    layerMask.init()
    event.init()
    timer.init()
    local cam = camMgr.get()
    cam:show()
    sceneMgr.switchTo("config/map1.csv")
end

return boot