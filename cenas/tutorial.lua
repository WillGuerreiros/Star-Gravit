local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local grupoTutorial = self.view

  
  local x = display.contentWidth
  local y = display.contentHeight
  local t = x + y


  local fundoTutorial =display.newImageRect ( grupoTutorial, "assets/Imagens/TUTORIAL/fundo02_tutorial.jpg", x, y )

  fundoTutorial.x = x*0.5
  fundoTutorial.y = y*0.5

--===================================================================================================
  
  local fundoTutorial =display.newImageRect ( grupoTutorial, "assets/Imagens/TUTORIAL/IMG_tut.png", x, y*0.6 )

  fundoTutorial.x = x*0.5
  fundoTutorial.y = y*0.4


--=========================================================================


local botaoVoltar = display.newImageRect( grupoTutorial, 
'assets/Imagens/TUTORIAL/ok.png', x*0.30, y*0.13 )  -- tamanho da objeto ou imagem

botaoVoltar.x = x*0.50
botaoVoltar.y = y*0.85


function voltar( event )
  
  composer.gotoScene( 'cenas.menu', { effect = 'fade', time = 500 })

end

  botaoVoltar:addEventListener('touch', voltar)












end
cena:addEventListener('create', cena)
return cena