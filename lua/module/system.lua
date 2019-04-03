local system = {}
local path = 'lua.module.test'
function system.init()
    event.onKeyPressed:Register(function(key)
        if key=='f6' then
            package.loaded[path] = nil
            local test = require(path)
            test.f6()
        elseif key=='f7' then
            package.loaded[path] = nil
            local test = require(path)
            test.f7()
        end
    end)
    event.onKeyPressed:Register(function(key)
        if key == "p" then
            pause = not pause
        end
        if key == "f1" then
            local b = love.window.getFullscreen()
            love.window.setFullscreen(not b)
        end
    end)
end

return system