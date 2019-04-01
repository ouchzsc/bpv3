local timer = {}

function timer.init()
    timer.globalTimer = Timer:New()
end

function timer.onUpdate(dt)
    timer.globalTimer:Update(dt)
end

return timer