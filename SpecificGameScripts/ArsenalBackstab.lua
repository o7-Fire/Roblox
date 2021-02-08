local localplayer = game.Players.LocalPlayer
local currentcamera = workspace.CurrentCamera
-- local virtualUser = game:GetService("VirtualUser")

local function teleportBehindTarget(player)
    localplayer.Character.HumanoidRootPart.CFrame =
        player.Character.HumanoidRootPart.CFrame +
            player.Character.HumanoidRootPart.CFrame.lookVector * -4
end

local function getRandomEnemyPlayer()
    local list = {}
    for i, player in pairs(game.Players:GetPlayers()) do
        if player.TeamColor ~= localplayer.TeamColor then
            table.insert(list, 1, player)
        end
    end
    return list[math.random(1, #list)]
end

while wait(0.3) do
    local enemy = getRandomEnemyPlayer()
    for i = 1, 10 do
        if not enemy.Character:FindFirstChild("HumanoidRootPart") then
            break
        end
        if enemy == nil then break end
        teleportBehindTarget(enemy)
        wait()
        currentcamera.CFrame = CFrame.new(currentcamera.CFrame.p,
                                          enemy.Character.HumanoidRootPart
                                              .Position)
        -- virtualUser:ClickButton1(Vector2.new(0,0))
    end
end
