local Entity = Object:extends()

function Entity:onNew()
    self.components = Stream:New()
end

function Entity:show()
    if self.isEnable then
        return
    end
    self.isEnable = true
    self.components:ForEach(function(com, id)
        com:setActive(true)
    end)
end

function Entity:hide()
    if not self.isEnable then
        return
    end
    self.isEnable = false
    self.components:ForEach(function(com, id)
        com:setActive(false)
    end)
end

function Entity:addComponent(comCls)
    local com = comCls:new({ entity = self })
    self.components:Add(com)
    if self.isEnable then
        com:setActive(true)
    end
    return com
end

function Entity:removeComponent(comCls)
    self.components:ForEach(function(com, id)
        if getmetatable(com) == comCls then
            com:setActive(false)
            com.entity = nil
            com:destroy()
            self.components:Delete(id)
        end
    end)
end

function Entity:getComponent(comCls)
    local targetCom = nil
    self.components:ForEach(function(com, id)
        if getmetatable(com) == comCls then
            targetCom = com
        end
    end)
    return targetCom
end

function Entity:popEvent(eventtype, data)
    self.components:ForEach(function(com, id)
        if com.isActive and com.onPopEvent then
            com:onPopEvent(eventtype, data)
        end
    end)
end

return Entity