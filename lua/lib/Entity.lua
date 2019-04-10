local Entity = Object:extends()

function Entity:onNew()
    self.components = Stream:New()
    self.children = {}
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
    if self.children then
        for child, v in pairs(self.children) do
            child:hide()
        end
        self.children = nil
    end
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

function Entity:removeComponentInst(instance)
    self.components:ForEach(function(com, id)
        if com == instance then
            com:setActive(false)
            com.entity = nil
            com:destroy()
            self.components:Delete(id)
        end
    end)
end

function Entity:removeOtherComponentInst(instance)
    self.components:ForEach(function(com, id)
        if getmetatable(com) == getmetatable(instance) and com ~= instance then
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

function Entity:addChild(child)
    self.children = self.children or {}
    self.children[child] = true
end

function Entity:removeChild(child)
    self.children[child] = nil
end

return Entity