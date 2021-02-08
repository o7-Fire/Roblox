-- Made By Kurokku/Rebug REX--
-- Settings:
local RemoteIgnores = {
    ["RemoteFunction"] = true,
    ["RemoteEvent"] = true,
    ["BindableFunction"] = false,
    ["BindableEvent"] = false
}

------------------------------------------

local MrSpyV2RebugKurokkusGhost = Instance.new("ScreenGui")
local Hub = Instance.new("TextButton")
local Main = Instance.new("Frame")
local BG = Instance.new("ImageLabel")
local ShadowHolder = Instance.new("Frame")
local Shadow = Instance.new("ImageLabel")
local Shadow_2 = Instance.new("ImageLabel")
local Shadow_3 = Instance.new("ImageLabel")
local Animate = Instance.new("Frame")
local Texture = Instance.new("ImageLabel")
local Texture2 = Instance.new("ImageLabel")
local Texture3 = Instance.new("ImageLabel")
local Texture4 = Instance.new("ImageLabel")
local TabsFolder = Instance.new("Frame")
local Output = Instance.new("Frame")
local OutputWindow = Instance.new("ScrollingFrame")
local R2S = Instance.new("Frame")
local Warning = Instance.new("Frame")
local Logo = Instance.new("ImageLabel")
local Shadow_4 = Instance.new("ImageLabel")
local Shadow_5 = Instance.new("ImageLabel")
local Shadow_6 = Instance.new("ImageLabel")
local WarningLabel = Instance.new("TextLabel")
local Shadow_7 = Instance.new("TextLabel")
local Shadow_8 = Instance.new("TextLabel")
local Shadow_9 = Instance.new("TextLabel")
local Window = Instance.new("Frame")
local ScriptWindow = Instance.new("ScrollingFrame")
local RemoteScript = Instance.new("TextLabel")
local CopyClip = Instance.new("TextButton")
local Shadow_10 = Instance.new("Frame")
local Shadow_11 = Instance.new("Frame")
local Shadow_12 = Instance.new("Frame")
local CopyText = Instance.new("TextLabel")
local BG_2 = Instance.new("TextLabel")
local BG_3 = Instance.new("TextLabel")
local BG_4 = Instance.new("TextLabel")
local Remotes = Instance.new("ScrollingFrame")
local Explorer = Instance.new("Frame")
local Warning_2 = Instance.new("Frame")
local Logo_2 = Instance.new("ImageLabel")
local Shadow_13 = Instance.new("ImageLabel")
local Shadow_14 = Instance.new("ImageLabel")
local Shadow_15 = Instance.new("ImageLabel")
local WarningLabel_2 = Instance.new("TextLabel")
local Shadow_16 = Instance.new("TextLabel")
local Shadow_17 = Instance.new("TextLabel")
local Shadow_18 = Instance.new("TextLabel")
local Window_2 = Instance.new("Frame")
local ExplorerWindow = Instance.new("ScrollingFrame")
local Shadow_19 = Instance.new("Frame")
local Shadow_20 = Instance.new("Frame")
local Shadow_21 = Instance.new("Frame")
local Shadow_22 = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Credits = Instance.new("TextLabel")
local Icon = Instance.new("ImageLabel")
local Exit = Instance.new("ImageButton")
local ShadowHolder_2 = Instance.new("Frame")
local Shadow_23 = Instance.new("ImageLabel")
local Shadow_24 = Instance.new("ImageLabel")
local Shadow_25 = Instance.new("ImageLabel")
local Tabs = Instance.new("Frame")
local TabLine = Instance.new("Frame")
local Remotes_2 = Instance.new("TextButton")
local Spys = Instance.new("Frame")
local Spyer = Instance.new("ImageButton")
local Shadow_26 = Instance.new("ImageLabel")
local Shadow_27 = Instance.new("ImageLabel")
local Shadow_28 = Instance.new("ImageLabel")
local Words = Instance.new("TextLabel")
local Output_2 = Instance.new("TextButton")
local ClearHolder = Instance.new("Frame")
local Clear = Instance.new("ImageButton")
local Shadow_29 = Instance.new("ImageLabel")
local Shadow_30 = Instance.new("ImageLabel")
local Shadow_31 = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Explorer_2 = Instance.new("TextButton")
local R2S_2 = Instance.new("TextButton")
local Holder = Instance.new("Frame")
local Icon_2 = Instance.new("Frame")
local IconMap = Instance.new("ImageLabel")
local RemoteGrid = Instance.new("UIGridLayout")
local RemoteTemplate = Instance.new("Frame")
local Icon_3 = Instance.new("Frame")
local IconMap_2 = Instance.new("ImageLabel")
local RemoteName = Instance.new("TextLabel")
local Spy = Instance.new("TextButton")
local Shadow_32 = Instance.new("Frame")
local Shadow_33 = Instance.new("Frame")
local Shadow_34 = Instance.new("Frame")
local View = Instance.new("TextButton")
local Shadow_35 = Instance.new("Frame")
local Shadow_36 = Instance.new("Frame")
local Shadow_37 = Instance.new("Frame")
local ExplorerTemplate = Instance.new("Frame")
local Arrow = Instance.new("Frame")
local Open = Instance.new("TextButton")
local IconMap_3 = Instance.new("ImageLabel")
local Icon_4 = Instance.new("Frame")
local IconMap_4 = Instance.new("ImageLabel")
local InstanceName = Instance.new("TextLabel")
local Open_2 = Instance.new("TextButton")
local Holder_2 = Instance.new("Frame")
local BG_5 = Instance.new("Frame")
local RemoteOutputTemplate = Instance.new("Frame")
local Icon_5 = Instance.new("Frame")
local IconMap_5 = Instance.new("ImageLabel")
local RemoteName_2 = Instance.new("TextLabel")
local R2S_3 = Instance.new("TextButton")
local Shadow_38 = Instance.new("Frame")
local Shadow_39 = Instance.new("Frame")
local Shadow_40 = Instance.new("Frame")
-- Properties:
MrSpyV2RebugKurokkusGhost.Name = "Mr.Spy V2 - Rebug/KurokkusGhost"
MrSpyV2RebugKurokkusGhost.Parent =
    game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
MrSpyV2RebugKurokkusGhost.ResetOnSpawn = false

Hub.Name = "Hub"
Hub.Parent = MrSpyV2RebugKurokkusGhost
Hub.AnchorPoint = Vector2.new(0.5, 0.5)
Hub.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
Hub.BorderSizePixel = 0
Hub.Position = UDim2.new(0.5, 0, 0.349999994, 0)
Hub.Size = UDim2.new(0, 550, 0, 50)
Hub.ZIndex = 10
Hub.AutoButtonColor = false
Hub.Font = Enum.Font.SourceSans
Hub.Text = ""
Hub.TextColor3 = Color3.new(0, 0, 0)
Hub.TextSize = 14

Main.Name = "Main"
Main.Parent = Hub
Main.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Main.BackgroundTransparency = 1
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0, 0, 1, 0)
Main.Size = UDim2.new(1, 50, 0, 300)
Main.ZIndex = 5

BG.Name = "BG"
BG.Parent = Main
BG.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
BG.BackgroundTransparency = 1
BG.Position = UDim2.new(0, 0, 0, -25)
BG.Size = UDim2.new(1, 0, 1, 25)
BG.ZIndex = 5
BG.Image = "rbxassetid://2052866575"
BG.ImageColor3 = Color3.new(0.137255, 0.137255, 0.137255)
BG.ScaleType = Enum.ScaleType.Slice
BG.SliceCenter = Rect.new(8, 8, 8, 8)

ShadowHolder.Name = "ShadowHolder"
ShadowHolder.Parent = BG
ShadowHolder.BackgroundColor3 = Color3.new(1, 1, 1)
ShadowHolder.BackgroundTransparency = 1
ShadowHolder.ClipsDescendants = true
ShadowHolder.Position = UDim2.new(0, 0, 0, 25)
ShadowHolder.Size = UDim2.new(1, 100, 1, 100)

Shadow.Name = "Shadow"
Shadow.Parent = ShadowHolder
Shadow.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0, 1, 0, -24)
Shadow.Size = UDim2.new(1, -100, 1, -100)
Shadow.ZIndex = 4
Shadow.Image = "rbxassetid://2052866575"
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.85000002384186
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(8, 8, 8, 8)

Shadow_2.Name = "Shadow"
Shadow_2.Parent = ShadowHolder
Shadow_2.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Shadow_2.BackgroundTransparency = 1
Shadow_2.Position = UDim2.new(0, 2, 0, -23)
Shadow_2.Size = UDim2.new(1, -100, 1, -100)
Shadow_2.ZIndex = 4
Shadow_2.Image = "rbxassetid://2052866575"
Shadow_2.ImageColor3 = Color3.new(0, 0, 0)
Shadow_2.ImageTransparency = 0.85000002384186
Shadow_2.ScaleType = Enum.ScaleType.Slice
Shadow_2.SliceCenter = Rect.new(8, 8, 8, 8)

Shadow_3.Name = "Shadow"
Shadow_3.Parent = ShadowHolder
Shadow_3.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Shadow_3.BackgroundTransparency = 1
Shadow_3.Position = UDim2.new(0, 3, 0, -22)
Shadow_3.Size = UDim2.new(1, -100, 1, -100)
Shadow_3.ZIndex = 4
Shadow_3.Image = "rbxassetid://2052866575"
Shadow_3.ImageColor3 = Color3.new(0, 0, 0)
Shadow_3.ImageTransparency = 0.85000002384186
Shadow_3.ScaleType = Enum.ScaleType.Slice
Shadow_3.SliceCenter = Rect.new(8, 8, 8, 8)

Animate.Name = "Animate"
Animate.Parent = Main
Animate.BackgroundColor3 = Color3.new(0.156863, 0.176471, 0.184314)
Animate.BackgroundTransparency = 1
Animate.BorderSizePixel = 0
Animate.ClipsDescendants = true
Animate.Size = UDim2.new(1, 0, 1, 0)

Texture.Name = "Texture"
Texture.Parent = Animate
Texture.BackgroundColor3 = Color3.new(1, 1, 1)
Texture.BackgroundTransparency = 1
Texture.BorderSizePixel = 0
Texture.Position = UDim2.new(0.00333333341, 0, 0.00999999978, 0)
Texture.Size = UDim2.new(2, 0, 2, 0)
Texture.ZIndex = 6
Texture.Image = "rbxassetid://922275274"
Texture.ImageColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314)
Texture.ImageTransparency = 0.5
Texture.ScaleType = Enum.ScaleType.Tile
Texture.TileSize = UDim2.new(0, 50, 0, 50)

Texture2.Name = "Texture2"
Texture2.Parent = Animate
Texture2.BackgroundColor3 = Color3.new(1, 1, 1)
Texture2.BackgroundTransparency = 1
Texture2.BorderSizePixel = 0
Texture2.Position = UDim2.new(2, 0, 2, 0)
Texture2.Size = UDim2.new(2, 0, 2, 0)
Texture2.ZIndex = 6
Texture2.Image = "rbxassetid://922275274"
Texture2.ImageColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314)
Texture2.ImageTransparency = 0.5
Texture2.ScaleType = Enum.ScaleType.Tile
Texture2.TileSize = UDim2.new(0, 50, 0, 50)

Texture3.Name = "Texture3"
Texture3.Parent = Animate
Texture3.BackgroundColor3 = Color3.new(1, 1, 1)
Texture3.BackgroundTransparency = 1
Texture3.BorderSizePixel = 0
Texture3.Position = UDim2.new(0, 0, 2, 0)
Texture3.Size = UDim2.new(2, 0, 2, 0)
Texture3.ZIndex = 6
Texture3.Image = "rbxassetid://922275274"
Texture3.ImageColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314)
Texture3.ImageTransparency = 0.5
Texture3.ScaleType = Enum.ScaleType.Tile
Texture3.TileSize = UDim2.new(0, 50, 0, 50)

Texture4.Name = "Texture4"
Texture4.Parent = Animate
Texture4.BackgroundColor3 = Color3.new(1, 1, 1)
Texture4.BackgroundTransparency = 1
Texture4.BorderSizePixel = 0
Texture4.Position = UDim2.new(2, 0, 0, 0)
Texture4.Size = UDim2.new(2, 0, 2, 0)
Texture4.ZIndex = 6
Texture4.Image = "rbxassetid://922275274"
Texture4.ImageColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314)
Texture4.ImageTransparency = 0.5
Texture4.ScaleType = Enum.ScaleType.Tile
Texture4.TileSize = UDim2.new(0, 50, 0, 50)

TabsFolder.Name = "TabsFolder"
TabsFolder.Parent = Main
TabsFolder.BackgroundColor3 = Color3.new(1, 1, 1)
TabsFolder.BackgroundTransparency = 1
TabsFolder.ClipsDescendants = true
TabsFolder.Size = UDim2.new(1, 0, 1, 0)

Output.Name = "Output"
Output.Parent = TabsFolder
Output.BackgroundColor3 = Color3.new(1, 1, 1)
Output.BackgroundTransparency = 1
Output.Position = UDim2.new(1, 0, 0, 0)
Output.Size = UDim2.new(1, 0, 1, 0)

OutputWindow.Name = "OutputWindow"
OutputWindow.Parent = Output
OutputWindow.BackgroundColor3 = Color3.new(1, 1, 1)
OutputWindow.BackgroundTransparency = 1
OutputWindow.BorderSizePixel = 0
OutputWindow.Size = UDim2.new(1, 0, 1, 0)
OutputWindow.ZIndex = 7
OutputWindow.BottomImage = "rbxassetid://2504831909"
OutputWindow.CanvasSize = UDim2.new(0, 0, 0, 0)
OutputWindow.MidImage = "rbxassetid://2504831909"
OutputWindow.ScrollBarThickness = 6
OutputWindow.TopImage = "rbxassetid://2504831909"

R2S.Name = "R2S"
R2S.Parent = TabsFolder
R2S.BackgroundColor3 = Color3.new(1, 1, 1)
R2S.BackgroundTransparency = 1
R2S.Position = UDim2.new(3, 0, 0, 0)
R2S.Size = UDim2.new(1, 0, 1, 0)

Warning.Name = "Warning"
Warning.Parent = R2S
Warning.BackgroundColor3 = Color3.new(1, 1, 1)
Warning.BackgroundTransparency = 1
Warning.Size = UDim2.new(1, 0, 1, 0)

Logo.Name = "Logo"
Logo.Parent = Warning
Logo.AnchorPoint = Vector2.new(0.5, 0)
Logo.BackgroundColor3 = Color3.new(1, 1, 1)
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.new(0.5, 0, 0.125, 0)
Logo.Size = UDim2.new(0, 150, 0, 150)
Logo.ZIndex = 7
Logo.Image = "rbxassetid://2512823206"

Shadow_4.Name = "Shadow"
Shadow_4.Parent = Logo
Shadow_4.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_4.BackgroundTransparency = 1
Shadow_4.Position = UDim2.new(0, 1, 0, 1)
Shadow_4.Size = UDim2.new(1, 0, 1, 0)
Shadow_4.ZIndex = 6
Shadow_4.Image = "rbxassetid://2512823206"
Shadow_4.ImageColor3 = Color3.new(0, 0, 0)
Shadow_4.ImageTransparency = 0.80000001192093

Shadow_5.Name = "Shadow"
Shadow_5.Parent = Logo
Shadow_5.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_5.BackgroundTransparency = 1
Shadow_5.Position = UDim2.new(0, 2, 0, 2)
Shadow_5.Size = UDim2.new(1, 0, 1, 0)
Shadow_5.ZIndex = 6
Shadow_5.Image = "rbxassetid://2512823206"
Shadow_5.ImageColor3 = Color3.new(0, 0, 0)
Shadow_5.ImageTransparency = 0.80000001192093

Shadow_6.Name = "Shadow"
Shadow_6.Parent = Logo
Shadow_6.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_6.BackgroundTransparency = 1
Shadow_6.Position = UDim2.new(0, 3, 0, 3)
Shadow_6.Size = UDim2.new(1, 0, 1, 0)
Shadow_6.ZIndex = 6
Shadow_6.Image = "rbxassetid://2512823206"
Shadow_6.ImageColor3 = Color3.new(0, 0, 0)
Shadow_6.ImageTransparency = 0.80000001192093

WarningLabel.Name = "WarningLabel"
WarningLabel.Parent = Warning
WarningLabel.AnchorPoint = Vector2.new(0.5, 1)
WarningLabel.BackgroundColor3 = Color3.new(1, 1, 1)
WarningLabel.BackgroundTransparency = 1
WarningLabel.Position = UDim2.new(0.5, 0, 0.899999976, 0)
WarningLabel.Size = UDim2.new(0.800000012, 0, 0.200000003, 0)
WarningLabel.ZIndex = 7
WarningLabel.Font = Enum.Font.SourceSansBold
WarningLabel.Text =
    "Please make sure you have selected a remote in the output to convert into a script"
WarningLabel.TextColor3 = Color3.new(1, 0.8, 0.301961)
WarningLabel.TextScaled = true
WarningLabel.TextSize = 30
WarningLabel.TextWrapped = true

Shadow_7.Name = "Shadow"
Shadow_7.Parent = WarningLabel
Shadow_7.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_7.BackgroundTransparency = 1
Shadow_7.Position = UDim2.new(0, 1, 0, 1)
Shadow_7.Size = UDim2.new(1, 0, 1, 0)
Shadow_7.ZIndex = 6
Shadow_7.Font = Enum.Font.SourceSansBold
Shadow_7.Text =
    "Please make sure you have selected a remote in the output to convert into a script"
Shadow_7.TextColor3 = Color3.new(0, 0, 0)
Shadow_7.TextScaled = true
Shadow_7.TextSize = 30
Shadow_7.TextTransparency = 0.80000001192093
Shadow_7.TextWrapped = true

Shadow_8.Name = "Shadow"
Shadow_8.Parent = WarningLabel
Shadow_8.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_8.BackgroundTransparency = 1
Shadow_8.Position = UDim2.new(0, 2, 0, 2)
Shadow_8.Size = UDim2.new(1, 0, 1, 0)
Shadow_8.ZIndex = 6
Shadow_8.Font = Enum.Font.SourceSansBold
Shadow_8.Text =
    "Please make sure you have selected a remote in the output to convert into a script"
Shadow_8.TextColor3 = Color3.new(0, 0, 0)
Shadow_8.TextScaled = true
Shadow_8.TextSize = 30
Shadow_8.TextTransparency = 0.80000001192093
Shadow_8.TextWrapped = true

Shadow_9.Name = "Shadow"
Shadow_9.Parent = WarningLabel
Shadow_9.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_9.BackgroundTransparency = 1
Shadow_9.Position = UDim2.new(0, 3, 0, 3)
Shadow_9.Size = UDim2.new(1, 0, 1, 0)
Shadow_9.ZIndex = 6
Shadow_9.Font = Enum.Font.SourceSansBold
Shadow_9.Text =
    "Please make sure you have selected a remote in the output to convert into a script"
Shadow_9.TextColor3 = Color3.new(0, 0, 0)
Shadow_9.TextScaled = true
Shadow_9.TextSize = 30
Shadow_9.TextTransparency = 0.80000001192093
Shadow_9.TextWrapped = true

Window.Name = "Window"
Window.Parent = R2S
Window.BackgroundColor3 = Color3.new(1, 1, 1)
Window.BackgroundTransparency = 1
Window.Size = UDim2.new(1, 0, 1, 0)
Window.Visible = false

ScriptWindow.Name = "ScriptWindow"
ScriptWindow.Parent = Window
ScriptWindow.BackgroundColor3 = Color3.new(1, 1, 1)
ScriptWindow.BackgroundTransparency = 1
ScriptWindow.BorderSizePixel = 0
ScriptWindow.Position = UDim2.new(0, 2, 0, 0)
ScriptWindow.Size = UDim2.new(1, -2, 1, -50)
ScriptWindow.ZIndex = 7
ScriptWindow.BottomImage = "rbxassetid://2504831909"
ScriptWindow.CanvasSize = UDim2.new(0, 0, 0, 0)
ScriptWindow.MidImage = "rbxassetid://2504831909"
ScriptWindow.ScrollBarThickness = 6
ScriptWindow.TopImage = "rbxassetid://2504831909"

RemoteScript.Name = "RemoteScript"
RemoteScript.Parent = ScriptWindow
RemoteScript.BackgroundColor3 = Color3.new(1, 1, 1)
RemoteScript.BackgroundTransparency = 1
RemoteScript.Size = UDim2.new(1, 0, 1, 0)
RemoteScript.ZIndex = 7
RemoteScript.Font = Enum.Font.SourceSansSemibold
RemoteScript.Text = ""
RemoteScript.TextColor3 = Color3.new(1, 1, 1)
RemoteScript.TextSize = 16
RemoteScript.TextXAlignment = Enum.TextXAlignment.Left
RemoteScript.TextYAlignment = Enum.TextYAlignment.Top

CopyClip.Name = "CopyClip"
CopyClip.Parent = Window
CopyClip.AnchorPoint = Vector2.new(0, 1)
CopyClip.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078)
CopyClip.BorderSizePixel = 0
CopyClip.Position = UDim2.new(0, 10, 1, -10)
CopyClip.Size = UDim2.new(1, -20, 0, 30)
CopyClip.ZIndex = 8
CopyClip.AutoButtonColor = false
CopyClip.Font = Enum.Font.SourceSansBold
CopyClip.Text = ""
CopyClip.TextColor3 = Color3.new(1, 1, 1)
CopyClip.TextSize = 20

Shadow_10.Name = "Shadow"
Shadow_10.Parent = CopyClip
Shadow_10.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_10.BackgroundTransparency = 0.80000001192093
Shadow_10.BorderSizePixel = 0
Shadow_10.Position = UDim2.new(0, 1, 0, 1)
Shadow_10.Size = UDim2.new(1, 0, 1, 0)
Shadow_10.ZIndex = 7

Shadow_11.Name = "Shadow"
Shadow_11.Parent = CopyClip
Shadow_11.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_11.BackgroundTransparency = 0.80000001192093
Shadow_11.BorderSizePixel = 0
Shadow_11.Position = UDim2.new(0, 2, 0, 2)
Shadow_11.Size = UDim2.new(1, 0, 1, 0)
Shadow_11.ZIndex = 7

Shadow_12.Name = "Shadow"
Shadow_12.Parent = CopyClip
Shadow_12.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_12.BackgroundTransparency = 0.80000001192093
Shadow_12.BorderSizePixel = 0
Shadow_12.Position = UDim2.new(0, 3, 0, 3)
Shadow_12.Size = UDim2.new(1, 0, 1, 0)
Shadow_12.ZIndex = 7

CopyText.Name = "CopyText"
CopyText.Parent = CopyClip
CopyText.BackgroundColor3 = Color3.new(1, 1, 1)
CopyText.BackgroundTransparency = 1
CopyText.Size = UDim2.new(1, 0, 1, 0)
CopyText.ZIndex = 10
CopyText.Font = Enum.Font.SourceSansBold
CopyText.Text = "Copy to clipboard"
CopyText.TextColor3 = Color3.new(1, 1, 1)
CopyText.TextSize = 20

BG_2.Name = "BG"
BG_2.Parent = CopyClip
BG_2.BackgroundColor3 = Color3.new(1, 1, 1)
BG_2.BackgroundTransparency = 1
BG_2.Position = UDim2.new(0, 1, 0, 1)
BG_2.Size = UDim2.new(1, 0, 1, 0)
BG_2.ZIndex = 9
BG_2.Font = Enum.Font.SourceSansBold
BG_2.Text = "Copy to clipboard"
BG_2.TextColor3 = Color3.new(0, 0, 0)
BG_2.TextSize = 20
BG_2.TextTransparency = 0.80000001192093

BG_3.Name = "BG"
BG_3.Parent = CopyClip
BG_3.BackgroundColor3 = Color3.new(1, 1, 1)
BG_3.BackgroundTransparency = 1
BG_3.Position = UDim2.new(0, 2, 0, 2)
BG_3.Size = UDim2.new(1, 0, 1, 0)
BG_3.ZIndex = 9
BG_3.Font = Enum.Font.SourceSansBold
BG_3.Text = "Copy to clipboard"
BG_3.TextColor3 = Color3.new(0, 0, 0)
BG_3.TextSize = 20
BG_3.TextTransparency = 0.80000001192093

BG_4.Name = "BG"
BG_4.Parent = CopyClip
BG_4.BackgroundColor3 = Color3.new(1, 1, 1)
BG_4.BackgroundTransparency = 1
BG_4.Position = UDim2.new(0, 3, 0, 3)
BG_4.Size = UDim2.new(1, 0, 1, 0)
BG_4.ZIndex = 9
BG_4.Font = Enum.Font.SourceSansBold
BG_4.Text = "Copy to clipboard"
BG_4.TextColor3 = Color3.new(0, 0, 0)
BG_4.TextSize = 20
BG_4.TextTransparency = 0.80000001192093

Remotes.Name = "Remotes"
Remotes.Parent = TabsFolder
Remotes.BackgroundColor3 = Color3.new(1, 1, 1)
Remotes.BackgroundTransparency = 1
Remotes.BorderSizePixel = 0
Remotes.Size = UDim2.new(1, 0, 1, 0)
Remotes.ZIndex = 7
Remotes.BottomImage = "rbxassetid://2504831909"
Remotes.CanvasSize = UDim2.new(0, 0, 0, 0)
Remotes.MidImage = "rbxassetid://2504831909"
Remotes.ScrollBarThickness = 6
Remotes.TopImage = "rbxassetid://2504831909"

Explorer.Name = "Explorer"
Explorer.Parent = TabsFolder
Explorer.BackgroundColor3 = Color3.new(1, 1, 1)
Explorer.BackgroundTransparency = 1
Explorer.Position = UDim2.new(2, 0, 0, 0)
Explorer.Size = UDim2.new(1, 0, 1, 0)

Warning_2.Name = "Warning"
Warning_2.Parent = Explorer
Warning_2.BackgroundColor3 = Color3.new(1, 1, 1)
Warning_2.BackgroundTransparency = 1
Warning_2.Size = UDim2.new(1, 0, 1, 0)

Logo_2.Name = "Logo"
Logo_2.Parent = Warning_2
Logo_2.AnchorPoint = Vector2.new(0.5, 0)
Logo_2.BackgroundColor3 = Color3.new(1, 1, 1)
Logo_2.BackgroundTransparency = 1
Logo_2.Position = UDim2.new(0.5, 0, 0.125, 0)
Logo_2.Size = UDim2.new(0, 150, 0, 150)
Logo_2.ZIndex = 7
Logo_2.Image = "rbxassetid://2512823206"

Shadow_13.Name = "Shadow"
Shadow_13.Parent = Logo_2
Shadow_13.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_13.BackgroundTransparency = 1
Shadow_13.Position = UDim2.new(0, 1, 0, 1)
Shadow_13.Size = UDim2.new(1, 0, 1, 0)
Shadow_13.ZIndex = 6
Shadow_13.Image = "rbxassetid://2512823206"
Shadow_13.ImageColor3 = Color3.new(0, 0, 0)
Shadow_13.ImageTransparency = 0.80000001192093

Shadow_14.Name = "Shadow"
Shadow_14.Parent = Logo_2
Shadow_14.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_14.BackgroundTransparency = 1
Shadow_14.Position = UDim2.new(0, 2, 0, 2)
Shadow_14.Size = UDim2.new(1, 0, 1, 0)
Shadow_14.ZIndex = 6
Shadow_14.Image = "rbxassetid://2512823206"
Shadow_14.ImageColor3 = Color3.new(0, 0, 0)
Shadow_14.ImageTransparency = 0.80000001192093

Shadow_15.Name = "Shadow"
Shadow_15.Parent = Logo_2
Shadow_15.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_15.BackgroundTransparency = 1
Shadow_15.Position = UDim2.new(0, 3, 0, 3)
Shadow_15.Size = UDim2.new(1, 0, 1, 0)
Shadow_15.ZIndex = 6
Shadow_15.Image = "rbxassetid://2512823206"
Shadow_15.ImageColor3 = Color3.new(0, 0, 0)
Shadow_15.ImageTransparency = 0.80000001192093

WarningLabel_2.Name = "WarningLabel"
WarningLabel_2.Parent = Warning_2
WarningLabel_2.AnchorPoint = Vector2.new(0.5, 1)
WarningLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
WarningLabel_2.BackgroundTransparency = 1
WarningLabel_2.Position = UDim2.new(0.5, 0, 0.899999976, 0)
WarningLabel_2.Size = UDim2.new(0.800000012, 0, 0.200000003, 0)
WarningLabel_2.ZIndex = 7
WarningLabel_2.Font = Enum.Font.SourceSansBold
WarningLabel_2.Text =
    "Please make sure you select a remote in the remotes tab to view its location"
WarningLabel_2.TextColor3 = Color3.new(1, 0.8, 0.301961)
WarningLabel_2.TextScaled = true
WarningLabel_2.TextSize = 30
WarningLabel_2.TextWrapped = true

Shadow_16.Name = "Shadow"
Shadow_16.Parent = WarningLabel_2
Shadow_16.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_16.BackgroundTransparency = 1
Shadow_16.Position = UDim2.new(0, 1, 0, 1)
Shadow_16.Size = UDim2.new(1, 0, 1, 0)
Shadow_16.ZIndex = 6
Shadow_16.Font = Enum.Font.SourceSansBold
Shadow_16.Text =
    "Please make sure you select a remote in the remotes tab to view its location"
Shadow_16.TextColor3 = Color3.new(0, 0, 0)
Shadow_16.TextScaled = true
Shadow_16.TextSize = 30
Shadow_16.TextTransparency = 0.80000001192093
Shadow_16.TextWrapped = true

Shadow_17.Name = "Shadow"
Shadow_17.Parent = WarningLabel_2
Shadow_17.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_17.BackgroundTransparency = 1
Shadow_17.Position = UDim2.new(0, 2, 0, 2)
Shadow_17.Size = UDim2.new(1, 0, 1, 0)
Shadow_17.ZIndex = 6
Shadow_17.Font = Enum.Font.SourceSansBold
Shadow_17.Text =
    "Please make sure you select a remote in the remotes tab to view its location"
Shadow_17.TextColor3 = Color3.new(0, 0, 0)
Shadow_17.TextScaled = true
Shadow_17.TextSize = 30
Shadow_17.TextTransparency = 0.80000001192093
Shadow_17.TextWrapped = true

Shadow_18.Name = "Shadow"
Shadow_18.Parent = WarningLabel_2
Shadow_18.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_18.BackgroundTransparency = 1
Shadow_18.Position = UDim2.new(0, 3, 0, 3)
Shadow_18.Size = UDim2.new(1, 0, 1, 0)
Shadow_18.ZIndex = 6
Shadow_18.Font = Enum.Font.SourceSansBold
Shadow_18.Text =
    "Please make sure you select a remote in the remotes tab to view its location"
Shadow_18.TextColor3 = Color3.new(0, 0, 0)
Shadow_18.TextScaled = true
Shadow_18.TextSize = 30
Shadow_18.TextTransparency = 0.80000001192093
Shadow_18.TextWrapped = true

Window_2.Name = "Window"
Window_2.Parent = Explorer
Window_2.BackgroundColor3 = Color3.new(1, 1, 1)
Window_2.BackgroundTransparency = 1
Window_2.Size = UDim2.new(1, 0, 1, 0)
Window_2.Visible = false
Window_2.ZIndex = 7

ExplorerWindow.Name = "ExplorerWindow"
ExplorerWindow.Parent = Window_2
ExplorerWindow.BackgroundColor3 = Color3.new(1, 1, 1)
ExplorerWindow.BackgroundTransparency = 1
ExplorerWindow.Size = UDim2.new(1, 0, 1, 0)
ExplorerWindow.ZIndex = 7
ExplorerWindow.BottomImage = "rbxassetid://2504831909"
ExplorerWindow.CanvasSize = UDim2.new(0, 0, 0, 0)
ExplorerWindow.MidImage = "rbxassetid://2504831909"
ExplorerWindow.ScrollBarThickness = 6
ExplorerWindow.TopImage = "rbxassetid://2504831909"

Shadow_19.Name = "Shadow"
Shadow_19.Parent = Hub
Shadow_19.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_19.BackgroundTransparency = 0.89999997615814
Shadow_19.BorderSizePixel = 0
Shadow_19.Position = UDim2.new(0, 0, 0.5, 1)
Shadow_19.Size = UDim2.new(1, 50, 0.5, 0)
Shadow_19.ZIndex = 9

Shadow_20.Name = "Shadow"
Shadow_20.Parent = Hub
Shadow_20.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_20.BackgroundTransparency = 0.89999997615814
Shadow_20.BorderSizePixel = 0
Shadow_20.Position = UDim2.new(0, 0, 0.5, 2)
Shadow_20.Size = UDim2.new(1, 50, 0.5, 0)
Shadow_20.ZIndex = 9

Shadow_21.Name = "Shadow"
Shadow_21.Parent = Hub
Shadow_21.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_21.BackgroundTransparency = 0.89999997615814
Shadow_21.BorderSizePixel = 0
Shadow_21.Position = UDim2.new(0, 0, 0.5, 3)
Shadow_21.Size = UDim2.new(1, 50, 0.5, 0)
Shadow_21.ZIndex = 9

Shadow_22.Name = "Shadow"
Shadow_22.Parent = Hub
Shadow_22.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_22.BackgroundTransparency = 0.89999997615814
Shadow_22.BorderSizePixel = 0
Shadow_22.Position = UDim2.new(0, 0, 0.5, 4)
Shadow_22.Size = UDim2.new(1, 50, 0.5, 0)
Shadow_22.ZIndex = 9

Title.Name = "Title"
Title.Parent = Hub
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 50, 0, 0)
Title.Size = UDim2.new(0, 150, 1, 0)
Title.ZIndex = 25
Title.Font = Enum.Font.SourceSansLight
Title.Text = "Mr.Spy V2"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 30
Title.TextXAlignment = Enum.TextXAlignment.Left

Credits.Name = "Credits"
Credits.Parent = Hub
Credits.BackgroundColor3 = Color3.new(1, 1, 1)
Credits.BackgroundTransparency = 1
Credits.Position = UDim2.new(0, 50, 0, 0)
Credits.Size = UDim2.new(0, 150, 1, -1)
Credits.ZIndex = 25
Credits.Font = Enum.Font.SourceSansSemibold
Credits.Text = "Created by - Rebug/KurokkusGhost"
Credits.TextColor3 = Color3.new(0.333333, 0.333333, 0.333333)
Credits.TextSize = 10
Credits.TextXAlignment = Enum.TextXAlignment.Left
Credits.TextYAlignment = Enum.TextYAlignment.Bottom

Icon.Name = "Icon"
Icon.Parent = Hub
Icon.BackgroundColor3 = Color3.new(1, 1, 1)
Icon.BackgroundTransparency = 1
Icon.Position = UDim2.new(0, 5, 0, 10)
Icon.Size = UDim2.new(0, 40, 0, 40)
Icon.ZIndex = 25
Icon.Image = "rbxassetid://2502312317"

Exit.Name = "Exit"
Exit.Parent = Hub
Exit.BackgroundColor3 = Color3.new(1, 1, 1)
Exit.BackgroundTransparency = 1
Exit.Position = UDim2.new(1, 0, 0, 0)
Exit.Size = UDim2.new(0, 50, 0, 50)
Exit.ZIndex = 25
Exit.Image = "rbxassetid://985583019"

ShadowHolder_2.Name = "ShadowHolder"
ShadowHolder_2.Parent = Exit
ShadowHolder_2.BackgroundColor3 = Color3.new(1, 1, 1)
ShadowHolder_2.BackgroundTransparency = 1
ShadowHolder_2.ClipsDescendants = true
ShadowHolder_2.Size = UDim2.new(1, 10, 1, 0)

Shadow_23.Name = "Shadow"
Shadow_23.Parent = ShadowHolder_2
Shadow_23.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_23.BackgroundTransparency = 1
Shadow_23.Position = UDim2.new(0, 1, 0, 1)
Shadow_23.Size = UDim2.new(0, 50, 0, 50)
Shadow_23.ZIndex = 24
Shadow_23.Image = "rbxassetid://985583019"
Shadow_23.ImageColor3 = Color3.new(0, 0, 0)
Shadow_23.ImageTransparency = 0.85000002384186

Shadow_24.Name = "Shadow"
Shadow_24.Parent = ShadowHolder_2
Shadow_24.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_24.BackgroundTransparency = 1
Shadow_24.Position = UDim2.new(0, 2, 0, 2)
Shadow_24.Size = UDim2.new(0, 50, 0, 50)
Shadow_24.ZIndex = 24
Shadow_24.Image = "rbxassetid://985583019"
Shadow_24.ImageColor3 = Color3.new(0, 0, 0)
Shadow_24.ImageTransparency = 0.85000002384186

Shadow_25.Name = "Shadow"
Shadow_25.Parent = ShadowHolder_2
Shadow_25.BackgroundColor3 = Color3.new(1, 1, 1)
Shadow_25.BackgroundTransparency = 1
Shadow_25.Position = UDim2.new(0, 3, 0, 3)
Shadow_25.Size = UDim2.new(0, 50, 0, 50)
Shadow_25.ZIndex = 24
Shadow_25.Image = "rbxassetid://985583019"
Shadow_25.ImageColor3 = Color3.new(0, 0, 0)
Shadow_25.ImageTransparency = 0.85000002384186

Tabs.Name = "Tabs"
Tabs.Parent = Hub
Tabs.BackgroundColor3 = Color3.new(1, 1, 1)
Tabs.BackgroundTransparency = 1
Tabs.Position = UDim2.new(0.400000006, 0, 0, 0)
Tabs.Size = UDim2.new(0.600000024, 0, 1, 0)
Tabs.ZIndex = 25

TabLine.Name = "TabLine"
TabLine.Parent = Tabs
TabLine.AnchorPoint = Vector2.new(0, 1)
TabLine.BackgroundColor3 = Color3.new(0.666667, 0.333333, 1)
TabLine.BorderSizePixel = 0
TabLine.Position = UDim2.new(0, 0, 1, 0)
TabLine.Size = UDim2.new(0.25, -1, 0, 3)
TabLine.ZIndex = 30

Remotes_2.Name = "Remotes"
Remotes_2.Parent = Tabs
Remotes_2.BackgroundColor3 = Color3.new(1, 1, 1)
Remotes_2.BackgroundTransparency = 1
Remotes_2.LayoutOrder = 1
Remotes_2.Size = UDim2.new(0.25, 0, 0, 50)
Remotes_2.ZIndex = 25
Remotes_2.Font = Enum.Font.SourceSansBold
Remotes_2.Text = "Remotes"
Remotes_2.TextColor3 = Color3.new(1, 1, 1)
Remotes_2.TextSize = 20

Spys.Name = "Spys"
Spys.Parent = Remotes_2
Spys.BackgroundColor3 = Color3.new(1, 1, 1)
Spys.BackgroundTransparency = 1
Spys.ClipsDescendants = true
Spys.Size = UDim2.new(1, 3, 1.75, 3)
Spys.ZIndex = 9

Spyer.Name = "Spyer"
Spyer.Parent = Spys
Spyer.BackgroundColor3 = Color3.new(0.843137, 0.352941, 0.290196)
Spyer.BackgroundTransparency = 1
Spyer.Position = UDim2.new(0, 0, 0, -7)
Spyer.Size = UDim2.new(1, -4, 0.5, 3)
Spyer.ZIndex = 8
Spyer.Image = "rbxassetid://2052866575"
Spyer.ImageColor3 = Color3.new(0, 0.666667, 0.364706)
Spyer.ScaleType = Enum.ScaleType.Slice
Spyer.SliceCenter = Rect.new(8, 8, 8, 8)

Shadow_26.Name = "Shadow"
Shadow_26.Parent = Spyer
Shadow_26.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Shadow_26.BackgroundTransparency = 1
Shadow_26.Position = UDim2.new(0, 1, 0, 1)
Shadow_26.Size = UDim2.new(1, 0, 1, 0)
Shadow_26.ZIndex = 7
Shadow_26.Image = "rbxassetid://2052866575"
Shadow_26.ImageColor3 = Color3.new(0, 0, 0)
Shadow_26.ImageTransparency = 0.85000002384186
Shadow_26.ScaleType = Enum.ScaleType.Slice
Shadow_26.SliceCenter = Rect.new(8, 8, 8, 8)

Shadow_27.Name = "Shadow"
Shadow_27.Parent = Spyer
Shadow_27.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Shadow_27.BackgroundTransparency = 1
Shadow_27.Position = UDim2.new(0, 2, 0, 2)
Shadow_27.Size = UDim2.new(1, 0, 1, 0)
Shadow_27.ZIndex = 7
Shadow_27.Image = "rbxassetid://2052866575"
Shadow_27.ImageColor3 = Color3.new(0, 0, 0)
Shadow_27.ImageTransparency = 0.85000002384186
Shadow_27.ScaleType = Enum.ScaleType.Slice
Shadow_27.SliceCenter = Rect.new(8, 8, 8, 8)

Shadow_28.Name = "Shadow"
Shadow_28.Parent = Spyer
Shadow_28.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Shadow_28.BackgroundTransparency = 1
Shadow_28.Position = UDim2.new(0, 3, 0, 3)
Shadow_28.Size = UDim2.new(1, 0, 1, 0)
Shadow_28.ZIndex = 7
Shadow_28.Image = "rbxassetid://2052866575"
Shadow_28.ImageColor3 = Color3.new(0, 0, 0)
Shadow_28.ImageTransparency = 0.85000002384186
Shadow_28.ScaleType = Enum.ScaleType.Slice
Shadow_28.SliceCenter = Rect.new(8, 8, 8, 8)

Words.Name = "Words"
Words.Parent = Spyer
Words.BackgroundColor3 = Color3.new(1, 1, 1)
Words.BackgroundTransparency = 1
Words.Position = UDim2.new(0, 0, 0.25, -1)
Words.Size = UDim2.new(1, 0, 0.75, 0)
Words.ZIndex = 8
Words.Font = Enum.Font.SourceSansBold
Words.Text = "Spy All"
Words.TextColor3 = Color3.new(1, 1, 1)
Words.TextSize = 20

Output_2.Name = "Output"
Output_2.Parent = Tabs
Output_2.BackgroundColor3 = Color3.new(1, 1, 1)
Output_2.BackgroundTransparency = 1
Output_2.LayoutOrder = 2
Output_2.Position = UDim2.new(0.25, 0, 0, 0)
Output_2.Size = UDim2.new(0.25, 0, 0, 50)
Output_2.ZIndex = 25
Output_2.Font = Enum.Font.SourceSansBold
Output_2.Text = "Output"
Output_2.TextColor3 = Color3.new(1, 1, 1)
Output_2.TextSize = 20

ClearHolder.Name = "ClearHolder"
ClearHolder.Parent = Output_2
ClearHolder.BackgroundColor3 = Color3.new(1, 1, 1)
ClearHolder.BackgroundTransparency = 1
ClearHolder.ClipsDescendants = true
ClearHolder.Size = UDim2.new(1, 3, 1.75, 3)
ClearHolder.ZIndex = 9

Clear.Name = "Clear"
Clear.Parent = ClearHolder
Clear.BackgroundColor3 = Color3.new(0.843137, 0.352941, 0.290196)
Clear.BackgroundTransparency = 1
Clear.Position = UDim2.new(0, 0, 0, -7)
Clear.Size = UDim2.new(1, -4, 0.5, 3)
Clear.ZIndex = 8
Clear.Image = "rbxassetid://2052866575"
Clear.ImageColor3 = Color3.new(0.843137, 0.352941, 0.290196)
Clear.ScaleType = Enum.ScaleType.Slice
Clear.SliceCenter = Rect.new(8, 8, 8, 8)

Shadow_29.Name = "Shadow"
Shadow_29.Parent = Clear
Shadow_29.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Shadow_29.BackgroundTransparency = 1
Shadow_29.Position = UDim2.new(0, 1, 0, 1)
Shadow_29.Size = UDim2.new(1, 0, 1, 0)
Shadow_29.ZIndex = 7
Shadow_29.Image = "rbxassetid://2052866575"
Shadow_29.ImageColor3 = Color3.new(0, 0, 0)
Shadow_29.ImageTransparency = 0.85000002384186
Shadow_29.ScaleType = Enum.ScaleType.Slice
Shadow_29.SliceCenter = Rect.new(8, 8, 8, 8)

Shadow_30.Name = "Shadow"
Shadow_30.Parent = Clear
Shadow_30.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Shadow_30.BackgroundTransparency = 1
Shadow_30.Position = UDim2.new(0, 2, 0, 2)
Shadow_30.Size = UDim2.new(1, 0, 1, 0)
Shadow_30.ZIndex = 7
Shadow_30.Image = "rbxassetid://2052866575"
Shadow_30.ImageColor3 = Color3.new(0, 0, 0)
Shadow_30.ImageTransparency = 0.85000002384186
Shadow_30.ScaleType = Enum.ScaleType.Slice
Shadow_30.SliceCenter = Rect.new(8, 8, 8, 8)

Shadow_31.Name = "Shadow"
Shadow_31.Parent = Clear
Shadow_31.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Shadow_31.BackgroundTransparency = 1
Shadow_31.Position = UDim2.new(0, 3, 0, 3)
Shadow_31.Size = UDim2.new(1, 0, 1, 0)
Shadow_31.ZIndex = 7
Shadow_31.Image = "rbxassetid://2052866575"
Shadow_31.ImageColor3 = Color3.new(0, 0, 0)
Shadow_31.ImageTransparency = 0.85000002384186
Shadow_31.ScaleType = Enum.ScaleType.Slice
Shadow_31.SliceCenter = Rect.new(8, 8, 8, 8)

TextLabel.Parent = Clear
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 0, 0.25, -1)
TextLabel.Size = UDim2.new(1, 0, 0.75, 0)
TextLabel.ZIndex = 8
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "Clear"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 20

Explorer_2.Name = "Explorer"
Explorer_2.Parent = Tabs
Explorer_2.BackgroundColor3 = Color3.new(1, 1, 1)
Explorer_2.BackgroundTransparency = 1
Explorer_2.LayoutOrder = 3
Explorer_2.Position = UDim2.new(0.5, 0, 0, 0)
Explorer_2.Size = UDim2.new(0.25, 0, 0, 50)
Explorer_2.ZIndex = 25
Explorer_2.Font = Enum.Font.SourceSansBold
Explorer_2.Text = "Explorer"
Explorer_2.TextColor3 = Color3.new(1, 1, 1)
Explorer_2.TextSize = 20

R2S_2.Name = "R2S"
R2S_2.Parent = Tabs
R2S_2.BackgroundColor3 = Color3.new(1, 1, 1)
R2S_2.BackgroundTransparency = 1
R2S_2.LayoutOrder = 3
R2S_2.Position = UDim2.new(0.75, 0, 0, 0)
R2S_2.Size = UDim2.new(0.25, 0, 0, 50)
R2S_2.ZIndex = 25
R2S_2.Font = Enum.Font.SourceSansBold
R2S_2.Text = "R2S"
R2S_2.TextColor3 = Color3.new(1, 1, 1)
R2S_2.TextSize = 20

Holder.Name = "Holder"
Holder.Parent = MrSpyV2RebugKurokkusGhost
Holder.BackgroundColor3 = Color3.new(1, 1, 1)
Holder.Size = UDim2.new(0, 100, 0, 100)
Holder.Visible = false

Icon_2.Name = "Icon"
Icon_2.Parent = Holder
Icon_2.BackgroundColor3 = Color3.new(1, 1, 1)
Icon_2.BackgroundTransparency = 1
Icon_2.ClipsDescendants = true
Icon_2.Size = UDim2.new(0, 16, 0, 16)
Icon_2.ZIndex = 7

IconMap.Name = "IconMap"
IconMap.Parent = Icon_2
IconMap.BackgroundColor3 = Color3.new(1, 1, 1)
IconMap.BackgroundTransparency = 1
IconMap.Position = UDim2.new(0, -93, 0, -21)
IconMap.Size = UDim2.new(0, 256, 0, 256)
IconMap.ZIndex = 7
IconMap.Image = "rbxassetid://483448923"

RemoteGrid.Name = "RemoteGrid"
RemoteGrid.Parent = Holder
RemoteGrid.HorizontalAlignment = Enum.HorizontalAlignment.Right
RemoteGrid.CellPadding = UDim2.new(0, 0, 0, 4)
RemoteGrid.CellSize = UDim2.new(1, -5, 0, 16)

RemoteTemplate.Name = "RemoteTemplate"
RemoteTemplate.Parent = Holder
RemoteTemplate.BackgroundColor3 = Color3.new(1, 1, 1)
RemoteTemplate.BackgroundTransparency = 1
RemoteTemplate.Size = UDim2.new(1, -5, 0, 16)
RemoteTemplate.ZIndex = 7

Icon_3.Name = "Icon"
Icon_3.Parent = RemoteTemplate
Icon_3.BackgroundColor3 = Color3.new(1, 1, 1)
Icon_3.BackgroundTransparency = 1
Icon_3.ClipsDescendants = true
Icon_3.Size = UDim2.new(0, 16, 0, 16)
Icon_3.ZIndex = 7

IconMap_2.Name = "IconMap"
IconMap_2.Parent = Icon_3
IconMap_2.BackgroundColor3 = Color3.new(1, 1, 1)
IconMap_2.BackgroundTransparency = 1
IconMap_2.Position = UDim2.new(0, -183, 0, -93)
IconMap_2.Size = UDim2.new(0, 256, 0, 256)
IconMap_2.ZIndex = 7
IconMap_2.Image = "rbxassetid://483448923"

RemoteName.Name = "RemoteName"
RemoteName.Parent = RemoteTemplate
RemoteName.BackgroundColor3 = Color3.new(1, 1, 1)
RemoteName.BackgroundTransparency = 1
RemoteName.Position = UDim2.new(0, 20, 0, 0)
RemoteName.Size = UDim2.new(0, 200, 0, 16)
RemoteName.ZIndex = 7
RemoteName.Font = Enum.Font.SourceSans
RemoteName.Text = "GiveMoney"
RemoteName.TextColor3 = Color3.new(0.901961, 0.901961, 0.901961)
RemoteName.TextSize = 14
RemoteName.TextXAlignment = Enum.TextXAlignment.Left

Spy.Name = "Spy"
Spy.Parent = RemoteTemplate
Spy.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
Spy.BorderSizePixel = 0
Spy.Position = UDim2.new(0, 82, 0, 0)
Spy.Size = UDim2.new(0, 50, 1, 0)
Spy.ZIndex = 8
Spy.AutoButtonColor = false
Spy.Font = Enum.Font.SourceSansSemibold
Spy.Text = "Spy"
Spy.TextColor3 = Color3.new(1, 1, 1)
Spy.TextSize = 14

Shadow_32.Name = "Shadow"
Shadow_32.Parent = Spy
Shadow_32.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_32.BackgroundTransparency = 0.80000001192093
Shadow_32.BorderSizePixel = 0
Shadow_32.Position = UDim2.new(0, 1, 0, 1)
Shadow_32.Size = UDim2.new(1, 0, 1, 0)
Shadow_32.ZIndex = 7

Shadow_33.Name = "Shadow"
Shadow_33.Parent = Spy
Shadow_33.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_33.BackgroundTransparency = 0.80000001192093
Shadow_33.BorderSizePixel = 0
Shadow_33.Position = UDim2.new(0, 2, 0, 2)
Shadow_33.Size = UDim2.new(1, 0, 1, 0)
Shadow_33.ZIndex = 7

Shadow_34.Name = "Shadow"
Shadow_34.Parent = Spy
Shadow_34.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_34.BackgroundTransparency = 0.80000001192093
Shadow_34.BorderSizePixel = 0
Shadow_34.Position = UDim2.new(0, 3, 0, 3)
Shadow_34.Size = UDim2.new(1, 0, 1, 0)
Shadow_34.ZIndex = 7

View.Name = "View"
View.Parent = RemoteTemplate
View.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
View.BorderSizePixel = 0
View.Position = UDim2.new(0, 142, 0, 0)
View.Size = UDim2.new(0, 50, 1, 0)
View.ZIndex = 8
View.AutoButtonColor = false
View.Font = Enum.Font.SourceSansSemibold
View.Text = "View"
View.TextColor3 = Color3.new(1, 1, 1)
View.TextSize = 14

Shadow_35.Name = "Shadow"
Shadow_35.Parent = View
Shadow_35.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_35.BackgroundTransparency = 0.80000001192093
Shadow_35.BorderSizePixel = 0
Shadow_35.Position = UDim2.new(0, 1, 0, 1)
Shadow_35.Size = UDim2.new(1, 0, 1, 0)
Shadow_35.ZIndex = 7

Shadow_36.Name = "Shadow"
Shadow_36.Parent = View
Shadow_36.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_36.BackgroundTransparency = 0.80000001192093
Shadow_36.BorderSizePixel = 0
Shadow_36.Position = UDim2.new(0, 2, 0, 2)
Shadow_36.Size = UDim2.new(1, 0, 1, 0)
Shadow_36.ZIndex = 7

Shadow_37.Name = "Shadow"
Shadow_37.Parent = View
Shadow_37.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_37.BackgroundTransparency = 0.80000001192093
Shadow_37.BorderSizePixel = 0
Shadow_37.Position = UDim2.new(0, 3, 0, 3)
Shadow_37.Size = UDim2.new(1, 0, 1, 0)
Shadow_37.ZIndex = 7

ExplorerTemplate.Name = "ExplorerTemplate"
ExplorerTemplate.Parent = Holder
ExplorerTemplate.BackgroundColor3 = Color3.new(0.0431373, 0.352941, 0.686275)
ExplorerTemplate.BackgroundTransparency = 1
ExplorerTemplate.BorderSizePixel = 0
ExplorerTemplate.Size = UDim2.new(0, 275, 0, 20)
ExplorerTemplate.ZIndex = 7

Arrow.Name = "Arrow"
Arrow.Parent = ExplorerTemplate
Arrow.BackgroundColor3 = Color3.new(1, 1, 1)
Arrow.BackgroundTransparency = 1
Arrow.ClipsDescendants = true
Arrow.Position = UDim2.new(0, 0, 0, 2)
Arrow.Size = UDim2.new(0, 16, 0, 16)
Arrow.ZIndex = 8

Open.Name = "Open"
Open.Parent = Arrow
Open.BackgroundColor3 = Color3.new(1, 1, 1)
Open.BackgroundTransparency = 1
Open.Size = UDim2.new(1, 0, 1, 0)
Open.ZIndex = 8
Open.Font = Enum.Font.SourceSans
Open.Text = ""
Open.TextColor3 = Color3.new(0, 0, 0)
Open.TextSize = 14

IconMap_3.Name = "IconMap"
IconMap_3.Parent = Arrow
IconMap_3.BackgroundColor3 = Color3.new(1, 1, 1)
IconMap_3.BackgroundTransparency = 1
IconMap_3.Position = UDim2.new(0, -219, 0, -201)
IconMap_3.Size = UDim2.new(0, 256, 0, 256)
IconMap_3.ZIndex = 8
IconMap_3.Image = "rbxassetid://483448923"

Icon_4.Name = "Icon"
Icon_4.Parent = ExplorerTemplate
Icon_4.BackgroundColor3 = Color3.new(1, 1, 1)
Icon_4.BackgroundTransparency = 1
Icon_4.ClipsDescendants = true
Icon_4.Position = UDim2.new(0, 20, 0, 2)
Icon_4.Size = UDim2.new(0, 16, 0, 16)
Icon_4.ZIndex = 8

IconMap_4.Name = "IconMap"
IconMap_4.Parent = Icon_4
IconMap_4.BackgroundColor3 = Color3.new(1, 1, 1)
IconMap_4.BackgroundTransparency = 1
IconMap_4.Position = UDim2.new(0, -93, 0, -21)
IconMap_4.Size = UDim2.new(0, 256, 0, 256)
IconMap_4.ZIndex = 8
IconMap_4.Image = "rbxassetid://483448923"

InstanceName.Name = "InstanceName"
InstanceName.Parent = ExplorerTemplate
InstanceName.BackgroundColor3 = Color3.new(0.0431373, 0.352941, 0.686275)
InstanceName.BackgroundTransparency = 1
InstanceName.BorderSizePixel = 0
InstanceName.Position = UDim2.new(0, 42, 0, 0)
InstanceName.Size = UDim2.new(0, 275, 1, 0)
InstanceName.ZIndex = 8
InstanceName.Font = Enum.Font.SourceSans
InstanceName.Text = "Workspace"
InstanceName.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
InstanceName.TextSize = 14
InstanceName.TextXAlignment = Enum.TextXAlignment.Left

Open_2.Name = "Open"
Open_2.Parent = InstanceName
Open_2.BackgroundColor3 = Color3.new(1, 1, 1)
Open_2.BackgroundTransparency = 1
Open_2.Size = UDim2.new(1, 0, 1, 0)
Open_2.ZIndex = 8
Open_2.Font = Enum.Font.SourceSans
Open_2.Text = ""
Open_2.TextColor3 = Color3.new(0, 0, 0)
Open_2.TextSize = 14

Holder_2.Name = "Holder"
Holder_2.Parent = ExplorerTemplate
Holder_2.BackgroundColor3 = Color3.new(1, 1, 1)
Holder_2.BackgroundTransparency = 1
Holder_2.Position = UDim2.new(0, 20, 0, 20)
Holder_2.Size = UDim2.new(1, 0, 0, 20)
Holder_2.ZIndex = 8

BG_5.Name = "BG"
BG_5.Parent = ExplorerTemplate
BG_5.BackgroundColor3 = Color3.new(0.0431373, 0.352941, 0.686275)
BG_5.BackgroundTransparency = 1
BG_5.BorderSizePixel = 0
BG_5.Position = UDim2.new(0, 16, 0, 0)
BG_5.Size = UDim2.new(0, 100, 1, 0)
BG_5.ZIndex = 7

RemoteOutputTemplate.Name = "RemoteOutputTemplate"
RemoteOutputTemplate.Parent = Holder
RemoteOutputTemplate.BackgroundColor3 = Color3.new(1, 1, 1)
RemoteOutputTemplate.BackgroundTransparency = 1
RemoteOutputTemplate.Size = UDim2.new(1, -5, 0, 16)
RemoteOutputTemplate.ZIndex = 7

Icon_5.Name = "Icon"
Icon_5.Parent = RemoteOutputTemplate
Icon_5.BackgroundColor3 = Color3.new(1, 1, 1)
Icon_5.BackgroundTransparency = 1
Icon_5.ClipsDescendants = true
Icon_5.Size = UDim2.new(0, 16, 0, 16)
Icon_5.ZIndex = 7

IconMap_5.Name = "IconMap"
IconMap_5.Parent = Icon_5
IconMap_5.BackgroundColor3 = Color3.new(1, 1, 1)
IconMap_5.BackgroundTransparency = 1
IconMap_5.Position = UDim2.new(0, -183, 0, -93)
IconMap_5.Size = UDim2.new(0, 256, 0, 256)
IconMap_5.ZIndex = 7
IconMap_5.Image = "rbxassetid://483448923"

RemoteName_2.Name = "RemoteName"
RemoteName_2.Parent = RemoteOutputTemplate
RemoteName_2.BackgroundColor3 = Color3.new(1, 1, 1)
RemoteName_2.BackgroundTransparency = 1
RemoteName_2.Position = UDim2.new(0, 20, 0, 0)
RemoteName_2.Size = UDim2.new(1, -20, 0, 16)
RemoteName_2.ZIndex = 7
RemoteName_2.Font = Enum.Font.SourceSans
RemoteName_2.Text = "GiveMoney | Args: {}"
RemoteName_2.TextColor3 = Color3.new(0.901961, 0.901961, 0.901961)
RemoteName_2.TextSize = 14
RemoteName_2.TextXAlignment = Enum.TextXAlignment.Left

R2S_3.Name = "R2S"
R2S_3.Parent = RemoteOutputTemplate
R2S_3.BackgroundColor3 = Color3.new(0.235294, 0.235294, 0.235294)
R2S_3.BorderSizePixel = 0
R2S_3.Position = UDim2.new(0, 82, 0, 0)
R2S_3.Size = UDim2.new(0, 50, 1, 0)
R2S_3.ZIndex = 8
R2S_3.AutoButtonColor = false
R2S_3.Font = Enum.Font.SourceSansSemibold
R2S_3.Text = "R2S"
R2S_3.TextColor3 = Color3.new(1, 1, 1)
R2S_3.TextSize = 14

Shadow_38.Name = "Shadow"
Shadow_38.Parent = R2S_3
Shadow_38.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_38.BackgroundTransparency = 0.80000001192093
Shadow_38.BorderSizePixel = 0
Shadow_38.Position = UDim2.new(0, 1, 0, 1)
Shadow_38.Size = UDim2.new(1, 0, 1, 0)
Shadow_38.ZIndex = 7

Shadow_39.Name = "Shadow"
Shadow_39.Parent = R2S_3
Shadow_39.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_39.BackgroundTransparency = 0.80000001192093
Shadow_39.BorderSizePixel = 0
Shadow_39.Position = UDim2.new(0, 2, 0, 2)
Shadow_39.Size = UDim2.new(1, 0, 1, 0)
Shadow_39.ZIndex = 7

Shadow_40.Name = "Shadow"
Shadow_40.Parent = R2S_3
Shadow_40.BackgroundColor3 = Color3.new(0, 0, 0)
Shadow_40.BackgroundTransparency = 0.80000001192093
Shadow_40.BorderSizePixel = 0
Shadow_40.Position = UDim2.new(0, 3, 0, 3)
Shadow_40.Size = UDim2.new(1, 0, 1, 0)
Shadow_40.ZIndex = 7

getfenv().script = Instance.new('LocalScript', MrSpyV2RebugKurokkusGhost)

repeat wait() until game:GetService("Players").LocalPlayer.Character:WaitForChild(
    "HumanoidRootPart")
local Hub = script.Parent.Hub
local plr = game:GetService("Players").LocalPlayer
local Animate = Hub.Main.Animate
local Animate_Time = 30
local Exit = Hub.Exit
local colSize = 14
script.Parent.Hub.Draggable = true
local Tabs = Hub.Tabs
local TF = Hub.Main.TabsFolder
local Remotes = TF.Remotes
local Output = TF.Output
local Supplies = script.Parent.Holder
local Opened = true;
local OutputTab = Tabs.Output
local RemoteTab = Tabs.Remotes
local Explorer = TF.Explorer
local R2S = TF.R2S

local Instances = {
    ["BadgeService"] = 76,
    ["Humanoid"] = 10,
    ["GuiService"] = 48,
    ["CylinderHandleAdornment"] = 55,
    ["BallSocketConstraint"] = 90,
    ["BrickColorValue"] = 5,
    ["Accoutrement"] = 33,
    ["AdService"] = 74,
    ["AssetService"] = 73,
    ["GuiMain"] = 48,
    ["ImageButton"] = 53,
    ["HapticService"] = 85,
    ["DialogChoice"] = 64,
    ["Handles"] = 54,
    ["ReflectionMetadataClasses"] = 87,
    ["JointInstance"] = 35,
    ["AnimationController"] = 61,
    ["RemoteEvent"] = 81,
    ["CollectionService"] = 31,
    ["Smoke"] = 60,
    ["Configuration"] = 59,
    ["KeyframeSequenceProvider"] = 61,
    ["Accessory"] = 33,
    ["SelectionPointLasso"] = 58,
    ["GamePassService"] = 20,
    ["CFrameValue"] = 5,
    ["TextureTrail"] = 5,
    ["ImageLabel"] = 50,
    ["ReflectionMetadataMember"] = 87,
    ["Animation"] = 61,
    ["IntConstrainedValue"] = 5,
    ["HttpService"] = 77,
    ["PointLight"] = 14,
    ["Model"] = 3,
    ["DoubleConstrainedValue"] = 5,
    ["Snap"] = 35,
    ["BodyAngularVelocity"] = 15,
    ["VelocityMotor"] = 35,
    ["RocketPropulsion"] = 15,
    ["SurfaceSelection"] = 56,
    ["CoreGui"] = 47,
    ["Part"] = 2,
    ["ReplicatedFirst"] = 73,
    ["BindableEvent"] = 68,
    ["SelectionPartLasso"] = 58,
    ["NegateOperation"] = 79,
    ["PyramidPart"] = 2,
    ["ArcHandles"] = 57,
    ["Hint"] = 34,
    ["Players"] = 22,
    ["Script"] = 7,
    ["ParallelRampPart"] = 2,
    ["RayValue"] = 5,
    ["LineHandleAdornment"] = 55,
    ["Camera"] = 6,
    ["RunService"] = 67,
    ["BodyForce"] = 15,
    ["KeyframeSequence"] = 61,
    ["ServerScriptService"] = 1,
    ["BillboardGui"] = 65,
    ["BodyThrust"] = 15,
    ["RemoteFunction"] = 80,
    ["Team"] = 25,
    ["Sound"] = 12,
    ["GuiButton"] = 53,
    ["Workspace"] = 20,
    ["Lighting"] = 14,
    ["JointsService"] = 35,
    ["BlurEffect"] = 91,
    ["WedgePart"] = 2,
    ["BloomEffect"] = 91,
    ["ReflectionMetadata"] = 87,
    ["Vector3Value"] = 5,
    ["PointsService"] = 84,
    ["UserInputService"] = 85,
    ["Sparkles"] = 43,
    ["BodyGyro"] = 15,
    ["Rotate"] = 35,
    ["HopperBin"] = 23,
    ["ForceField"] = 38,
    ["Tool"] = 18,
    ["Texture"] = 11,
    ["Teams"] = 24,
    ["ReflectionMetadataFunctions"] = 87,
    ["RodConstraint"] = 90,
    ["Folder"] = 71,
    ["BodyVelocity"] = 15,
    ["Shirt"] = 44,
    ["SlidingBallConstraint"] = 90,
    ["Animator"] = 61,
    ["TextButton"] = 52,
    ["Color3Value"] = 5,
    ["TextBox"] = 52,
    ["NetworkReplicator"] = 30,
    ["Platform"] = 36,
    ["TerrainRegion"] = 66,
    ["SkateboardPlatform"] = 36,
    ["Seat"] = 36,
    ["Terrain"] = 66,
    ["Explosion"] = 37,
    ["BlockMesh"] = 9,
    ["TeleportService"] = 82,
    ["PlayerGui"] = 47,
    ["TextLabel"] = 51,
    ["SurfaceLight"] = 14,
    ["SurfaceGui"] = 65,
    ["Debris"] = 31,
    ["FlagStand"] = 40,
    ["StarterPack"] = 21,
    ["BindableFunction"] = 67,
    ["ReflectionMetadataCallbacks"] = 87,
    ["NetworkClient"] = 17,
    ["ModuleScript"] = 72,
    ["Flag"] = 39,
    ["Status"] = 3,
    ["ParticleEmitter"] = 70,
    ["StarterPlayer"] = 89,
    ["StringValue"] = 5,
    ["ObjectValue"] = 5,
    ["CharacterMesh"] = 61,
    ["StarterGui"] = 47,
    ["ReplicatedStorage"] = 73,
    ["StarterCharacterScripts"] = 83,
    ["NetworkServer"] = 16,
    ["Backpack"] = 21,
    ["ReflectionMetadataEnum"] = 87,
    ["StarterPlayerScripts"] = 83,
    ["SpotLight"] = 14,
    ["CustomEventReceiver"] = 5,
    ["SphereHandleAdornment"] = 55,
    ["SoundService"] = 32,
    ["SpecialMesh"] = 9,
    ["SpawnLocation"] = 26,
    ["PlayerScripts"] = 83,
    ["PartPairLasso"] = 58,
    ["ColorCorrectionEffect"] = 91,
    ["UnionOperation"] = 78,
    ["Sky"] = 29,
    ["MoveToConstraint"] = 90,
    ["RopeConstraint"] = 90,
    ["RightAngleRampPart"] = 2,
    ["ShirtGraphic"] = 41,
    ["ScreenGui"] = 48,
    ["SelectionSphere"] = 55,
    ["RotateV"] = 35,
    ["SelectionBox"] = 55,
    ["VehicleSeat"] = 36,
    ["CustomEvent"] = 5,
    ["Chat"] = 34,
    ["ServerStorage"] = 75,
    ["Selection"] = 56,
    ["IntValue"] = 5,
    ["RotateP"] = 35,
    ["FloorWire"] = 5,
    ["TrussPart"] = 2,
    ["StarterGear"] = 21,
    ["ReflectionMetadataYieldFunctions"] = 87,
    ["ReflectionMetadataProperties"] = 87,
    ["ReflectionMetadataEvents"] = 87,
    ["ReflectionMetadataEnums"] = 87,
    ["ReflectionMetadataEnumItem"] = 87,
    ["ReflectionMetadataClass"] = 87,
    ["PrismPart"] = 2,
    ["BinaryStringValue"] = 5,
    ["Glue"] = 35,
    ["PrismaticConstraint"] = 90,
    ["TouchTransmitter"] = 38,
    ["CornerWedgePart"] = 2,
    ["PathfindingService"] = 38,
    ["SpringConstraint"] = 90,
    ["Fire"] = 62,
    ["Pants"] = 45,
    ["NumberValue"] = 5,
    ["TestService"] = 69,
    ["Motor6D"] = 35,
    ["Motor"] = 35,
    ["CylindricalConstraint"] = 90,
    ["MarketplaceService"] = 47,
    ["CoreScript"] = 19,
    ["CylinderMesh"] = 9,
    ["ConeHandleAdornment"] = 55,
    ["SunRaysEffect"] = 91,
    ["LocalScript"] = 19,
    ["Weld"] = 35,
    ["Attachment"] = 35,
    ["BoolValue"] = 5,
    ["Dialog"] = 63,
    ["Pose"] = 61,
    ["Decal"] = 8,
    ["Hat"] = 46,
    ["AnimationTrack"] = 61,
    ["ClickDetector"] = 42,
    ["Frame"] = 49,
    ["LogService"] = 88,
    ["FileMesh"] = 9,
    ["InsertService"] = 73,
    ["HingeConstraint"] = 90,
    ["Message"] = 34,
    ["Player"] = 13,
    ["ContextActionService"] = 42,
    ["ContentProvider"] = 73,
    ["BodyPosition"] = 15,
    ["BoxHandleAdornment"] = 55,
    ["ScrollingFrame"] = 49,
    ["Keyframe"] = 61
}

function LoadIcon(service, frame, numb)
    if Instances[service] or numb then
        local row = 1
        local col = 0
        if numb then
            for i = 1, numb do
                if i > colSize * row then
                    col = 1
                    row = row + 1
                else
                    col = col + 1
                end
            end
        else
            for i = 1, Instances[service] do
                if i > colSize * row then
                    col = 1
                    row = row + 1
                else
                    col = col + 1
                end
            end
        end
        frame.IconMap.Position = UDim2.new(0, (-3 + (-18 * col)) + 18, 0,
                                           (-3 + (-18 * row)) + 18)
    end
end

Exit.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(Exit, TweenInfo.new(0.1), {
        ['ImageColor3'] = Color3.fromRGB(200, 200, 200)
    }):Play();
end)

Exit.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(Exit, TweenInfo.new(0.1), {
        ['ImageColor3'] = Color3.fromRGB(255, 255, 255)
    }):Play();
end)

Exit.MouseButton1Down:Connect(function()
    Opened = false
    Hub:TweenPosition(UDim2.new(0.5, 0, 1.1, 0), "InOut", "Sine", 0.25, true)
end)

Hub.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(Hub, TweenInfo.new(0.1), {
        ['BackgroundColor3'] = Color3.fromRGB(50, 50, 50)
    }):Play();
end)

Hub.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(Hub, TweenInfo.new(0.1), {
        ['BackgroundColor3'] = Color3.fromRGB(40, 40, 40)
    }):Play();
end)

local CHO = false
local BTH = false

OutputTab.ClearHolder.MouseEnter:Connect(function() CHO = true end)

OutputTab.ClearHolder.MouseLeave:Connect(function() CHO = false end)

OutputTab.MouseEnter:Connect(function()
    BTH = true
    OutputTab.ClearHolder.Clear:TweenPosition(UDim2.new(0, 0, 0.5, -7), "InOut",
                                              "Sine", 0.2, true)
    repeat wait() until not BTH or not CHO
    OutputTab.ClearHolder.Clear:TweenPosition(UDim2.new(0, 0, 0, -7), "InOut",
                                              "Sine", 0.2, true)
end)

local SH = false
local RH = false

RemoteTab.Spys.MouseEnter:Connect(function() SH = true end)

RemoteTab.Spys.MouseLeave:Connect(function() SH = false end)

RemoteTab.MouseEnter:Connect(function()
    RH = true
    RemoteTab.Spys.Spyer:TweenPosition(UDim2.new(0, 0, 0.5, -7), "InOut",
                                       "Sine", 0.2, true)
    repeat wait() until not SH or not RH
    RemoteTab.Spys.Spyer:TweenPosition(UDim2.new(0, 0, 0, -7), "InOut", "Sine",
                                       0.2, true)
end)

function OpenUI()
    if Opened then
        Opened = not Opened
        Hub:TweenPosition(UDim2.new(0.5, 0, 1.1, 0), "InOut", "Sine", 0.25, true)
    else
        Opened = not Opened
        Hub:TweenPosition(UDim2.new(0.5, 0, 0.35, 0), "InOut", "Sine", 0.25,
                          true)
    end
end

plr.Chatted:Connect(
    function(msg) if msg:lower() == "/e open" then OpenUI() end end)

game:GetService("UserInputService").InputBegan:Connect(
    function(input, proc)
        if not proc and input.KeyCode == Enum.KeyCode.F4 then OpenUI() end
    end)

function SwitchTab(tab, x)
    Tabs.TabLine:TweenPosition(UDim2.new(x, 0, 1, 0), "InOut", "Sine", 0.25,
                               true)
    if tab == "Remotes" then
        TF.Remotes:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Sine", 0.25,
                                 true)
        TF.Output:TweenPosition(UDim2.new(1, 0, 0, 0), "InOut", "Sine", 0.25,
                                true)
        TF.Explorer:TweenPosition(UDim2.new(2, 0, 0, 0), "InOut", "Sine", 0.25,
                                  true)
        TF.R2S:TweenPosition(UDim2.new(3, 0, 0, 0), "InOut", "Sine", 0.25, true)
    elseif tab == "Output" then
        TF.Remotes:TweenPosition(UDim2.new(-1, 0, 0, 0), "InOut", "Sine", 0.25,
                                 true)
        TF.Output:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Sine", 0.25,
                                true)
        TF.Explorer:TweenPosition(UDim2.new(1, 0, 0, 0), "InOut", "Sine", 0.25,
                                  true)
        TF.R2S:TweenPosition(UDim2.new(2, 0, 0, 0), "InOut", "Sine", 0.25, true)
    elseif tab == "Explorer" then
        TF.Remotes:TweenPosition(UDim2.new(-2, 0, 0, 0), "InOut", "Sine", 0.25,
                                 true)
        TF.Output:TweenPosition(UDim2.new(-1, 0, 0, 0), "InOut", "Sine", 0.25,
                                true)
        TF.Explorer:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Sine", 0.25,
                                  true)
        TF.R2S:TweenPosition(UDim2.new(1, 0, 0, 0), "InOut", "Sine", 0.25, true)
    elseif tab == "R2S" then
        TF.Remotes:TweenPosition(UDim2.new(-3, 0, 0, 0), "InOut", "Sine", 0.25,
                                 true)
        TF.Output:TweenPosition(UDim2.new(-2, 0, 0, 0), "InOut", "Sine", 0.25,
                                true)
        TF.Explorer:TweenPosition(UDim2.new(-1, 0, 0, 0), "InOut", "Sine", 0.25,
                                  true)
        TF.R2S:TweenPosition(UDim2.new(0, 0, 0, 0), "InOut", "Sine", 0.25, true)
    end
end

for i, v in pairs(Tabs:GetChildren()) do
    if v:IsA("TextButton") then
        v.MouseButton1Down:Connect(function()
            SwitchTab(v.Name, v.Position.X.Scale)
        end)
    end
end

local Ignores = {
    ["CharacterSoundEvent"] = true,
    ["MovementUpdate"] = true,
    ["OnNewMessage"] = true,
    ["OnMessageDoneFiltering"] = true,
    ["OnNewSystemMessage"] = true,
    ["OnChannelJoined"] = true,
    ["OnChannelLeft"] = true,
    ["OnMuted"] = true,
    ["OnUnmuted"] = true,
    ["OnMainChannelSet"] = true,
    ["ChannelNameColorUpdated"] = true,
    ["SayMessageRequest"] = true,
    ["SetBlockedUserIdsRequest"] = true,
    ["GetInitDataRequest"] = true,
    ["MutePlayerRequest"] = true,
    ["UnMutePlayerRequest"] = true,
    ["DefaultServerSoundEvent"] = true,
    ["AddCharacterLoadedEvent"] = true,
    ["RemoveCharacterEvent"] = true,
    ["SoundDispatcher"] = true,
    ["GamepadNotifications"] = true,
    ["SendNotificationInfo"] = true,
    ["FollowRelationshipChanged"] = true,
    ["NewFollower"] = true,
    ["GetFollowRelationships"] = true,
    ["SetPlayerBlockList"] = true,
    ["UpdatePlayerBlockList"] = true,
    ["SetDialogInUse"] = true,
    ["GetServerVersion"] = true
}

local RemotesToSpy = {}
local SpyingRemotes = {}
local BiggestTB = 0;

function UpdateOutput()
    Output.OutputWindow.CanvasSize = UDim2.new(0, 89 + BiggestTB, 0,
                                               (#Output.OutputWindow:GetChildren() *
                                                   20) + 1)
end

function ClearOutput()
    BiggestTB = 0
    Output.OutputWindow:ClearAllChildren()
    UpdateOutput()
end

OutputTab.ClearHolder.Clear.MouseButton1Down:Connect(
    function()
        BTH = false
        CHO = false
        ClearOutput()
    end)

local TextToCopy = ""

function LoadR2S(obj, args)
    R2S.Warning.Visible = false
    R2S.Window.Visible = true

    local InstancesTable = {}
    local String = ""
    for i in string.gmatch(obj:GetFullName(), ".") do
        if i == "." then
            InstancesTable[#InstancesTable + 1] = String
            String = ""
        else
            String = String .. i
        end
    end
    InstancesTable[#InstancesTable + 1] = String

    local TextToLoad = "local Remote = game"

    for i, v in pairs(InstancesTable) do
        if i == #InstancesTable then
            TextToLoad = TextToLoad .. "['" .. v .. "']"
        else
            TextToLoad = TextToLoad .. "." .. v
        end
    end

    TextToLoad = TextToLoad .. "\n\nlocal Arguments = "

    local function GenerateScript()
        local Tabs = 0
        local function AddTabs()
            if Tabs == 0 then return end
            for i = 0, Tabs do TextToLoad = TextToLoad .. "    " end
        end
        local IgnoreCommaBreak = false
        local last = ""
        for i in string.gmatch(args, ".") do
            if i == "{" then
                TextToLoad = TextToLoad .. "{\n"
                Tabs = Tabs + 1
                AddTabs()
            elseif i == "}" then
                TextToLoad = TextToLoad .. "\n"
                Tabs = Tabs - 1
                AddTabs()
                TextToLoad = TextToLoad .. "}"
            elseif i == "(" then
                IgnoreCommaBreak = true
                TextToLoad = TextToLoad .. i
            elseif i == ")" and IgnoreCommaBreak then
                IgnoreCommaBreak = false
                TextToLoad = TextToLoad .. i
            elseif i == "," and not IgnoreCommaBreak then
                TextToLoad = TextToLoad .. ",\n"
                AddTabs()
            elseif i == " " and last == "," then
                -- lol goteeem im doing nothing here cuz it's mainly for visuals
            else
                TextToLoad = TextToLoad .. i
            end
            last = i
        end
    end
    GenerateScript()
    TextToLoad = TextToLoad .. "\n\nRemote:" ..
                     ((obj.ClassName == "RemoteEvent" and "FireServer") or
                         (obj.ClassName == "RemoteFunction" and "InvokeServer") or
                         (obj.ClassName == "BindableEvent" and "Fire") or
                         (obj.ClassName == "BindableFunction" and "Invoke")) ..
                     "(unpack(Arguments))"

    TextToCopy = TextToLoad

    R2S.Window.ScriptWindow.RemoteScript.Text = TextToLoad
    R2S.Window.ScriptWindow.CanvasSize =
        UDim2.new(0, R2S.Window.ScriptWindow.RemoteScript.TextBounds.X + 6, 0,
                  R2S.Window.ScriptWindow.RemoteScript.TextBounds.Y + 6)
end

R2S.Window.CopyClip.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(R2S.Window.CopyClip,
                                           TweenInfo.new(0.1), {
        ['BackgroundColor3'] = Color3.fromRGB(60, 60, 60)
    }):Play();
end)

R2S.Window.CopyClip.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(R2S.Window.CopyClip,
                                           TweenInfo.new(0.1), {
        ['BackgroundColor3'] = Color3.fromRGB(50, 50, 50)
    }):Play();
end)

R2S.Window.CopyClip.MouseButton1Down:Connect(
    function()
        R2S.Window.CopyClip.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        game:GetService("TweenService"):Create(R2S.Window.CopyClip,
                                               TweenInfo.new(0.1), {
            ['BackgroundColor3'] = Color3.fromRGB(50, 50, 50)
        }):Play();
        if setclipboard then
            setclipboard(TextToCopy)
        elseif toclipboard then
            toclipboard(TextToCopy)
        elseif syn and syn.write_clipboard then
            syn.write_clipboard(TextToCopy)
        end
    end)

local ViewDB = false

function AddToOutput(obj, args)
    local temp = Supplies.RemoteOutputTemplate:Clone()
    temp.RemoteName.Text = obj.Name .. " | Args: " .. args
    LoadIcon(obj.ClassName, temp.Icon)
    temp.Position = UDim2.new(0, 5, 0, #Output.OutputWindow:GetChildren() * 20)
    temp.Parent = Output.OutputWindow
    temp.R2S.Position = UDim2.new(0, 25 + temp.RemoteName.TextBounds.X, 0, 0)
    if temp.RemoteName.TextBounds.X >= BiggestTB then
        BiggestTB = temp.RemoteName.TextBounds.X
    end
    UpdateOutput()
    temp.R2S.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(temp.R2S, TweenInfo.new(0.1), {
            ['BackgroundColor3'] = Color3.fromRGB(75, 75, 75)
        }):Play();
    end)
    temp.R2S.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(temp.R2S, TweenInfo.new(0.1), {
            ['BackgroundColor3'] = Color3.fromRGB(60, 60, 60)
        }):Play();
    end)
    temp.R2S.MouseButton1Down:Connect(function()
        if not ViewDB then
            ViewDB = true
            LoadR2S(obj, args)
            SwitchTab("R2S", 0.75)
            wait(0.5)
            ViewDB = false
        end
    end)
end

-- Do Spy stuff boyssssss

local IgnoreThis = {
    GetSetting = true,
    GetSelection = true,
    SelectionChanged = true,
    GetAwaiting = true
}

function GetType(item)
    if type(item) == "string" then
        return "\"" .. item .. "\""
    elseif type(item) == "table" then
        local str = "{"
        local max = 0
        local numb = 1
        for i, v in pairs(item) do max = max + 1 end
        for i, v in pairs(item) do
            if numb == max then
                str = str .. "[" .. GetType(i) .. "] = " .. GetType(v)
            else
                str = str .. "[" .. GetType(i) .. "] = " .. GetType(v) .. ", "
            end
            numb = numb + 1
        end
        str = str .. "}"
        return str
    elseif type(item) == "userdata" then
        local a, b = pcall(function() return item.ClassName end)
        if a then
            return item:GetFullName()
        else
            if tostring(b):match("not a valid member of %w+") then
                local c, d = tostring(b):match("not a valid member of %w+")
                                 :find("of ")
                local class = tostring(b):match("not a valid member of %w+")
                                  :sub(d + 1)
                return class .. ".new(" .. tostring(item) .. ")"
            end
        end
    else
        return tostring(item)
    end
end

function ReturnArgs(...)
    local args = {...}
    local list = ""
    local max = 0
    local numb = 1
    for i, v in pairs(args) do max = max + 1 end
    for i, v in pairs(args) do
        if numb == max then
            list = list .. GetType(v)
        else
            list = list .. GetType(v) .. ", "
        end
        numb = numb + 1
    end
    list = list
    return list
end

local mt = getrawmetatable(game)
local old_n = mt.__namecall
if setreadonly then
    setreadonly(mt, false)
elseif make_writeable then
    make_writeable(mt)
end

local protect = newcclosure or protect_function or function(f) return f end
mt.__namecall = protect(function(self, ...)
    local args = {...}
    table.remove(args)

    if (not IgnoreThis[self.Name]) and SpyingRemotes[self] and
        RemoteIgnores[self.ClassName] then
        AddToOutput(self, ReturnArgs(args));
    end

    return old_n(self, ...)
end)

if replaceclosure then
    local OldFireServer
    local Hook = protect(function(self, ...)
        local args = {...}

        if (not IgnoreThis[self.Name]) and SpyingRemotes[self] then
            AddToOutput(self, ReturnArgs(args));
        end

        return OldFireServer(self, ...)
    end)

    OldFireServer = replaceclosure(Instance.new("RemoteEvent").FireServer, Hook)

    local OldInvokeServer
    local Hook2 = protect(function(self, ...)
        local args = {...}

        if (not IgnoreThis[self.Name]) and SpyingRemotes[self] then
            AddToOutput(self, ReturnArgs(args));
        end

        return OldInvokeServer(self, ...)
    end)

    OldInvokeServer = replaceclosure(
                          Instance.new("RemoteFunction").InvokeServer, Hook2)
end
----------------------

local BiggestR = 0;

function UpdateRemotes()
    Remotes.CanvasSize = UDim2.new(0, 144 + BiggestR, 0,
                                   (#Remotes:GetChildren() - 1) * 20)
end

function Spy(temp, bool)
    if not bool then
        temp.Spy.Text = "Spy"
        game:GetService("TweenService"):Create(temp.Spy, TweenInfo.new(0.5), {
            ['TextColor3'] = Color3.fromRGB(255, 255, 255)
        }):Play();
    else
        temp.Spy.Text = "Spying"
        game:GetService("TweenService"):Create(temp.Spy, TweenInfo.new(0.5), {
            ['TextColor3'] = Color3.fromRGB(17, 170, 73)
        }):Play();
    end
end

function LoadExplorer(obj)
    Explorer.Window.ExplorerWindow:ClearAllChildren()
    Explorer.Window.ExplorerWindow.CanvasSize = UDim2.new(0, 0, 0, 0)
    Explorer.Warning.Visible = false
    Explorer.Window.Visible = true
    local InstancesTable = {}
    local String = ""
    for i in string.gmatch(obj:GetFullName(), ".") do
        if i == "." then
            InstancesTable[#InstancesTable + 1] = String
            String = ""
        else
            String = String .. i
        end
    end
    InstancesTable[#InstancesTable + 1] = String
    local ClassTable = {}
    local function Check(obj, pos)
        if obj:FindFirstChild(InstancesTable[pos]) then
            ClassTable[pos] = obj:FindFirstChild(InstancesTable[pos])
            if InstancesTable[pos + 1] then
                Check(obj:FindFirstChild(InstancesTable[pos]), pos + 1)
            end
        end
    end
    Check(game, 1)
    local last
    for i, v in pairs(InstancesTable) do
        local temp = Supplies.ExplorerTemplate:Clone()
        temp.Name = v
        temp.InstanceName.Text = v
        LoadIcon(((ClassTable[i] and ClassTable[i].ClassName) or "Folder"),
                 temp.Icon)
        if ClassTable[i] then
            if #ClassTable[i]:GetChildren() > 0 then
                temp.Arrow.Visible = true
            else
                temp.Arrow.Visible = false
            end
        end
        if last then
            temp.Parent = last.Holder
        else
            temp.Parent = Explorer.Window.ExplorerWindow
        end
        temp.BG.Size = UDim2.new(0, temp.InstanceName.TextBounds.X + 36, 1, 0)
        temp.InstanceName.Size = UDim2.new(0,
                                           temp.InstanceName.TextBounds.X + 10,
                                           1, 0)
        last = temp
        temp.InstanceName.MouseEnter:Connect(
            function()
                game:GetService("TweenService"):Create(temp.BG,
                                                       TweenInfo.new(0.1), {
                    ['BackgroundTransparency'] = 0.5
                }):Play();
            end)
        temp.InstanceName.MouseLeave:Connect(
            function()
                game:GetService("TweenService"):Create(temp.BG,
                                                       TweenInfo.new(0.1), {
                    ['BackgroundTransparency'] = 1
                }):Play();
            end)
        temp.Arrow.Open.MouseEnter:Connect(
            function()
                game:GetService("TweenService"):Create(temp.Arrow.IconMap,
                                                       TweenInfo.new(0.1), {
                    ['ImageColor3'] = Color3.fromRGB(200, 200, 200)
                }):Play();
            end)
        temp.Arrow.Open.MouseLeave:Connect(
            function()
                game:GetService("TweenService"):Create(temp.Arrow.IconMap,
                                                       TweenInfo.new(0.1), {
                    ['ImageColor3'] = Color3.fromRGB(255, 255, 255)
                }):Play();
            end)
        temp.Arrow.Open.MouseButton1Down:Connect(
            function()
                if temp.Holder.Visible then
                    temp.Holder.Visible = false
                    LoadIcon(nil, temp.Arrow, 166)
                else
                    temp.Holder.Visible = true
                    LoadIcon(nil, temp.Arrow, 167)
                end
            end)
        temp.InstanceName.Open.MouseButton1Down:Connect(
            function()
                if temp.Holder.Visible then
                    temp.Holder.Visible = false
                    LoadIcon(nil, temp.Arrow, 166)
                else
                    temp.Holder.Visible = true
                    LoadIcon(nil, temp.Arrow, 167)
                end
            end)
    end
    Explorer.Window.ExplorerWindow.CanvasSize =
        UDim2.new(0,
                  (last.AbsolutePosition.X - Explorer.AbsolutePosition.X) + 50 +
                      last.InstanceName.TextBounds.X, 0,
                  (20 * #InstancesTable) + 5)
end

local AllStuff = {}

function MakeRemote(obj)
    local temp = Supplies.RemoteTemplate:Clone()
    temp.RemoteName.Text = obj.Name
    LoadIcon(obj.ClassName, temp.Icon)
    temp.Parent = Remotes
    temp.Spy.Position = UDim2.new(0, 25 + temp.RemoteName.TextBounds.X, 0, 0)
    temp.View.Position = UDim2.new(0, 80 + temp.RemoteName.TextBounds.X, 0, 0)
    if temp.RemoteName.TextBounds.X >= BiggestR then
        BiggestR = temp.RemoteName.TextBounds.X
    end
    RemotesToSpy[obj] = temp
    AllStuff[temp] = obj
    temp.Spy.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(temp.Spy, TweenInfo.new(0.1), {
            ['BackgroundColor3'] = Color3.fromRGB(75, 75, 75)
        }):Play();
    end)
    temp.Spy.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(temp.Spy, TweenInfo.new(0.1), {
            ['BackgroundColor3'] = Color3.fromRGB(60, 60, 60)
        }):Play();
    end)
    temp.View.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(temp.View, TweenInfo.new(0.1), {
            ['BackgroundColor3'] = Color3.fromRGB(75, 75, 75)
        }):Play();
    end)
    temp.View.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(temp.View, TweenInfo.new(0.1), {
            ['BackgroundColor3'] = Color3.fromRGB(60, 60, 60)
        }):Play();
    end)
    temp.Spy.MouseButton1Down:Connect(function()
        if SpyingRemotes[obj] then
            SpyingRemotes[obj] = nil
            Spy(temp, false)
        else
            SpyingRemotes[obj] = true
            Spy(temp, true)
        end
    end)
    temp.View.MouseButton1Down:Connect(function()
        if not ViewDB then
            ViewDB = true
            LoadExplorer(obj)
            SwitchTab("Explorer", 0.5)
            wait(0.5)
            ViewDB = false
        end
    end)
end

local SpyingDB = false
RemoteTab.Spys.Spyer.MouseButton1Down:Connect(
    function()
        if not SpyingDB then
            SpyingDB = true
            game:GetService("TweenService"):Create(RemoteTab.Spys.Spyer,
                                                   TweenInfo.new(0.1), {
                ['ImageColor3'] = Color3.fromRGB(215, 90, 74)
            }):Play();
            RemoteTab.Spys.Spyer.Words.Text = "Unspy All"
            for i, v in pairs(Remotes:GetChildren()) do
                if v:IsA("Frame") then
                    Spy(v, true)
                    if AllStuff[v] then
                        SpyingRemotes[AllStuff[v]] = true
                    end
                end
            end
        else
            SpyingDB = false
            game:GetService("TweenService"):Create(RemoteTab.Spys.Spyer,
                                                   TweenInfo.new(0.1), {
                ['ImageColor3'] = Color3.fromRGB(0, 170, 93)
            }):Play();
            RemoteTab.Spys.Spyer.Words.Text = "Spy All"
            for i, v in pairs(Remotes:GetChildren()) do
                if v:IsA("Frame") then
                    Spy(v, false)
                    if AllStuff[v] then
                        SpyingRemotes[AllStuff[v]] = nil
                    end
                end
            end
        end
    end)

function LoadSpy()
    Remotes:ClearAllChildren()
    Supplies.RemoteGrid:Clone().Parent = Remotes
    local function recur(obj)
        for i, v in pairs(obj:GetChildren()) do
            local suc, err = pcall(function() v:GetChildren() end)
            if suc then
                if RemoteIgnores[v.ClassName] and not Ignores[v.Name] then
                    MakeRemote(v)
                end
                recur(v)
            end
        end
    end
    recur(game)
    UpdateRemotes()
end
spawn(function() LoadSpy() end)

function CreateListener()
    for i, v in pairs(game:GetChildren()) do
        local suc, err = pcall(function() v:GetChildren() end)
        if suc then
            v.DescendantAdded:Connect(function(obj)
                if RemoteIgnores[obj.ClassName] and not Ignores[obj.Name] then
                    MakeRemote(obj)
                    UpdateRemotes()
                end
            end)
            v.DescendantRemoving:Connect(
                function(obj)
                    if RemoteIgnores[obj.ClassName] and not Ignores[obj.Name] then
                        RemotesToSpy[obj]:Destroy()
                        RemotesToSpy[obj] = nil
                        SpyingRemotes[obj] = nil
                    end
                end)
        end
    end
end
spawn(function() CreateListener() end)

spawn(function()
    while true do
        for i = 0, 100 do
            Tabs.TabLine.BackgroundColor3 = Color3.fromHSV(i / 100, 0.75, 0.75)
            wait()
        end
    end
end)

spawn(function()
    while true do
        Animate.Texture:TweenPosition(UDim2.new(-2, 0, -2, 0), "Out", "Linear",
                                      Animate_Time, true)
        Animate.Texture2:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Linear",
                                       Animate_Time, true)
        Animate.Texture3:TweenPosition(UDim2.new(-2, 0, 0, 0), "Out", "Linear",
                                       Animate_Time, true)
        Animate.Texture4:TweenPosition(UDim2.new(0, 0, -2, 0), "Out", "Linear",
                                       Animate_Time, true)
        wait(Animate_Time)
        Animate.Texture.Position = UDim2.new(2, 0, 2, 0)
        Animate.Texture3.Position = UDim2.new(0, 0, 2, 0)
        Animate.Texture4.Position = UDim2.new(2, 0, 0, 0)
        Animate.Texture2:TweenPosition(UDim2.new(-2, 0, -2, 0), "Out", "Linear",
                                       Animate_Time, true)
        Animate.Texture:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Linear",
                                      Animate_Time, true)
        Animate.Texture3:TweenPosition(UDim2.new(-2, 0, 0, 0), "Out", "Linear",
                                       Animate_Time, true)
        Animate.Texture4:TweenPosition(UDim2.new(0, 0, -2, 0), "Out", "Linear",
                                       Animate_Time, true)
        wait(Animate_Time)
        Animate.Texture2.Position = UDim2.new(2, 0, 2, 0)
        Animate.Texture3.Position = UDim2.new(0, 0, 2, 0)
        Animate.Texture4.Position = UDim2.new(2, 0, 0, 0)
    end
end)
