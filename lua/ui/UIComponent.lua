local UIComponent = Component:extends()

function UIComponent:_onUIEnable()
end

function UIComponent:_onUIDisable()
    self:removeChildren()
end

function UIComponent:addChild(ComCls)
    if self.ui_children == nil then
        self.ui_children = Stream:New()
    end
    local child = Entity:new()
    child:addComponent(ComCls)
    local childId = self.ui_children:Add(child)
    return child, childId
end

function UIComponent:removeChildren()
    if self.ui_children then
        self.ui_children:ForEach(function(child, id)
            child:hide()
        end)
        self.ui_children = nil
    end
end

return UIComponent