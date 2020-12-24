HumanDied = false
local CountSCIFIMOVIELOL = 1
function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
	local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 5772000--67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 5772000
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "Ath_"..CountSCIFIMOVIELOL
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "Ath_"..CountSCIFIMOVIELOL
	AttachmentA.Orientation = Angle or Vector3.new(0,0,0)
	AttachmentA.Position = Position or Vector3.new(0,0,0)
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentA;
	AlignOri.Attachment0 = AttachmentB;
	CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
	return {AlignPos,AlignOri,AttachmentA,AttachmentB}
end
 
if _G.netted ~= true then
	_G.netted = true
	coroutine.wrap(function()
		settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		settings().Physics.AllowSleep = false
		game:GetService("RunService").RenderStepped:Connect(function()
			game:FindFirstChildOfClass("Players").LocalPlayer.MaximumSimulationRadius=math.pow(math.huge,math.huge)
			sethiddenproperty(game:FindFirstChildOfClass("Players").LocalPlayer,"SimulationRadius",math.huge*math.huge)
		end)
	end)()
end
 
game:FindFirstChildOfClass("Players").LocalPlayer["Character"].Archivable = true
local hatnameclone = {}
for _,v in next, game:FindFirstChildOfClass("Players").LocalPlayer["Character"]:GetChildren() do
	if v:IsA("Accessory") then
		if hatnameclone[v.Name] then
			if hatnameclone[v.Name] == "s" then
				hatnameclone[v.Name] = {}
			end
			table.insert(hatnameclone[v.Name],v)
		else
			hatnameclone[v.Name] = "s"
		end
	end
end
for _,v in pairs(hatnameclone) do
	if type(v) == "table" then
		local num = 1
		for _,w in pairs(v) do
			w.Name = w.Name..num
			num = num + 1
		end
	end
end
hatnameclone = nil
 
local DeadChar = game:FindFirstChildOfClass("Players").LocalPlayer.Character
 
local fldr = Instance.new("Folder",game:FindFirstChildOfClass("Players").LocalPlayer["Character"])
fldr.Name = "DMYF"
local CloneChar = DeadChar:Clone()
local ANIMATIONHERE
if CloneChar:FindFirstChild("Animate") then
	ANIMATIONHERE = CloneChar:FindFirstChild("Animate"):Clone()
	CloneChar:FindFirstChild("Animate"):Destroy()
end
if CloneChar:FindFirstChildOfClass("Folder") then CloneChar:FindFirstChildOfClass("Folder"):Destroy() end
if CloneChar.Torso:FindFirstChild("Neck") then
	local Clonessss = CloneChar.Torso:FindFirstChild("Neck"):Clone()
	Clonessss.Part0 = nil
	Clonessss.Part1 = DeadChar.Head
	Clonessss.Parent = DeadChar.Torso
end
CloneChar.Parent = fldr
CloneChar.HumanoidRootPart.CFrame = DeadChar.HumanoidRootPart.CFrame
CloneChar.Humanoid.BreakJointsOnDeath = false
CloneChar.Name = "non"
CloneChar.Humanoid.DisplayDistanceType = "None"
 
for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		local topacc = false
		if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
		v.Handle.Massless = true
		v.Handle.CanCollide = false
		if v.Handle:FindFirstChildOfClass("Attachment") then
			local ath__ = v.Handle:FindFirstChildOfClass("Attachment")
			if ath__.Name == "HatAttachment" or ath__.Name == "HairAttachment" or ath__.Name == "FaceFrontAttachment" or ath__.Name == "FaceCenterAttachment" then
				topacc = ath__.Name
			end
		end
        local bv = Instance.new("BodyVelocity",v.Handle)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			if topacc then
				local allthings = SCIFIMOVIELOL(v.Handle,DeadChar.Torso,Vector3.new(0,1.5,0)+ (DeadChar.Head[topacc].Position + (v.Handle[topacc].Position*-1)),Vector3.new(0,0,0))
				local normaltop = allthings[1].Attachment1
				local alipos = allthings[1]
				local alirot = allthings[2]
				local p0 = v.Handle
				local p1 = DeadChar.Head
				alipos.Parent = CloneChar:FindFirstChild(v.Name).Handle
				alirot.Parent = CloneChar:FindFirstChild(v.Name).Handle
				while true do
					game:GetService("RunService").RenderStepped:wait()
					if HumanDied then break end
					coroutine.wrap(function()
						if alipos.Attachment1 == normaltop then
							p0.CFrame = p0.CFrame:lerp((((DeadChar.Torso.CFrame * CFrame.new(0,1.5,0)) * p1[topacc].CFrame) * p0[topacc].CFrame:inverse()),1)
						else
							v.Handle.CFrame = v.Handle.CFrame:lerp(alipos.Attachment1.Parent.CFrame * CFrame.new(alipos.Attachment1.Position) * CFrame.Angles(math.rad(alipos.Attachment1.Rotation.X),math.rad(alipos.Attachment1.Rotation.Y),math.rad(alipos.Attachment1.Rotation.Z)),1)
						end
					end)()
				end
			else
				SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
			end
		end)()
    end
end
 
local a = DeadChar.Torso
local b = DeadChar.HumanoidRootPart
local c = DeadChar.Humanoid
a.Parent = game:FindFirstChildOfClass("Workspace")
c.Parent = game:FindFirstChildOfClass("Workspace")
local told = a:Clone()
local told1 = c:Clone()
b["RootJoint"].Part0 = told
b["RootJoint"].Part1 = DeadChar.Head
a.Name = "torso"
a.Neck:Destroy()
c.Name = "Mizt Hub Best"
told.Parent = DeadChar
told1.Parent = DeadChar
DeadChar.PrimaryPart = told
told1.Health = 0
b:Destroy()
a.Parent = DeadChar
c.Parent = DeadChar
told:Destroy()
told1:Destroy()
a.Name = "Torso"
 
if CloneChar.Head:FindFirstChildOfClass("Decal") then CloneChar.Head:FindFirstChildOfClass("Decal").Transparency = 1 end
if DeadChar:FindFirstChild("Animate") then DeadChar:FindFirstChild("Animate"):Destroy() end
 
local Collider
function UnCollide()
    if HumanDied then Collider:Disconnect(); return end
    --[[for _,Parts in next, CloneChar:GetChildren() do
        if Parts:IsA("BasePart") then
            Parts.CanCollide = false 
        end 
    end]]
    for _,Parts in next, DeadChar:GetChildren() do
        if Parts:IsA("BasePart") then
        Parts.CanCollide = false
        end 
    end 
end
Collider = game:GetService("RunService").Stepped:Connect(UnCollide)
 
local resetBindable = Instance.new("BindableEvent")
resetBindable.Event:connect(function()
    game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
	resetBindable:Destroy()
	HumanDied = true
    pcall(function()
		game:FindFirstChildOfClass("Players").LocalPlayer.Character = DeadChar
		DeadChar.Head:Destroy()
		DeadChar:FindFirstChildOfClass("Humanoid"):Destroy()
		game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
		if DeadChar:FindFirstChildOfClass("Folder") then DeadChar:FindFirstChildOfClass("Folder"):Destroy() end
	end)
end)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)
 
coroutine.wrap(function()
    while true do
        game:GetService("RunService").RenderStepped:wait()
        if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChildOfClass("Humanoid") or CloneChar:FindFirstChildOfClass("Humanoid").Health <= 0 and not DeadChar or not DeadChar:FindFirstChild("Head") or not DeadChar:FindFirstChildOfClass("Humanoid") or DeadChar:FindFirstChildOfClass("Humanoid").Health <= 0 then 
            HumanDied = true
            pcall(function()
				game:FindFirstChildOfClass("Players").LocalPlayer.Character = DeadChar
				DeadChar.Head:Destroy()
				DeadChar:FindFirstChildOfClass("Humanoid"):Destroy()
				game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
				if DeadChar:FindFirstChildOfClass("Folder") then DeadChar:FindFirstChildOfClass("Folder"):Destroy() end
			end)
            if resetBindable then
                game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
                resetBindable:Destroy()
            end
            break
        end		
    end
end)()
 
 
SCIFIMOVIELOL(DeadChar["Head"],CloneChar["Head"])
SCIFIMOVIELOL(DeadChar["Torso"],CloneChar["Torso"])
SCIFIMOVIELOL(DeadChar["Left Arm"],CloneChar["Left Arm"])
SCIFIMOVIELOL(DeadChar["Right Arm"],CloneChar["Right Arm"])
SCIFIMOVIELOL(DeadChar["Left Leg"],CloneChar["Left Leg"])
SCIFIMOVIELOL(DeadChar["Right Leg"],CloneChar["Right Leg"])
 
for _,v in pairs(DeadChar:GetChildren()) do
	if v:IsA("BasePart") and v.Name ~= "Head" then
		--[[local bv = Instance.new("BodyVelocity",v)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if HumanDied then break end
				v.CFrame = CloneChar[v.Name].CFrame
			end
		end)()]]
	elseif v:IsA("BasePart") and v.Name == "Head" then
		local bv = Instance.new("BodyVelocity",v)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			while true do
				game:GetService("RunService").RenderStepped:wait()
				if HumanDied then break end
				v.CFrame = DeadChar.Torso.CFrame * CFrame.new(0,1.5,0)
			end
		end)()
	end
end
 
for _,BodyParts in next, CloneChar:GetDescendants() do
if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
BodyParts.Transparency = 1 end end
game:GetService("RunService").RenderStepped:wait()
game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
game:FindFirstChildOfClass("Workspace"):FindFirstChildOfClass("Camera").CameraSubject = CloneChar.Humanoid
 
for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
	end
end
wait(0.1)
 
IT = Instance.new
CF = CFrame.new
VT = Vector3.new
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
NS = NumberSequence.new
NSK = NumberSequenceKeypoint.new
RAY = Ray.new
CS = ColorSequence.new
NR = NumberRange.new
TI = TweenInfo.new
RAND = Random.new
 
ANGLES = CFrame.Angles
 
COS = math.cos
ACOS = math.acos
RAD = math.rad
SIN = math.sin
MRANDOM = math.random
MHUGE = math.huge
FLOOR = math.floor
SQRT = math.sqrt
CEIL = math.ceil
 
Character = game.Players.LocalPlayer.Character
Torso = Character.Torso
Root = Character.HumanoidRootPart
Neck = Torso.Neck
RootJoint = Root.RootJoint
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
 
--values and other stuff
 
NeckOrg = CF(0,-.5,0) * ANGLES(RAD(-90),0,RAD(180))
RootJointOrg = CF(0,0,0) * ANGLES(RAD(-90),0,RAD(180))
LeftShoulderOrg = CF(.5,.5,0) * ANGLES(0,RAD(-90),0)
RightShoulderOrg = CF(-.5,.5,0) * ANGLES(0,RAD(90),0)
LeftHipOrg = CF(-.5,1,0) * ANGLES(0,RAD(-90),0)
RightHipOrg = CF(.5,1,0) * ANGLES(0,RAD(90),0)
 
HB = game["Run Service"].Heartbeat
 
local so = IT("Sound")
so.SoundId = "rbxassetid://5599347184"
so.Looped = true
so.Volume = 4
so.Parent = Root
 
repeat wait() until so.IsLoaded
 
function co(f)
	coroutine.resume(coroutine.create(f))
end
 
function Clerp(joint,cf,bool)
	local s = .45/1.825
	local dir = Enum.EasingDirection.Out
	if bool == false then
		dir = Enum.EasingDirection.In
		s = .35/1.825
	end
	game.TweenService:Create(joint,TweenInfo.new(s,Enum.EasingStyle.Sine,dir),{C1 = cf}):Play()
	if joint == RightHip then
		wait(s)
	end
end
 
function swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		HB:Wait()
	else
		for i=1,NUMBER do
			HB:Wait()
		end
	end
end
 
Clerp(Neck,NeckOrg,false)
Clerp(RootJoint,RootJointOrg * CF(0,0,.5),false)
Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(60),0,RAD(15)),false)
Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(60),0,RAD(-15)),false)
Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0),false)
Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0),false)
 
so:Play()
 
while true do
	Clerp(Neck,NeckOrg)
	Clerp(RootJoint,RootJointOrg * ANGLES(0,0,RAD(-45)))
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(105),0,RAD(120)))
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(105),0,RAD(-120)))
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0))
	Clerp(RightHip,RightHipOrg)
 
	Clerp(Neck,NeckOrg,false)
	Clerp(RootJoint,RootJointOrg * CF(0,0,.5),false)
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(-45),0,RAD(120)),false)
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(-45),0,RAD(-120)),false)
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0),false)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0),false)
 
	Clerp(Neck,NeckOrg)
	Clerp(RootJoint,RootJointOrg * ANGLES(0,0,RAD(45)))
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(0,0,RAD(120)))
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(0,0,RAD(-120)))
	Clerp(LeftHip,LeftHipOrg)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0))
 
	Clerp(Neck,NeckOrg,false)
	Clerp(RootJoint,RootJointOrg * CF(0,0,.5),false)
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(25),0,0),false)
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(25),0,0),false)
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0),false)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0),false)
 
	Clerp(Neck,NeckOrg)
	Clerp(RootJoint,RootJointOrg * ANGLES(0,0,RAD(-45)))
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(60),0,RAD(15)))
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(60),0,RAD(-15)))
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0))
	Clerp(RightHip,RightHipOrg)
 
	Clerp(Neck,NeckOrg,false)
	Clerp(RootJoint,RootJointOrg * CF(0,0,.5),false)
	Clerp(LeftShoulder,LeftShoulderOrg * CF(0,-.5,0) * ANGLES(RAD(-45),0,RAD(15)),false)
	Clerp(RightShoulder,RightShoulderOrg * CF(0,-.5,0) * ANGLES(RAD(-45),0,RAD(-15)),false)
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0),false)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0),false)
 
	Clerp(Neck,NeckOrg)
	Clerp(RootJoint,RootJointOrg * ANGLES(0,0,RAD(45)))
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(-105),0,RAD(20)))
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(-105),0,RAD(-20)))
	Clerp(LeftHip,LeftHipOrg)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0))
 
	Clerp(Neck,NeckOrg,false)
	Clerp(RootJoint,RootJointOrg * CF(0,0,.5),false)
	Clerp(LeftShoulder,LeftShoulderOrg * ANGLES(RAD(60),0,RAD(15)),false)
	Clerp(RightShoulder,RightShoulderOrg * ANGLES(RAD(60),0,RAD(-15)),false)
	Clerp(LeftHip,LeftHipOrg * CF(.5,-.5,0),false)
	Clerp(RightHip,RightHipOrg * CF(-.5,-.5,0),false)
end
