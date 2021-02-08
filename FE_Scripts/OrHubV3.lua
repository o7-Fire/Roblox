game.StarterGui:SetCore("SendNotification", {
    Title = "Drag Fixed",
    Text = "You are able to drag now",
    Icon = "",
    Duration = 2
})
wait(.6)
local RobloxGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Top = Instance.new("Frame")
local Icon = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local Icon_2 = Instance.new("TextLabel")
local Holder = Instance.new("Frame")
local HomeBTN = Instance.new("TextButton")
local ScriptsBTN = Instance.new("TextButton")
local CreditsBTN = Instance.new("TextButton")
local HomePage = Instance.new("Frame")
local Text = Instance.new("TextLabel")
local Text_2 = Instance.new("TextLabel")
local Text_3 = Instance.new("TextLabel")
local Text_4 = Instance.new("TextLabel")
local Text_5 = Instance.new("TextLabel")
local Text_6 = Instance.new("TextLabel")
local ScriptsPage = Instance.new("Frame")
local KillbotV3 = Instance.new("TextButton")
local SmugDance = Instance.new("TextButton")
local OrbitHats = Instance.new("TextButton")
local RetardDance = Instance.new("TextButton")
local IPloggerTroll = Instance.new("TextButton")
local CarsonDance = Instance.new("TextButton")
local CarDrift = Instance.new("TextButton")
local Cop = Instance.new("TextButton")
local OrangeJustice = Instance.new("TextButton")
local Spider = Instance.new("TextButton")
local Stand = Instance.new("TextButton")
local AntiAFK = Instance.new("TextButton")
local HenryDance = Instance.new("TextButton")
local Nameless = Instance.new("TextButton")
local CreditsPage = Instance.new("Frame")
local Text_7 = Instance.new("TextLabel")
local Text_8 = Instance.new("TextLabel")
local Text_9 = Instance.new("TextLabel")
local Text_10 = Instance.new("TextLabel")
local Text_11 = Instance.new("TextLabel")
local HDroblox = Instance.new("TextButton")

-- Properties:

RobloxGui.Name = "RobloxGui"
RobloxGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
RobloxGui.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = RobloxGui
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.290410727, 0, 0.296096802, 0)
Main.Size = UDim2.new(0, 416, 0, 257)
Main.Visible = false
wait(1.2)
game.StarterGui:SetCore("SendNotification", {
    Title = "OrPlayz Hub V3",
    Text = "Whitelisted!",
    Icon = "",
    Duration = 2
})
Main.Visible = true

Top.Name = "Top"
Top.Parent = Main
Top.BackgroundColor3 = Color3.fromRGB(0, 156, 156)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(-0.00054154027, 0, 0, 0)
Top.Size = UDim2.new(0, 416, 0, 38)

Icon.Name = "Icon"
Icon.Parent = Main
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.Position = UDim2.new(0.027279973, 0, 0.0194552392, 0)
Icon.Size = UDim2.new(0, 46, 0, 28)
Icon.Font = Enum.Font.GothamBlack
Icon.Text = "Or"
Icon.TextColor3 = Color3.fromRGB(0, 156, 156)
Icon.TextSize = 18.000

UICorner.CornerRadius = UDim.new(0.300000012, 0)
UICorner.Parent = Icon

Icon_2.Name = "Icon"
Icon_2.Parent = Icon
Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon_2.BackgroundTransparency = 1.000
Icon_2.Position = UDim2.new(1.14361012, 0, 0.133999959, 0)
Icon_2.Size = UDim2.new(0, 29, 0, 20)
Icon_2.Font = Enum.Font.GothamBlack
Icon_2.Text = "Hub"
Icon_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Icon_2.TextSize = 18.000

Holder.Name = "Holder"
Holder.Parent = Main
Holder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Holder.BorderSizePixel = 0
Holder.Position = UDim2.new(0.021634616, 0, 0.182879373, 0)
Holder.Size = UDim2.new(0, 397, 0, 200)

HomeBTN.Name = "HomeBTN"
HomeBTN.Parent = Holder
HomeBTN.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
HomeBTN.BorderSizePixel = 0
HomeBTN.Position = UDim2.new(0.00503778318, 0, 0, 0)
HomeBTN.Size = UDim2.new(0, 128, 0, 25)
HomeBTN.Font = Enum.Font.GothamSemibold
HomeBTN.Text = "Home"
HomeBTN.TextColor3 = Color3.fromRGB(255, 255, 255)
HomeBTN.TextSize = 14.000

ScriptsBTN.Name = "ScriptsBTN"
ScriptsBTN.Parent = Holder
ScriptsBTN.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ScriptsBTN.BorderSizePixel = 0
ScriptsBTN.Position = UDim2.new(0.337531477, 0, 0, 0)
ScriptsBTN.Size = UDim2.new(0, 128, 0, 25)
ScriptsBTN.Font = Enum.Font.GothamSemibold
ScriptsBTN.Text = "Scripts"
ScriptsBTN.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptsBTN.TextSize = 14.000

CreditsBTN.Name = "CreditsBTN"
CreditsBTN.Parent = Holder
CreditsBTN.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CreditsBTN.BorderSizePixel = 0
CreditsBTN.Position = UDim2.new(0.677581906, 0, 0, 0)
CreditsBTN.Size = UDim2.new(0, 128, 0, 25)
CreditsBTN.Font = Enum.Font.GothamSemibold
CreditsBTN.Text = "Credits"
CreditsBTN.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsBTN.TextSize = 14.000

HomePage.Name = "HomePage"
HomePage.Parent = Holder
HomePage.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
HomePage.BackgroundTransparency = 1.000
HomePage.BorderSizePixel = 0
HomePage.Position = UDim2.new(0.00400233828, 0, 0, 0)
HomePage.Size = UDim2.new(0, 397, 0, 202)
HomePage.Visible = false

Text.Name = "Text"
Text.Parent = HomePage
Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text.BackgroundTransparency = 1.000
Text.BorderSizePixel = 0
Text.Position = UDim2.new(0.0251889173, 0, 0.17326732, 0)
Text.Size = UDim2.new(0, 200, 0, 17)
Text.Font = Enum.Font.GothamSemibold
Text.Text = "OrHub Version 3.0"
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextSize = 14.000
Text.TextXAlignment = Enum.TextXAlignment.Left

Text_2.Name = "Text"
Text_2.Parent = HomePage
Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_2.BackgroundTransparency = 1.000
Text_2.BorderSizePixel = 0
Text_2.Position = UDim2.new(0.0251889173, 0, 0.257425755, 0)
Text_2.Size = UDim2.new(0, 368, 0, 17)
Text_2.Font = Enum.Font.GothamSemibold
Text_2.Text = "Number of scripts: null123"
Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_2.TextSize = 14.000
Text_2.TextXAlignment = Enum.TextXAlignment.Left

Text_3.Name = "Text"
Text_3.Parent = HomePage
Text_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_3.BackgroundTransparency = 1.000
Text_3.BorderSizePixel = 0
Text_3.Position = UDim2.new(0.0327455923, 0, 0.866336703, 0)
Text_3.Size = UDim2.new(0, 368, 0, 17)
Text_3.Font = Enum.Font.GothamSemibold
Text_3.Text = "Thanks for buying OrHub!"
Text_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_3.TextSize = 14.000
Text_3.TextWrapped = true

Text_4.Name = "Text"
Text_4.Parent = HomePage
Text_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_4.BackgroundTransparency = 1.000
Text_4.BorderSizePixel = 0
Text_4.Position = UDim2.new(0.0251889173, 0, 0.341584206, 0)
Text_4.Size = UDim2.new(0, 368, 0, 17)
Text_4.Font = Enum.Font.GothamSemibold
Text_4.Text = "Discord: discord.gg/66A6VVepex"
Text_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_4.TextSize = 14.000
Text_4.TextWrapped = true
Text_4.TextXAlignment = Enum.TextXAlignment.Left

Text_5.Name = "Text"
Text_5.Parent = HomePage
Text_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_5.BackgroundTransparency = 1.000
Text_5.BorderSizePixel = 0
Text_5.Position = UDim2.new(0.0251889173, 0, 0.425742626, 0)
Text_5.Size = UDim2.new(0, 368, 0, 17)
Text_5.Font = Enum.Font.GothamSemibold
Text_5.Text = "Bugs & Glitches: None (For Now)"
Text_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_5.TextSize = 14.000
Text_5.TextWrapped = true
Text_5.TextXAlignment = Enum.TextXAlignment.Left

Text_6.Name = "Text"
Text_6.Parent = HomePage
Text_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_6.BackgroundTransparency = 1.000
Text_6.BorderSizePixel = 0
Text_6.Position = UDim2.new(0.0251889173, 0, 0.509900987, 0)
Text_6.Size = UDim2.new(0, 371, 0, 17)
Text_6.Font = Enum.Font.GothamSemibold
Text_6.Text = "Exploits Supported: Any that can execute PSU obfuscated scripts"
Text_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_6.TextScaled = true
Text_6.TextSize = 14.000
Text_6.TextWrapped = true
Text_6.TextXAlignment = Enum.TextXAlignment.Left

ScriptsPage.Name = "ScriptsPage"
ScriptsPage.Parent = Holder
ScriptsPage.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScriptsPage.BackgroundTransparency = 1.000
ScriptsPage.BorderSizePixel = 0
ScriptsPage.Position = UDim2.new(0.00400233828, 0, 0, 0)
ScriptsPage.Size = UDim2.new(0, 397, 0, 202)

KillbotV3.Name = "Killbot V3"
KillbotV3.Parent = ScriptsPage
KillbotV3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KillbotV3.BorderSizePixel = 0
KillbotV3.Position = UDim2.new(0.345088154, 0, 0.188118815, 0)
KillbotV3.Size = UDim2.new(0, 122, 0, 25)
KillbotV3.Font = Enum.Font.GothamSemibold
KillbotV3.Text = "Killbot V3"
KillbotV3.TextColor3 = Color3.fromRGB(255, 255, 255)
KillbotV3.TextSize = 14.000
KillbotV3.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/RZmLVe7N'))
end)
OrbitHats.Name = "Orbit Hats"
OrbitHats.Parent = ScriptsPage
OrbitHats.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
OrbitHats.BorderSizePixel = 0
OrbitHats.Position = UDim2.new(0.67002517, 0, 0.341584146, 0)
OrbitHats.Size = UDim2.new(0, 122, 0, 25)
OrbitHats.Font = Enum.Font.GothamSemibold
OrbitHats.Text = "Orbit Hats"
OrbitHats.TextColor3 = Color3.fromRGB(255, 255, 255)
OrbitHats.TextSize = 14.000
OrbitHats.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/4B4fktPS", true))()
end)

RetardDance.Name = "Retard Dance"
RetardDance.Parent = ScriptsPage
RetardDance.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
RetardDance.BorderSizePixel = 0
RetardDance.Position = UDim2.new(0.0125944586, 0, 0.341584146, 0)
RetardDance.Size = UDim2.new(0, 122, 0, 25)
RetardDance.Font = Enum.Font.GothamSemibold
RetardDance.Text = "Retard Dance"
RetardDance.TextColor3 = Color3.fromRGB(255, 255, 255)
RetardDance.TextSize = 14.000
RetardDance.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/9XZfbKtG'))
end)

IPloggerTroll.Name = "IP logger Troll"
IPloggerTroll.Parent = ScriptsPage
IPloggerTroll.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
IPloggerTroll.BorderSizePixel = 0
IPloggerTroll.Position = UDim2.new(0.67002517, 0, 0.504950523, 0)
IPloggerTroll.Size = UDim2.new(0, 122, 0, 25)
IPloggerTroll.Font = Enum.Font.GothamSemibold
IPloggerTroll.Text = "Troll IP Logger"
IPloggerTroll.TextColor3 = Color3.fromRGB(255, 255, 255)
IPloggerTroll.TextSize = 14.000
IPloggerTroll.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/rawjeGChNZJ'))()
end)

CarsonDance.Name = "Carson Dance"
CarsonDance.Parent = ScriptsPage
CarsonDance.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CarsonDance.BorderSizePixel = 0
CarsonDance.Position = UDim2.new(0.345088154, 0, 0.504950523, 0)
CarsonDance.Size = UDim2.new(0, 122, 0, 25)
CarsonDance.Font = Enum.Font.GothamSemibold
CarsonDance.Text = "Carson Dance"
CarsonDance.TextColor3 = Color3.fromRGB(255, 255, 255)
CarsonDance.TextSize = 14.000
CarsonDance.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(("https://pastebin.com/raw/yCrBkPaY"), true))()
end)

CarDrift.Name = "Car Drift"
CarDrift.Parent = ScriptsPage
CarDrift.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
CarDrift.BorderSizePixel = 0
CarDrift.Position = UDim2.new(0.0125944596, 0, 0.504950523, 0)
CarDrift.Size = UDim2.new(0, 122, 0, 25)
CarDrift.Font = Enum.Font.GothamSemibold
CarDrift.Text = "Car Drift"
CarDrift.TextColor3 = Color3.fromRGB(255, 255, 255)
CarDrift.TextSize = 14.000
CarDrift.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(
                   'https://raw.githubusercontent.com/MonkoTubeYT/carscript/master/!carscript.lua',
                   true))()
end)

Cop.Name = "Cop"
Cop.Parent = ScriptsPage
Cop.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Cop.BorderSizePixel = 0
Cop.Position = UDim2.new(0.664987385, 0, 0.668316841, 0)
Cop.Size = UDim2.new(0, 122, 0, 25)
Cop.Font = Enum.Font.GothamSemibold
Cop.Text = "Cop"
Cop.TextColor3 = Color3.fromRGB(255, 255, 255)
Cop.TextSize = 14.000
Cop.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/KVsAcKPS'))()
end)

OrangeJustice.Name = "Orange Justice"
OrangeJustice.Parent = ScriptsPage
OrangeJustice.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
OrangeJustice.BorderSizePixel = 0
OrangeJustice.Position = UDim2.new(0.00755667547, 0, 0.668316841, 0)
OrangeJustice.Size = UDim2.new(0, 122, 0, 25)
OrangeJustice.Font = Enum.Font.GothamSemibold
OrangeJustice.Text = "Orange Justice"
OrangeJustice.TextColor3 = Color3.fromRGB(255, 255, 255)
OrangeJustice.TextSize = 14.000
OrangeJustice.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet(("https://pastebin.com/raw/yCrBkPaY"), true))()
end)

Spider.Name = "Spider"
Spider.Parent = ScriptsPage
Spider.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Spider.BorderSizePixel = 0
Spider.Position = UDim2.new(0.664987385, 0, 0.821782172, 0)
Spider.Size = UDim2.new(0, 122, 0, 25)
Spider.Font = Enum.Font.GothamSemibold
Spider.Text = "Spider"
Spider.TextColor3 = Color3.fromRGB(255, 255, 255)
Spider.TextSize = 14.000
Spider.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/3ZuT57Wb'))()
end)

AntiAFK.Name = "Anti-AFK"
AntiAFK.Parent = ScriptsPage
AntiAFK.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
AntiAFK.BorderSizePixel = 0
AntiAFK.Position = UDim2.new(0.00755667547, 0, 0.821782172, 0)
AntiAFK.Size = UDim2.new(0, 122, 0, 25)
AntiAFK.Font = Enum.Font.GothamSemibold
AntiAFK.Text = "Anti Afk"
AntiAFK.TextColor3 = Color3.fromRGB(255, 255, 255)
AntiAFK.TextSize = 14.000
AntiAFK.MouseButton1Click:Connect(function()
    local VirtualUser = game:service 'VirtualUser'
    game:service 'Players'.LocalPlayer.Idled:connect(
        function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)

    warn("Anti-Afk has Loaded")
end)

HenryDance.Name = "Henry Dance"
HenryDance.Parent = ScriptsPage
HenryDance.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
HenryDance.BorderSizePixel = 0
HenryDance.Position = UDim2.new(0.345088154, 0, 0.341584146, 0)
HenryDance.Size = UDim2.new(0, 122, 0, 25)
HenryDance.Font = Enum.Font.GothamSemibold
HenryDance.Text = "Henry Dance"
HenryDance.TextColor3 = Color3.fromRGB(255, 255, 255)
HenryDance.TextSize = 14.000
HenryDance.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/JNhkAEmJ'))()
end)

Nameless.Name = "Nameless"
Nameless.Parent = ScriptsPage
Nameless.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Nameless.BorderSizePixel = 0
Nameless.Position = UDim2.new(0.34005037, 0, 0.668316841, 0)
Nameless.Size = UDim2.new(0, 122, 0, 25)
Nameless.Font = Enum.Font.GothamSemibold
Nameless.Text = "Nameless"
Nameless.TextColor3 = Color3.fromRGB(255, 255, 255)
Nameless.TextSize = 14.000
Nameless.MouseButton1Click:Connect(function()
    loadstring(game:GetObjects("rbxassetid://5688101100")[1].Source)()
end)

CreditsPage.Name = "CreditsPage"
CreditsPage.Parent = Holder
CreditsPage.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CreditsPage.BackgroundTransparency = 1.000
CreditsPage.BorderSizePixel = 0
CreditsPage.Position = UDim2.new(0.00400233828, 0, 0, 0)
CreditsPage.Size = UDim2.new(0, 397, 0, 202)
CreditsPage.Visible = false

Text_7.Name = "Text"
Text_7.Parent = CreditsPage
Text_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_7.BackgroundTransparency = 1.000
Text_7.BorderSizePixel = 0
Text_7.Position = UDim2.new(0.0327455923, 0, 0.866336703, 0)
Text_7.Size = UDim2.new(0, 368, 0, 17)
Text_7.Font = Enum.Font.GothamSemibold
Text_7.Text = "Thanks for buying OrHub!"
Text_7.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_7.TextSize = 14.000
Text_7.TextWrapped = true

Text_8.Name = "Text"
Text_8.Parent = CreditsPage
Text_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_8.BackgroundTransparency = 1.000
Text_8.BorderSizePixel = 0
Text_8.Position = UDim2.new(0.0251889173, 0, 0.17326732, 0)
Text_8.Size = UDim2.new(0, 200, 0, 17)
Text_8.Font = Enum.Font.GothamSemibold
Text_8.Text = "OrHub Version 3.0 (Credits)"
Text_8.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_8.TextSize = 14.000
Text_8.TextXAlignment = Enum.TextXAlignment.Left

Text_9.Name = "Text"
Text_9.Parent = CreditsPage
Text_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_9.BackgroundTransparency = 1.000
Text_9.BorderSizePixel = 0
Text_9.Position = UDim2.new(0.0251889173, 0, 0.257425725, 0)
Text_9.Size = UDim2.new(0, 200, 0, 17)
Text_9.Font = Enum.Font.GothamSemibold
Text_9.Text = "Skreet - UI Maker I"
Text_9.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_9.TextSize = 14.000
Text_9.TextXAlignment = Enum.TextXAlignment.Left

Text_10.Name = "Text"
Text_10.Parent = CreditsPage
Text_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_10.BackgroundTransparency = 1.000
Text_10.BorderSizePixel = 0
Text_10.Position = UDim2.new(0.0251889173, 0, 0.341584146, 0)
Text_10.Size = UDim2.new(0, 200, 0, 17)
Text_10.Font = Enum.Font.GothamSemibold
Text_10.Text = "OrPlayz - UI Maker II"
Text_10.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_10.TextSize = 14.000
Text_10.TextXAlignment = Enum.TextXAlignment.Left

Text_11.Name = "Text"
Text_11.Parent = CreditsPage
Text_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text_11.BackgroundTransparency = 1.000
Text_11.BorderSizePixel = 0
Text_11.Position = UDim2.new(0.0251889173, 0, 0.425742567, 0)
Text_11.Size = UDim2.new(0, 200, 0, 17)
Text_11.Font = Enum.Font.GothamSemibold
Text_11.Text = "Skreet - Scripter"
Text_11.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_11.TextSize = 14.000
Text_11.TextXAlignment = Enum.TextXAlignment.Left

HDroblox.Name = "HD roblox"
HDroblox.Parent = Holder
HDroblox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
HDroblox.BorderSizePixel = 0
HDroblox.Position = UDim2.new(0.0125944586, 0, 0.188118815, 0)
HDroblox.Size = UDim2.new(0, 122, 0, 25)
HDroblox.Font = Enum.Font.GothamSemibold
HDroblox.Text = "HD roblox"
HDroblox.TextColor3 = Color3.fromRGB(255, 255, 255)
HDroblox.TextSize = 14.000
HDroblox.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/qMANTs3Z'))()
end)

HomeBTN.MouseButton1Click:Connect(function()
    HomePage.Visible = true
    ScriptsPage.Visible = false
    CreditsPage.Visible = false
    HDroblox.Visible = false
end)

ScriptsBTN.MouseButton1Click:Connect(function()
    HomePage.Visible = false
    ScriptsPage.Visible = true
    CreditsPage.Visible = false
    HDroblox.Visible = true
end)

CreditsBTN.MouseButton1Click:Connect(function()
    HomePage.Visible = false
    ScriptsPage.Visible = false
    CreditsPage.Visible = true
    HDroblox.Visible = false
end)

local UIS = game:GetService("UserInputService")
function dragify(Frame)
    dragToggle = nil
    local dragSpeed = 0.50
    dragInput = nil
    dragStart = nil
    local dragPos = nil
    function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale,
                                   startPos.X.Offset + Delta.X,
                                   startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.30),
                                               {Position = Position}):Play()
    end
    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or
            input.UserInputType == Enum.UserInputType.Touch) and
            UIS:GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or
            input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(
        function(input)
            if input == dragInput and dragToggle then
                updateInput(input)
            end
        end)
end
loadstring(game:HttpGet(('https://pastebin.com/raw/QJaQ8L8G'), true))()
dragify(Main)
