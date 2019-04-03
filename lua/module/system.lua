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
end

return system