-- general avoid players made by Terry Davis on v3rmillion.net
-- Toggle on and off by changing _G.On to false or true
_G.On = true -- switch to false to stop
local TRIGGER_DISTANCE = 25 -- changes size of radius
local MAX_DISTANCE = game.Workspace.Structure.Baseplate.Size.X / 2 or 500 -- change this to the baseplate of your game or whatever size you have

RunService = game:GetService("RunService")
local LP = game.Players.LocalPlayer
local connection
local moveToEnabled = true
local block = Instance.new("Part")
block.CanCollide = false
block.Shape = Enum.PartType.Cylinder
block.Orientation = Vector3.new(0, 0, 90)
block.Size = Vector3.new(1, TRIGGER_DISTANCE * 2, TRIGGER_DISTANCE * 2)
block.Transparency = 0.5
block.Anchored = true
block.Parent = game.Workspace

function onHeartBeat()
    local closestPos = TRIGGER_DISTANCE
    closest = nil
    local CHAR = LP.Character
    local HRP = CHAR:WaitForChild("HumanoidRootPart")
    local HUMANOID = CHAR:FindFirstChildOfClass("Humanoid")

    if _G.On == false then
        connection:Disconnect()
        block:Destroy()
        return
    end

    if LP:DistanceFromCharacter(Vector3.new(0, 0, 0)) > MAX_DISTANCE then
        HUMANOID:MoveTo(Vector3.new(0, 0, 0))
    else

        for _, player in pairs(game.Players:GetChildren()) do
            if player.Character ~= nil then
                local enemyHRP = player.Character:FindFirstChild(
                                     "HumanoidRootPart")
                if enemyHRP ~= nil and
                    LP:DistanceFromCharacter(enemyHRP.Position) <= closestPos and
                    player ~= LP then
                    closestPos = LP:DistanceFromCharacter(enemyHRP.Position)
                    closest = player
                end
            end
        end
        if closest ~= nil and
            closest.Character:FindFirstChild("HumanoidRootPart") then
            local closestHRP = closest.Character:FindFirstChild(
                                   "HumanoidRootPart")
            HUMANOID:MoveTo(Vector3.new((HRP.CFrame.X - closestHRP.CFrame.X) +
                                            HRP.CFrame.X, HRP.CFrame.Y,
                                        (HRP.CFrame.Z - closestHRP.CFrame.Z) +
                                            HRP.CFrame.Z))
        end
    end

    if HRP ~= nil then block.Position = HRP.Position end
end

connection = RunService.Heartbeat:Connect(onHeartBeat)
