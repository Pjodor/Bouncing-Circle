local storyboard = require ( "storyboard" )
local scene = storyboard.newScene()

local widget = require( "widget" )



local function onBackBtnRelease()

	storyboard.gotoScene( "menu", "fade", 500 )
	
	return true
	
end

function scene:createScene( event )

	local group = self.view
	
	local bg = display.newImage( "bg.jpg", display.contentWidth, display.contentHeight )
	bg:setReferencePoint( display.TopLeftReferencePoint )
	bg.x, bg.y = 0, 0
	
	local back = widget.newButton{
		label="Tillbaka",
		labelColor = { default={160}, ovet={230} },
		fontSize = 45,
		defaultColor = { 0, 0, 0, 255 },
		overColor = { 50, 50, 50, 255 },
		strokeColor = { 255, 0, 0, 255 },
		strokeWidth = 3,
		width=200, height=60,
		cornerRadius = 0,
		onRelease = onBackBtnRelease
	}
	back:setReferencePoint( display.TopLeftReferencePoint )
	back.x = display.contentWidth * 0.01
	back.y = display.contentHeight * 0.01
	
	group:insert( bg )
	group:insert( back )
	
end

function scene:enterScene( event )
	
	local group = self.view
	
end

function scene:exitScene( event )

	local group = self.view
	
end

function scene:destroyScene( event )

	local group = self.view
	
end

scene:addEventListener( "createScene", scene )

scene:addEventListener( "enterScene", scene )

scene:addEventListener( "exitScene", scene )

return scene