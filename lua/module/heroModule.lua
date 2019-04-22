local heroModule = {}

function heroModule.init()
    heroModule.abilityIndex = 1
    heroModule.abilityList = { Ability_Bullet, Ability_Magic1 }
end

function heroModule:selectPreAbility()
    heroModule.abilityIndex = heroModule.abilityIndex - 1
    if heroModule.abilityIndex < 1 then
        heroModule.abilityIndex = #heroModule.abilityList
    end
end

function heroModule:selectNextAbility()
    heroModule.abilityIndex = heroModule.abilityIndex + 1
    if heroModule.abilityIndex > #heroModule.abilityList then
        heroModule.abilityIndex = 1
    end
end
return heroModule