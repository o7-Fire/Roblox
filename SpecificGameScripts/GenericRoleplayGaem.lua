-- mm yes kill script
-- made by Nexity#2106

_G.enabled = true

local yourpos = game.Workspace.skyynt_MX4LvCE0M.Torso.Position
while wait() do
if _G.enabled == true then
local victim = game.Workspace.scriptedradio.Torso.Position
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(victim.x,victim.y,victim.z)
wait(0.1)
local A_1 = "LeftDown"
local Event = game:GetService("Workspace")["skyynt_MX4LvCE0M"].Punch.Remote
Event:FireServer(A_1)
wait(0.7)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(yourpos.x,yourpos.y,yourpos.z)
wait(0.9)
end
end
