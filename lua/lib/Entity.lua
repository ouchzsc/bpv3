--local StreamMap = require "lua.common.StreamMap"
local Entity = Object:extends()

function Entity:onNew()
    self.components = StreamMap:New()
end

function Entity:show()
    if not self.inited then
        if self.onInit then
            self:onInit()
        end
        self.inited = true
    end
    if self.isEnable then
        return
    end
    self.isEnable = true
    self.components:ForEach(function(cls, com)
        com:setActive(true)
    end)
end

function Entity:hide()
    if not self.isEnable then
        return
    end
    self.isEnable = false
    self.components:ForEach(function(cls, com)
        com:setActive(false)
    end)
end

function Entity:addComponents(types)
    for _, v in pairs(types) do
        self:addComponent(v)
    end
end

function Entity:addComponent(comCls)
    local com = comCls:new({ entity = self })
    self.components:Put(comCls, com)
    if self.isEnable then
        com:setActive(true)
    end
end

function Entity:removeComponent(comCls)
    local com = self.components:Get(comCls)
    if com then
        com:setActive(false)
        com.entity = nil
        com:destroy()
        self.components:Remove(comCls)
    end
end

function Entity:getComponent(comCls)
    return self.components:Get(comCls)
end

function Entity:popEvent(eventtype, data)
    self.components:ForEach(function(cls, com)
        if com.isActive and com.onPopEvent then
            com:onPopEvent(eventtype, data)
        end
    end)
end

return Entity