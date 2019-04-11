local Ability_Magic1 = Ability:extends()

function Ability_Magic1:onSpellStart()
    local data = { caster = self.entity,
                   x = self.entity.x + 10,
                   y = self.entity.y,
                   w = 30,
                   h = 30,
                   timerLife = 3,
                   v = 800,
                   dir = self.entity.dir,
                   color = { 0, 0.5, 0.6, 1 },
                   layerMask = layerMask.trigger,
                   animcfg = animations.effect1,
    }
    local effect = projectileFactory.createAnimated(data)
    effect:show()
end

return Ability_Magic1