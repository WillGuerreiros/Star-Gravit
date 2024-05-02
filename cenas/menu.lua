local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local grupoMenu = self.view


  
    local x = display.contentWidth
    local y = display.contentHeight
    local t = x + y
   
    local fonte1 = 'assets/fontes/SuperMario256.ttf'
  
  
  -- aqui vai todos os comandos e codigos 

  --===================================================================================--


  local fundo2 =display.newImageRect ( grupoMenu, "assets/Imagens/MENU/Fundo_Menu01.png", x, y )

  fundo2.x = x*0.5
  fundo2.y = y*0.5

   
  
  --=========================================================================================


  local botaoJogar = display.newImageRect( grupoMenu, 
  'assets/Imagens/MENU/reprodutor-de-video.png', x*0.15, y*0.07 )  
    botaoJogar.x = x*0.79
    botaoJogar.y = y*0.28
    botaoJogar.alpha = 0.9


-- local textoJogar = display.newText( grupoMenu,
--  ' JOGAR ', botaoJogar.x, botaoJogar.y , fonte1 , t*0.02)
--     textoJogar:setFillColor(0.9, 1., 0.)
    

  ----------------------------------------------------------------------------------------
    
      local botaoTutorial = display.newCircle( grupoMenu, x*0.60, y*0.12, 135 )
      botaoTutorial.alpha = 0.01
  
   local textoTutorial = display.newText( grupoMenu,
   ' ?', botaoTutorial.x, botaoTutorial.y , fonte1, t*0.038)
      textoTutorial:setFillColor(0.9, 1., 0.)
  
  
  --======================================================================
  
  local botaoCreditos = display.newImageRect( grupoMenu, 
  'assets/Imagens/MENU/pergaminho3.png', x*0.15, y*0.07 ) 

  botaoCreditos.x = x*0.84
  botaoCreditos.y = y*0.58
  botaoCreditos.alpha = 0.9
  
  
  --  local textoCreditos = display.newText( grupoMenu,
  --   ' CREDITOS ', botaoCreditos.x, botaoCreditos.y , fonte1, t*0.04)
  --     textoCreditos:setFillColor(0.9, 1., 0.)
  

  

  local musicaMenu = audio.loadSound( "assets/audios/Space Music Pack/Space Music Pack/menu.mp3",3)
  audio.setVolume( 0.05) 
  audio.play( musicaMenu , { loops = -1})
  --====================================================================================
  
  
  function verificaToque ( event ) -- sempre que usar funcao de touch precisar colocar dentro ( )
  
    if event.phase == 'began' then
  
      if event.target == botaoJogar then
        composer.gotoScene( 'cenas.jogo', {
          effect = 'fade', time = 500
        })
      audio.pause( 2 )  
      
  
      elseif event.target == botaoTutorial then
        composer.gotoScene( 'cenas.tutorial',  { effect = 'fade', time = 300 })
            
  
        elseif event.target == botaoCreditos then
          composer.gotoScene( 'cenas.creditos', { effect = 'fade', time = 300 })
        
          
      end  
  
  
    end
  end
  
  botaoJogar:addEventListener('touch', verificaToque )
  botaoTutorial:addEventListener('touch', verificaToque )
  botaoCreditos:addEventListener('touch', verificaToque )
  
  
 
  local function createRaindrop()
    local raindrop = display.newImage ( grupoMenu,"assets/Imagens/MENU/cometa.png", math.random(display.contentWidth), -100)
    raindrop.alpha = 0.8 + math.random() * 0.2  -- Define uma transparência aleatória entre 0.8 e 1.0

    local scale = 0.2 + math.random() * 0.2  -- Define uma escala aleatória para variar o tamanho dos pingos
    raindrop:scale(scale, scale)

    local speed = 150 + math.random() * 50  -- Define uma velocidade aleatória para variar a velocidade dos pingos

    raindrop.rotation = 281

    transition.to(raindrop, {
        y = display.contentHeight + 100,
        time = 3000,
        alpha = 0,
        onComplete = function()
            display.remove(raindrop)
        end
    })
end

local function startRain()
    local rainTimer = timer.performWithDelay(3500, createRaindrop, -1)  -- Cria um novo pingo a cada 500 milissegundos
end

startRain()  -- Inicia a chuva quando o código é executado









end
cena:addEventListener('create', cena)
return cena