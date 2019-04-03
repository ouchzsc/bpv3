local Ability = Component:extends()

function Ability:setAnimation(animCfg)

end

function Ability:onEnable()
    self:reg(event.onCmdUpdate, function(dt)
        if love.mouse.isDown(1) then
            if self:getLeftCd() > 0 then
                return
            else
                self:setLastTime(timer.now)
                --if self.onAbilityPhaseStart then
                --    self:onAbilityPhaseStart()
                --end
                if self.onSpellStart then
                    self:onSpellStart()
                end
            end
        end
    end)
end

function Ability:onGetAbilityCastPoint()
    return 0
end

function Ability:onGetCd()
    return 10
end

function Ability:getLeftCd()
    if self.lastTime == nil then
        return 0
    else
        return self:onGetCd() - (timer.now - self.lastTime)
    end
end

function Ability:setLastTime(time)
    self.lastTime = time
end

return Ability