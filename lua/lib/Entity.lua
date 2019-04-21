local Entity = Object:extends()

function Entity:onNew()
    self.components = Stream:New()
    self.children = {}
end

function Entity:show(parentEntity)
    if self.isEnable then
        self.components:ForEach(function(com, id)
            if com.onRender then
                com:onRender()
            end
        end)
        return
    end
    self.isEnable = true

    if self.parent then
        print("error")
        return
    end

    if parentEntity then
        if not parentEntity.isEnable then
            print("error")
            return
        end
        self.parent = parentEntity
        self.parent.children[self] = true
    end

    self.components:ForEach(function(com, id)
        com:onEntityEnable()
    end)
end

function Entity:hide()
    if not self.isEnable then
        return
    end

    self.isEnable = false
    -- disable components
    self.components:ForEach(function(com, id)
        com:onEntityDisable()
    end)

    -- hide my children
    for child, _ in pairs(self.children) do
        child:hide()
    end
    self.children = {}

    --remove me from parent
    if self.parent then
        self.parent.children[self] = nil
    end
end

function Entity:addComponent(comCls)
    local com = comCls:new({ entity = self })
    self.components:Add(com)
    if self.isEnable then
        com:onEntityEnable()
    end
    return com
end

function Entity:removeComponent(comCls)
    self.components:ForEach(function(com, id)
        if getmetatable(com) == comCls then
            com:onEntityDisable()
            com.entity = nil
            self.components:Delete(id)
        end
    end)
end

function Entity:removeComponentInst(instance)
    self.components:ForEach(function(com, id)
        if com == instance then
            com:onEntityDisable()
            com.entity = nil
            self.components:Delete(id)
        end
    end)
end

function Entity:removeOtherComponentInst(instance)
    self.components:ForEach(function(com, id)
        if getmetatable(com) == getmetatable(instance) and com ~= instance then
            com:onEntityDisable()
            com.entity = nil
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