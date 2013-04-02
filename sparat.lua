function startDrag( event )

		local t = event.target
		
		local phase = event.phase
		if "began" == phase then
			display.getCurrentStage():setFocus( t )
			t.siFocus = true
			
			t.x0 = event.x - t.x
			t.y0 = event.y - t.y
			
			event.target.bodyType = "kinematic"
			
			event.target:setLinearVelocity( 0, 0 )
			event.target.angularVelocity = 0
			
		elseif t.isFocus then
			if "moved" == phase then
				t.x = event.x - t.x0
				t.y = event.y - t.y0
			
			elseif "ended" == phase or "cancelled" == phase then
				display.getCurrentStage():setFocus( nil )
				t.isFocus = false
				
				if ( not event.target.isPlatform ) then
					event.target.bodyType = "dynamic"
				end
			end
		end
		
end



local function rotateobj( event )
		
		if event.phase == "began" then
			display.getCurrentStage():setFocus( self )
			self.isFocus = true
			
			self.x1 = event.x
			self.y1 = event.y
			
		elseif self.isFocus then
			if event.phase == "moved" then
				self.x2 = event.x
				self.y2 = event.y
				
				angle1 = 180/math.pi * math.atan2(self.y1 - self.y, self.x1 - self.x )
				
				angle2 = 180/math.pi * math.atan2(self.y2 - self.y, self.x2 - self.x )
				
				print( "angle1 = "..angle1 )
				rotationAmt = angle1 - angle2
				
				self.rotation = self.rotation - rotationAmt
				print( "self.rotation = "..self.rotation )
				
				self.x1 = self.x2
				self.y1 = self.y2
				
			elseif event.phase == "ended" or event.phase == "cancelled" then
				display.getCurrentStage():setFocus( nil )
				self.isFocus = false
				
			end
		end
		
		return true
		
	end