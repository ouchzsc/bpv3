local RuntimeTest = Component:extends()
local path = 'test'

function RuntimeTest:onEnable()
    self:reg(event.onKeyPressed, function(key)
        if key == "f5" then
            package.loaded[path] = nil
            local test = require(path)
            test.f5()
        elseif key == "f6" then
            package.loaded[path] = nil
            local test = require(path)
            test.f6()
        elseif key == "f7" then
            package.loaded[path] = nil
            local test = require(path)
            test.f7()
        end
    end)
end

return RuntimeTest

