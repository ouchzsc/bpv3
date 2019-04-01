local RenderAnim = Component:extends()

function RenderAnim:onEnable()
    self:scheduleTimerAtFixedRate("anim", 0, 1 / self.entity.animcfg.fps, function()
        if self.quads then
            self.index = self.index or 1
            self.index = self.index + 1
            if self.index > #self.quads then
                self.index = 1
            end
        end
    end)
end

function RenderAnim:onPopEvent(type)
    if type == "cameraDraw" then
        local entity = self.entity
        local animcfg = entity.animcfg
        if self.img == nil then
            if animcfg == nil then
                return
            end
            local imgPath = animcfg.imgPath
            local width = animcfg.width
            local height = animcfg.height
            local space = animcfg.space
            local quadCnt = animcfg.cnt

            self.img = love.graphics.newImage(imgPath)
            self.quads = {}
            for i = 1, quadCnt do
                local x = (i - 1) * (space + width)
                local y = 0
                local quad = love.graphics.newQuad(x, y, width, height, self.img:getDimensions())
                table.insert(self.quads, quad)
            end
        end
        local x, y = entity.x, entity.y
        local w, h = animcfg.width, animcfg.height
        local scale = animcfg.scale or 1
        local dir = entity.dir or 1
        local index = self.index or 1
        if dir == 1 then
            love.graphics.draw(self.img, self.quads[index], x, y, 0, scale, scale)
        else
            love.graphics.draw(self.img, self.quads[index], x + entity.w, y, 0, -1 * scale, scale)
        end
    end
end

return RenderAnim
