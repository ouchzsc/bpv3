local Ability1 = Ability:extends()

function Ability1:onSpellStart()
    print("spell start ab1")
end

function Ability1:onGetCd()
    return 2
end

function Ability1:onGetAbilityCastPoint()
    return 0.456
end

return Ability1