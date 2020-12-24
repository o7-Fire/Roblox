- Objects
 
local FEGui = Instance.new("ScreenGui")
local MainBody = Instance.new("Frame")
local Title = Instance.new("Frame")
local Bottom = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Animations = Instance.new("TextButton")
local CreeperR6 = Instance.new("TextButton")
local CreeperR15 = Instance.new("TextButton")
local AnimationsR15 = Instance.new("TextButton")
local FEDropHats = Instance.new("TextButton")
local NoLimbs = Instance.new("TextButton")
local FEbtools = Instance.new("TextButton")
local FlyR6 = Instance.new("TextButton")
local FEinvisible = Instance.new("TextButton")
local Glitchmax = Instance.new("TextButton")
local FEFloatinghead = Instance.new("TextButton")
local Inform = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
 
-- Properties
 
FEGui.Name = "FE Gui"
FEGui.Parent = game.Players.LocalPlayer.PlayerGui
FEGui.ResetOnSpawn = false
 
MainBody.Name = "Main Body"
MainBody.Parent = FEGui
MainBody.Active = true
MainBody.BackgroundColor3 = Color3.new(0, 0, 0)
MainBody.Draggable = true
MainBody.Position = UDim2.new(0.536635697, 0, 0.0425101332, 0)
MainBody.Size = UDim2.new(0, 353, 0, 270)
 
Title.Name = "Title"
Title.Parent = MainBody
Title.BackgroundColor3 = Color3.new(0.0313726, 0.321569, 1)
Title.Position = UDim2.new(0.000818580389, 0, -0.000419855118, 0)
Title.Size = UDim2.new(0, 353, 0, 27)
 
Bottom.Name = "Bottom"
Bottom.Parent = MainBody
Bottom.BackgroundColor3 = Color3.new(0.0235294, 0.627451, 1)
Bottom.Position = UDim2.new(0.000818580389, 0, 0.0986804739, 0)
Bottom.Size = UDim2.new(0, 353, 0, 16)
 
TextLabel.Parent = MainBody
TextLabel.BackgroundColor3 = Color3.new(0.0313726, 0.321569, 1)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 200, 0, 19)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "Troll FE"
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextSize = 14
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
 
Animations.Name = "Animations"
Animations.Parent = MainBody
Animations.BackgroundColor3 = Color3.new(0, 0.615686, 1)
Animations.Position = UDim2.new(0.698873341, 0, 0.194331974, 0)
Animations.Size = UDim2.new(0, 106, 0, 27)
Animations.Font = Enum.Font.SciFi
Animations.Text = "Animations"
Animations.TextColor3 = Color3.new(1, 1, 1)
Animations.TextSize = 14
 
Animations.MouseButton1Down:connect(function()
	local Gui = Instance.new("ScreenGui", game.CoreGui)
Gui.Name = "FE Animations"
local Background = Instance.new("Frame",Gui)
Background.Name = "Background"
Background.Active = true
Background.BackgroundColor3 = Color3.fromRGB(220,220,255)
Background.Transparency = 0.3
Background.BorderSizePixel = 5
Background.Draggable = true
Background.Position = UDim2.new(0,300,0,300)
Background.Size = UDim2.new(0,345,0,190)
local Title = Instance.new("TextLabel",Background)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0,0,0,-80)
Title.Size = UDim2.new(0,290,1,0)
Title.Font = "SourceSansLight"
Title.FontSize = "Size18"
Title.Text = "FE Animations [by illremember]"
Title.TextColor3 = Color3.fromRGB(20,20,25)
 
local Chop = Instance.new("TextButton", Background)
Chop.Name = "Chop"
Chop.BackgroundColor3 = Color3.fromRGB(20,20,20)
Chop.BackgroundTransparency = 0.1
Chop.BorderSizePixel = 0
Chop.Position = UDim2.new(0,120,0,30)
Chop.Size = UDim2.new(0,100,0,30)
Chop.Font = "SourceSansItalic"
Chop.FontSize = "Size18"
Chop.Text = "Chop"
Chop.TextColor3 = Color3.fromRGB(230,230,230)
Chop.TextWrapped = true
 
local Dance = Chop:Clone()
Dance.Name = "Dance"
Dance.Parent = Background
Dance.Position = UDim2.new(0,120,0,70)
Dance.Text = "Dance"
 
local ArmsOut = Chop:Clone()
ArmsOut.Name = "ArmsOut"
ArmsOut.Parent = Background
ArmsOut.Position = UDim2.new(0,10,0,110)
ArmsOut.Text = "ArmsOut"
 
local Stab = Chop:Clone()
Stab.Name = "Stab"
Stab.Parent = Background
Stab.Position = UDim2.new(0,10,0,30)
Stab.Text = "Stab"
 
local SmellyRun = Chop:Clone()
SmellyRun.Name = "SmellyRun"
SmellyRun.Parent = Background
SmellyRun.Position = UDim2.new(0,10,0,70)
SmellyRun.Text = "SmellyRun"
 
local rando = Chop:Clone()
rando.Name = "rando"
rando.Parent = Background
rando.Position = UDim2.new(0,120,0,110)
rando.Text = "rando"
 
local hmm = Chop:Clone()
hmm.Name = "hmm"
hmm.Parent = Background
hmm.Position = UDim2.new(0,120,0,150)
hmm.Text = "hmm"
 
local Kick = Chop:Clone()
Kick.Name = "Kick"
Kick.Parent = Background
Kick.Position = UDim2.new(0,10,0,150)
Kick.Size = UDim2.new(0,100,0,30)
Kick.Text = "Kick"
 
local Flying = Chop:Clone()
Flying.Name = "Flying"
Flying.Parent = Background
Flying.Position = UDim2.new(0,230,0,30)
Flying.Size = UDim2.new(0,100,0,30)
Flying.Text = "Flying"
 
local Arms = Chop:Clone()
Arms.Name = "Arms"
Arms.Parent = Background
Arms.Position = UDim2.new(0,230,0,70)
Arms.Size = UDim2.new(0,100,0,30)
Arms.Text = "Arms"
 
local Sword = Chop:Clone()
Sword.Name = "Sword"
Sword.Parent = Background
Sword.Position = UDim2.new(0,230,0,110)
Sword.Size = UDim2.new(0,100,0,30)
Sword.Text = "Sword"
 
local Insane = Chop:Clone()
Insane.Name = "Insane"
Insane.Parent = Background
Insane.Position = UDim2.new(0,230,0,150)
Insane.Size = UDim2.new(0,100,0,30)
Insane.Text = "Insane"
 
--
 local plr = game.Players.LocalPlayer
 
local mouse = plr:GetMouse()
 
lpc = game.Players.LocalPlayer.Character
 
weld1 = Instance.new("Weld")
 
Chop.MouseButton1Down:connect(function()
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "33169596"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
end
end
end)
 
Insane.MouseButton1Down:connect(function()
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "33796059"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(10000)
end
end
end)
 
Arms.MouseButton1Down:connect(function()
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "33169583"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
end
end
end)
 
Sword.MouseButton1Click:connect(function()
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "35978879"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
end
end
end)
 
hmm.MouseButton1Down:connect(function()
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "33855276"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
end
end
end)
 
rando.MouseButton1Down:connect(function()
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "48977286"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
end
end
end)
 
Dance.MouseButton1Down:connect(function()
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "35654637"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
end
end
end)
 
Stab.MouseButton1Down:connect(function()
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "66703241"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
end
end
end)
 
Kick.MouseButton1Down:connect(function()
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "45737360"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
end
end
end)
 
Flying.MouseButton1Down:connect(function()
flying = not flying
repeat wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 70
local speed = 0
if flying then
	Fly.BackgroundColor3 = loc
else
	Fly.BackgroundColor3 = col
end
 
function FlyFunction()
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = true
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
FlyFunction()
end)
 
SmellyRun.MouseButton1Down:connect(function()
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "30235165"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
end
end
end)
 
ArmsOut.MouseButton1Down:connect(function()
local gg = mouse.Target
if gg ~= nil then
for i,v in pairs(game.Players:GetPlayers()) do
AnimationId = "27432691"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
k:Play()
k:AdjustSpeed(1)
end
end
end)
end)
 
CreeperR6.Name = "Creeper R6"
CreeperR6.Parent = MainBody
CreeperR6.BackgroundColor3 = Color3.new(0, 0.615686, 1)
CreeperR6.Position = UDim2.new(-0.000271856785, 0, 0.194331974, 0)
CreeperR6.Size = UDim2.new(0, 106, 0, 27)
CreeperR6.Font = Enum.Font.SciFi
CreeperR6.Text = "Creeper (R6)"
CreeperR6.TextColor3 = Color3.new(1, 1, 1)
CreeperR6.TextSize = 14
 
CreeperR6.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character.Head.Mesh:Destroy()
game.Players.LocalPlayer.Character["Left Arm"]:Destroy()
game.Players.LocalPlayer.Character["Right Arm"]:Destroy()
end)
 
CreeperR15.Name = "Creeper R15"
CreeperR15.Parent = MainBody
CreeperR15.BackgroundColor3 = Color3.new(0, 0.615686, 1)
CreeperR15.Position = UDim2.new(0.349042743, 0, 0.192480117, 0)
CreeperR15.Size = UDim2.new(0, 106, 0, 27)
CreeperR15.Font = Enum.Font.SciFi
CreeperR15.Text = "Creeper (R15)"
CreeperR15.TextColor3 = Color3.new(1, 1, 1)
CreeperR15.TextSize = 14
 
CreeperR15.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character.Head.Mesh:Destroy()
game.Players.LocalPlayer.Character.LeftHand:Destroy()
game.Players.LocalPlayer.Character.LeftLowerArm:Destroy()
game.Players.LocalPlayer.Character.LeftUpperArm:Destroy()
game.Players.LocalPlayer.Character.RightHand:Destroy()
game.Players.LocalPlayer.Character.RightLowerArm:Destroy()
game.Players.LocalPlayer.Character.RightUpperArm:Destroy()
end)
 
AnimationsR15.Name = "Animations R15"
AnimationsR15.Parent = MainBody
AnimationsR15.BackgroundColor3 = Color3.new(0, 0.615686, 1)
AnimationsR15.Position = UDim2.new(0.698873341, 0, 0.34988755, 0)
AnimationsR15.Size = UDim2.new(0, 106, 0, 27)
AnimationsR15.Font = Enum.Font.SciFi
AnimationsR15.Text = "Animations (R15)"
AnimationsR15.TextColor3 = Color3.new(1, 1, 1)
AnimationsR15.TextSize = 14
 
AnimationsR15.MouseButton1Down:connect(function()
	loadstring(Game:GetObjects("rbxassetid://1202558084")[1].Source)()
end)
 
FEDropHats.Name = "FE DropHats"
FEDropHats.Parent = MainBody
FEDropHats.BackgroundColor3 = Color3.new(0, 0.615686, 1)
FEDropHats.Position = UDim2.new(0.347598553, 0, 0.34988755, 0)
FEDropHats.Size = UDim2.new(0, 106, 0, 27)
FEDropHats.Font = Enum.Font.SciFi
FEDropHats.Text = "FE DropHats"
FEDropHats.TextColor3 = Color3.new(1, 1, 1)
FEDropHats.TextSize = 14
 
FEDropHats.MouseButton1Down:connect(function()
	local a=Instance.new("ScreenGui")a.Parent=game.CoreGui;local b=Instance.new("Frame")b.BackgroundTransparency=1;b.Parent=a;local c=Instance.new("TextButton")c.Active=true;c.BackgroundColor3=Color3.new(0.827451,0,0.0117647)c.BorderSizePixel=0;c.Name="topbar"c.Position=UDim2.new(4.84556389,0,3.46589231,0)c.Selectable=true;c.Size=UDim2.new(0,297,0,31)c.Style=Enum.ButtonStyle.Custom;c.Font=Enum.Font.Legacy;c.FontSize=Enum.FontSize.Size14;c.Text=""c.Draggable=true;c.Parent=b;local d=Instance.new("Frame")d.BackgroundColor3=Color3.new(0.678431,0,0.00784314)d.BackgroundTransparency=0.55000001192093;d.BorderSizePixel=0;d.Size=UDim2.new(0,297,0,160)d.Draggable=true;d.Parent=c;local e=Instance.new("TextButton")e.Active=true;e.BackgroundColor3=Color3.new(0.713726,0.121569,0.133333)e.Position=UDim2.new(0.0404040404,0,0.268750012,0)e.Selectable=true;e.Size=UDim2.new(0,126,0,73)e.Style=Enum.ButtonStyle.Custom;e.Font=Enum.Font.Highway;e.FontSize=Enum.FontSize.Size32;e.Text="DROP"e.TextColor3=Color3.new(1,1,1)e.TextStrokeColor3=Color3.new(1,0,0.0156863)e.TextStrokeTransparency=0;e.Parent=d;local f=Instance.new("TextButton")f.Active=true;f.BackgroundColor3=Color3.new(0.713726,0.121569,0.133333)f.Position=UDim2.new(0.537963867,0,0.268750012,0)f.Selectable=true;f.Size=UDim2.new(0,126,0,73)f.Style=Enum.ButtonStyle.Custom;f.Font=Enum.Font.Highway;f.FontSize=Enum.FontSize.Size24;f.Text="Hats = Blocks"f.TextColor3=Color3.new(1,1,1)f.TextStrokeColor3=Color3.new(1,0,0.0156863)f.TextStrokeTransparency=0;f.TextWrapped=true;f.Parent=d;local g=Instance.new("TextLabel")g.BackgroundColor3=Color3.new(0.611765,0,0.00784314)g.BorderSizePixel=0;g.Position=UDim2.new(0,0,0.837499976,0)g.Size=UDim2.new(0,297,0,26)g.Font=Enum.Font.Highway;g.FontSize=Enum.FontSize.Size18;g.Text="This was made by I low."g.TextColor3=Color3.new(1,1,1)g.Parent=d;local h=Instance.new("TextLabel")h.BackgroundColor3=Color3.new(0.639216,0.635294,0.647059)h.BackgroundTransparency=1;h.BorderSizePixel=0;h.Size=UDim2.new(0,297,0,31)h.Font=Enum.Font.Highway;h.FontSize=Enum.FontSize.Size18;h.Text="FE Drop Hats"h.TextColor3=Color3.new(1,1,1)h.Parent=d;local i=Instance.new("TextButton")i.Active=true;i.BackgroundColor3=Color3.new(0.815686,0,0)i.Position=UDim2.new(0,0,0.947432756,0)i.Selectable=true;i.Size=UDim2.new(0,98,0,43)i.Style=Enum.ButtonStyle.Custom;i.Font=Enum.Font.Highway;i.FontSize=Enum.FontSize.Size14;i.Text="Hide/Show"i.TextColor3=Color3.new(1,1,1)i.Parent=a;e.MouseButton1Click:connect(function()local j=game.Players.LocalPlayer;for k,l in pairs(j.Character:GetChildren())do if l:IsA'Accoutrement'then l.Parent=game.Workspace end end end)f.MouseButton1Click:connect(function()local j=game.Players.LocalPlayer;for k,l in pairs(j.Character:GetChildren())do if l:IsA'Accoutrement'then l.Handle.Mesh:Destroy()end end end)i.MouseButton1Click:connect(function()if b.Visible==true then b.Visible=false elseif b.Visible==false then b.Visible=true end end)
end)
 
NoLimbs.Name = "No Limbs"
NoLimbs.Parent = MainBody
NoLimbs.BackgroundColor3 = Color3.new(0, 0.615686, 1)
NoLimbs.Position = UDim2.new(-0.000843375921, 0, 0.34988755, 0)
NoLimbs.Size = UDim2.new(0, 106, 0, 27)
NoLimbs.Font = Enum.Font.SciFi
NoLimbs.Text = "No lmbs"
NoLimbs.TextColor3 = Color3.new(1, 1, 1)
NoLimbs.TextSize = 14
 
NoLimbs.MouseButton1Down:connect(function()
	game.Players.LocalPlayer.Character["Left Leg"]:Destroy()
	game.Players.LocalPlayer.Character["Left Arm"]:Destroy()
	game.Players.LocalPlayer.Character["Right Leg"]:Destroy()
	game.Players.LocalPlayer.Character["Right Arm"]:Destroy()
end)
 
FEbtools.Name = "FE btools"
FEbtools.Parent = MainBody
FEbtools.BackgroundColor3 = Color3.new(0, 0.615686, 1)
FEbtools.Position = UDim2.new(-0.000843375921, 0, 0.501739383, 0)
FEbtools.Size = UDim2.new(0, 106, 0, 27)
FEbtools.Font = Enum.Font.SciFi
FEbtools.Text = "FE btools"
FEbtools.TextColor3 = Color3.new(1, 1, 1)
FEbtools.TextSize = 14
 
FEbtools.MouseButton1Down:connect(function()
	maind = nil
if workspace:FindFirstChild'GiveSystem' then
 if workspace.GiveSystem:FindFirstChild'GiveItem' then
  maind = workspace.GiveSystem.GiveItem
 end
end
if workspace:FindFirstChild'HandToCentre' then
 if workspace.HandToCentre:FindFirstChild'SendItem' then
  maind = workspace.HandToCentre.SendItem
 end
end
if maind == nil then
 print'could not find give event :('
 return
end
tool = Instance.new'Tool'
me = game:GetService'Players'.LocalPlayer
tool.RequiresHandle = false
tool.TextureId = 'http://www.roblox.com/asset/?id=12223874'
tool.Name = 'ya like jazz?'
tool.Parent = me.Backpack
buttonf = nil
tool.Equipped:connect(function()
 local m = game:GetService'Players'.LocalPlayer:GetMouse()
 m.Icon = 'rbxasset://textures/HammerCursor.png'
 buttonf = m.Button1Down:connect(function()
  if m.Target == nil then return end
  local ob = m.Target
  if ob:IsA'BasePart' or ob:IsA'WedgePart' then
   if ob:IsDescendantOf(me.Character) then return end
   m.Icon = 'rbxasset://textures/HammerOverCursor.png'
   local ex = Instance.new'Explosion'
   ex.BlastRadius = 0
   ex.Position = ob.Position
   ex.Parent = workspace
   maind:FireServer(workspace, ob)
   wait(0.3)
   m.Icon = 'rbxasset://textures/HammerCursor.png'
  end
 end)
end)
tool.Unequipped:connect(function()
 if buttonf ~= nil then
  buttonf:Disconnect()
  buttonf = nil
 end
 local m = game:GetService'Players'.LocalPlayer:GetMouse()
 m.Icon = ''
end)
end)
 
FlyR6.Name = "Fly (R6)"
FlyR6.Parent = MainBody
FlyR6.BackgroundColor3 = Color3.new(0, 0.615686, 1)
FlyR6.Position = UDim2.new(0.347598553, 0, 0.501739383, 0)
FlyR6.Size = UDim2.new(0, 106, 0, 27)
FlyR6.Font = Enum.Font.SciFi
FlyR6.Text = "Fly (R6)"
FlyR6.TextColor3 = Color3.new(1, 1, 1)
FlyR6.TextSize = 14
 
FlyR6.MouseButton1Down:connect(function()
	-- FLY SCRIPT BY RGEENEUS
 
-- The following code should be in a local script.
-- Only works on PC, not xbox or mobile. I do not have devices to test on.
-- Call the start fly function AFTER the character exists to fly. The function does not run if there is no character. 
 
local speed = 50 -- This is the fly speed. Change it to whatever you like. The variable can be changed while running
 
local c
local h
local bv
local bav
local cam
local flying
local p = game.Players.LocalPlayer
local buttons = {W = false, S = false, A = false, D = false, Moving = false}
 
local startFly = function () -- Call this function to begin flying 
	if not p.Character or not p.Character.Head or flying then return end
	c = p.Character
	h = c.Humanoid
	h.PlatformStand = true
	cam = workspace:WaitForChild('Camera')
	bv = Instance.new("BodyVelocity")
	bav = Instance.new("BodyAngularVelocity")
	bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
	bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
	bv.Parent = c.Head
	bav.Parent = c.Head
	flying = true
	h.Died:connect(function() flying = false end)
end
 
local endFly = function () -- Call this function to stop flying
	if not p.Character or not flying then return end
	h.PlatformStand = false
	bv:Destroy()
	bav:Destroy()
	flying = false
end
 
game:GetService("UserInputService").InputBegan:connect(function (input, GPE) 
	if GPE then return end
	for i, e in pairs(buttons) do
		if i ~= "Moving" and input.KeyCode == Enum.KeyCode[i] then
			buttons[i] = true
			buttons.Moving = true
		end
	end
end)
 
game:GetService("UserInputService").InputEnded:connect(function (input, GPE) 
	if GPE then return end
	local a = false
	for i, e in pairs(buttons) do
		if i ~= "Moving" then
			if input.KeyCode == Enum.KeyCode[i] then
				buttons[i] = false
			end
			if buttons[i] then a = true end
		end
	end
	buttons.Moving = a
end)
 
local setVec = function (vec)
	return vec * (speed / vec.Magnitude)
end
 
game:GetService("RunService").Heartbeat:connect(function (step) -- The actual fly function, called every frame
	if flying and c and c.PrimaryPart then
		local p = c.PrimaryPart.Position
		local cf = cam.CFrame
		local ax, ay, az = cf:toEulerAnglesXYZ()
		c:SetPrimaryPartCFrame(CFrame.new(p.x, p.y, p.z) * CFrame.Angles(ax, ay, az))
		if buttons.Moving then
			local t = Vector3.new()
			if buttons.W then t = t + (setVec(cf.lookVector)) end
			if buttons.S then t = t - (setVec(cf.lookVector)) end
			if buttons.A then t = t - (setVec(cf.rightVector)) end
			if buttons.D then t = t + (setVec(cf.rightVector)) end
			c:TranslateBy(t * step)
		end
	end
end)
end)
 
FEinvisible.Name = "FE invisible"
FEinvisible.Parent = MainBody
FEinvisible.BackgroundColor3 = Color3.new(0, 0.615686, 1)
FEinvisible.Position = UDim2.new(0.698873341, 0, 0.501739383, 0)
FEinvisible.Size = UDim2.new(0, 106, 0, 27)
FEinvisible.Font = Enum.Font.SciFi
FEinvisible.Text = "FE Invisible (R6)"
FEinvisible.TextColor3 = Color3.new(1, 1, 1)
FEinvisible.TextSize = 14
 
FEinvisible.MouseButton1Down:connect(function()
	Local = game:GetService('Players').LocalPlayer
Char  = Local.Character
touched,tpdback = false, false
Local.CharacterAdded:connect(function(char)
    if script.Disabled ~= true then
        wait(.25)
        loc = Char.HumanoidRootPart.Position
        Char:MoveTo(box.Position + Vector3.new(0,.5,0))
    end
end)
game:GetService('UserInputService').InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.Equals then
        if script.Disabled ~= true then
            script.Disabled = true
            print'you may re-execute'
        end
    end
end)
box = Instance.new('Part',workspace)
box.Anchored = true
box.CanCollide = true
box.Size = Vector3.new(10,1,10)
box.Position = Vector3.new(0,10000,0)
box.Touched:connect(function(part)
    if (part.Parent.Name == Local.Name) then
        if touched == false then
            touched = true
            function apply()
                if script.Disabled ~= true then
                    no = Char.HumanoidRootPart:Clone()
                    wait(.25)
                    Char.HumanoidRootPart:Destroy()
                    no.Parent = Char
                    Char:MoveTo(loc)
                    touched = false
                end end
            if Char then
                apply()
            end
        end
    end
end)
repeat wait() until Char
loc = Char.HumanoidRootPart.Position
Char:MoveTo(box.Position + Vector3.new(0,.5,0))
end)
 
Glitchmax.Name = "Glitchmax"
Glitchmax.Parent = MainBody
Glitchmax.BackgroundColor3 = Color3.new(0, 0.615686, 1)
Glitchmax.Position = UDim2.new(-0.000843346119, 0, 0.653591216, 0)
Glitchmax.Size = UDim2.new(0, 106, 0, 27)
Glitchmax.Font = Enum.Font.SciFi
Glitchmax.Text = "Glitchmax GUI"
Glitchmax.TextColor3 = Color3.new(1, 1, 1)
Glitchmax.TextSize = 14
 
Glitchmax.MouseButton1Down:connect(function()
	-- Objects
 
local GlitchMax = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseGUI = Instance.new("TextButton")
local Credit = Instance.new("TextLabel")
local DetailTopFrame = Instance.new("Frame")
local ButtonFrame = Instance.new("Frame")
local UserBox = Instance.new("TextBox")
local Flatten = Instance.new("TextButton")
local Push = Instance.new("TextButton")
local LockOn = Instance.new("TextButton")
local Float = Instance.new("TextButton")
local Stick = Instance.new("TextButton")
local Experimental = Instance.new("TextButton")
local SideFrame = Instance.new("Frame")
local OpenGUI = Instance.new("TextButton")
local SideCredit = Instance.new("TextLabel")
local SideTitle = Instance.new("TextLabel")
 
-- Properties
 
GlitchMax.Name = "GlitchMax"
GlitchMax.Parent = game.CoreGui
 
MainFrame.Name = "MainFrame"
MainFrame.Parent = GlitchMax
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.BackgroundTransparency = 1
MainFrame.Draggable = true
MainFrame.Position = UDim2.new(0, 570, 0, 61)
MainFrame.Size = UDim2.new(0, 376, 0, 285)
 
TopFrame.Name = "TopFrame"
TopFrame.Parent = MainFrame
TopFrame.BackgroundColor3 = Color3.new(0.466667, 0.47451, 1)
TopFrame.Size = UDim2.new(0, 376, 0, 36)
 
Title.Name = "Title"
Title.Parent = TopFrame
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 376, 0, 36)
Title.Font = Enum.Font.Highway
Title.FontSize = Enum.FontSize.Size14
Title.Text = "GlitchMax"
Title.TextColor3 = Color3.new(0.243137, 0.372549, 0.4)
Title.TextScaled = true
Title.TextSize = 14
Title.TextStrokeColor3 = Color3.new(1, 1, 1)
Title.TextStrokeTransparency = 0
Title.TextWrapped = true
 
CloseGUI.Name = "CloseGUI"
CloseGUI.Parent = TopFrame
CloseGUI.BackgroundColor3 = Color3.new(1, 1, 1)
CloseGUI.BackgroundTransparency = 1
CloseGUI.Position = UDim2.new(0, 327, 0, 0)
CloseGUI.Size = UDim2.new(0, 49, 0, 36)
CloseGUI.Font = Enum.Font.SourceSans
CloseGUI.FontSize = Enum.FontSize.Size60
CloseGUI.Text = "X"
CloseGUI.TextSize = 50
 
Credit.Name = "Credit"
Credit.Parent = TopFrame
Credit.BackgroundColor3 = Color3.new(1, 1, 1)
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0, 16, 0, 0)
Credit.Size = UDim2.new(0, 96, 0, 36)
Credit.Font = Enum.Font.Highway
Credit.FontSize = Enum.FontSize.Size14
Credit.Text = "illremember"
Credit.TextColor3 = Color3.new(0.431373, 0.662745, 0.709804)
Credit.TextScaled = true
Credit.TextSize = 14
Credit.TextStrokeColor3 = Color3.new(1, 1, 1)
Credit.TextStrokeTransparency = 0
Credit.TextWrapped = true
 
DetailTopFrame.Name = "DetailTopFrame"
DetailTopFrame.Parent = MainFrame
DetailTopFrame.BackgroundColor3 = Color3.new(0.541176, 0.678431, 1)
DetailTopFrame.Position = UDim2.new(0, 0, 0, 37)
DetailTopFrame.Size = UDim2.new(0, 376, 0, 11)
 
ButtonFrame.Name = "ButtonFrame"
ButtonFrame.Parent = MainFrame
ButtonFrame.BackgroundColor3 = Color3.new(0.945098, 0.945098, 0.945098)
ButtonFrame.Position = UDim2.new(0, 0, 0, 49)
ButtonFrame.Size = UDim2.new(0, 376, 0, 236)
 
UserBox.Name = "UserBox"
UserBox.Parent = ButtonFrame
UserBox.BackgroundColor3 = Color3.new(0.898039, 0.898039, 0.898039)
UserBox.BorderColor3 = Color3.new(0.360784, 0.384314, 0.392157)
UserBox.BorderSizePixel = 5
UserBox.Position = UDim2.new(0, 33, 0, 15)
UserBox.Size = UDim2.new(0, 310, 0, 31)
UserBox.Font = Enum.Font.SourceSans
UserBox.FontSize = Enum.FontSize.Size14
UserBox.Text = ""
UserBox.TextScaled = true
UserBox.TextSize = 14
UserBox.TextWrapped = true
 
Flatten.Name = "Flatten"
Flatten.Parent = ButtonFrame
Flatten.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
Flatten.BorderColor3 = Color3.new(0.368627, 0.576471, 0.72549)
Flatten.BorderSizePixel = 2
Flatten.Position = UDim2.new(0, 22, 0, 66)
Flatten.Size = UDim2.new(0, 135, 0, 36)
Flatten.Font = Enum.Font.Highway
Flatten.FontSize = Enum.FontSize.Size32
Flatten.Text = "Flatten"
Flatten.TextColor3 = Color3.new(0.827451, 0.827451, 0.827451)
Flatten.TextScaled = true
Flatten.TextSize = 30
Flatten.TextWrapped = true
 
Push.Name = "Push"
Push.Parent = ButtonFrame
Push.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
Push.BorderColor3 = Color3.new(0.368627, 0.576471, 0.72549)
Push.BorderSizePixel = 2
Push.Position = UDim2.new(0, 22, 0, 126)
Push.Size = UDim2.new(0, 135, 0, 36)
Push.Font = Enum.Font.Highway
Push.FontSize = Enum.FontSize.Size32
Push.Text = "Push"
Push.TextColor3 = Color3.new(0.827451, 0.827451, 0.827451)
Push.TextScaled = true
Push.TextSize = 30
Push.TextWrapped = true
 
LockOn.Name = "LockOn"
LockOn.Parent = ButtonFrame
LockOn.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
LockOn.BorderColor3 = Color3.new(0.368627, 0.576471, 0.72549)
LockOn.BorderSizePixel = 2
LockOn.Position = UDim2.new(0, 22, 0, 186)
LockOn.Size = UDim2.new(0, 135, 0, 36)
LockOn.Font = Enum.Font.Highway
LockOn.FontSize = Enum.FontSize.Size32
LockOn.Text = "LockOn"
LockOn.TextColor3 = Color3.new(0.827451, 0.827451, 0.827451)
LockOn.TextSize = 30
LockOn.TextWrapped = true
 
Float.Name = "Float"
Float.Parent = ButtonFrame
Float.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
Float.BorderColor3 = Color3.new(0.368627, 0.576471, 0.72549)
Float.BorderSizePixel = 2
Float.Position = UDim2.new(0, 218, 0, 66)
Float.Size = UDim2.new(0, 135, 0, 36)
Float.Font = Enum.Font.Highway
Float.FontSize = Enum.FontSize.Size32
Float.Text = "Float"
Float.TextColor3 = Color3.new(0.827451, 0.827451, 0.827451)
Float.TextScaled = true
Float.TextSize = 30
Float.TextWrapped = true
 
Stick.Name = "Stick"
Stick.Parent = ButtonFrame
Stick.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
Stick.BorderColor3 = Color3.new(0.368627, 0.576471, 0.72549)
Stick.BorderSizePixel = 2
Stick.Position = UDim2.new(0, 218, 0, 126)
Stick.Size = UDim2.new(0, 135, 0, 36)
Stick.Font = Enum.Font.Highway
Stick.FontSize = Enum.FontSize.Size32
Stick.Text = "Stick"
Stick.TextColor3 = Color3.new(0.827451, 0.827451, 0.827451)
Stick.TextSize = 30
Stick.TextWrapped = true
 
Experimental.Name = "Experimental"
Experimental.Parent = ButtonFrame
Experimental.BackgroundColor3 = Color3.new(0.254902, 0.254902, 0.254902)
Experimental.BorderColor3 = Color3.new(0.368627, 0.576471, 0.72549)
Experimental.BorderSizePixel = 2
Experimental.Position = UDim2.new(0, 218, 0, 186)
Experimental.Size = UDim2.new(0, 135, 0, 36)
Experimental.Font = Enum.Font.Highway
Experimental.FontSize = Enum.FontSize.Size28
Experimental.Text = "Experimental"
Experimental.TextColor3 = Color3.new(0.827451, 0.827451, 0.827451)
Experimental.TextSize = 25
Experimental.TextWrapped = true
 
SideFrame.Name = "SideFrame"
SideFrame.Parent = GlitchMax
SideFrame.Active = true
SideFrame.BackgroundColor3 = Color3.new(0.466667, 0.47451, 1)
SideFrame.Draggable = true
SideFrame.Position = UDim2.new(0, 570, 0, 61)
SideFrame.Size = UDim2.new(0, 376, 0, 36)
SideFrame.Visible = false
 
OpenGUI.Name = "OpenGUI"
OpenGUI.Parent = SideFrame
OpenGUI.BackgroundColor3 = Color3.new(1, 1, 1)
OpenGUI.BackgroundTransparency = 1
OpenGUI.Position = UDim2.new(0, 327, 0, 0)
OpenGUI.Size = UDim2.new(0, 49, 0, 36)
OpenGUI.Font = Enum.Font.SourceSans
OpenGUI.FontSize = Enum.FontSize.Size60
OpenGUI.Text = "X"
OpenGUI.TextSize = 50
 
SideCredit.Name = "SideCredit"
SideCredit.Parent = SideFrame
SideCredit.BackgroundColor3 = Color3.new(1, 1, 1)
SideCredit.BackgroundTransparency = 1
SideCredit.Position = UDim2.new(0, 16, 0, 0)
SideCredit.Size = UDim2.new(0, 96, 0, 36)
SideCredit.Font = Enum.Font.Highway
SideCredit.FontSize = Enum.FontSize.Size14
SideCredit.Text = "illremember"
SideCredit.TextColor3 = Color3.new(0.431373, 0.662745, 0.709804)
SideCredit.TextScaled = true
SideCredit.TextSize = 14
SideCredit.TextStrokeColor3 = Color3.new(1, 1, 1)
SideCredit.TextStrokeTransparency = 0
SideCredit.TextWrapped = true
 
SideTitle.Name = "SideTitle"
SideTitle.Parent = SideFrame
SideTitle.BackgroundColor3 = Color3.new(1, 1, 1)
SideTitle.BackgroundTransparency = 1
SideTitle.Size = UDim2.new(0, 376, 0, 36)
SideTitle.Font = Enum.Font.Highway
SideTitle.FontSize = Enum.FontSize.Size14
SideTitle.Text = "GlitchMax"
SideTitle.TextColor3 = Color3.new(0.243137, 0.372549, 0.4)
SideTitle.TextScaled = true
SideTitle.TextSize = 14
SideTitle.TextStrokeColor3 = Color3.new(1, 1, 1)
SideTitle.TextStrokeTransparency = 0
SideTitle.TextWrapped = true
 
-- Buttons
 
col = Color3.new(0.254902, 0.254902, 0.254902)
loc = Color3.new(0.40, 0.40, 0.40)
 
CloseGUI.MouseButton1Click:connect(function()
	MainFrame.Visible = false
	SideFrame.Visible = true
	SideFrame.Position = MainFrame.Position
end)
 
OpenGUI.MouseButton1Click:connect(function()
	MainFrame.Visible = true
	SideFrame.Visible = false
	MainFrame.Position = SideFrame.Position
end)
 
function shortnames(username)
    local nameshort = {}
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Name:lower():sub(1, #username) == username:lower() then
            table.insert(nameshort,v)
        end
    end    
    return nameshort    
end
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://282574440"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
flattening = false
Flatten.MouseButton1Click:connect(function()
	flattening = not flattening
	if flattening then
		Flatten.BackgroundColor3 = loc
		local y = Instance.new("RocketPropulsion")
		y.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		y.CartoonFactor = 1
		y.MaxThrust = 50000
		y.MaxSpeed = 1000
		y.ThrustP = 50000
		y.Name = "Flatten"
		for i,v in pairs(shortnames(UserBox.Text))do
			y.Target = game.Players[v.name].Character["Left Leg"]
			y:Fire()
			track:Play(.1, 1, 1)
			game:GetService('RunService').Stepped:connect(function()
				if flattening then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
			while wait(0.3) do
				if flattening then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame + Vector3.new(0,2,0)
				end
			end
		end
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.Flatten:Destroy()
		track:Stop()
		Flatten.BackgroundColor3 = col
	end
end)
 
floating = false
Float.MouseButton1Click:connect(function()
	floating = not floating
	if floating then
		Float.BackgroundColor3 = loc
		local y = Instance.new("RocketPropulsion")
		y.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		y.CartoonFactor = 1
		y.MaxThrust = 50000
		y.MaxSpeed = 1000
		y.ThrustP = 50000
		y.Name = "Float"
		for i,v in pairs(shortnames(UserBox.Text))do
			y.Target = game.Players[v.Name].Character.Head
			y:Fire()
			game:GetService('RunService').Stepped:connect(function()
				if floating then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
			while wait(0.3) do
				if floating then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character["Left Leg"].CFrame
				end
			end
		end
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.Float:Destroy()
		Float.BackgroundColor3 = col
	end
end)
 
LockOnACTIVE = false
LockOn.MouseButton1Click:connect(function()
	LockOnACTIVE = not LockOnACTIVE
	for i,v in pairs(shortnames(UserBox.Text))do
		while wait() do
			if LockOnACTIVE then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v.Name].Character.HumanoidRootPart.CFrame
				LockOn.BackgroundColor3 = loc
			else
				LockOn.BackgroundColor3 = col
			end
		end
	end
end)
 
pushing = false
Push.MouseButton1Click:connect(function()
	pushing = not pushing
	if pushing then
		Push.BackgroundColor3 = loc
		local b = Instance.new("RocketPropulsion")
		b.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		b.TurnP = 2500
		b.MaxThrust = 50000
		b.MaxSpeed = 1000
		b.ThrustP = 50000
		b.CartoonFactor = 1
		b.Name = "Push"
		for i,v in pairs(shortnames(UserBox.Text))do
			b.Target = game.Players[v.Name].Character.HumanoidRootPart
			b:Fire()
			game:GetService('RunService').Stepped:connect(function()
				if pushing then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
			b:Fire()
		end
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.Push:Destroy()
		Push.BackgroundColor3 = col
	end
end)
 
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://215384594"
local track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
experi = false
Experimental.MouseButton1Click:connect(function()
	experi = not experi
	if experi then
		Experimental.BackgroundColor3 = loc
		local h = Instance.new("RocketPropulsion")
		h.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		h.Name = "Experimental"
		for i,v in pairs(shortnames(UserBox.Text))do
			h.Target = game.Players[v.Name].Character.HumanoidRootPart
			h:Fire()
			track:Play(.1,1,1)
			game:GetService('RunService').Stepped:connect(function()
				if experi then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
		end
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.Experimental:Destroy()
		track:Stop()
		Stick.BackgroundColor3 = col
	end
end)
 
stuck = false
Stick.MouseButton1Click:connect(function()
	stuck = not stuck
	if stuck then
		Stick.BackgroundColor3 = loc
		local h = Instance.new("RocketPropulsion")
		h.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		h.MaxSpeed = 1000
		h.MaxThrust = 10000
		h.Name = "Stick"
		for i,v in pairs(shortnames(UserBox.Text))do
			h.Target = game.Players[v.Name].Character.HumanoidRootPart
			h:Fire()
			game:GetService('RunService').Stepped:connect(function()
				if stuck then
					game.Players.LocalPlayer.Character.Head.CanCollide = false
					game.Players.LocalPlayer.Character.Torso.CanCollide = false
					game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
					game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
				end
			end)
		end
	else
		game.Players.LocalPlayer.Character.HumanoidRootPart.Stick:Destroy()
		Stick.BackgroundColor3 = col
	end
end)
end)
 
 
FEFloatinghead.Name = "FE Floating head"
FEFloatinghead.Parent = MainBody
FEFloatinghead.BackgroundColor3 = Color3.new(0, 0.615686, 1)
FEFloatinghead.Position = UDim2.new(0.347598583, 0, 0.653591216, 0)
FEFloatinghead.Size = UDim2.new(0, 106, 0, 27)
FEFloatinghead.Font = Enum.Font.SciFi
FEFloatinghead.Text = "FE FloatingHead"
FEFloatinghead.TextColor3 = Color3.new(1, 1, 1)
FEFloatinghead.TextSize = 14
 
FEFloatinghead.MouseButton1Down:connect(function()
	local speed = 50 -- This is the fly speed. Change it to whatever you like. The variable can be changed while running
local c
local h
local bv
local bav
local cam
local flying
local p = game:GetService'Players'.LocalPlayer
local buttons = {W = false, S = false, A = false, D = false, Moving = false}
local startFly = function () -- Call this function to begin flying 
if not p.Character or not p.Character.Head or flying then return end
c = p.Character
h = c.Humanoid
h.PlatformStand = true
cam = workspace:WaitForChild('Camera')
bv = Instance.new("BodyVelocity")
bav = Instance.new("BodyAngularVelocity")
bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
bv.Parent = c.Head
bav.Parent = c.Head
flying = true
h.Died:connect(function() flying = false end)
end
local endFly = function () -- Call this function to stop flying
if not p.Character or not flying then return end
h.PlatformStand = false
bv:Destroy()
bav:Destroy()
flying = false
end
game:GetService("UserInputService").InputBegan:connect(function (input, GPE) 
if GPE then return end
for i, e in pairs(buttons) do
if i ~= "Moving" and input.KeyCode == Enum.KeyCode[i] then
buttons[i] = true
buttons.Moving = true
end
end
end)
game:GetService("UserInputService").InputEnded:connect(function (input, GPE) 
if GPE then return end
local a = false
for i, e in pairs(buttons) do
if i ~= "Moving" then
if input.KeyCode == Enum.KeyCode[i] then
buttons[i] = false
end
if buttons[i] then a = true end
end
end
buttons.Moving = a
end)
local setVec = function (vec)
return vec * (speed / vec.Magnitude)
end
game:GetService("RunService").Heartbeat:connect(function (step) -- The actual fly function, called every frame
if flying and c and c.PrimaryPart then
local p = c.PrimaryPart.Position
local cf = cam.CFrame
local ax, ay, az = cf:toEulerAnglesXYZ()
c:SetPrimaryPartCFrame(CFrame.new(p.x, p.y, p.z) * CFrame.Angles(ax, ay, az))
if buttons.Moving then
local t = Vector3.new()
if buttons.W then t = t + (setVec(cf.lookVector)) end
if buttons.S then t = t - (setVec(cf.lookVector)) end
if buttons.A then t = t - (setVec(cf.rightVector)) end
if buttons.D then t = t + (setVec(cf.rightVector)) end
c:TranslateBy(t * step)
end
end
end)
FEFloatinghead.MouseButton1Down:connect(function()
local lol = game:GetService'Players'.LocalPlayer.Character
pcall(function()
for i,v in pairs(lol:GetChildren()) do
if v.Name ~= 'Head' and v.Name ~= 'Torso' and v.Name ~= 'HumanoidRootPart' then
v:Destroy()
end
end
local ok = lol:FindFirstChild'Torso'
if ok then ok = ok:FindFirstChild'roblox' if ok then ok:Destroy() end end
Instance.new('Humanoid', lol)
if lol.HumanoidRootPart:FindFirstChild'Rank' then lol.HumanoidRootPart:FindFirstChild'Rank':Destroy() end
local nouxd = lol:FindFirstChild'Torso'
wait'1'
lol.Head.Position = lol.Head.Position + Vector3.new(1,1,1)
if nouxd then nouxd.Transparency = 1 end
wait'.3'
startFly()
end)
end)
end)
 
 
 
Inform.Name = "Inform"
Inform.Parent = MainBody
Inform.BackgroundColor3 = Color3.new(0, 0.615686, 1)
Inform.Position = UDim2.new(0.698873401, 0, 0.653591216, 0)
Inform.Size = UDim2.new(0, 106, 0, 27)
Inform.Font = Enum.Font.SciFi
Inform.Text = "ChatLogs"
Inform.TextColor3 = Color3.new(1, 1, 1)
Inform.TextSize = 14
 
Inform.MouseButton1Down:connect(function()
	loadstring(game:GetObjects("rbxassetid://1295331911")[1].Source)()
end)
 
TextLabel_2.Parent = MainBody
TextLabel_2.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.940740705, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 16)
TextLabel_2.Font = Enum.Font.ArialBold
TextLabel_2.Text = "Made by 1x7x9x0x3x1x9"
TextLabel_2.TextColor3 = Color3.new(1, 1, 1)
TextLabel_2.TextSize = 14
