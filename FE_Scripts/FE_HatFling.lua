-- script made by kuraga#4659
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v.ClassName == "Accessory" then v.Parent = workspace end
end
game.Players.LocalPlayer.Character:BreakJoints()
wait(7)
game.Players.LocalPlayer.MaximumSimulationRadius =
    math.pow(math.huge, math.huge) * math.huge
game.Players.LocalPlayer.SimulationRadius =
    math.pow(math.huge, math.huge) * math.huge
game:GetService("RunService").Stepped:wait()
v = game.Workspace["LongStraightHair"].Handle
local temp = Instance.new("BodyPosition")
temp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
temp.Parent = v
game.Players.LocalPlayer.MaximumSimulationRadius =
    math.pow(math.huge, math.huge) * math.huge
game.Players.LocalPlayer.SimulationRadius =
    math.pow(math.huge, math.huge) * math.huge
game:GetService("RunService").Stepped:wait()
local temp1 = Instance.new("BodyThrust")
temp1.Location = Vector3.new(5, 0, 0)
temp1.Force = Vector3.new(4000, 4000, 4000)
temp1.Parent = v
v.CanCollide = false
while wait() do
    temp.Position = game.Players.LocalPlayer:GetMouse().Hit.p +
                        Vector3.new(0, 1, 0)
end
