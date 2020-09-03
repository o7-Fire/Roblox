-- gui made by Nexity
-- Roblox Engine is doomed -Itzbenz

-- Objects

local abc = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local bar = Instance.new("Frame")
local title = Instance.new("TextLabel")
local title_2 = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local aimbot = Instance.new("Frame")
local at = Instance.new("TextLabel")
local rage = Instance.new("TextButton")
local rt = Instance.new("TextLabel")
local lt = Instance.new("TextLabel")
local legit = Instance.new("TextButton")
local esp = Instance.new("Frame")
local et = Instance.new("TextLabel")
local cham = Instance.new("TextButton")
local ct = Instance.new("TextLabel")
local tt = Instance.new("TextLabel")
local trace = Instance.new("TextButton")
local bet = Instance.new("TextLabel")
local boxesp = Instance.new("TextButton")
local miscs = Instance.new("Frame")
local mt = Instance.new("TextLabel")
local infammo = Instance.new("TextButton")
local sst = Instance.new("TextLabel")
local speed = Instance.new("TextButton")
local misc2 = Instance.new("Frame")
local thing = Instance.new("Frame")
local nst = Instance.new("TextLabel")
local spread = Instance.new("TextButton")
local recoil = Instance.new("TextButton")
local nrt = Instance.new("TextLabel")
local iat = Instance.new("TextLabel")
local mt_2 = Instance.new("TextLabel")
local mt_3 = Instance.new("TextLabel")
local mt_4 = Instance.new("TextLabel")
local newtween = function(obj,props,speed,...)
    local info = TweenInfo.new(speed,...); 
    local tween = game:GetService("TweenService"):Create(obj,info,props);
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

aimbot.Name = "aimbot"
aimbot.Parent = main
aimbot.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
aimbot.BorderColor3 = Color3.new(1, 1, 1)
aimbot.Position = UDim2.new(0.0254237279, 0, 0.220833331, 0)
aimbot.Size = UDim2.new(0, 159, 0, 80)

at.Name = "at"
at.Parent = aimbot
at.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
at.BorderSizePixel = 0
at.Position = UDim2.new(0.100628935, 0, -0.162499994, 0)
at.Size = UDim2.new(0, 61, 0, 21)
at.Font = Enum.Font.GothamSemibold
at.Text = "Aimbot"
at.TextColor3 = Color3.new(1, 1, 1)
at.TextSize = 14

rage.Name = "rage"
rage.Parent = aimbot
rage.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
rage.BorderColor3 = Color3.new(1, 1, 1)
rage.Position = UDim2.new(0.100628927, 0, 0.212499976, 0)
rage.Size = UDim2.new(0, 18, 0, 18)
rage.AutoButtonColor = false
rage.Font = Enum.Font.SourceSans
rage.Text = ""
rage.TextColor3 = Color3.new(0, 0, 0)
rage.TextSize = 14

rt.Name = "rt"
rt.Parent = aimbot
rt.BackgroundColor3 = Color3.new(1, 1, 1)
rt.BackgroundTransparency = 1
rt.Position = UDim2.new(0.268361211, 0, 0.208823398, 0)
rt.Size = UDim2.new(0, 85, 0, 18)
rt.Font = Enum.Font.Gotham
rt.Text = "Rage Aimbot"
rt.TextColor3 = Color3.new(1, 1, 1)
rt.TextSize = 12

lt.Name = "lt"
lt.Parent = aimbot
lt.BackgroundColor3 = Color3.new(1, 1, 1)
lt.BackgroundTransparency = 1
lt.Position = UDim2.new(0.268361211, 0, 0.583823442, 0)
lt.Size = UDim2.new(0, 85, 0, 18)
lt.Font = Enum.Font.Gotham
lt.Text = "Legit Aimbot"
lt.TextColor3 = Color3.new(1, 1, 1)
lt.TextSize = 12

legit.Name = "legit"
legit.Parent = aimbot
legit.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
legit.BorderColor3 = Color3.new(1, 1, 1)
legit.Position = UDim2.new(0.100628927, 0, 0.587499976, 0)
legit.Size = UDim2.new(0, 18, 0, 18)
legit.AutoButtonColor = false
legit.Font = Enum.Font.SourceSans
legit.Text = ""
legit.TextColor3 = Color3.new(0, 0, 0)
legit.TextSize = 14

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

cham.Name = "cham"
cham.Parent = esp
cham.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
cham.BorderColor3 = Color3.new(1, 1, 1)
cham.Position = UDim2.new(0.100628927, 0, 0.156944424, 0)
cham.Size = UDim2.new(0, 18, 0, 18)
cham.AutoButtonColor = false
cham.Font = Enum.Font.SourceSans
cham.Text = ""
cham.TextColor3 = Color3.new(0, 0, 0)
cham.TextSize = 14

ct.Name = "ct"
ct.Parent = esp
ct.BackgroundColor3 = Color3.new(1, 1, 1)
ct.BackgroundTransparency = 1
ct.Position = UDim2.new(0.268361211, 0, 0.153267756, 0)
ct.Size = UDim2.new(0, 48, 0, 18)
ct.Font = Enum.Font.Gotham
ct.Text = "Chams"
ct.TextColor3 = Color3.new(1, 1, 1)
ct.TextSize = 12

tt.Name = "tt"
tt.Parent = esp
tt.BackgroundColor3 = Color3.new(1, 1, 1)
tt.BackgroundTransparency = 1
tt.Position = UDim2.new(0.268361211, 0, 0.42641589, 0)
tt.Size = UDim2.new(0, 49, 0, 18)
tt.Font = Enum.Font.Gotham
tt.Text = "Tracers"
tt.TextColor3 = Color3.new(1, 1, 1)
tt.TextSize = 12

trace.Name = "trace"
trace.Parent = esp
trace.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
trace.BorderColor3 = Color3.new(1, 1, 1)
trace.Position = UDim2.new(0.100628927, 0, 0.430092573, 0)
trace.Size = UDim2.new(0, 18, 0, 18)
trace.AutoButtonColor = false
trace.Font = Enum.Font.SourceSans
trace.Text = ""
trace.TextColor3 = Color3.new(0, 0, 0)
trace.TextSize = 14

bet.Name = "bet"
bet.Parent = esp
bet.BackgroundColor3 = Color3.new(1, 1, 1)
bet.BackgroundTransparency = 1
bet.Position = UDim2.new(0.268361211, 0, 0.694934428, 0)
bet.Size = UDim2.new(0, 57, 0, 18)
bet.Font = Enum.Font.Gotham
bet.Text = "Box Esp"
bet.TextColor3 = Color3.new(1, 1, 1)
bet.TextSize = 12

boxesp.Name = "boxesp"
boxesp.Parent = esp
boxesp.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
boxesp.BorderColor3 = Color3.new(1, 1, 1)
boxesp.Position = UDim2.new(0.100628927, 0, 0.698611081, 0)
boxesp.Size = UDim2.new(0, 18, 0, 18)
boxesp.AutoButtonColor = false
boxesp.Font = Enum.Font.SourceSans
boxesp.Text = ""
boxesp.TextColor3 = Color3.new(0, 0, 0)
boxesp.TextSize = 14

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

nst.Name = "nst"
nst.Parent = miscs
nst.BackgroundColor3 = Color3.new(1, 1, 1)
nst.BackgroundTransparency = 1
nst.Position = UDim2.new(1.16773224, 0, 0.333823413, 0)
nst.Size = UDim2.new(0, 72, 0, 18)
nst.Font = Enum.Font.Gotham
nst.Text = "No Spread"
nst.TextColor3 = Color3.new(1, 1, 1)
nst.TextSize = 12

spread.Name = "spread"
spread.Parent = miscs
spread.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
spread.BorderColor3 = Color3.new(1, 1, 1)
spread.Position = UDim2.new(0.99999994, 0, 0.337500006, 0)
spread.Size = UDim2.new(0, 18, 0, 18)
spread.AutoButtonColor = false
spread.Font = Enum.Font.SourceSans
spread.Text = ""
spread.TextColor3 = Color3.new(0, 0, 0)
spread.TextSize = 14

recoil.Name = "recoil"
recoil.Parent = miscs
recoil.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
recoil.BorderColor3 = Color3.new(1, 1, 1)
recoil.Position = UDim2.new(0.99999994, 0, 0.6875, 0)
recoil.Size = UDim2.new(0, 18, 0, 18)
recoil.AutoButtonColor = false
recoil.Font = Enum.Font.SourceSans
recoil.Text = ""
recoil.TextColor3 = Color3.new(0, 0, 0)
recoil.TextSize = 14

nrt.Name = "nrt"
nrt.Parent = miscs
nrt.BackgroundColor3 = Color3.new(1, 1, 1)
nrt.BackgroundTransparency = 1
nrt.Position = UDim2.new(1.16773224, 0, 0.683823407, 0)
nrt.Size = UDim2.new(0, 65, 0, 18)
nrt.Font = Enum.Font.Gotham
nrt.Text = "No Recoil"
nrt.TextColor3 = Color3.new(1, 1, 1)
nrt.TextSize = 12

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

rage.MouseButton1Down:connect(function()
	 newtween(rage,{BackgroundColor3 = Color3.fromRGB(255,255,255)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
legit.MouseButton1Down:connect(function()
	 newtween(legit,{BackgroundColor3 = Color3.fromRGB(255,255,255)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
boxesp.MouseButton1Down:connect(function()
	 newtween(boxesp,{BackgroundColor3 = Color3.fromRGB(255,255,255)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
trace.MouseButton1Down:connect(function()
	 newtween(trace,{BackgroundColor3 = Color3.fromRGB(255,255,255)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
cham.MouseButton1Down:connect(function()
	 newtween(cham,{BackgroundColor3 = Color3.fromRGB(255,255,255)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
infammo.MouseButton1Down:connect(function()
	 newtween(infammo,{BackgroundColor3 = Color3.fromRGB(255,255,255)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
recoil.MouseButton1Down:connect(function()
	 newtween(recoil,{BackgroundColor3 = Color3.fromRGB(255,255,255)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
spread.MouseButton1Down:connect(function()
	 newtween(spread,{BackgroundColor3 = Color3.fromRGB(255,255,255)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
speed.MouseButton1Down:connect(function()
	 newtween(speed,{BackgroundColor3 = Color3.fromRGB(255,255,255)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
rage.MouseEnter:connect(function()
	 newtween(rage,{BackgroundColor3 = Color3.fromRGB(30,30,30)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
legit.MouseEnter:connect(function()
	 newtween(legit,{BackgroundColor3 = Color3.fromRGB(30,30,30)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
boxesp.MouseEnter:connect(function()
	 newtween(boxesp,{BackgroundColor3 = Color3.fromRGB(30,30,30)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
trace.MouseEnter:connect(function()
	 newtween(trace,{BackgroundColor3 = Color3.fromRGB(30,30,30)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
cham.MouseEnter:connect(function()
	 newtween(cham,{BackgroundColor3 = Color3.fromRGB(30,30,30)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
infammo.MouseEnter:connect(function()
	 newtween(infammo,{BackgroundColor3 = Color3.fromRGB(30,30,30)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
recoil.MouseEnter:connect(function()
	 newtween(recoil,{BackgroundColor3 = Color3.fromRGB(30,30,30)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
spread.MouseEnter:connect(function()
	 newtween(spread,{BackgroundColor3 = Color3.fromRGB(30,30,30)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
speed.MouseEnter:connect(function()
	 newtween(speed,{BackgroundColor3 = Color3.fromRGB(30,30,30)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
rage.MouseLeave:connect(function()
	 newtween(rage,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
legit.MouseLeave:connect(function()
	 newtween(legit,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
boxesp.MouseLeave:connect(function()
	 newtween(boxesp,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
trace.MouseLeave:connect(function()
	 newtween(trace,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
cham.MouseLeave:connect(function()
	 newtween(cham,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
infammo.MouseLeave:connect(function()
	 newtween(infammo,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
recoil.MouseLeave:connect(function()
	 newtween(recoil,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
spread.MouseLeave:connect(function()
	 newtween(spread,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
speed.MouseLeave:connect(function()
	 newtween(speed,{BackgroundColor3 = Color3.fromRGB(35,35,35)},0.3,Enum.EasingStyle.Sine,Enum.EasingDirection.In);
end)
