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
    sceneMgr.load(Scene1, "config/map1.csv")

    local panelMain = Entity:new()
    panelMain:addComponent(PanelMain)
    panelMain:show()
end

return boot