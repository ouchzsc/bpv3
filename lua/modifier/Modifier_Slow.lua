local Modifier_Slow = Modifier:extends()

function Modifier_Slow:onEnable()
    Modifier.onEnable(self)
    self.effect = effectFactory.createAttachEffect({
        animcfg = animations.effect_slow,
        targetEntity = self.entity
    })
    self.effect:show()
end

function Modifier_Slow:onDisable()
    Modifier.onDisable(self)
    self.effect:hide()
end

function Modifier_Slow:onGetModifierMoveSpeedBonus_Constant()
    return 0
end

function Modifier_Slow:onGetModifierMoveSpeedBonus_Percentage()
    return 0.5
end

function Modifier_Slow:onGetDuration()
    return 2
end

return Modifier_Slow