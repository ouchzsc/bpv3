local Ability = Component:extends()

function Ability:setAnimation(animCfg)

end

function Ability:onEnable()
    self:reg(event.onCmdUpdate, function(dt)
        if love.mouse.isDown(1) then
            -- todo 如果有其他的技能在施法中，要么不让施法，要么先打断其他施法
            if self:getLeftCd() > 0 then
                return
            else
                self:setLastTime(timer.now)
                self:_startPlayAnim()
                if self.onAbilityPhaseStart then
                    self:onAbilityPhaseStart()
                end
            end
        end
    end)
end

function Ability:onGetAbilityCastPoint()
    return 0.5
end

function Ability:onGetCd()
    return 10
end

function Ability:onGetAnimCfg()

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

function Ability:_startPlayAnim()
    local entity = self.entity
    local animcfg = self:onGetAnimCfg()
    entity.animcfg = animcfg
    local animtime = animcfg.loopTime
    self:scheduleTimer("anim_duration", animtime, function()
        self:_stopPlayAnim()
    end)
    self:scheduleTimer("to_spellstart", self:onGetAbilityCastPoint(), function()
        self:onSpellStart()
    end)
end

function Ability:_stopPlayAnim()
    local entity = self.entity
    entity.animcfg = entity.defaultAnimCfg
end

return Ability