local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
    
local cenaJogo = self.view

math.randomseed(os.time()) 

local x = display.contentWidth
local y = display.contentHeight 
t= x+y

--declaração de variaveis 

local escalaPlayerX = t*0.00007
local escalaPlayerY = t*0.00007
local combustivel = 0
local limitaMovimento = false
local posicaoInicialX = x*0.15
local posicaoInicialY= y*0.6
local faseAtual = 1



--declaracao do fundo

local fundo =display.newImageRect (cenaJogo,"assets/Imagens/FUNDO/FUNDO.png", x, y )

fundo.x = x*0.5
fundo.y = y*0.5


--==========



local scriptFase1 = require("scripts.fase1")

local objetosFase1 = scriptFase1.novo()

table.insert(cenaJogo, objetosFase1)

local scriptFase2 = require("scripts.fase2")

--local objetosFase2 = scriptFase2.novo() --nil

table.insert(cenaJogo, objetosFase2)

--==========================================audio
local audioReset = audio.loadSound( "assets/audios/Space Music Pack/Space Music Pack/fx/scream.wav"   )
local musicaFundo = audio.loadSound( "assets/audios/musica de fundo.mp3"   )
local audioAvancaFase = audio.loadSound( "assets/audios/Space Music Pack/Space Music Pack/fx/start-level.mp3"   )
audio.setVolume( 0.1) 
audio.play( musicaFundo , { loops = -1} )


--===========================================
-- tabelas de frames
local opcoesTabelaFrames = 
{
x = 0,
y = 0,
width = 2722/12,
height = 376,
numFrames = 11
}

local opcoesTabelaMorte = {
    x = 0,
    y = 0,
    width = 6312/12,
    height = 519,
    numFrames = 12
}

local tabelaFramesPlayer = graphics.newImageSheet( "assets/Imagens/PLAYER/Robot_Asset_Pack/Robot_Asset_Pack/Animations/IdleNew/idle_000-sheet.png",  opcoesTabelaFrames )
local tabelaFramesMorte = graphics.newImageSheet( "assets/Imagens/PLAYER/Robot_Asset_Pack/Robot_Asset_Pack/Animations/Death/Death_000-sheet.png",  opcoesTabelaMorte )

-- sequencias de animaçao

local sequenciasAnimacaoPlayer = 
{
{
name = "idle",
start = 1,
count = 11,
time = 800,
loopCount = 0
},

{
sheet = tabelaFramesMorte,
name = "morte",
start = 1,
count = 11,
time = 1000,
loopCount = 1
},
}

-- player 

local player = display.newSprite( cenaJogo, tabelaFramesPlayer, sequenciasAnimacaoPlayer )-- t*0.03, t*0.06 ) -- Player robo
player.x = posicaoInicialX
player.y = posicaoInicialY
player.vivo = true
player.id = "playerId"
player:scale(escalaPlayerX,escalaPlayerY)
player:setSequence( "idle" )
player:play()
physics.addBody( player, "dinamic", {radius = escalaPlayerX*180, friction = 0.1, bounce = 0.0}) --, box = {halfWidth=escalaPlayerX/2, halfHeight=escalaPlayerY/2, x=0, y=0 }}) 
player.isFixedRotation = true


--=========================

local fundoInterface = display.newRect(  x*0.5, y*0.85, x, y*0.37 )
fundoInterface:setFillColor(190/255, 190/255,190/255, 1)

local tabelaNomeConsole = {"ster swaartekrag", "trọng lực của sao","yulduz tortishish kuchi", "зоряне тяжіння", "ስሕበት ኮኾብ", "నక్షత్ర గురుత్వాకర్షణ", "sidus gravitatis","Gravità Stellare", "Star Gravity", "Gravidade Estelar" }

local fundoNome =display.newRect(  x*0.5, y*0.695, x, y*0.06 )
fundoNome:setFillColor (150/255, 150/255, 150/255, 1)
local textoConsole = display.newText( {text = tabelaNomeConsole[math.random(1, 10)], x= -x*0.5, y=fundoNome.y, fontSize= 100} )
textoConsole:setFillColor (54/255,103/255,181/255,1)

local transicaotextoConsole = transition.to( textoConsole, 
{
    time = 5000,
    iterations = 0,
    x = x*1.5,
    
} )

local transicaotextoConsole2 = transition.blink( textoConsole, {time = 500} )




-- =================================== declaração de botoes

-- Botao Reset fase
local botaoResetFaseExterior = display.newRoundedRect(  x*0.75, y*0.85, x*0.4, y*0.15, t*0.5 )
botaoResetFaseExterior:setFillColor(0,0,0,1)
local botaoResetFase = display.newRoundedRect(  x*0.75, y*0.85, x*0.3, y*0.1, t*0.5 )
botaoResetFase:setFillColor(54/255,103/255,181/255,1)





-- local botaoGravidadeCima

local botaoGravidadeCima =display.newRoundedRect(  x*0.25, y*0.78, 128, 128, 12 )

botaoGravidadeCima:setFillColor(0, 0,0, 1)

local function moveGravidadeCima( event )

if event.phase == "began"  then 

    player.yScale = -escalaPlayerY
    physics.setGravity( 0,-30)
    player:applyForce( 0, -0, 0, 0 )
    print(physics.getGravity())

end

end




-- local botaoGravBaixo

local botaoGravidadebBaixo = display.newRoundedRect(  x*0.25, y*0.93, 128, 128, 12 )

botaoGravidadebBaixo:setFillColor(0, 0,0, 1)

local function moveGravidadeBaixo( event )

if event.phase == "began"  then 

    player.yScale = escalaPlayerY
    physics.setGravity( 0 , 30)
    player:applyForce( 0, 0, 0, 0 )
    print(physics.getGravity())

end

end

-- botaoDireita

local botaoDireita =display.newRoundedRect(  x*0.4, y*0.85, 128, 128, 12 )

botaoDireita:setFillColor(0, 0,0, 1)



local function personagemADireita( event )


    if event.phase == "began" and limitaMovimento == false then 
    player.xScale = escalaPlayerX
    player:setLinearVelocity(350, 0)
    limitaMovimento = true

    elseif event.phase == "ended" and limitaMovimento == true then
    limitaMovimento = false

    end

end


-- botaoEsquerda

local botaoEsquerda = display.newRoundedRect(  x*0.1, y*0.85, 128, 128, 12 )

    botaoEsquerda:setFillColor(0, 0,0, 1)

    local function personagemAEsquerda( event )

    if event.phase == "began" and limitaMovimento == false then 
    player.xScale = escalaPlayerX
    player:setLinearVelocity(-350, 0)
    limitaMovimento = true

    elseif event.phase == "ended" and limitaMovimento == true then
    limitaMovimento = false

    end

end


--declaracao de funções
--===========================funcao combustivel ()============================
local function adicionaCombustivel()
if combustivel < 100 then

    
    combustivel = combustivel + 100
    print( "combustivel:".. combustivel )
    
    if faseAtual == 1 then

        for i,v in ipairs(objetosFase1) do
            if v.id == "galaoFase1Id" then 
            display.remove( v )
            end
        end

    elseif faseAtual == 2 then

        for i,v in ipairs(objetosFase2) do
            if v.id == "galao2FaseId" then 
                display.remove( v )
            end
          
        end
    

    end
    



end
end

--===========================funcao nave (prox fase)============================
local function fimDejogo() 
    botaoDireita.alpha = 0
    botaoEsquerda.alpha = 0
    botaoGravidadebBaixo.alpha = 0
    botaoGravidadeCima.alpha = 0
    botaoResetFase.alpha = 0
    botaoResetFaseExterior.alpha = 0
    fundoInterface.alpha = 0
    fundo.alpha = 0.5
    fundoNome.alpha = 0
    transition.pause(transicaotextoConsole)
    transition.pause(transicaotextoConsole2)
    textoConsole.alpha = 0

    local textoFimDeJogo =
    {
    "O robô conseguiu chegar ao seu objetivo",
    "apesar dos desafios pelo caminho",
    "Obrigado por jogar",
    }
    
    local textoFimDeJogo1 = display.newText( {text = textoFimDeJogo[1], x= x*0.5, y=y*0.8, fontSize= 50} )
    local textoFimDeJogo2 = display.newText( {text = textoFimDeJogo[2], x= textoFimDeJogo1.x, y=y*0.9, fontSize= 50} )
    local textoFimDeJogo3 = display.newText( {text = textoFimDeJogo[3], x= textoFimDeJogo1.x, y=y, fontSize= 50} )
    
    transition.to( textoFimDeJogo1, 
    {
    time = 15000,
    iterations = 1,
    y = -y*1.5,
    } )

    transition.to( textoFimDeJogo2, 
    {
    time = 15000,
    iterations = 1,
    y = -y*1.5,
    } )

    transition.to( textoFimDeJogo3, 
    {
    time = 15000,
    iterations = 1,
    y = -y*1.5,

    onComplete = function()      
        composer.removeScene( "cenas.jogo")
        composer.gotoScene( 'cenas.menu', {
            effect = 'fade', time = 200
          })
    


    end



    } )

    
end


------------------------------------------

local function avancaFase()

if combustivel >= 100 then 

if faseAtual == 1 then 
        
    for i,v in ipairs(objetosFase1) do
        

        transition.to(v, {time = 500, alpha = 0, onComplete = function()
        display.remove( v )
       
        end
        })
       
    end
    audio.play( audioAvancaFase)
    timer.performWithDelay( 500, function ()
    objetosFase2 = scriptFase2.novo()
    player.x = posicaoInicialX
    player.y = posicaoInicialY
    player.yScale = escalaPlayerY
    faseAtual = 2
    combustivel = 0 
    end , 1 )
    

elseif faseAtual == 2 then

    for i,v in ipairs(objetosFase2) do
       
        transition.to(v, {time = 500, alpha = 0, onComplete = function()
            display.remove( v )

            end
        })
       
    end
    
    combustivel = 0 
    display.remove( player )

    fimDejogo() 


end

end
end

--======================funcao reseta fase=======================

local function apertaResetaFase(event)
    if event.phase == "began" then
        textoConsole.text = tabelaNomeConsole[math.random(1, 10)]
        
        audio.play( audioReset)

        if faseAtual == 1 then 

            for i,v in ipairs(objetosFase1) do
            display.remove( v )
        
            end

            objetosFase1 = scriptFase1.novo()
            physics.start() 
            player.x = posicaoInicialX
            player.y = posicaoInicialY
            player:setSequence( "idle" )
            player.vivo = true
            combustivel = 0
        
        elseif faseAtual == 2 then
        
            for i,v in ipairs(objetosFase2) do
                display.remove( v )
            
            end
    
            objetosFase2 = scriptFase2.novo()
            physics.start() 
            player.x = posicaoInicialX
            player.y = posicaoInicialY
            player:setSequence( "idle" )
            player.vivo = true
            combustivel = 0



        end 
                

    end

end

--========================funcao mata jogador=================

local function verificaVida()

    if player.vivo == false then
        player.vivo = true
        print("morreu")
        player.yScale = escalaPlayerY
        player:setSequence("morte")
        player:play()
        audio.play( audioReset)
    end

end


--=============================VERIFICA A COLISAO ===================


function verificaColisao (event)

if event.phase == 'began' then

    --fase 1
    if  event.object1.id == 'playerId' and event.object2.id == 'galaoFase1Id' or 
        event.object2.id == 'playerId' and event.object1.id == 'galaoFase1Id' then
        
        adicionaCombustivel()

    end

    if  event.object1.id == 'playerId' and event.object2.id == 'naveFase1Id' or 
        event.object2.id == 'playerId' and event.object1.id == 'naveFase1Id' then

        avancaFase()
        print( "player nave" )
    end

    if  event.object1.id == 'playerId' and event.object2.id == 'buracoNegroFase1Id' or 
        event.object2.id == 'playerId' and event.object1.id == 'buracoNegroFase1Id' then
        physics.pause() 
        player.vivo = false

        print( "player buraco negro" )
    end


    --fase2
    if  event.object1.id == 'playerId' and event.object2.id == 'galao2FaseId' or 
        event.object2.id == 'playerId' and event.object1.id == 'galao2FaseId' then
    
        adicionaCombustivel()
    
    end
    
    if  event.object1.id == 'playerId' and event.object2.id == 'naveFase2Id' or 
        event.object2.id == 'playerId' and event.object1.id == 'naveFase2Id' then
    
        avancaFase()
        print( "player nave" )
    end
    
    if  event.object1.id == 'playerId' and event.object2.id == 'buracoNegroFase2Id' or 
        event.object2.id == 'playerId' and event.object1.id == 'buracoNegroFase2Id' then
        physics.pause() 
        player.vivo = false
    
        print( "player buraco negro" )
    end












end
end

Runtime:addEventListener('collision', verificaColisao)
Runtime:addEventListener("enterFrame", verificaVida)


botaoGravidadeCima:addEventListener( "touch", moveGravidadeCima )

botaoGravidadebBaixo:addEventListener( "touch", moveGravidadeBaixo )

botaoDireita:addEventListener( "touch", personagemADireita )

botaoEsquerda:addEventListener( "touch", personagemAEsquerda )

botaoResetFase:addEventListener("touch",apertaResetaFase)



end
cena:addEventListener('create', cena)
return cena


