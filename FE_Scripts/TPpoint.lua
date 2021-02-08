local lastPoint
local targetPoint
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ToTarget = Instance.new("TextButton")
local GoBack = Instance.new("TextButton")
local SetPos = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.500
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 5
Frame.Position = UDim2.new(0.686852515, 0, 0.576456368, 0)
Frame.Size = UDim2.new(0, 284, 0, 164)
Frame.Draggable = true
Frame.Active = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.246478871, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 144, 0, 36)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "TP GUI [o7]"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

ToTarget.Name = "ToTarget"
ToTarget.Parent = Frame
ToTarget.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToTarget.BackgroundTransparency = 0.500
ToTarget.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToTarget.BorderSizePixel = 5
ToTarget.Position = UDim2.new(0.0704225302, 0, 0.284871906, 0)
ToTarget.Size = UDim2.new(0, 113, 0, 28)
ToTarget.Font = Enum.Font.SourceSans
ToTarget.Text = "To Target"
ToTarget.TextColor3 = Color3.fromRGB(0, 0, 0)
ToTarget.TextScaled = true
ToTarget.TextSize = 14.000
ToTarget.TextWrapped = true
ToTarget.MouseButton1Click:connect(function()
    if targetPoint then
        lastPoint = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character:MoveTo(targetPoint)
    end
end)

GoBack.Name = "GoBack"
GoBack.Parent = Frame
GoBack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GoBack.BackgroundTransparency = 0.500
GoBack.BorderColor3 = Color3.fromRGB(0, 0, 0)
GoBack.BorderSizePixel = 5
GoBack.Position = UDim2.new(0.545774639, 0, 0.284871906, 0)
GoBack.Size = UDim2.new(0, 113, 0, 28)
GoBack.Font = Enum.Font.SourceSans
GoBack.Text = "Go Back"
GoBack.TextColor3 = Color3.fromRGB(0, 0, 0)
GoBack.TextScaled = true
GoBack.TextSize = 14.000
GoBack.TextWrapped = true
GoBack.MouseButton1Click:connect(function()
    if lastPoint then game.Players.LocalPlayer.Character:MoveTo(lastPoint) end
end)

SetPos.Name = "SetPos"
SetPos.Parent = Frame
SetPos.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SetPos.BackgroundTransparency = 0.500
SetPos.BorderColor3 = Color3.fromRGB(0, 0, 0)
SetPos.BorderSizePixel = 5
SetPos.Position = UDim2.new(0.0704225302, 0, 0.528774381, 0)
SetPos.Size = UDim2.new(0, 113, 0, 28)
SetPos.Font = Enum.Font.SourceSans
SetPos.Text = "Set Pos"
SetPos.TextColor3 = Color3.fromRGB(0, 0, 0)
SetPos.TextScaled = true
SetPos.TextSize = 14.000
SetPos.TextWrapped = true
SetPos.MouseButton1Click:connect(function()
    targetPoint = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
end)
