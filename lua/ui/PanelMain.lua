local PanelMain = UIComponent:extends()

function PanelMain:onEnable()
    self.gridView = self:addChild(GridView)
end

function PanelMain:onRender()
    self.gridView:setData({ ItemCls = SelectItem, Count = 3, dataList = {} })
    self.gridView:show()
end

return PanelMain