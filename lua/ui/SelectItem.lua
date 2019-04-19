local SelectItem = Component:extends()

function SelectItem:onRender()
    local entity = self.entity
    local x, y, w, h = entity.x, entity.y, entity.w, entity.h
    if entity.isSelected then
        love.graphics.rectangle("fill", x, y, w, h)
    else
        love.graphics.rectangle("line", x, y, w, h)
    end
    love.graphics.print(self.text, x, y)
end

return SelectItem