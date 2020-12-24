--[[ Options ]]--
_G.CharacterBug = false --Set to true if your uppertorso floats when you use godmode with R15 To R6.
_G.GodMode = true --Set to true if you want godmode.
_G.R6 = true --Set to true if you wanna enable R15 to R6 when your R15.
--[[Reanimate]]--
loadstring(game:HttpGet("https://paste.ee/r/pt8Dx/0"))()
-----------------
repeat wait() until _G.MSG ~= nil
repeat wait() until _G.MSG.Text == ""
-----------------

function GetPlayer(name)
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.Name:lower():sub(1, #name) == name:lower() then
			return v
		end
	end    
end

local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart
local killing = false
local victim = nil

hrp.Transparency = 0.5
if hrp:FindFirstChildOfClass("AlignPosition") then
	hrp:FindFirstChildOfClass("AlignPosition"):Destroy()
end
if hrp:FindFirstChildOfClass("AlignOrientation") then
	hrp:FindFirstChildOfClass("AlignOrientation"):Destroy()
end
local bp = Instance.new("BodyPosition", hrp)
bp.D = 9999999
bp.P = 999999999999999
bp.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
flinger = Instance.new("BodyAngularVelocity",hrp)
flinger.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
flinger.P = 1000000000000000000000000000
flinger.AngularVelocity = Vector3.new(10000,10000,10000)

plr.Chatted:Connect(function(msg)
	if string.sub(msg, 1, 6) == "/kill " then
		if plrs:FindFirstChild(string.sub(msg, 7)) then
			victim = plrs:FindFirstChild(string.sub(msg, 7))
			killing = true
			wait(0.7)
			killing = false
		else
			if GetPlayer(string.sub(msg, 7)) then
				victim = GetPlayer(string.sub(msg, 7))
				killing = true
				wait(0.7)
				killing = false
			else
				print("Player not found!")
			end
		end
	end
end)

plrs.PlayerRemoving:Connect(function(player)
	if player == victim then
		killing = false
	end
end)

spawn(function()
	while game:GetService("RunService").Heartbeat:Wait() do
		if killing == false then
			bp.Position = char.NullwareReanim.Torso.Position
		else
			if victim.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
				bp.Position = victim.Character.Torso.Position
			else
				bp.Position = victim.Character.UpperTorso.Position
			end
		end
	end
end)
