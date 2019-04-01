local FullScreen = Component:extends()

function FullScreen:onEnable()
    self:reg(event.onKeyPressed, function(key)
        if key == "f1" then
            local b = love.window.getFullscreen()
            love.window.setFullscreen(not b)
        end
    end)
end

return FullScreen