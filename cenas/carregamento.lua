


local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local grupoCarregamento = self.view

  local x = display.contentWidth
  local y = display.contentHeight
  local t = x + y
 
  local fonte1 = 'assets/fontes/SuperMario256.ttf'


  -- aqui vai todos os comandos e codigos 

  local musicaCarregamento = audio.loadSound( "assets/audios/Space Music Pack/Space Music Pack/loading.mp3")
  audio.setVolume( 0.5 ) 
  audio.play( musicaCarregamento , {loops = -1})


  --=======================================================
  local fundo = display.newImageRect( grupoCarregamento, 
  'assets/Imagens/CARREGAMENTO/load02.jpg', x, y )

  fundo.x = x*0.5
  fundo.y = y*0.5
  fundo.alpha = 1
--=================================================================
  local nomeJogo = display.newImageRect( grupoCarregamento, 
  'assets/Imagens/CARREGAMENTO/NAME_GAME02.png', x*1.08, y*0.2 ) 

  nomeJogo.x = x*0.5
  nomeJogo.y = y*0.4

-------------------------------------------------
local fundoBarra = display.newRoundedRect( grupoCarregamento,
x*0.5, y*0.85, x*0.95, y*0.09, 100 ) 
fundoBarra:setFillColor(0.1, 5, 0)

local fundoBarra = display.newRoundedRect( grupoCarregamento,
x*0.5, y*0.85, x*0.9, y*0.07, 100 ) 
fundoBarra:setFillColor(0.5, 0.5, 0.5)

local barra = display.newRoundedRect( grupoCarregamento,
x*0.5, y*0.85, x*0.9, y*0.07, 100 ) 
barra:setFillColor(0.5, 0.5, 0.5)



  transition.to( barra, 
  {
    time = (9000 ),
    width = x*0.85,-- AO COMPLETAR A FUNCAO ELE VAI PRA CENA MENU. MUDA DE CENA
    onComplete = function()
      composer.gotoScene( 'cenas.menu')
      audio.pause({channel = 1})
    end
} )




local foguete = display.newImageRect( grupoCarregamento, 
  'assets/Imagens/CARREGAMENTO/—Pngtree—flying rocket_3718748.png', x*0.30, y*0.12 ) -- tamanho da objeto 

  -- posicao dO objeto

  foguete.x = x*0.15
  foguete.y = y*0.85

  foguete.rotation = 90




transition.to ( foguete,
 {
  time =( 8000 ),  -- TEMPO TOTAL
  x = x*0.85,
} )



----------------------------------------------------------------


 local zero, vinte, quarenta, sessenta, oitenta, cem

local function mostrar20()
    zero.alpha = 0
    vinte.alpha = 1
end

local function mostrar40()
    vinte.alpha = 0
    quarenta.alpha = 1
end

local function mostrar60()
  quarenta.alpha = 0
  sessenta.alpha = 1
end

local function mostrar80()
  sessenta.alpha = 0
  oitenta.alpha = 1
end

local function mostrar100()
  oitenta.alpha = 0
  cem.alpha = 1
end

--==============================================================================


zero = display.newText(grupoCarregamento,'0%', x*0.5, y*0.74, fonte1, t*0.05)
  zero.isVisible = true
    zero:setFillColor(0, 1, 0)



vinte = display.newText(grupoCarregamento,'20%', x*0.5, y*0.74, fonte1, t*0.05)
  vinte.alpha = 0
    vinte:setFillColor(0, 1, 0)



quarenta = display.newText(grupoCarregamento,'40%', x*0.5, y*0.74, fonte1, t*0.05)
  quarenta.alpha = 0
    quarenta:setFillColor(0, 1, 0)


sessenta = display.newText(grupoCarregamento,'60%', x*0.5, y*0.74, fonte1, t*0.05)
  sessenta.alpha = 0
    sessenta:setFillColor(0, 1, 0)


oitenta = display.newText(grupoCarregamento,'80%', x*0.5, y*0.74, fonte1, t*0.05)
  oitenta.alpha = 0
    oitenta:setFillColor(0, 1, 0)


cem = display.newText(grupoCarregamento,'100%', x*0.5, y*0.74, fonte1, t*0.05)
  cem.alpha = 0
    cem:setFillColor(0, 1, 0)



-- TEMPRO PRA EXECUTAR CADA FUNCAO

timer.performWithDelay(1500, mostrar20)
timer.performWithDelay(3000, mostrar40)
timer.performWithDelay(4500, mostrar60)
timer.performWithDelay(6000, mostrar80)
timer.performWithDelay(7500, mostrar100)
--------------------------------------------------------------


--  FAZ O CARREGAMENTO DO AUDIO

-- local meuAudio = audio.loadSound("recursos/audios/apito.mp3")

--=============================================================



-- local opcoesAudio = {
--   loops = 0,  -- 1 vez (0 para reprodução única)
--   fadein = 30000,  -- Volume
--   channel = 1  -- número do canal (opcional)
-- }

-- TEMPO QUE O AUDIO LEVA PRA SER INICIADO, NO CASO UM ATRASO DE 6 SEG.


-- local function reproduzirAudio()
--   local meuAudio = audio.loadSound("recursos/audios/apito.mp3")
--   audio.play(meuAudio, opcoesAudio)
-- end

-- -- Atraso de 6 segundos (6000 milissegundos)
-- timer.performWithDelay(6000, reproduzirAudio)












end
cena:addEventListener('create', cena)
return cena


