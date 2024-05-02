local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local grupoCreditos = self.view

  
  local x = display.contentWidth
  local y = display.contentHeight
  local t = x + y


  local branco = display.newRect( grupoCreditos, x*0.5, y*0.5, x, y )  




  local cpdi = display.newImageRect( grupoCreditos, 
  'assets/Imagens/CREDITOS/CPDI-logo.jpg', x*0.99, y*0.4 )  
    cpdi.x = x*0.5
    cpdi.y = y*0.2


  


  local textOBG = display.newText(grupoCreditos, "@Dev_LucasArthur" , x*0.50, y*0.52, nil, t*0.03)
  textOBG:setFillColor(0,0,255)  -- Defina a cor do texto
  



  local textOBG = display.newText(grupoCreditos, "@Dev_William" , x*0.50, y*0.63, nil, t*0.03)
  textOBG:setFillColor(0,0,255)  -- Defina a cor do texto




  local textOBG = display.newText(grupoCreditos, "COPYRIGHT © TODOS OS DIREITOS RESERVADOS." , x*0.50, y*0.95, nil, t*0.012)
  textOBG:setFillColor(1, 0, 0)  -- Defina a cor do texto


--====================================================


local botaoVoltar = display.newImageRect( grupoCreditos, 
'assets/Imagens/TUTORIAL/ok.png', x*0.30, y*0.13 )  -- tamanho da objeto ou imagem

botaoVoltar.x = x*0.50
botaoVoltar.y = y*0.80


function voltar( event )
  
  composer.gotoScene( 'cenas.menu', { effect = 'fade', time = 500 })

end

  botaoVoltar:addEventListener('touch', voltar)








end
cena:addEventListener('create', cena)
return cena