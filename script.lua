-- Auto generated script file --

-- VANILLA STUFF
vanilla_model.ALL:setVisible(false)
local username = avatar:getEntityName()
nameplate.All:setText("Trivia Bot")
nameplate.Entity:setVisible(false)

-- ACTION WHEEL
local emission = false
models:setSecondaryRenderType("NONE")
local microphone = true
models.model.root.Body.arm_r.held.mic:setVisible(true)
local quiz = false
models.model.root.Head.clock:setVisible(false)
models.model.root.Head.plane:setUV(12 / 64 , 0)
local snail = false
models.model.root:setVisible(true)
models.model.Skull:setVisible(true)
models.model.snail:setVisible(false)

local dots = true
local dotsFrame = 0
local dotsLoading = false

local mainPage = action_wheel:newPage()
local togglesPage = action_wheel:newPage()
local emotesPage = action_wheel:newPage()
local quizPage = action_wheel:newPage()

local toToggles = mainPage:newAction()
    :item("minecraft:redstone_lamp")
    :onLeftClick(function()action_wheel:setPage(togglesPage)end)
    :title("Toggles")
local toEmotes = mainPage:newAction()
    :item("minecraft:totem_of_undying")
    :onLeftClick(function()action_wheel:setPage(emotesPage)end)
    :title("Misc Emotes [WIP]")
local toQuiz = mainPage:newAction()
    :item("minecraft:clock")
    :onLeftClick(function()action_wheel:setPage(quizPage)end)
    :title("Quiz Related [WIP]")
local snailToggle = mainPage:newAction()
    :item("minecraft:player_head{SkullOwner:"..username.."}")
    :title("VHSnail Toggle")
    :setHoverColor(239 / 255, 92 / 255, 84 / 255)
    :setColor(119 / 255, 46 / 255, 42 / 255)

local emissionToggle = togglesPage:newAction()
    :item("minecraft:glow_ink_sac")
    :title("Toggle Emission")
    :setHoverColor(239 / 255, 92 / 255, 84 / 255)
    :setColor(119 / 255, 46 / 255, 42 / 255)
local micToggle = togglesPage:newAction()
    :item("minecraft:lightning_rod")
    :title("Toggle Microphone")
    :setColor(53 / 255, 116 / 255, 53 / 255)
    :setHoverColor(106 / 255, 232 / 255, 107 / 255)
local toMainFromToggles = togglesPage:newAction()
    :item("minecraft:barrier")
    :onLeftClick(function()action_wheel:setPage(mainPage)end)
    :title("Back")

local toMainFromEmotes = emotesPage:newAction()
    :item("minecraft:barrier")
    :onLeftClick(function()action_wheel:setPage(mainPage)end)
    :title("Back")

local quizStart = quizPage:newAction()
    :item("minecraft:clock")
    :title("Start Quiz")
    :setHoverColor(239 / 255, 92 / 255, 84 / 255)
    :setColor(119 / 255, 46 / 255, 42 / 255)
local winAction = quizPage:newAction()
    :item("minecraft:green_concrete")
    :title("Correct Response!")
local loseAction = quizPage:newAction()
    :item("minecraft:red_concrete")
    :title("Incorrect Response!")
local toMainFromQuiz = quizPage:newAction()
    :item("minecraft:barrier")
    :onLeftClick(function()
        action_wheel:setPage(mainPage)
        models.model.root.Head.clock:setVisible(false)
        models.model.root.Head.plane:setUV(12/64 , 0)
        animations.model.ticking:stop()
        quiz = false
        dots = true
        end)
    :title("Back")

action_wheel:setPage(mainPage)

snailToggle:onLeftClick(function()
    if snail then
        models.model.root:setVisible(true)
        models.model.snail:setVisible(false)
        snail = false
        snailToggle:setHoverColor(239 / 255, 92 / 255, 84 / 255)
        snailToggle:setColor(119 / 255, 46 / 255, 42 / 255)
        renderer:setOffsetCameraPivot(0, 0, 0)
        
        toEmotes:setHoverColor(1, 1, 1):setColor(0, 0, 0):onLeftClick(function()action_wheel:setPage(emotesPage)end)
        toQuiz:setHoverColor(1, 1, 1):setColor(0, 0, 0):onLeftClick(function()action_wheel:setPage(quizPage)end)
    else
        models.model.root:setVisible(false)
        models.model.snail:setVisible(true)
        snail = true
        snailToggle:setHoverColor(106 / 255, 232 / 255, 107 / 255)
        snailToggle:setColor(53 / 255, 116 / 255, 53 / 255)
        renderer:setOffsetCameraPivot(0, -1, 0)
        
        toEmotes:setHoverColor(239 / 255, 92 / 255, 84 / 255):setColor(119 / 255, 46 / 255, 42 / 255):onLeftClick()
        toQuiz:setHoverColor(239 / 255, 92 / 255, 84 / 255):setColor(119 / 255, 46 / 255, 42 / 255):onLeftClick()
    end
end)

emissionToggle:onLeftClick(function()
    if emission then
        models:setSecondaryRenderType("NONE")
        emission = false
        emissionToggle:setHoverColor(239 / 255, 92 / 255, 84 / 255)
        emissionToggle:setColor(119 / 255, 46 / 255, 42 / 255)
    else
        models:setSecondaryRenderType("EYES")
        emission = true
        emissionToggle:setHoverColor(106 / 255, 232 / 255, 107 / 255)
        emissionToggle:setColor(53 / 255, 116 / 255, 53 / 255)
    end
end)
micToggle:onLeftClick(function()
    if microphone then
        vanilla_model.HELD_ITEMS:setVisible(true)
        models.model.root.Body.arm_r.held.mic:setVisible(false)
        microphone = false
        micToggle:setHoverColor(239 / 255, 92 / 255, 84 / 255)
        micToggle:setColor(119 / 255, 46 / 255, 42 / 255)
    else
        vanilla_model.HELD_ITEMS:setVisible(false)
        models.model.root.Body.arm_r.held.mic:setVisible(true)
        microphone = true
        micToggle:setHoverColor(106 / 255, 232 / 255, 107 / 255)
        micToggle:setColor(53 / 255, 116 / 255, 53 / 255)
    end
end)
quizStart:onLeftClick(function()
    if quiz then
        models.model.root.Head.clock:setVisible(false)
        models.model.root.Head.plane:setUV(12 / 64 , 0)
        animations.model.ticking:stop()
        quiz = false
        dots = true
        quizStart:title("Start Quiz")
        quizStart:setHoverColor(239 / 255, 92 / 255, 84 / 255)
        quizStart:setColor(119 / 255, 46 / 255, 42 / 255)
    else
        models.model.root.Head.clock:setVisible(true)
        models.model.root.Head.plane:setUV(0, 0)
        animations.model.ticking:play()
        quiz = true
        dots = false
        quizStart:title("Cancel Quiz")
        quizStart:setHoverColor(106 / 255, 232 / 255, 107 / 255)
        quizStart:setColor(53 / 255, 116 / 255, 53 / 255)
    end
end)
winAction:onLeftClick(function()
    models.model.root.Head.clock:setVisible(false)
    models.model.root.Head.plane:setUV(0 , 11/66)
    animations.model.ticking:stop()
    quizStart:title("Start Quiz")
    quizStart:setHoverColor(239 / 255, 92 / 255, 84 / 255)
    quizStart:setColor(119 / 255, 46 / 255, 42 / 255)
    quiz = false
    dots = false
end)
loseAction:onLeftClick(function()
    models.model.root.Head.clock:setVisible(false)
    models.model.root.Head.plane:setUV(12/64 , 11/66)
    animations.model.ticking:stop()
    quizStart:title("Start Quiz")
    quizStart:setHoverColor(239 / 255, 92 / 255, 84 / 255)
    quizStart:setColor(119 / 255, 46 / 255, 42 / 255)
    quiz = false
    dots = false
end)

-- EVERYTHING ELSE

--entity init event, used for when the avatar entity is loaded for the first time
function events.entity_init()
  
end

--tick event, called 20 times per second
function events.tick()
  if animations.model.elytra:isPlaying() or animations.model.falling:isPlaying() then
    models.model.root.Body.arm_r.held.umbrella:setVisible(true)
  else
    models.model.root.Body.arm_r.held.umbrella:setVisible(false)
  end
  
  if player:getItem(6).id == "minecraft:player_head" and player:getItem(6).tag.SkullOwner ~= nil then 
    if player:getItem(6).tag.SkullOwner.Name == username then
        models.model.root.Head.antennaL:setVisible(true)
        models.model.root.Head.antennaR:setVisible(true)
    else
        models.model.root.Head.antennaL:setVisible(false)
        models.model.root.Head.antennaR:setVisible(false)
    end
  else
    models.model.root.Head.antennaL:setVisible(false)
    models.model.root.Head.antennaR:setVisible(false)
  end
  --and player:getItem(6).tag == "{SkullOwner:"..username.."}"
  if world.getTime() % 10 == 0 and quiz then
    --sounds:playSound("block.note_block.snare", player:getPos(), 1, 1, false)
    sounds:playSound("block.note_block.hat", player:getPos(), 2, 1.5, false)
  end

  if dotsLoading then
  else
    if world.getTime() % 5 == 0 then 
        dotsFrame = dotsFrame+1 
        if dotsFrame == 21 then dotsFrame = 0 end
    end
    models.model.root.Head.green_dot:setVisible(dots and (dotsFrame < 3 or dotsFrame > 4))
    models.model.root.Head.yellow_dot:setVisible(dots and (dotsFrame < 2 or dotsFrame > 5))
    models.model.root.Head.red_dot:setVisible(dots and (dotsFrame < 1 or dotsFrame > 6))
  end
end

--render event, called every time your avatar is rendered
--it have two arguments, "delta" and "context"
--"delta" is the percentage between the last and the next tick (as a decimal value, 0.0 to 1.0)
--"context" is a string that tells from where this render event was called (the paperdoll, gui, player render, first person)
function events.render(delta, context)
    
end