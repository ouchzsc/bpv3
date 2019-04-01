local heroMgr = {}

function heroMgr.set(hero)
    heroMgr.hero = hero
end

function heroMgr.get()
    return heroMgr.hero
end

return heroMgr