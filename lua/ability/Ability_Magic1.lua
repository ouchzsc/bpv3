local Ability_Magic1 = Ability:extends()

function Ability_Magic1:onSpellStart()
    local effect = effectFactory.createAttachEffect({
        animcfg = animations.effect1,
        targetEntity = self.entity
    })
    effect:showBy(sceneMgr.curScene)
end

function Ability_Magic1:onGetName()
    return "MagicAb"
end

return Ability_Magic1