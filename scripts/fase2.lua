local fase2 = {}

function fase2.novo()

local objetosFase2 = {}

--==================================================================



local x = display.contentWidth
local y = display.contentHeight 
t= x+y

local physics = require( "physics" )
--physics.setDrawMode( "hybrid" )
physics.start() 

physics.setGravity( 0 , 30 )





--declaração dos objetos

local chao = display.newRect( x*0.5, y*0.65, x, y*0.03 )
physics.addBody( chao, "static", {friction = 0.1, bounce = 0.0} )
table.insert( objetosFase2, chao )

local teto = display.newRect( x*0.5, y*0.015, x, y*0.03 )
physics.addBody( teto, "static", {friction = 0.1, bounce = 0.0} )
table.insert( objetosFase2, teto )

local paredeEsquerda = display.newRect( x*0.015, y*0.65/2, x*0.03, y*0.65 )
physics.addBody( paredeEsquerda, "static", {friction = 0.1, bounce = 0.00} )
table.insert( objetosFase2, paredeEsquerda )

local paredeDireita = display.newRect( x*(1-0.015), y*0.65/2, x*0.03, y*0.65 )
physics.addBody( paredeDireita, "static", {friction = 0.1, bounce = 0.0} )
table.insert( objetosFase2, paredeDireita )




-- local plataforma -- plataforma1,plataforma2

local function adicionaPlataforma(quant,posX,posY)

local tamanhoPlataforma = t*0.01
for i=1,quant do

local plataforma1 = display.newRoundedRect( posX, posY, tamanhoPlataforma, tamanhoPlataforma, 6 )
plataforma1.id = "plataformaId"..i
plataforma1.x = posX+(tamanhoPlataforma*i)-tamanhoPlataforma
plataforma1.y = posY
physics.addBody( plataforma1, "static", {friction = 0, bounce = 0.3, 
}
)
table.insert( objetosFase2, plataforma1 )

end

end


adicionaPlataforma(14 , x*0.05 , y*0.54)
adicionaPlataforma(6 , x*0.05 , y*0.44)
adicionaPlataforma(11 , x*0.62 , y*0.23)
adicionaPlataforma(15 , x*0.05 , y*0.35)
adicionaPlataforma(15 , x*0.48 , y*0.13)
adicionaPlataforma(3 , x*0.45 , y*0.44)

local function adicionaPlataformaVert(quant,posX,posY)

local tamanhoPlataforma = t*0.01
for i=1,quant do

local plataformaVert = display.newRoundedRect( posX, posY, tamanhoPlataforma, tamanhoPlataforma, 6 )
plataformaVert.id = "plataformaVertId"..i
plataformaVert.x = posX
plataformaVert.y = posY+(tamanhoPlataforma*i)-tamanhoPlataforma
physics.addBody( plataformaVert, "static", {friction = 0, bounce = 0.3, 
}
)
table.insert( objetosFase2, plataformaVert )
end

end

adicionaPlataformaVert( 12, x*0.75 , y*0.35)
adicionaPlataformaVert( 6, x*0.25 , y*0.13)
adicionaPlataformaVert( 3, x*0.40 , y*0.31)



-- local obstaculoTipo1 -- espinhos, lava. obstaculoTipo2..

local function adicionaBuracoNegro(posX, posY,pos2X, tempo, transicao)

local buracoNegroFase2 = display.newImageRect( "assets/Imagens/BuracoNegro/Black Hole1.png", x*0.15, y*0.05 )
buracoNegroFase2.x = posX
buracoNegroFase2.y = posY
buracoNegroFase2.alpha = 0.8
buracoNegroFase2.id = "buracoNegroFase2Id"
physics.addBody ( buracoNegroFase2, 'static' ,{radius=t*0.01})

if transicao == true then
transition.loop( buracoNegroFase2, 
{
    time = tempo,
    iterations = 0,
    x = pos2X,

    
   
} )
end

table.insert( objetosFase2, buracoNegroFase2 )

end

adicionaBuracoNegro(x*0.1, y*0.08, x*0.35, 3000, true)
adicionaBuracoNegro(x*0.9, y*0.18, x*0.35, 5000, true)
adicionaBuracoNegro(x*0.1, y*0.5, x*0.65, 6000, true)
adicionaBuracoNegro(x*0.9, y*0.28, x*0.1, 6000, true)


-- local objetivoPrimario -- Porta, nave
local function adicionaNave(posX,posY)


local naveFase2 = display.newImageRect( "assets/Imagens/NAVE/pngegg.png", x*0.06, y*0.05 )
naveFase2.x = posX
naveFase2.y = posY
naveFase2.id = "naveFase2Id"
physics.addBody ( naveFase2, 'static' )
table.insert( objetosFase2, naveFase2 )
end

adicionaNave(x*0.9,y*0.07)



-- local objetivoSecundario -- chave, moeda, combustivel

local function adicionaGalao(posX,posY)

local galao2Fase = display.newImageRect( "assets/Imagens/GALAO/gasolina.png", x*0.08, y*0.03 )

galao2Fase.x = posX
galao2Fase.y = posY

galao2Fase.id = "galao2FaseId"
physics.addBody ( galao2Fase, 'static' )

table.insert( objetosFase2, galao2Fase )

end

adicionaGalao(x*0.33,y*0.4)



---======================================================================
return objetosFase2

end


return fase2