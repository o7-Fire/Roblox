-- https://v3rmillion.net/showthread.php?tid=1101457
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
local args = { [1] = true } workspace.RefreshLocks:FireServer(unpack(args))
noclip = false
game:GetService('RunService').Stepped:connect(function()
if noclip then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
noclip = not noclip
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
local Character = game:GetService('Players').LocalPlayer.Character
wait(3)
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-69.0208588, 108.308792, 644.431091))
wait(1)
local CFrameEnd = CFrame.new(-41.7870445, 77.1494141, 8675.35059) -- Place your coords in here
local Time = 33-- Time in seconds
local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
tween:Play()
tween.Completed:Wait(X) --- Completes, no need for additional wait time
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-63.2413521, -357.34967, 8819.09277)) wait(0.5)
local CFrameEnd = CFrame.new(-55.8801956, -361.116333, 9488.1377) -- Place your coords in here
local Time = 0 -- Time in seconds
local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
tween:Play()
tween.Completed:Wait(X)
game.Players.LocalPlayer.CharacterAdded:Connect(function()
wait(3)
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-69.0208588, 108.308792, 644.431091))
wait(1)
local CFrameEnd = CFrame.new(-41.7870445, 77.1494141, 8675.35059) -- Place your coords in here
local Time = 33-- Time in seconds
local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
tween:Play()
tween.Completed:Wait(X) --- Completes, no need for additional wait time
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-63.2413521, -357.34967, 8819.09277)) wait(0.5)
local CFrameEnd = CFrame.new(-55.8801956, -361.116333, 9488.1377) -- Place your coords in here
local Time = 0 -- Time in seconds
local tween =  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(Time), {CFrame = CFrameEnd})
tween:Play()
tween.Completed:Wait(X)
end)
for i=1, math.huge do
wait(200)
game.Players.LocalPlayer.Character.Head:Destroy() end
