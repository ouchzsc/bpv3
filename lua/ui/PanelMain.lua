local PanelMain = Component:extends()

function PanelMain:onEnable()
    self:reg(event.onDrawUi, function()
        self:onRender()
    end)
end

function PanelMain:onRender()
end

return PanelMain