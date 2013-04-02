local storyboard = require ( "storyboard" )
local scene = storyboard.newScene()

local widget = require( "widget" )

local physics = require( "physics" )
physics.start(); physics.pause()



local isPlaying = false

--Start funktionen
local function onStartBtnRelease()

	physics.start()
	physics.setGravity( 0, 0 )
	isPlaying = true
	
	return true
	
end

--Tillbaka funktionen
local function onBackBtnRelease()

	storyboard.gotoScene( "menu", "fade", 300 )
	storyboard.removeAll()
	
	return true
	
end

-- Omstarts funktionen
local function onRestartBtnRelease()
	
	if isPlaying == true then
	isPlaying = false
	physics.pause()
	
	
	storyboard.gotoScene( "menu", "fade", 0 )	
	--storyboard.purgeScene( "scene" )
	storyboard.removeAll()
	storyboard.gotoScene( "lvlthree", "fade", 0 )
	
	end
	
	--return true
	
end

function scene:createScene( event )
	-- Skapar en grupp
	local group = self.view
	
	--Lägger till bakgrund
	local bg = display.newImage( "bg.jpg", display.contentWidth, display.contentHeight )
	bg:setReferencePoint( display.TopLeftReferencePoint )
	bg.x, bg.y = 0, 0
	
	local pil = display.newImage( "pilner2.jpg", 70, 70 )
	pil:setReferencePoint( display.TopLeftReferencePoint )
	pil.x, pil.y = 67 , 250
	
	--Lägger till knappar
	
	local start = widget.newButton{
		label = "Start",
		labelColor = { default={160}, ovet={230} },
		fontSize = display.contentWidth * 0.075,
		defaultColor = { 0, 0, 0, 255 },
		overColor = { 50, 50, 50, 255 },
		strokeColor = { 255, 0, 0, 255 },
		strokeWidth = 3,
		width = display.contentWidth * 0.3, 
		height = 60,
		cornerRadius = 0,
		onRelease = onStartBtnRelease
	}
	start:setReferencePoint( display.TopLeftReferencePoint )
	start.x = display.contentWidth * 0.01
	start.y = display.contentHeight * 0.01
	
	
	local back = widget.newButton{
		label = "Back",
		labelColor = { default={160}, ovet={230} },
		fontSize = display.contentWidth * 0.075,
		defaultColor = { 0, 0, 0, 255 },
		overColor = { 50, 50, 50, 255 },
		strokeColor = { 255, 0, 0, 255 },
		strokeWidth = 3,
		width = display.contentWidth * 0.3,
		height = 60,
		cornerRadius = 0,
		onRelease = onBackBtnRelease
	}
	back:setReferencePoint( display.TopRightReferencePoint )
	back.x = display.contentWidth * 0.99
	back.y = display.contentHeight * 0.01
	
	--[[
	local restart = widget.newButton{
		label = "Restart",
		labelColor = { default={160}, ovet={230} },
		fontSize = display.contentWidth * 0.06,
		defaultColor = { 0, 0, 0, 255 },
		overColor = { 50, 50, 50, 255 },
		strokeColor = { 255, 0, 0, 255 },
		strokeWidth = 3,
		width = display.contentWidth * 0.3, 
		height = 60,
		cornerRadius = 0,
		onRelease = onRestartBtnRelease
	}
	restart:setReferencePoint( display.TopCenterReferencePoint )
	restart.x = display.contentWidth * 0.5
	restart.y = display.contentHeight * 0.01
	]]--
	
	--Lägger till cirkeln som ska röra sig genom banan och sätter riktning och hastighet
	local cirkel = display.newCircle( 100, 200, 30 )
	cirkel:setFillColor( 255, 0, 0 )
	physics.addBody(cirkel, { friction = 0, bounce = 1 } )
	cirkel:setLinearVelocity( 0, 500 )
	
	
	--Lägger till marken längst ner på bilden.
	local mark = display.newRect( 0, 0, display.contentWidth * 0.98, 20 )
	mark:setReferencePoint( display.BottomLeftReferencePoint )
	mark.x = display.contentWidth * 0.01
	mark.y = display.contentHeight * 0.98
	mark.strokeWidth = 2
	mark:setFillColor( 0, 0, 0 )
	mark:setStrokeColor( 255, 0, 0 )
	physics.addBody( mark, "static", { friction = 0, bounce = 1 } )
	
	--De två hinder väggarna
	local hinder = display.newRect( 0, 0, display.contentWidth * 0.5, 20 )
	hinder:setReferencePoint( display.BottomLeftReferencePoint )
	hinder.x = display.contentWidth * 0.01
	hinder.y = display.contentHeight * 0.45
	hinder.strokeWidth = 2
	hinder:setFillColor( 0, 0, 0 )
	hinder:setStrokeColor( 255, 0, 0 )
	physics.addBody( hinder, "static", { friction = 0 , bounce = 1 } )
	
	local hinder2 = display.newRect( 0, 0, display.contentWidth * 0.15, 20 )
	hinder2:setReferencePoint( display.BottomLeftReferencePoint )
	hinder2.x = display.contentWidth * 0.85
	hinder2.y = display.contentHeight * 0.45
	hinder2.strokeWidth = 2
	hinder2:setFillColor( 0, 0, 0 )
	hinder2:setStrokeColor( 255, 0, 0 )
	physics.addBody( hinder2, "static", { friction = 0 , bounce = 1 } )
	
	local hinder3 = display.newRect( 0, 0, display.contentWidth * 0.3, 20 )
	hinder3:setReferencePoint( display.BottomLeftReferencePoint )
	hinder3.x = display.contentWidth * 0.45
	hinder3.y = display.contentHeight * 0.7
	hinder3.strokeWidth = 2
	hinder3:setFillColor( 0, 0, 0 )
	hinder3:setStrokeColor( 255, 0, 0 )
	physics.addBody( hinder3, "static", { friction = 0 , bounce = 1 } )
	
	local vram = display.newRect( 0, 0, 5, display.contentHeight * 1 )
	vram:setReferencePoint( display.TopLeftReferencePoint )
	vram.x = 0
	vram.y = 1
	vram:setFillColor( 0, 0, 0 )
	physics.addBody( vram, "static", { isSensor = true } )
	
	local hram = display.newRect( 0, 0, 5, display.contentHeight * 1 )
	hram:setReferencePoint( display.TopLeftReferencePoint )
	hram.x = display.contentWidth * 0.993
	hram.y = 1
	hram:setFillColor( 0, 0, 0 )
	physics.addBody( hram, "static", { isSensor = true } )
	
	local uppram = display.newRect( 0, 0, display.contentWidth * 1 , 5 )
	uppram:setReferencePoint( display.TopLeftReferencePoint )
	uppram.x = 0
	uppram.y = 75
	uppram:setFillColor( 0, 0, 0 )
	physics.addBody( uppram, "static", { isSensor = true } )
	
	--Lägger till målstolpen.
	local finnish = display.newRect( 0, 0, 5, 150 )
	physics.addBody( finnish, "static", { isSensor = true } )
	finnish:setReferencePoint( display.BottomRightReferencePoint )
	finnish.x = display.contentWidth * 0.2
	finnish.y = display.contentHeight * 0.96
	finnish:setFillColor( 255, 0, 0 )
	
	--Funktion som tar hand om popup knapp-alternativen
	local function alertBtn( event )
		
		local action = event.action
		if "clicked" == event.action then
			--print( "index => ".. event.index .. " action => ".. event.action )
			
			if event.index == 2 then
				onBackBtnRelease()
			end
			if event.index == 1 then
				onRestartBtnRelease()
			end
		elseif "cancelled" == event.action then
		
		end
	end
	
	--Funktion som gör att målstoplen triggar på kollision.
	function finnish:collision( event )
		if isPlaying then
			if event.phase == "began" then
				local otherobj = event.other
				
				if otherObj == character then
					physics.pause()
					
					local alert = native.showAlert( "Grattis!", "Du klarade banan!", { "Starta om" , "Till menyn" }, alertBtn )
					
					return true
				end
			end
			return true
		end
	end
	
	finnish:addEventListener( "collision", finnsih )
	
	function vram:collision( event )
		if isPlaying then
			if event.phase == "began" then
				local otherobj = event.other
				
				if otherObj == character then
					
					
					local alert = native.showAlert( "Ops!", "You want to try again?", { "Restart" , "Main menu" }, alertBtn )
					
					return true
				end
			end
			return true
		end
	end
	
	vram:addEventListener( "collision", vram )
	
	function hram:collision( event )
		if isPlaying then
			if event.phase == "began" then
				local otherobj = event.other
				
				if otherObj == character then
					
					
					local alert = native.showAlert( "Ops!", "You want to try again?", { "Restart" , "Main menu" }, alertBtn )
					
					return true
				end
			end
			return true
		end
	end
	
	hram:addEventListener( "collision", hram )
	
	function uppram:collision( event )
		if isPlaying then
			if event.phase == "began" then
				local otherobj = event.other
				
				if otherObj == character then
					
					
					local alert = native.showAlert( "Ops!", "You want to try again?", { "Restart" , "Main menu" }, alertBtn )
					
					return true
				end
			end
			return true
		end
	end
	
	uppram:addEventListener( "collision", uppram )
	
			
	--Lägger till en rektangel som ska gå att flytta
	local objrekt = display.newRect( 0, 0, 150, 25 )
	physics.addBody( objrekt, "static", { friction = 0, bounce = 1 } )
	objrekt:setReferencePoint( display.CenterReferencePoint )
	objrekt.x = display.contentWidth * 0.8
	objrekt.y = display.contentHeight * 0.15
	objrekt.strokeWidth = 2
	objrekt:setFillColor( 0, 0, 0 )
	objrekt:setStrokeColor( 0, 255, 0 )
	objrekt.isPlatform = true
	
	local greenobjrekt = display.newRect( 0, 0, 150, 25 )
	physics.addBody( greenobjrekt, "static", { friction = 0, bounce = 1 } )
	greenobjrekt:setReferencePoint( display.CenterReferencePoint )
	greenobjrekt.x = display.contentWidth * 0.8
	greenobjrekt.y = display.contentHeight * 0.2
	greenobjrekt.strokeWidth = 2
	greenobjrekt:setFillColor( 0, 0, 0 )
	greenobjrekt:setStrokeColor( 0, 255, 0 )
	greenobjrekt.isPlatform = true
	
	local greenobjrekt2 = display.newRect( 0, 0, 150, 25 )
	physics.addBody( greenobjrekt2, "static", { friction = 0, bounce = 1 } )
	greenobjrekt2:setReferencePoint( display.CenterReferencePoint )
	greenobjrekt2.x = display.contentWidth * 0.8
	greenobjrekt2.y = display.contentHeight * 0.25
	greenobjrekt2.strokeWidth = 2
	greenobjrekt2:setFillColor( 0, 0, 0 )
	greenobjrekt2:setStrokeColor( 0, 255, 0 )
	greenobjrekt2.isPlatform = true
	
	local gold = display.newCircle( 500, 200, 20 )
	gold.x = display.contentWidth * 0.6
	gold.y = display.contentHeight * 0.85
	gold:setFillColor( 0, 0, 0 )
	gold.strokeWidth = 2
	gold:setStrokeColor( 50, 50, 255 )
	physics.addBody( gold, "static", { isSensor = true, radius = 20 } )
	
	
	function gold:collision( event )
		if isPlaying then
			if event.phase == "began" then
				local otherobj = event.other
				
				if otherObj == character then
					self.isVisible = false
					
					return true
				end
			end
			return true
		end
	end
	
	gold:addEventListener( "collision", gold )
	
	--Funktion som gör att ett objekt går att flytta på.
	local moveobj = function( self, event )
		
		if event.phase == "began" then
			display.getCurrentStage():setFocus( self )
			self.isFocus = true
			
			event.target.bodyType = "kinematic"
			
			--event.target:setLinearVelocity( 0, 0 )
			event.target.angularVelocity = 0
			
		elseif self.isFocus then
			local moveX = math.abs( event.x - event.xStart )
			local moveY = math.abs( event.y - event.yStart )
			local moveThresh = 5
			
			if event.phase == "moved" then
				self.x = event.x 
				self.y = event.y 
				
			elseif event.phase == "ended" or event.phase == "cancelled" then
				
				if moveX < moveThresh or moveY < moveThresh then
					self.rotation = self.rotation + 10
				
				end
				
				display.getCurrentStage():setFocus( nil )
				self.isFocus = false
				
			end
		end
		
		return true
	end
	
	objrekt.touch = moveobj
	greenobjrekt.touch = moveobj
	greenobjrekt2.touch = moveobj
	
	objrekt:addEventListener( "touch", objrekt )
	greenobjrekt:addEventListener( "touch", greenobjrekt )
	greenobjrekt2:addEventListener( "touch", greenobjrekt2 )
	
	--Lägger in alla objekten i samma grupp till scenen.
	group:insert( bg )
	group:insert( uppram )
	group:insert( vram )
	group:insert( hram )
	group:insert( pil )
	group:insert( gold )
	group:insert( start )
	group:insert( back )
	--group:insert( restart )
	group:insert( cirkel )
	group:insert( mark )
	group:insert( objrekt )
	group:insert( finnish )
	group:insert( greenobjrekt )
	group:insert( greenobjrekt2 )
	group:insert( hinder )
	group:insert( hinder2 )
	group:insert( hinder3 )
	
	
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