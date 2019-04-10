local Modifier_Slow = Modifier:extends()

function Modifier_Slow:onEnable()
    local effect = effectFactory.create({ animcfg = animations.effect_slow, x = self.entity.x, y = self.entity.y, parent = self.entity })
    effect:show()
end

function Modifier_Slow:onGetModifierMoveSpeedBonus_Constant()
    return 0
end

function Modifier_Slow:onGetModifierMoveSpeedBonus_Percentage()
    return 0.1
end

function Modifier_Slow:onGetDuration()
    return 5
end

return Modifier_Slow