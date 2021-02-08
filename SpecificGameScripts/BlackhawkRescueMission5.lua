-- Not o7 property
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Ronograd = Instance.new("TextButton")
local DesertTown = Instance.new("TextButton")
local MountainOutpost = Instance.new("TextButton")
local CommandCenter = Instance.new("TextButton")
local BackToMainBase = Instance.new("TextButton")

-- Properties:

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
TextLabel.Text = "BRM TP GUI by Cards#8591"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Ronograd.Name = "Ronograd"
Ronograd.Parent = Frame
Ronograd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ronograd.BackgroundTransparency = 0.500
Ronograd.BorderColor3 = Color3.fromRGB(0, 0, 0)
Ronograd.BorderSizePixel = 5
Ronograd.Position = UDim2.new(0.0704225302, 0, 0.284871906, 0)
Ronograd.Size = UDim2.new(0, 113, 0, 28)
Ronograd.Font = Enum.Font.SourceSans
Ronograd.Text = "Ronograd City"
Ronograd.TextColor3 = Color3.fromRGB(0, 0, 0)
Ronograd.TextScaled = true
Ronograd.TextSize = 14.000
Ronograd.TextWrapped = true
Ronograd.MouseButton1Click:connect(function()
    game.Players.LocalPlayer.Character:MoveTo(
        Vector3.new(3356.396, 176.642868, 479.418335))
end)

DesertTown.Name = "DesertTown"
DesertTown.Parent = Frame
DesertTown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DesertTown.BackgroundTransparency = 0.500
DesertTown.BorderColor3 = Color3.fromRGB(0, 0, 0)
DesertTown.BorderSizePixel = 5
DesertTown.Position = UDim2.new(0.545774639, 0, 0.284871906, 0)
DesertTown.Size = UDim2.new(0, 113, 0, 28)
DesertTown.Font = Enum.Font.SourceSans
DesertTown.Text = "Desert Town"
DesertTown.TextColor3 = Color3.fromRGB(0, 0, 0)
DesertTown.TextScaled = true
DesertTown.TextSize = 14.000
DesertTown.TextWrapped = true
DesertTown.MouseButton1Click:connect(function()
    game.Players.LocalPlayer.Character:MoveTo(
        Vector3.new(-4972.27979, 107.465622, 5641.16016))
end)

MountainOutpost.Name = "MountainOutpost"
MountainOutpost.Parent = Frame
MountainOutpost.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MountainOutpost.BackgroundTransparency = 0.500
MountainOutpost.BorderColor3 = Color3.fromRGB(0, 0, 0)
MountainOutpost.BorderSizePixel = 5
MountainOutpost.Position = UDim2.new(0.0704225302, 0, 0.528774381, 0)
MountainOutpost.Size = UDim2.new(0, 113, 0, 28)
MountainOutpost.Font = Enum.Font.SourceSans
MountainOutpost.Text = "Mountain Outpost"
MountainOutpost.TextColor3 = Color3.fromRGB(0, 0, 0)
MountainOutpost.TextScaled = true
MountainOutpost.TextSize = 14.000
MountainOutpost.TextWrapped = true
MountainOutpost.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character:MoveTo(
            Vector3.new(-1669.2, 1200.48, -4376.87))
    end)

CommandCenter.Name = "CommandCenter"
CommandCenter.Parent = Frame
CommandCenter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandCenter.BackgroundTransparency = 0.500
CommandCenter.BorderColor3 = Color3.fromRGB(0, 0, 0)
CommandCenter.BorderSizePixel = 5
CommandCenter.Position = UDim2.new(0.545774639, 0, 0.528774381, 0)
CommandCenter.Size = UDim2.new(0, 113, 0, 28)
CommandCenter.Font = Enum.Font.SourceSans
CommandCenter.Text = "Command Center"
CommandCenter.TextColor3 = Color3.fromRGB(0, 0, 0)
CommandCenter.TextScaled = true
CommandCenter.TextSize = 14.000
CommandCenter.TextWrapped = true
CommandCenter.MouseButton1Click:connect(function()
    game.Players.LocalPlayer.Character:MoveTo(
        Vector3.new(-3526.24243, 64.1496964, 533.052063))
end)

BackToMainBase.Name = "Rearm"
BackToMainBase.Parent = Frame
BackToMainBase.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BackToMainBase.BackgroundTransparency = 0.500
BackToMainBase.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackToMainBase.BorderSizePixel = 5
BackToMainBase.Position = UDim2.new(0.235915512, 0, 0.778774381, 0)
BackToMainBase.Size = UDim2.new(0, 149, 0, 28)
BackToMainBase.Font = Enum.Font.SourceSans
BackToMainBase.Text = "Main Base (for ammo and medkits)"
BackToMainBase.TextColor3 = Color3.fromRGB(0, 0, 0)
BackToMainBase.TextScaled = true
BackToMainBase.TextSize = 14.000
BackToMainBase.TextWrapped = true
BackToMainBase.MouseButton1Click:connect(
    function()
        game.Players.LocalPlayer.Character:MoveTo(
            Vector3.new(3571, 176.5745, 1153.81))
    end)
