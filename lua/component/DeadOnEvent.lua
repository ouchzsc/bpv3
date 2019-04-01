local DeadOnEvent = Component:extends()

function DeadOnEvent:onPopEvent(type, data)
    if type == "damage" then
        local hp = data
        if hp <= 0 then
            self.entity:hide()
        end
    end
end

return DeadOnEvent