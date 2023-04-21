-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local physics = require('physics')
physics.start()

local tapCount = 0



local background = display.newImageRect( "background.png", 360, 600 )

background.x = display.contentCenterX
background.y = display.contentCenterY

--render text

local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tapText:setFillColor( 0, 0, 0 )


local platform = display.newImageRect("platform.png",300,50)

platform.x = display.contentCenterX 
platform.y = display.contentHeight-15


local ballon =  display.newImageRect("balloon.png",100,100)

ballon.x = display.contentCenterX
ballon.y = display.contentCenterY

physics.addBody(platform,"static")

physics.addBody(ballon,"dynamic",{radius=50,bounce=0.5})

local function pushBalloon()
    ballon:applyLinearImpulse( 0, -0.75, ballon.x, ballon.y )
    tapCount= tapCount+1
    tapText.text = tapCount
   
end

ballon:addEventListener("tap",pushBalloon)