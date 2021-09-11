local Part = workspace:WaitForChild("Part")
local Camera = workspace.CurrentCamera

local mouse:Mouse = game.Players.LocalPlayer:GetMouse()
local tweenservice = game:GetService("TweenService")
local info = TweenInfo.new(0.1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0)

local SpeedLower = 500 --[[reduce Speed.]]
local SpeedPhysicsLower = 1 --[[reduce Speed Rotation]]

local lastx = nil
local lasty = nil
local newx = nil
local newy = nil

local enable = false

local oldspeedx = 0
local oldspeedy = 0

mouse.Button1Down:Connect(function()
	enable = true
end)
mouse.Button1Up:Connect(function()
	enable = false
end)

function lerp()
	Part.CFrame = Part.CFrame * CFrame.Angles(0,oldspeedx/SpeedLower,oldspeedy/SpeedLower)
end

while game:GetService("RunService").RenderStepped:Wait() do
	if enable then
		if not lastx then
			lastx = mouse.X
		end
		if not lasty then
			lasty = mouse.Y
		end
		newx = -(lastx - mouse.X)
		newy = -(lasty - mouse.Y)
		oldspeedx = newx
		oldspeedy = newy
		lerp()
	else
		if oldspeedx >= 1 then
			oldspeedx -= SpeedPhysicsLower
		end
		if oldspeedy >= 1 then
			oldspeedy -= SpeedPhysicsLower
		end
		if oldspeedx <= -1 then
			oldspeedx += SpeedPhysicsLower
		end
		if oldspeedy <= -1 then
			oldspeedy += SpeedPhysicsLower
		end
		if oldspeedx >-1 and oldspeedx < 1 then
			oldspeedx = 0
		end
		if oldspeedy >-1 and oldspeedy < 1 then
			oldspeedy = 0
		end
		lerp()
	end
	lasty = mouse.Y
	lastx = mouse.X
end
