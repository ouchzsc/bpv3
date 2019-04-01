local PauseGame = Component:extends()

function PauseGame:onEnable()
    self:reg(event.onKeyPressed, function(key)
        if key == "p" then
            pause = not pause
        end
    end)
end

return PauseGame