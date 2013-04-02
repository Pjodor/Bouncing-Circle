local storyboard = require ( "storyboard" )
local scene = storyboard.newScene()


local widget = require( "widget" )


local function onLvlOneBtnRelease()
	
	storyboard.gotoScene( "lvlone", "fade", 300 )
	
	return true
end

local function onLvlTwoBtnRelease()

	storyboard.gotoScene( "lvltwo", "fade", 300 )
	
	return true
end

local function onLvlThreeBtnRelease()

	storyboard.gotoScene( "lvlthree", "fade", 300 )
	
	return true
end

function scene:createScene( event )
	
	local group = self.view
	
	local bg = display.newImage( "bg.jpg", display.contentWidth, display.contentHeight )
	bg:setReferencePoint( display.TopLeftReferencePoint )
	bg.x, bg.y = 0, 0
	
	local titel = display.newText( "Studsande Cirkel", display.contentWidth, display.contentHeight, native.systemFont, 50 )
	titel:setReferencePoint( display.TopLeftReferencePoint )
	titel.x = display.contentWidth * 0.01
	titel.y = display.contentHeight * 0.03
	titel:setTextColor( 100, 100, 100 )
	
	local lvlOne = widget.newButton{
		label="Level 1",
		labelColor = { default={160}, ovet={230} },
		fontSize = 45,
		defaultColor = { 0, 0, 0, 255 },
		overColor = { 50, 50, 50, 255 },
		strokeColor = { 255, 0, 0, 255 },
		strokeWidth = 3,
		width=200, height=60,
		cornerRadius = 0,
		onRelease = onLvlOneBtnRelease
	}
	lvlOne:setReferencePoint( display.LeftReferencePoint )
	lvlOne.x = display.contentWidth * 0.01
	lvlOne.y = display.contentHeight - 500
	
	local lvlTwo = widget.newButton{
		label="Level 2",
		labelColor = { default={160}, ovet={230} },
		fontSize = 45,
		defaultColor = { 0, 0, 0, 255 },
		overColor = { 50, 50, 50, 255 },
		strokeColor = { 255, 0, 0, 255 },
		strokeWidth = 3,
		width=200, height=60,
		cornerRadius = 0,
		onRelease = onLvlTwoBtnRelease
	}
	lvlTwo:setReferencePoint( display.LeftReferencePoint )
	lvlTwo.x = display.contentWidth * 0.01
	lvlTwo.y = display.contentHeight - 425
	
	local lvlThree = widget.newButton{
		label="Level 3",
		labelColor = { default={160}, ovet={230} },
		fontSize = 45,
		defaultColor = { 0, 0, 0, 255 },
		overColor = { 50, 50, 50, 255 },
		strokeColor = { 255, 0, 0, 255 },
		strokeWidth = 3,
		width=200, height=60,
		cornerRadius = 0,
		onRelease = onLvlThreeBtnRelease
	}
	lvlThree:setReferencePoint( display.LeftReferencePoint )
	lvlThree.x = display.contentWidth * 0.01
	lvlThree.y = display.contentHeight - 349
	
	group:insert( bg )
	group:insert( titel )
	group:insert( lvlOne )
	group:insert( lvlTwo )
	group:insert( lvlThree )
	
end

function scene:enterScene( event )

	storyboard.removeAll()
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