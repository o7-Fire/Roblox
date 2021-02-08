-- KingDeathWalker stupid scriptptptpt
local player = game.Players.LocalPlayer
local char = player.Character
local hump = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")

screenie = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
screenie:Clone().Parent = CoreGui
box = Instance.new("TextBox", screenie)
screenie.Name = "screenie"
box.Position = UDim2.new(0.5, 0, 0.074, 0)
box.Size = UDim2.new(0, 412, 0, 50)
box.AnchorPoint = Vector2.new(0.5, 0.5)
box.Text = "Type Username Here! Hold Tool To Stop!"
box.TextScaled = true
box.Draggable = true

local speedBox = Instance.new("TextBox", screenie)
speedBox.Name = "SpeedBox"
speedBox.Size = UDim2.new(0, 73, 0, 50)
speedBox.Position = UDim2.new(0.764, 0, 0.15, 0)
speedBox.TextScaled = true
speedBox.AnchorPoint = Vector2.new(0.5, 0.5)
speedBox.Text = .01
speedBox.Draggable = true

local NumberV = Instance.new("NumberValue", speedBox)
NumberV.Name = "Speed"
NumberV.Value = speedBox.Text

go = Instance.new("TextButton", screenie)
go.Name = "go"
go.Position = UDim2.new(0.764, 0, 0.074, 0)
go.Size = UDim2.new(0, 73, 0, 50)
go.AnchorPoint = Vector2.new(0.5, 0.5)
go.TextScaled = true
go.Text = "Go!"
go.Draggable = true

speedText = Instance.new("TextButton", screenie)
speedText.Name = "speedText"
speedText.Text = "Click To Set Speed"
speedText.TextScaled = true
speedText.Size = UDim2.new(0, 73, 0, 50)
speedText.Position = UDim2.new(0.764, 0, 0.225, 0)
speedText.AnchorPoint = Vector2.new(0.5, 0.5)
speedText.Draggable = true
speedText.MouseButton1Click:Connect(function() NumberV.Value = speedBox.Text end)

go.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local char = player.Character
    local hum = char:WaitForChild("Humanoid")
    local hump = char:FindFirstChild("HumanoidRootPart")
    AnimationId = "42071631"
    local Anim = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://" .. AnimationId
    local Anim = hum:LoadAnimation(Anim)

    victim = box.Text
    if workspace:FindFirstChild(box.Text) then
        victimHump = workspace:FindFirstChild(victim)
    end

    while wait(NumberV.Value) do
        if workspace:FindFirstChild(box.Text) then
            if char:FindFirstChild("HumanoidRootPart") then
                Anim:Play()
                Anim:AdjustSpeed(1)
                char.HumanoidRootPart.CFrame =
                    victimHump.HumanoidRootPart.CFrame - hump.CFrame.lookVector -
                        hump.CFrame.lookVector

                wait(NumberV.Value)

                char.HumanoidRootPart.CFrame =
                    hump.CFrame + hump.CFrame.lookVector * .15 +
                        hump.CFrame.lookVector * .15 + hump.CFrame.lookVector *
                        .15

                wait(NumberV.Value)

                char.HumanoidRootPart.CFrame =
                    hump.CFrame + hump.CFrame.lookVector * .3 +
                        hump.CFrame.lookVector * .3 + hump.CFrame.lookVector *
                        .3 -- char.HumanoidRootPart.CFrame = victimHump.HumanoidRootPart.CFrame - hump.CFrame.lookVector - hump.CFrame.lookVector

                wait(NumberV.Value)

                char.HumanoidRootPart.CFrame =
                    hump.CFrame - hump.CFrame.lookVector * .15 -
                        hump.CFrame.lookVector * .15 - hump.CFrame.lookVector *
                        .15

                if char:FindFirstChildWhichIsA("Tool") then
                    Anim:Stop()
                    break
                end
            end
        end
    end

end)
