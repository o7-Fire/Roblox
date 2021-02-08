-- gui made by Nexity
-- Roblox Engine is doomed -Itzbenz
-- Objects
local abc = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local bar = Instance.new("Frame")
local title = Instance.new("TextLabel")
local title_2 = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")

local nongui = Instance.new("Frame")
local ngtext = Instance.new("TextLabel")

local armoredpatrol = Instance.new("TextButton")
local aptext = Instance.new("TextLabel")

local chatbypass = Instance.new("TextButton")
local cbtext = Instance.new("TextLabel")

local esp = Instance.new("Frame")
local et = Instance.new("TextLabel")

local fullbright = Instance.new("TextButton")
local fbtext = Instance.new("TextLabel")

local ogtext10 = Instance.new("TextLabel")
local opengift10 = Instance.new("TextButton")

local ogtext = Instance.new("TextLabel")
local opengift = Instance.new("TextButton")

local miscs = Instance.new("Frame")
local mt = Instance.new("TextLabel")
local infammo = Instance.new("TextButton")

local sst = Instance.new("TextLabel")
local speed = Instance.new("TextButton")

local misc2 = Instance.new("Frame")
local thing = Instance.new("Frame")
local rtext = Instance.new("TextLabel")
local reviz = Instance.new("TextButton")

local aimbot = Instance.new("TextButton")
local atext = Instance.new("TextLabel")

local iat = Instance.new("TextLabel")
local mt_2 = Instance.new("TextLabel")
local mt_3 = Instance.new("TextLabel")
local mt_4 = Instance.new("TextLabel")
local newtween = function(obj, props, speed, ...)
    local info = TweenInfo.new(speed, ...);
    local tween = game:GetService("TweenService"):Create(obj, info, props);
    return tween:Play();
end;

-- Properties

abc.Name = "abc"
abc.Parent = game.CoreGui

main.Name = "main"
main.Parent = abc
main.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
bar.BorderSizePixel = 0
main.Position = UDim2.new(0.362022996, 0, 0.26242438, 0)
main.Size = UDim2.new(0, 354, 0, 240)
main.Active = true
main.Draggable = true

bar.Name = "bar"
bar.Parent = main
bar.BackgroundColor3 = Color3.new(0.12549, 0.12549, 0.12549)
bar.BorderSizePixel = 0
bar.Position = UDim2.new(-0.000933796167, 0, -0.00093537569, 0)
bar.Size = UDim2.new(0, 354, 0, 34)

title.Name = "title"
title.Parent = bar
title.BackgroundColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Size = UDim2.new(0, 72, 0, 34)
title.Font = Enum.Font.GothamSemibold
title.Text = "Trinity"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 15

title_2.Name = "title"
title_2.Parent = bar
title_2.BackgroundColor3 = Color3.new(1, 1, 1)
title_2.BackgroundTransparency = 1
title_2.Position = UDim2.new(0.169491529, 0, 0, 0)
title_2.Size = UDim2.new(0, 58, 0, 34)
title_2.Font = Enum.Font.GothamSemibold
title_2.Text = "Aimbot"
title_2.TextColor3 = Color3.new(0.72549, 1, 0.737255)
title_2.TextSize = 15

TextButton.Parent = bar
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.BackgroundTransparency = 1
TextButton.Position = UDim2.new(0.926553667, 0, 0.205882356, 0)
TextButton.Size = UDim2.new(0, 17, 0, 19)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "—"
TextButton.TextColor3 = Color3.new(1, 1, 1)
TextButton.TextSize = 17
TextButton.TextWrapped = true

nongui.Name = "NonGUI"
nongui.Parent = main
nongui.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
nongui.BorderColor3 = Color3.new(1, 1, 1)
nongui.Position = UDim2.new(0.0254237279, 0, 0.220833331, 0)
nongui.Size = UDim2.new(0, 159, 0, 80)

ngtext.Name = "NGText"
ngtext.Parent = nongui
ngtext.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
ngtext.BorderSizePixel = 0
ngtext.Position = UDim2.new(0.100628935, 0, -0.162499994, 0)
ngtext.Size = UDim2.new(0, 61, 0, 21)
ngtext.Font = Enum.Font.GothamSemibold
ngtext.Text = "Non GUI"
ngtext.TextColor3 = Color3.new(1, 1, 1)
ngtext.TextSize = 14

armoredpatrol.Name = "Armored Patrol"
armoredpatrol.Parent = nongui
armoredpatrol.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
armoredpatrol.BorderColor3 = Color3.new(1, 1, 1)
armoredpatrol.Position = UDim2.new(0.100628927, 0, 0.212499976, 0)
armoredpatrol.Size = UDim2.new(0, 18, 0, 18)
armoredpatrol.AutoButtonColor = false
armoredpatrol.Font = Enum.Font.SourceSans
armoredpatrol.Text = ""
armoredpatrol.TextColor3 = Color3.new(0, 0, 0)
armoredpatrol.TextSize = 14

aptext.Name = "APText"
aptext.Parent = nongui
aptext.BackgroundColor3 = Color3.new(1, 1, 1)
aptext.BackgroundTransparency = 1
aptext.Position = UDim2.new(0.268361211, 0, 0.208823398, 0)
aptext.Size = UDim2.new(0, 85, 0, 18)
aptext.Font = Enum.Font.Gotham
aptext.Text = "Armored Patrol"
aptext.TextColor3 = Color3.new(1, 1, 1)
aptext.TextSize = 12

cbtext.Name = "CBText"
cbtext.Parent = nongui
cbtext.BackgroundColor3 = Color3.new(1, 1, 1)
cbtext.BackgroundTransparency = 1
cbtext.Position = UDim2.new(0.268361211, 0, 0.583823442, 0)
cbtext.Size = UDim2.new(0, 85, 0, 18)
cbtext.Font = Enum.Font.Gotham
cbtext.Text = "Chat Bypasser"
cbtext.TextColor3 = Color3.new(1, 1, 1)
cbtext.TextSize = 12

chatbypass.Name = "ChatBypass"
chatbypass.Parent = nongui
chatbypass.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
chatbypass.BorderColor3 = Color3.new(1, 1, 1)
chatbypass.Position = UDim2.new(0.100628927, 0, 0.587499976, 0)
chatbypass.Size = UDim2.new(0, 18, 0, 18)
chatbypass.AutoButtonColor = false
chatbypass.Font = Enum.Font.SourceSans
chatbypass.Text = ""
chatbypass.TextColor3 = Color3.new(0, 0, 0)
chatbypass.TextSize = 14

esp.Name = "esp"
esp.Parent = main
esp.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
esp.BorderColor3 = Color3.new(1, 1, 1)
esp.Position = UDim2.new(0.525423706, 0, 0.220833346, 0)
esp.Size = UDim2.new(0, 159, 0, 108)

et.Name = "et"
et.Parent = esp
et.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
et.BorderSizePixel = 0
et.Position = UDim2.new(0.100628927, 0, -0.125462994, 0)
et.Size = UDim2.new(0, 35, 0, 21)
et.Font = Enum.Font.GothamSemibold
et.Text = "ESP"
et.TextColor3 = Color3.new(1, 1, 1)
et.TextSize = 14

fullbright.Name = "fullbright"
fullbright.Parent = esp
fullbright.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
fullbright.BorderColor3 = Color3.new(1, 1, 1)
fullbright.Position = UDim2.new(0.100628927, 0, 0.156944424, 0)
fullbright.Size = UDim2.new(0, 18, 0, 18)
fullbright.AutoButtonColor = false
fullbright.Font = Enum.Font.SourceSans
fullbright.Text = ""
fullbright.TextColor3 = Color3.new(0, 0, 0)
fullbright.TextSize = 14

fbtext.Name = "ct"
fbtext.Parent = esp
fbtext.BackgroundColor3 = Color3.new(1, 1, 1)
fbtext.BackgroundTransparency = 1
fbtext.Position = UDim2.new(0.268361211, 0, 0.153267756, 0)
fbtext.Size = UDim2.new(0, 48, 0, 18)
fbtext.Font = Enum.Font.Gotham
fbtext.Text = "Murder Mystery 2"
fbtext.TextColor3 = Color3.new(1, 1, 1)
fbtext.TextSize = 12

ogtext10.Name = "ogtext10"
ogtext10.Parent = esp
ogtext10.BackgroundColor3 = Color3.new(1, 1, 1)
ogtext10.BackgroundTransparency = 1
ogtext10.Position = UDim2.new(0.268361211, 0, 0.42641589, 0)
ogtext10.Size = UDim2.new(0, 49, 0, 18)
ogtext10.Font = Enum.Font.Gotham
ogtext10.Text = "Open Gift x10"
ogtext10.TextColor3 = Color3.new(1, 1, 1)
ogtext10.TextSize = 12

opengift10.Name = "opengift10"
opengift10.Parent = esp
opengift10.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
opengift10.BorderColor3 = Color3.new(1, 1, 1)
opengift10.Position = UDim2.new(0.100628927, 0, 0.430092573, 0)
opengift10.Size = UDim2.new(0, 18, 0, 18)
opengift10.AutoButtonColor = false
opengift10.Font = Enum.Font.SourceSans
opengift10.Text = ""
opengift10.TextColor3 = Color3.new(0, 0, 0)
opengift10.TextSize = 14

ogtext.Name = "ogtext"
ogtext.Parent = esp
ogtext.BackgroundColor3 = Color3.new(1, 1, 1)
ogtext.BackgroundTransparency = 1
ogtext.Position = UDim2.new(0.268361211, 0, 0.694934428, 0)
ogtext.Size = UDim2.new(0, 57, 0, 18)
ogtext.Font = Enum.Font.Gotham
ogtext.Text = "Open Gift"
ogtext.TextColor3 = Color3.new(1, 1, 1)
ogtext.TextSize = 12

opengift.Name = "opengift"
opengift.Parent = esp
opengift.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
opengift.BorderColor3 = Color3.new(1, 1, 1)
opengift.Position = UDim2.new(0.100628927, 0, 0.698611081, 0)
opengift.Size = UDim2.new(0, 18, 0, 18)
opengift.AutoButtonColor = false
opengift.Font = Enum.Font.SourceSans
opengift.Text = ""
opengift.TextColor3 = Color3.new(0, 0, 0)
opengift.TextSize = 14

miscs.Name = "miscs"
miscs.Parent = main
miscs.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
miscs.BorderColor3 = Color3.new(1, 1, 1)
miscs.Position = UDim2.new(0.0254237279, 0, 0.641666651, 0)
miscs.Size = UDim2.new(0, 159, 0, 80)

mt.Name = "mt"
mt.Parent = miscs
mt.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
mt.BorderSizePixel = 0
mt.Position = UDim2.new(0.100628927, 0, -0.162499994, 0)
mt.Size = UDim2.new(0, 46, 0, 21)
mt.Font = Enum.Font.GothamSemibold
mt.Text = "Miscs"
mt.TextColor3 = Color3.new(1, 1, 1)
mt.TextSize = 14

infammo.Name = "infammo"
infammo.Parent = miscs
infammo.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
infammo.BorderColor3 = Color3.new(1, 1, 1)
infammo.Position = UDim2.new(0.100628927, 0, 0.212499976, 0)
infammo.Size = UDim2.new(0, 18, 0, 18)
infammo.AutoButtonColor = false
infammo.Font = Enum.Font.SourceSans
infammo.Text = ""
infammo.TextColor3 = Color3.new(0, 0, 0)
infammo.TextSize = 14

sst.Name = "sst"
sst.Parent = miscs
sst.BackgroundColor3 = Color3.new(1, 1, 1)
sst.BackgroundTransparency = 1
sst.Position = UDim2.new(0.268361211, 0, 0.583823383, 0)
sst.Size = UDim2.new(0, 85, 0, 18)
sst.Font = Enum.Font.Gotham
sst.Text = "Super Speed"
sst.TextColor3 = Color3.new(1, 1, 1)
sst.TextSize = 12

speed.Name = "speed"
speed.Parent = miscs
speed.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
speed.BorderColor3 = Color3.new(1, 1, 1)
speed.Position = UDim2.new(0.100628927, 0, 0.587499976, 0)
speed.Size = UDim2.new(0, 18, 0, 18)
speed.AutoButtonColor = false
speed.Font = Enum.Font.SourceSans
speed.Text = ""
speed.TextColor3 = Color3.new(0, 0, 0)
speed.TextSize = 14

misc2.Name = "misc2"
misc2.Parent = miscs
misc2.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
misc2.BorderColor3 = Color3.new(1, 1, 1)
misc2.Position = UDim2.new(0.946008086, 0, 0.237499997, 0)
misc2.Size = UDim2.new(0, 126, 0, 61)

thing.Name = "thing"
thing.Parent = misc2
thing.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
thing.BorderColor3 = Color3.new(1, 1, 1)
thing.BorderSizePixel = 0
thing.Position = UDim2.new(-0.0801333487, 0, -0.105263129, 0)
thing.Size = UDim2.new(0, 19, 0, 68)

rtext.Name = "rtext"
rtext.Parent = miscs
rtext.BackgroundColor3 = Color3.new(1, 1, 1)
rtext.BackgroundTransparency = 1
rtext.Position = UDim2.new(1.16773224, 0, 0.333823413, 0)
rtext.Size = UDim2.new(0, 72, 0, 18)
rtext.Font = Enum.Font.Gotham
rtext.Text = "Reviz Admin"
rtext.TextColor3 = Color3.new(1, 1, 1)
rtext.TextSize = 12

rtext.Name = "rtext"
reviz.Parent = miscs
reviz.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
reviz.BorderColor3 = Color3.new(1, 1, 1)
reviz.Position = UDim2.new(0.99999994, 0, 0.337500006, 0)
reviz.Size = UDim2.new(0, 18, 0, 18)
reviz.AutoButtonColor = false
reviz.Font = Enum.Font.SourceSans
reviz.Text = ""
reviz.TextColor3 = Color3.new(0, 0, 0)
reviz.TextSize = 14

aimbot.Name = "aimbot"
aimbot.Parent = miscs
aimbot.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
aimbot.BorderColor3 = Color3.new(1, 1, 1)
aimbot.Position = UDim2.new(0.99999994, 0, 0.6875, 0)
aimbot.Size = UDim2.new(0, 18, 0, 18)
aimbot.AutoButtonColor = false
aimbot.Font = Enum.Font.SourceSans
aimbot.Text = ""
aimbot.TextColor3 = Color3.new(0, 0, 0)
aimbot.TextSize = 14

atext.Name = "atext"
atext.Parent = miscs
atext.BackgroundColor3 = Color3.new(1, 1, 1)
atext.BackgroundTransparency = 1
atext.Position = UDim2.new(1.16773224, 0, 0.683823407, 0)
atext.Size = UDim2.new(0, 65, 0, 18)
atext.Font = Enum.Font.Gotham
atext.Text = "U Aimbot"
atext.TextColor3 = Color3.new(1, 1, 1)
atext.TextSize = 12

iat.Name = "iat"
iat.Parent = miscs
iat.BackgroundColor3 = Color3.new(1, 1, 1)
iat.BackgroundTransparency = 1
iat.Position = UDim2.new(0.268361211, 0, 0.208823398, 0)
iat.Size = UDim2.new(0, 85, 0, 18)
iat.Font = Enum.Font.Gotham
iat.Text = "Ininite Ammo"
iat.TextColor3 = Color3.new(1, 1, 1)
iat.TextSize = 12

mt_2.Name = "mt"
mt_2.Parent = miscs
mt_2.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
mt_2.BorderSizePixel = 0
mt_2.Position = UDim2.new(1.81132078, 0, 0.337499976, 0)
mt_2.Size = UDim2.new(0, 46, 0, 9)
mt_2.Font = Enum.Font.GothamSemibold
mt_2.Text = "FPS: 60"
mt_2.TextColor3 = Color3.new(1, 1, 1)
mt_2.TextSize = 11

mt_3.Name = "mt"
mt_3.Parent = miscs
mt_3.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
mt_3.BorderSizePixel = 0
mt_3.Position = UDim2.new(1.78616357, 0, 0.56250006, 0)
mt_3.Size = UDim2.new(0, 55, 0, 15)
mt_3.Font = Enum.Font.GothamSemibold
mt_3.Text = "Status:"
mt_3.TextColor3 = Color3.new(1, 1, 1)
mt_3.TextSize = 11
mt_3.TextWrapped = true

mt_4.Name = "mt"
mt_4.Parent = miscs
mt_4.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
mt_4.BorderSizePixel = 0
mt_4.Position = UDim2.new(1.74634862, 0, 0.762499988, 0)
mt_4.Size = UDim2.new(0, 67, 0, 15)
mt_4.Font = Enum.Font.GothamSemibold
mt_4.Text = "Whitelisted"
mt_4.TextColor3 = Color3.new(0.72549, 1, 0.737255)
mt_4.TextSize = 10
mt_4.TextWrapped = true

armoredpatrol.MouseButton1Down:connect(function()
    loadstring(game:HttpGet(
                   "https://raw.githubusercontent.com/machport/machport.github.io/master/ArmoredPatrol.lua"))()
end)
chatbypass.MouseButton1Down:connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/JFeVbTv6", true))()
end)
opengift.MouseButton1Down:connect(function()
    local Remote = game.ReplicatedStorage.Resources.Remotes['Gift']
    Remote:InvokeServer(game.Players.LocalPlayer)
end)
opengift10.MouseButton1Down:connect(function()
    for count = 1, 10 do
        local Remote = game.ReplicatedStorage.Resources.Remotes['Gift']
        Remote:InvokeServer(game.Players.LocalPlayer)
    end
end)
speed.MouseButton1Down:connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
end)
aimbot.MouseButton1Down:connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY", true))()
end)
reviz.MouseButton1Down:connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/KNUzQPYS", true))()
end)
fullbright.MouseButton1Down:connect(function()
    loadstring(game:HttpGet("https://paste.ee/r/NRfmI/0", true))()
end)
infammo.MouseButton1Down:connect(function() end)

