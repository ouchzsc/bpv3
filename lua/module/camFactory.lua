local camFactory = {}
function camFactory.create()
    local camera = Entity:new()
    camera:addComponent(Camera)
    camera:addComponent(ArrowCmd)
    --camera:addComponent(CmdMove)
    camera:addComponent(CamFollowAI)
    camera:setData({ x = 0, y = 0, w = 1280, h = 720 })
    return camera
end
return camFactory