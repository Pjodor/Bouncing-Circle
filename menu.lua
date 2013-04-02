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

local function onInfoPageBtnRelease()
	
	storyboard.gotoScene( "scrollView", "fade", 300 )
	
	return true
end

function scene:createScene( event )
	
	local group = self.view
	
	local bg = display.newImage( "bg.jpg", display.contentWidth, display.contentHeight )
	bg:setReferencePoint( display.TopLeftReferencePoint )
	bg.x, bg.y = 0, 0
	
	local titel = display.newText( "Bouncing Circle", display.contentWidth, display.contentHeight, native.systemFont, 50 )
	titel:setReferencePoint( display.TopLeftReferencePoint )
	titel.x = display.contentWidth * 0.05
	titel.y = display.contentHeight * 0.03
	titel:setTextColor( 150, 150, 150 )
	
	local daGame = display.newText( "(the Game!)", display.contentWidth, display.contentHeight, native.systemFont, 50 )
	daGame:setReferencePoint( display.TopLeftReferencePoint )
	daGame.x = display.contentWidth * 0.05
	daGame.y = display.contentHeight * 0.09
	daGame:setTextColor( 0, 200, 0 )
	
	local lvlOne = widget.newButton{
		label="Level 1",
		labelColor = { default={160}, over={230} },
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
	lvlOne.x = display.contentWidth * 0.05
	lvlOne.y = display.contentHeight - 500
	
	local lvlTwo = widget.newButton{
		label="Level 2",
		labelColor = { default={160}, over={230} },
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
	lvlTwo.x = display.contentWidth * 0.05
	lvlTwo.y = display.contentHeight - 425
	
	local lvlThree = widget.newButton{
		label="Level 3",
		labelColor = { default={160}, over={230} },
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
	lvlThree.x = display.contentWidth * 0.05
	lvlThree.y = display.contentHeight - 349
	
	local infoPage = widget.newButton{
		label = "Info",
		labelColor = { default = { 160 }, over = { 230 } },
		fontSize = 45,
		defaultColor = { 0, 0, 0, 255 },
		overColor = { 50, 50, 50, 255 },
		strokeColor = { 255, 0, 0, 255 },
		strokeWidth = 3,
		width=200, height=60,
		cornerRadius = 0,
		onRelease = onInfoPageBtnRelease
	}
	infoPage:setReferencePoint( display.RightReferencePoint )
	infoPage.x = display.contentWidth * 0.05
	infoPage.y = display.contentHeight * 0.9 
	
	group:insert( bg )
	group:insert( titel )
	group:insert( daGame )
	group:insert( lvlOne )
	group:insert( lvlTwo )
	group:insert( lvlThree )
	group:insert( infoPage )
	
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