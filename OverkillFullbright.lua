local FullBrightBySirrVindict1234 = Instance.new("ScreenGui")
local Screen = Instance.new("Frame")
local Background = Instance.new("ImageLabel")
local Sun = Instance.new("ImageLabel")
local ImageLabel = Instance.new("ImageLabel")
local Toggle = Instance.new("TextButton")
local Moon = Instance.new("ImageLabel")
local ImageLabel_2 = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local ToggleClick = Instance.new("Sound")
local Enabled = false
local BeforeFullBright = game.Lighting.Brightness
local BeforeLightColor = game.Lighting.OutdoorAmbient
local PointLight = Instance.new("PointLight")
PointLight.Brightness = 0
PointLight.Range = 60
PointLight.Enabled = true
PointLight.Color = Color3.new(1,1,1)
PointLight.Parent = game.Players.LocalPlayer.Character.Head
ToggleClick.SoundId = "rbxassetid://3231066768"
ToggleClick.Parent = workspace
FullBrightBySirrVindict1234.Name = "FullBrightBySirrVindict#1234"
FullBrightBySirrVindict1234.Parent = game.CoreGui
FullBrightBySirrVindict1234.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Screen.Name = "Screen"
Screen.Parent = FullBrightBySirrVindict1234
Screen.BackgroundColor3 = Color3.new(1, 1, 1)
Screen.BackgroundTransparency = 1
Screen.BorderSizePixel = 0
Screen.Size = UDim2.new(10.0658178, 100, 10.0358772, 100)
Background.Name = "Background"
Background.Parent = Screen
Background.BackgroundColor3 = Color3.new(1, 1, 1)
Background.BackgroundTransparency = 1
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.0844934136, 0, 0.0898809582, 0)
Background.Size = UDim2.new(0, 213, 0, 62)
Background.Image = "rbxassetid://3248139990"
Sun.Name = "Sun"
Sun.Parent = Background
Sun.BackgroundColor3 = Color3.new(1, 1, 1)
Sun.BackgroundTransparency = 1
Sun.BorderSizePixel = 0
Sun.Position = UDim2.new(0.112676024, 0, 0.122570962, 0)
Sun.Size = UDim2.new(0, 43, 0, 43)
Sun.ZIndex = 1
Sun.Image = "rbxassetid://232918622"
Sun.ImageColor3 = Color3.new(0.807843, 0.807843, 0.807843)
Sun.Visible = false
ImageLabel.Parent = Sun
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.0930232406, 0, 0.116279073, 0)
ImageLabel.Size = UDim2.new(0, 34, 0, 32)
ImageLabel.Image = "rbxassetid://1431606886"
Toggle.Name = "Toggle"
Toggle.Parent = Background
Toggle.BackgroundColor3 = Color3.new(1, 1, 1)
Toggle.BackgroundTransparency = 1
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0.110798009, 0, 0.138700426, 0)
Toggle.Size = UDim2.new(0, 166, 0, 43)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = ""
Toggle.TextColor3 = Color3.new(0, 0, 0)
Toggle.TextSize = 14
Toggle.MouseButton1Down:connect(function()
if Enabled == false then
Sun.Visible = true
Moon.Visible = false
if Sun.Position == UDim2.new(0.112676024, 0, 0.122570962, 0) then
ToggleClick:Play()
PointLight.Brightness = 10
game.Lighting.OutdoorAmbient = Color3.new(1,1,1)
Sun:TweenPosition(UDim2.new(0.69295764, 0, 0.138700426, 0),0, 4, 1)
game.Lighting.Brightness = 1000
ImageLabel.Image = "rbxassetid://1431606886"
wait(0.6)
else
ToggleClick:Play()
PointLight.Brightness = 0
Sun:TweenPosition(UDim2.new(0.112676024, 0, 0.122570962, 0),0, 4, 1)
game.Lighting.Brightness = BeforeFullBright
game.Lighting.OutdoorAmbient = BeforeLightColor
ImageLabel.Image = "rbxassetid://81854182"
wait(0.6)
end
else
Sun.Visible = false
Moon.Visible = true
end
end)
Moon.Name = "Moon"
Moon.Parent = Background
Moon.BackgroundColor3 = Color3.new(1, 1, 1)
Moon.BackgroundTransparency = 1
Moon.BorderSizePixel = 0
Moon.Position = UDim2.new(0.110798001, 0, 0.138700426, 0)
Moon.Size = UDim2.new(0, 44, 0, 43)
Moon.Image = "rbxassetid://232918622"
Moon.ImageColor3 = Color3.new(0.807843, 0.807843, 0.807843)
ImageLabel_2.Parent = Moon
ImageLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel_2.BackgroundTransparency = 1
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(0.0465116277, 0, 0.0465116277, 0)
ImageLabel_2.Size = UDim2.new(0, 39, 0, 38)
ImageLabel_2.Image = "rbxassetid://81854182"
TextLabel.Parent = Background
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.188053727, 0, -0.314584196, 0)
TextLabel.Size = UDim2.new(0, 132, 0, 27)
TextLabel.Font = Enum.Font.Highway
TextLabel.Text = "Fullbright Remote"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextWrapped = true
