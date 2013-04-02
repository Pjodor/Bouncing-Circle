local storyboard = require ( "storyboard" )
local scene = storyboard.newScene()

local widget = require( "widget" )



local function onBackBtnRelease()

	storyboard.gotoScene( "menu", "fade", 500 )
	
	return true
	
end

function scene:createScene( event )
	local group = self.view
	
	
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
	
	
function wrap(str, limit, indent, indent1)
  indent = indent or ""
  indent1 = indent1 or indent
  limit = limit or 72
  local here = 1-#indent1
  return indent1..str:gsub("(%s+)()(%S+)()",
                          function(sp, st, word, fi)
                            if fi-here > limit then
                              here = st - #indent
                              return "\n"..indent..word
                            end
                          end)
end
 
function explode(div,str)
  if (div=='') then return false end
  local pos,arr = 0,{}
  -- for each divider found
  for st,sp in function() return string.find(str,div,pos,true) end do
    table.insert(arr,string.sub(str,pos,st-1)) -- Attach chars left of current divider
    pos = sp + 1 -- Jump past current divider
  end
  table.insert(arr,string.sub(str,pos)) -- Attach chars right of last divider
  return arr
end
 
 
function wrappedText(str, limit, size, font, color, indent, indent1)
        str = explode("\n", str)
        size = tonumber(size) or 12
        color = color or {255, 255, 255}
        font = font or "Helvetica"      
 
        --apply line breaks using the wrapping function
        local i = 1
        local strFinal = ""
    while i <= #str do
                strW = wrap(str[i], limit, indent, indent1)
                strFinal = strFinal.."\n"..strW
                i = i + 1
        end
        str = strFinal
        
        --search for each line that ends with a line break and add to an array
        local pos, arr = 0, {}
        for st,sp in function() return string.find(str,"\n",pos,true) end do
                table.insert(arr,string.sub(str,pos,st-1)) 
                pos = sp + 1 
        end
        table.insert(arr,string.sub(str,pos)) 
                        
        --iterate through the array and add each item as a display object to the group
        local g = display.newGroup()
        local i = 1
    while i <= #arr do
                local t = display.newText( arr[i], 0, 0, font, size )    
                t:setTextColor( color[1], color[2], color[3] )
                t.x = math.floor(t.width/2)
                t.y = (size*1.3)*(i-1)
                g:insert(t)
                i = i + 1
        end
        return g
end

local myText = "This is a simple bouncing circle game. When you press 'Start' the circle will start moving in the direction of the arrow. You have to place the green rectangles so that the circle can bounce to the red line at the buttom of the screen. Tap on the green rectangles to rotate them."
 
local myTextObject = wrappedText( myText, 25, 40, "Helvetica", {255, 0, 0} )
myTextObject.x = 20
myTextObject.y = 70
 
group:insert( myTextObject )
group:insert( back )
--group:insert( scrollView )

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