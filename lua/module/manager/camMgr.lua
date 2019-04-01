local camMgr = {}

function camMgr.get()
    if camMgr.cam == nil then
        camMgr.cam = camFactory:create()
    end
    return camMgr.cam
end

return camMgr