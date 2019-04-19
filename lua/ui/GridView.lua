local GridView = Component:extends()

function GridView:onRender()
    local entity  = self.entity
    entity.griditems = {}

    for k,v in pairs(entity.griditems) do
        item:setData()
        item:show()
    end
end

function GridView:onDataChange()

end

return GridView