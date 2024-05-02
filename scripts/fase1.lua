local fase1 = {}

function fase1.novo()

local objetosFase1 = {}

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
table.insert( objetosFase1, chao )

local teto = display.newRect( x*0.5, y*0.015, x, y*0.03 )
physics.addBody( teto, "static", {friction = 0.1, bounce = 0.0} )
table.insert( objetosFase1, teto )

local paredeEsquerda = display.newRect( x*0.015, y*0.65/2, x*0.03, y*0.65 )
physics.addBody( paredeEsquerda, "static", {friction = 0.1, bounce = 0.00} )
table.insert( objetosFase1, paredeEsquerda )

local paredeDireita = display.newRect( x*(1-0.015), y*0.65/2, x*0.03, y*0.65 )
physics.addBody( paredeDireita, "static", {friction = 0.1, bounce = 0.0} )
table.insert( objetosFase1, paredeDireita )




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
table.insert( objetosFase1, plataforma1 )

end

end


adicionaPlataforma(10 , x*0.05 , y*0.52)
adicionaPlataforma(15 , x*0.25 , y*0.4)
adicionaPlataforma(11 , x*0.62 , y*0.3)
adicionaPlataforma(10 , x*0.05 , y*0.3)
adicionaPlataforma(21 , x*0.28 , y*0.18)

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
table.insert( objetosFase1, plataformaVert )
end

end

adicionaPlataformaVert( 16, x*0.72 , y*0.4)
adicionaPlataformaVert( 4, x*0.75 , y*0.04)



-- local obstaculoTipo1 -- espinhos, lava. obstaculoTipo2..

local function adicionaBuracoNegro(posX, posY,pos2X, tempo, transicao)

local buracoNegro = display.newImageRect( "assets/Imagens/BuracoNegro/Black Hole1.png", x*0.15, y*0.05 )
buracoNegro.x = posX
buracoNegro.y = posY
buracoNegro.alpha = 0.8
buracoNegro.id = "buracoNegroFase1Id"
physics.addBody ( buracoNegro, 'static' ,{radius=t*0.01})

if transicao == true then
transition.loop( buracoNegro, 
{
    time = tempo,
    iterations = 0,
    x = pos2X,

} )
end

table.insert( objetosFase1, buracoNegro )

end

adicionaBuracoNegro(x*0.1, y*0.35, x*0.9, 7000, true)
adicionaBuracoNegro(x*0.2, y*0.23, x*0.9, 5000, true)
adicionaBuracoNegro(x*0.85, y*0.6, false)
adicionaBuracoNegro(x*0.15, y*0.05, false)

-- local objetivoPrimario -- Porta, nave
local function adicionaNave(posX,posY)


local naveFase1 = display.newImageRect( "assets/Imagens/NAVE/pngegg.png", x*0.06, y*0.05 )
naveFase1.x = posX
naveFase1.y = posY
naveFase1.id = "naveFase1Id"
physics.addBody ( naveFase1, 'static' )
table.insert( objetosFase1, naveFase1 )
end

adicionaNave(x*0.85,y*0.15)



-- local objetivoSecundario -- chave, moeda, combustivel

local function adicionaGalao(posX,posY)


local galaoFase1 = display.newImageRect( "assets/Imagens/GALAO/gasolina.png", x*0.08, y*0.03 )

galaoFase1.x = posX
galaoFase1.y = posY

galaoFase1.id = "galaoFase1Id"
physics.addBody ( galaoFase1, 'static' )

table.insert( objetosFase1, galaoFase1 )

end

adicionaGalao(x*0.85,y*0.55)



---======================================================================
return objetosFase1

end


return fase1