local camModule = {}

function camModule.get()
    if camModule.cam == nil then
        camModule.cam = camFactory:create()
    end
    return camModule.cam
end

function camModule.getWorldPos()
    if camModule.cam then
        local scale = camModule.cam.scale
    end
end

return camModule