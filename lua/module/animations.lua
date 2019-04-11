local animations = {}

function animations.init()
    animations.hero_attack1 = {
        imgPath = "img/heroattack.png",
        width = 20,
        height = 24,
        space = 0,
        cnt = 9,
        loopTime = 0.6,
        scale = 2,
    }
    animations.hero_idle = {
        imgPath = "img/idle.png",
        width = 11,
        height = 25,
        space = 1,
        cnt = 5,
        loopTime = 0.5,
        scale = 2,
    }
    animations.zombie_attack = {
        imgPath = "img/zombieattack.png",
        width = 20,
        height = 25,
        space = 2,
        cnt = 4,
        loopTime = 0.86,
        scale = 2
    }
    animations.effect1 = {
        imgPath = "img/effect1.png",
        width = 15,
        height = 15,
        space = 0,
        cnt = 8,
        loopTime = 0.86,
        scale = 2
    }
    animations.effect_slow={
        imgPath = "img/effect_slow.png",
        width = 50,
        height = 50,
        space = 0,
        cnt = 4,
        loopTime = 2,
        scale = 1
    }
end

return animations