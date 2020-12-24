-- Gui to Lua
-- Version: 3.2
 
-- Instances:
 
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local Frame_3 = Instance.new("Frame")
local Bypass = Instance.new("TextButton")
local HENRY = Instance.new("TextButton")
local Minigun = Instance.new("TextButton")
local Trapgun = Instance.new("TextButton")
local RE = Instance.new("TextButton")
local Elioblasio = Instance.new("TextButton")
local rickroll = Instance.new("TextButton")
local Ragdoll = Instance.new("TextButton")
local Neko = Instance.new("TextButton")
local Death = Instance.new("TextButton")
local Deathv2 = Instance.new("TextButton")
local zoom = Instance.new("TextButton")
local ImageLabel = Instance.new("ImageLabel")
local ImageLabel_2 = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
 
--Properties:
 
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
 
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.215639815, 0, 0.420863301, 0)
Frame.Size = UDim2.new(0, 496, 0, 235)
Frame.Active = true
Frame.Draggable = true
 
Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(197, 104, 10)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(0, 496, 0, 2)
 
Frame_3.Parent = Frame
Frame_3.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0, 0, -0.123817541, 0)
Frame_3.Size = UDim2.new(0, 496, 0, 29)
 
Bypass.Name = "Bypass"
Bypass.Parent = Frame_3
Bypass.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Bypass.BorderSizePixel = 0
Bypass.Position = UDim2.new(0.0282258056, 0, 1.43462956, 0)
Bypass.Size = UDim2.new(0, 101, 0, 41)
Bypass.Font = Enum.Font.SourceSans
Bypass.Text = "Bypass"
Bypass.TextColor3 = Color3.fromRGB(255, 255, 255)
Bypass.TextSize = 14.000
Bypass.MouseButton1Down:connect(function()
 
 
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
		local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "AthP_"..CountSCIFIMOVIELOL
		local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "AthP_"..CountSCIFIMOVIELOL
		local AttachmentC=Instance.new('Attachment',Part1); AttachmentC.Name = "AthO_"..CountSCIFIMOVIELOL
		local AttachmentD=Instance.new('Attachment',Part0); AttachmentD.Name = "AthO_"..CountSCIFIMOVIELOL
		AttachmentC.Orientation = Angle or Vector3.new(0,0,0)
		AttachmentA.Position = Position or Vector3.new(0,0,0)
		AlignPos.Attachment1 = AttachmentA;
		AlignPos.Attachment0 = AttachmentB;
		AlignOri.Attachment1 = AttachmentC;
		AlignOri.Attachment0 = AttachmentD;
		CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
		return {AlignPos,AttachmentA,AttachmentB,AlignOri,AttachmentC,AttachmentD}
	end
 
	if _G.netted ~= true then
		_G.netted = true
		coroutine.wrap(function()
			settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
			settings().Physics.ThrottleAdjustTime = math.huge*math.huge
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
	local CloneChar = game:FindFirstChildOfClass("Players").LocalPlayer["Character"]:Clone()
	CloneChar.Parent = game:FindFirstChildOfClass("Workspace"):FindFirstChildOfClass("Terrain")
	CloneChar.HumanoidRootPart.CFrame = game:FindFirstChildOfClass("Players").LocalPlayer["Character"].HumanoidRootPart.CFrame
	CloneChar.Humanoid.BreakJointsOnDeath = false
	CloneChar.Name = "non" 
	CloneChar.Humanoid.DisplayDistanceType = "None"
 
	local DeadChar = game:FindFirstChildOfClass("Players").LocalPlayer.Character
 
	for _,v in next, DeadChar:GetChildren() do
		if v:IsA("Accessory") then
			local topacc = false
			if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
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
					local alirot = allthings[4]
					local p0 = v.Handle
					local p1 = DeadChar.Head
					while true do
						game:GetService("RunService").RenderStepped:wait()
						if HumanDied then break end
						coroutine.wrap(function()
							if alipos.Attachment1 == normaltop then
								p0.CFrame = (((DeadChar.Torso.CFrame * CFrame.new(0,1.5,0)) * p1[topacc].CFrame) * p0[topacc].CFrame:inverse())
							else
								v.Handle.CFrame = alipos.Attachment1.Parent.CFrame * CFrame.new(alipos.Attachment1.Position) * CFrame.Angles(math.rad(alirot.Attachment1.Rotation.X),math.rad(alirot.Attachment1.Rotation.Y),math.rad(alirot.Attachment1.Rotation.Z))
							end
						end)()
					end
				else
					SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
				--[[while true do
					game:GetService("RunService").RenderStepped:wait()
					if HumanDied then break end
					local alipos = CloneChar[v.Name].Handle:FindFirstChildOfClass("AlignPosition")
					local alirot = CloneChar[v.Name].Handle:FindFirstChildOfClass("AlignOrientation")
					v.Handle.CFrame = alipos.Attachment1.Parent.CFrame * CFrame.new(alipos.Attachment1.Position) * CFrame.Angles(math.rad(alirot.Attachment1.Rotation.X),math.rad(alirot.Attachment1.Rotation.Y),math.rad(alirot.Attachment1.Rotation.Z))
				end]]
				end
			end)()
		end
	end
 
	game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
	game:FindFirstChildOfClass("Players").LocalPlayer.Character = DeadChar
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
	c.Name = "hum"
	told.Parent = DeadChar
	told1.Parent = DeadChar
	DeadChar.PrimaryPart = told
	told1.Health = 0
	a.Parent = DeadChar
	c.Parent = DeadChar
	b:Destroy()
	told:Destroy()
	told1:Destroy()
	a.Name = "Torso"
 
	if CloneChar.Head:FindFirstChildOfClass("Decal") then CloneChar.Head:FindFirstChildOfClass("Decal").Transparency = 1 end
	if DeadChar:FindFirstChild("Animate") then DeadChar:FindFirstChild("Animate"):Destroy() end
 
	local Collider
	function UnCollide()
		if HumanDied then Collider:Disconnect(); return end
    --[[for _,Parts in next, CloneChar:GetDescendants() do
        if Parts:IsA("BasePart") then
            Parts.CanCollide = false 
        end 
    end]]
		for _,Parts in next, DeadChar:GetDescendants() do
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
			DeadChar.hum.Name = "Humanoid"
			DeadChar.Humanoid.Health = 0
			DeadChar.Head:Destroy()
			game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
			CloneChar.Humanoid.Health = 0
			CloneChar.Head:Destroy()
			for _,v in pairs(game:FindFirstChildOfClass("Workspace"):FindFirstChildOfClass("Terrain"):GetChildren()) do
				if v.Name == "non" then
					v:Destroy()
				end
			end
		end)
	end)
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)
 
	coroutine.wrap(function()
		while true do
			game:GetService("RunService").RenderStepped:wait()
			if not CloneChar or not CloneChar:FindFirstChild("Head") or not CloneChar:FindFirstChild("Humanoid") or CloneChar:FindFirstChild("Humanoid").Health  0.01 then
				playAnimation("walk", 0.1, Humanoid)
				if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then
					setAnimationSpeed(speed / 14.5)
				end
				pose = "Running"
			else
				if emoteNames[currentAnim] == nil then
					playAnimation("idle", 0.1, Humanoid)
					pose = "Standing"
				end
			end
		end
 
		function onDied()
			pose = "Dead"
		end
 
		function onJumping()
			playAnimation("jump", 0.1, Humanoid)
			jumpAnimTime = jumpAnimDuration
			pose = "Jumping"
		end
 
		function onClimbing(speed)
			playAnimation("climb", 0.1, Humanoid)
			setAnimationSpeed(speed / 12.0)
			pose = "Climbing"
		end
 
		function onGettingUp()
			pose = "GettingUp"
		end
 
		function onFreeFall()
			if (jumpAnimTime  0 then
				pose = "Running"
			else
				pose = "Standing"
			end
		end
 
		function getTool()	
			for _, kid in ipairs(Figure:GetChildren()) do
				if kid.className == "Tool" then return kid end
			end
			return nil
		end
 
		function getToolAnim(tool)
			for _, c in ipairs(tool:GetChildren()) do
				if c.Name == "toolanim" and c.className == "StringValue" then
					return c
				end
			end
			return nil
		end
 
		function animateTool()
 
			if (toolAnim == "None") then
				playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle)
				return
			end
 
			if (toolAnim == "Slash") then
				playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
				return
			end
 
			if (toolAnim == "Lunge") then
				playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
				return
			end
		end
 
		function moveSit()
			RightShoulder.MaxVelocity = 0.15
			LeftShoulder.MaxVelocity = 0.15
			RightShoulder:SetDesiredAngle(3.14 /2)
			LeftShoulder:SetDesiredAngle(-3.14 /2)
			RightHip:SetDesiredAngle(3.14 /2)
			LeftHip:SetDesiredAngle(-3.14 /2)
		end
 
		local lastTick = 0
 
		function move(time)
			local amplitude = 1
			local frequency = 1
			local deltaTime = time - lastTick
			lastTick = time
 
			local climbFudge = 0
			local setAngles = false
 
			if (jumpAnimTime > 0) then
				jumpAnimTime = jumpAnimTime - deltaTime
			end
 
			if (pose == "FreeFall" and jumpAnimTime  toolAnimTime then
					toolAnimTime = 0
					toolAnim = "None"
				end
 
				animateTool()		
			else
				stopToolAnimations()
				toolAnim = "None"
				toolAnimInstance = nil
				toolAnimTime = 0
			end
		end
 
 
		local events = {}
		local eventHum = Humanoid
 
		local function onUnhook()
			for i = 1, #events do
				events[i]:Disconnect()
			end
			events = {}
		end
 
		local function onHook()
			onUnhook()
 
			pose = eventHum.Sit and "Seated" or "Standing"
 
			events = {
				eventHum.Died:connect(onDied),
				eventHum.Running:connect(onRunning),
				eventHum.Jumping:connect(onJumping),
				eventHum.Climbing:connect(onClimbing),
				eventHum.GettingUp:connect(onGettingUp),
				eventHum.FreeFalling:connect(onFreeFall),
				eventHum.FallingDown:connect(onFallingDown),
				eventHum.Seated:connect(onSeated),
				eventHum.PlatformStanding:connect(onPlatformStanding),
				eventHum.Swimming:connect(onSwimming)
			}
		end
 
 
		onHook()
		--FOLDER:WaitForChild("Loaded").Value = true
 
 
		-- main program
 
		-- initialize to idle
		playAnimation("idle", 0.1, Humanoid)
		pose = "Standing"
 
		spawn(function()
			while Figure.Parent ~= nil do
				local _, time = wait(0.1)
				move(time)
			end
		end)
 
		return {
			onRunning = onRunning, 
			onDied = onDied, 
			onJumping = onJumping, 
			onClimbing = onClimbing, 
			onGettingUp = onGettingUp, 
			onFreeFall = onFreeFall, 
			onFallingDown = onFallingDown, 
			onSeated = onSeated, 
			onPlatformStanding = onPlatformStanding,
			onHook = onHook,
			onUnhook = onUnhook
		}
 
	end
	RUNANIMATESCRIPT(CloneChar.Animate)
end)
HENRY.Name = "HENRY"
HENRY.Parent = Frame_3
HENRY.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
HENRY.BorderSizePixel = 0
HENRY.Position = UDim2.new(0.268145174, 0, 1.43462956, 0)
HENRY.Size = UDim2.new(0, 101, 0, 41)
HENRY.Font = Enum.Font.SourceSans
HENRY.Text = "Henry dance"
HENRY.TextColor3 = Color3.fromRGB(255, 255, 255)
HENRY.TextSize = 14.000
HENRY.MouseButton1Down:connect(function()
	 --[[
IronBrew:tm: obfuscation; Version 2.7.2
]]
	return(function(distraction_lIlllIlllIIllllIlII,distraction_IllIlIlIIl,distraction_IllIlIlIIl)local distraction_IIIlIIIllIlIIIIllIIlII=string.char;local distraction_lIlIIlIlIIllIIIIllllll=string.sub;local distraction_IIIIIllIIlIIIlllIIl=table.concat;local distraction_IIIllllIllllIlIIIII=math.ldexp;local distraction_IIIIIIIllllllIlIlIlIll=getfenv or function()return _ENV end;local distraction_IlllIlIIllllIlllIl=select;local distraction_lllIlIIII=unpack or table.unpack;local distraction_IlIlIIllI=tonumber;local function distraction_llIIIIllIIIIlIIlIlIIllIIl(distraction_lIlllIlllIIllllIlII)local distraction_IllIIIIlIIIIIlIl,distraction_llIIIIIllIllllllIllIlIl,distraction_IlllllIIlIIlllIIlllIII="","",{}local distraction_IIlIIIIlIlIIl=256;local distraction_lllIlIIII={}for distraction_IllIlIlIIl=0,distraction_IIlIIIIlIlIIl-1 do distraction_lllIlIIII[distraction_IllIlIlIIl]=distraction_IIIlIIIllIlIIIIllIIlII(distraction_IllIlIlIIl)end;local distraction_IllIlIlIIl=1;local function distraction_IIIlIIIlIlIIllllI()local distraction_IllIIIIlIIIIIlIl=distraction_IlIlIIllI(distraction_lIlIIlIlIIllIIIIllllll(distraction_lIlllIlllIIllllIlII,distraction_IllIlIlIIl,distraction_IllIlIlIIl),36)distraction_IllIlIlIIl=distraction_IllIlIlIIl+1;local distraction_llIIIIIllIllllllIllIlIl=distraction_IlIlIIllI(distraction_lIlIIlIlIIllIIIIllllll(distraction_lIlllIlllIIllllIlII,distraction_IllIlIlIIl,distraction_IllIlIlIIl+distraction_IllIIIIlIIIIIlIl-1),36)distraction_IllIlIlIIl=distraction_IllIlIlIIl+distraction_IllIIIIlIIIIIlIl;return distraction_llIIIIIllIllllllIllIlIl end;distraction_IllIIIIlIIIIIlIl=distraction_IIIlIIIllIlIIIIllIIlII(distraction_IIIlIIIlIlIIllllI())distraction_IlllllIIlIIlllIIlllIII[1]=distraction_IllIIIIlIIIIIlIl;while distraction_IllIlIlIIl0 and distraction_llIIIIIllIllllllIllIlIl>0 do local distraction_lIlIIlIlIIllIIIIllllll,distraction_lllIlIIII=distraction_IllIlIlIIl%2,distraction_llIIIIIllIllllllIllIlIl%2 if distraction_lIlIIlIlIIllIIIIllllll~=distraction_lllIlIIII then distraction_IlllllIIlIIlllIIlllIII=distraction_IlllllIIlIIlllIIlllIII+distraction_IllIIIIlIIIIIlIl end distraction_IllIlIlIIl,distraction_llIIIIIllIllllllIllIlIl,distraction_IllIIIIlIIIIIlIl=(distraction_IllIlIlIIl-distraction_lIlIIlIlIIllIIIIllllll)/2,(distraction_llIIIIIllIllllllIllIlIl-distraction_lllIlIIII)/2,distraction_IllIIIIlIIIIIlIl*2 end if distraction_IllIlIlIIl0 do local distraction_llIIIIIllIllllllIllIlIl=distraction_IllIlIlIIl%2 if distraction_llIIIIIllIllllllIllIlIl>0 then distraction_IlllllIIlIIlllIIlllIII=distraction_IlllllIIlIIlllIIlllIII+distraction_IllIIIIlIIIIIlIl end distraction_IllIlIlIIl,distraction_IllIIIIlIIIIIlIl=(distraction_IllIlIlIIl-distraction_llIIIIIllIllllllIllIlIl)/2,distraction_IllIIIIlIIIIIlIl*2 end return distraction_IlllllIIlIIlllIIlllIII end local function distraction_llIIIIIllIllllllIllIlIl(distraction_llIIIIIllIllllllIllIlIl,distraction_IllIlIlIIl,distraction_IllIIIIlIIIIIlIl)if distraction_IllIIIIlIIIIIlIl then local distraction_IllIlIlIIl=(distraction_llIIIIIllIllllllIllIlIl/2^(distraction_IllIlIlIIl-1))%2^((distraction_IllIIIIlIIIIIlIl-1)-(distraction_IllIlIlIIl-1)+1);return distraction_IllIlIlIIl-distraction_IllIlIlIIl%1;else local distraction_IllIlIlIIl=2^(distraction_IllIlIlIIl-1);return(distraction_llIIIIIllIllllllIllIlIl%(distraction_IllIlIlIIl+distraction_IllIlIlIIl)>=distraction_IllIlIlIIl)and 1 or 0;end;end;local distraction_IllIlIlIIl=1;local function distraction_IllIIIIlIIIIIlIl()local distraction_llIIIIIllIllllllIllIlIl,distraction_lllIlIIII,distraction_lIlIIlIlIIllIIIIllllll,distraction_IllIIIIlIIIIIlIl=distraction_lIlllIlllIIllllIlII(distraction_IIIlIIIlIlIIllllI,distraction_IllIlIlIIl,distraction_IllIlIlIIl+3);distraction_llIIIIIllIllllllIllIlIl=distraction_IlllllIIlIIlllIIlllIII(distraction_llIIIIIllIllllllIllIlIl,250)distraction_lllIlIIII=distraction_IlllllIIlIIlllIIlllIII(distraction_lllIlIIII,250)distraction_lIlIIlIlIIllIIIIllllll=distraction_IlllllIIlIIlllIIlllIII(distraction_lIlIIlIlIIllIIIIllllll,250)distraction_IllIIIIlIIIIIlIl=distraction_IlllllIIlIIlllIIlllIII(distraction_IllIIIIlIIIIIlIl,250)distraction_IllIlIlIIl=distraction_IllIlIlIIl+4;return(distraction_IllIIIIlIIIIIlIl*16777216)+(distraction_lIlIIlIlIIllIIIIllllll*65536)+(distraction_lllIlIIII*256)+distraction_llIIIIIllIllllllIllIlIl;end;local function distraction_IlIlIIllI()local distraction_IllIIIIlIIIIIlIl=distraction_IlllllIIlIIlllIIlllIII(distraction_lIlllIlllIIllllIlII(distraction_IIIlIIIlIlIIllllI,distraction_IllIlIlIIl,distraction_IllIlIlIIl),250);distraction_IllIlIlIIl=distraction_IllIlIlIIl+1;return distraction_IllIIIIlIIIIIlIl;end;local function distraction_IIlIIIIlIlIIl()local distraction_llIIIIIllIllllllIllIlIl,distraction_IllIIIIlIIIIIlIl=distraction_lIlllIlllIIllllIlII(distraction_IIIlIIIlIlIIllllI,distraction_IllIlIlIIl,distraction_IllIlIlIIl+2);distraction_llIIIIIllIllllllIllIlIl=distraction_IlllllIIlIIlllIIlllIII(distraction_llIIIIIllIllllllIllIlIl,250)distraction_IllIIIIlIIIIIlIl=distraction_IlllllIIlIIlllIIlllIII(distraction_IllIIIIlIIIIIlIl,250)distraction_IllIlIlIIl=distraction_IllIlIlIIl+2;return(distraction_IllIIIIlIIIIIlIl*256)+distraction_llIIIIIllIllllllIllIlIl;end;local function distraction_llIIIlIlllIl()local distraction_IllIlIlIIl=distraction_IllIIIIlIIIIIlIl();local distraction_IllIIIIlIIIIIlIl=distraction_IllIIIIlIIIIIlIl();local distraction_lIlIIlIlIIllIIIIllllll=1;local distraction_IlllllIIlIIlllIIlllIII=(distraction_llIIIIIllIllllllIllIlIl(distraction_IllIIIIlIIIIIlIl,1,20)*(2^32))+distraction_IllIlIlIIl;local distraction_IllIlIlIIl=distraction_llIIIIIllIllllllIllIlIl(distraction_IllIIIIlIIIIIlIl,21,31);local distraction_IllIIIIlIIIIIlIl=((-1)^distraction_llIIIIIllIllllllIllIlIl(distraction_IllIIIIlIIIIIlIl,32));if(distraction_IllIlIlIIl==0)then if(distraction_IlllllIIlIIlllIIlllIII==0)then return distraction_IllIIIIlIIIIIlIl*0;else distraction_IllIlIlIIl=1;distraction_lIlIIlIlIIllIIIIllllll=0;end;elseif(distraction_IllIlIlIIl==2047)then return(distraction_IlllllIIlIIlllIIlllIII==0)and(distraction_IllIIIIlIIIIIlIl*(1/0))or(distraction_IllIIIIlIIIIIlIl*(0/0));end;return distraction_IIIllllIllllIlIIIII(distraction_IllIIIIlIIIIIlIl,distraction_IllIlIlIIl-1023)*(distraction_lIlIIlIlIIllIIIIllllll+(distraction_IlllllIIlIIlllIIlllIII/(2^52)));end;local distraction_llIIIIllIIIIlIIlIlIIllIIl=distraction_IllIIIIlIIIIIlIl;local function distraction_IIIllllIllllIlIIIII(distraction_IllIIIIlIIIIIlIl)local distraction_llIIIIIllIllllllIllIlIl;if(not distraction_IllIIIIlIIIIIlIl)then distraction_IllIIIIlIIIIIlIl=distraction_llIIIIllIIIIlIIlIlIIllIIl();if(distraction_IllIIIIlIIIIIlIl==0)then return'';end;end;distraction_llIIIIIllIllllllIllIlIl=distraction_lIlIIlIlIIllIIIIllllll(distraction_IIIlIIIlIlIIllllI,distraction_IllIlIlIIl,distraction_IllIlIlIIl+distraction_IllIIIIlIIIIIlIl-1);distraction_IllIlIlIIl=distraction_IllIlIlIIl+distraction_IllIIIIlIIIIIlIl;local distraction_IllIIIIlIIIIIlIl={}for distraction_IllIlIlIIl=1,#distraction_llIIIIIllIllllllIllIlIl do distraction_IllIIIIlIIIIIlIl[distraction_IllIlIlIIl]=distraction_IIIlIIIllIlIIIIllIIlII(distraction_IlllllIIlIIlllIIlllIII(distraction_lIlllIlllIIllllIlII(distraction_lIlIIlIlIIllIIIIllllll(distraction_llIIIIIllIllllllIllIlIl,distraction_IllIlIlIIl,distraction_IllIlIlIIl)),250))end return distraction_IIIIIllIIlIIIlllIIl(distraction_IllIIIIlIIIIIlIl);end;local distraction_IllIlIlIIl=distraction_IllIIIIlIIIIIlIl;local function distraction_IllIlIllllllllIIllIl(...)return{...},distraction_IlllIlIIllllIlllIl('#',...)end local function distraction_llIIIIllIIIIlIIlIlIIllIIl()local distraction_IIIlIIIlIlIIllllI={};local distraction_lIlllIlllIIllllIlII={};local distraction_IllIlIlIIl={};local distraction_IIIlIIIllIlIIIIllIIlII={[#{{342;271;809;781};"1 + 1 = 111";}]=distraction_lIlllIlllIIllllIlII,[#{"1 + 1 = 111";"1 + 1 = 111";{55;131;147;544};}]=nil,[#{"1 + 1 = 111";{514;1;676;964};{137;750;67;403};{26;838;282;566};}]=distraction_IllIlIlIIl,[#{"1 + 1 = 111";}]=distraction_IIIlIIIlIlIIllllI,};local distraction_IllIlIlIIl=distraction_IllIIIIlIIIIIlIl()local distraction_lIlIIlIlIIllIIIIllllll={}for distraction_llIIIIIllIllllllIllIlIl=1,distraction_IllIlIlIIl do local distraction_IllIIIIlIIIIIlIl=distraction_IlIlIIllI();local distraction_IllIlIlIIl;if(distraction_IllIIIIlIIIIIlIl==2)then distraction_IllIlIlIIl=(distraction_IlIlIIllI()~=0);elseif(distraction_IllIIIIlIIIIIlIl==3)then distraction_IllIlIlIIl=distraction_llIIIlIlllIl();elseif(distraction_IllIIIIlIIIIIlIl==1)then distraction_IllIlIlIIl=distraction_IIIllllIllllIlIIIII();end;distraction_lIlIIlIlIIllIIIIllllll[distraction_llIIIIIllIllllllIllIlIl]=distraction_IllIlIlIIl;end;distraction_IIIlIIIllIlIIIIllIIlII[3]=distraction_IlIlIIllI();for distraction_lIlllIlllIIllllIlII=1,distraction_IllIIIIlIIIIIlIl()do local distraction_IllIlIlIIl=distraction_IlIlIIllI();if(distraction_llIIIIIllIllllllIllIlIl(distraction_IllIlIlIIl,1,1)==0)then local distraction_IlllllIIlIIlllIIlllIII=distraction_llIIIIIllIllllllIllIlIl(distraction_IllIlIlIIl,2,3);local distraction_lllIlIIII=distraction_llIIIIIllIllllllIllIlIl(distraction_IllIlIlIIl,4,6);local distraction_IllIlIlIIl={distraction_IIlIIIIlIlIIl(),distraction_IIlIIIIlIlIIl(),nil,nil};if(distraction_IlllllIIlIIlllIIlllIII==0)then distraction_IllIlIlIIl[#("Vj3")]=distraction_IIlIIIIlIlIIl();distraction_IllIlIlIIl[#("3IbT")]=distraction_IIlIIIIlIlIIl();elseif(distraction_IlllllIIlIIlllIIlllIII==1)then distraction_IllIlIlIIl[#("c7f")]=distraction_IllIIIIlIIIIIlIl();elseif(distraction_IlllllIIlIIlllIIlllIII==2)then distraction_IllIlIlIIl[#("okx")]=distraction_IllIIIIlIIIIIlIl()-(2^16)elseif(distraction_IlllllIIlIIlllIIlllIII==3)then distraction_IllIlIlIIl[#("eZh")]=distraction_IllIIIIlIIIIIlIl()-(2^16)distraction_IllIlIlIIl[#("r6qS")]=distraction_IIlIIIIlIlIIl();end;if(distraction_llIIIIIllIllllllIllIlIl(distraction_lllIlIIII,1,1)==1)then distraction_IllIlIlIIl[#("sn")]=distraction_lIlIIlIlIIllIIIIllllll[distraction_IllIlIlIIl[#("VD")]]end if(distraction_llIIIIIllIllllllIllIlIl(distraction_lllIlIIII,2,2)==1)then distraction_IllIlIlIIl[#("y4f")]=distraction_lIlIIlIlIIllIIIIllllll[distraction_IllIlIlIIl[#("3Hy")]]end if(distraction_llIIIIIllIllllllIllIlIl(distraction_lllIlIIII,3,3)==1)then distraction_IllIlIlIIl[#("6e7e")]=distraction_lIlIIlIlIIllIIIIllllll[distraction_IllIlIlIIl[#("sFgk")]]end distraction_IIIlIIIlIlIIllllI[distraction_lIlllIlllIIllllIlII]=distraction_IllIlIlIIl;end end;for distraction_IllIlIlIIl=1,distraction_IllIIIIlIIIIIlIl()do distraction_lIlllIlllIIllllIlII[distraction_IllIlIlIIl-1]=distraction_llIIIIllIIIIlIIlIlIIllIIl();end;return distraction_IIIlIIIllIlIIIIllIIlII;end;local function distraction_IIIllllIllllIlIIIII(distraction_IllIlIlIIl,distraction_IllIIIIlIIIIIlIl,distraction_lIlIIlIlIIllIIIIllllll)distraction_IllIlIlIIl=(distraction_IllIlIlIIl==true and distraction_llIIIIllIIIIlIIlIlIIllIIl())or distraction_IllIlIlIIl;return(function(...)local distraction_IlllllIIlIIlllIIlllIII=distraction_IllIlIlIIl[1];local distraction_IIlIIIIlIlIIl=distraction_IllIlIlIIl[3];local distraction_IIIIIllIIlIIIlllIIl=distraction_IllIlIlIIl[2];local distraction_IIIlIIIlIlIIllllI=distraction_IllIlIllllllllIIllIl local distraction_IllIIIIlIIIIIlIl=1;local distraction_lIlllIlllIIllllIlII=-1;local distraction_llIIIIllIIIIlIIlIlIIllIIl={};local distraction_IIIlIIIllIlIIIIllIIlII={...};local distraction_IlIlIIllI=distraction_IlllIlIIllllIlllIl('#',...)-1;local distraction_IllIlIlIIl={};local distraction_llIIIIIllIllllllIllIlIl={};for distraction_IllIlIlIIl=0,distraction_IlIlIIllI do if(distraction_IllIlIlIIl>=distraction_IIlIIIIlIlIIl)then distraction_llIIIIllIIIIlIIlIlIIllIIl[distraction_IllIlIlIIl-distraction_IIlIIIIlIlIIl]=distraction_IIIlIIIllIlIIIIllIIlII[distraction_IllIlIlIIl+1];else distraction_llIIIIIllIllllllIllIlIl[distraction_IllIlIlIIl]=distraction_IIIlIIIllIlIIIIllIIlII[distraction_IllIlIlIIl+#{{658;892;661;380};}];end;end;local distraction_IllIlIlIIl=distraction_IlIlIIllI-distraction_IIlIIIIlIlIIl+1 local distraction_IllIlIlIIl;local distraction_IlIlIIllI;while true do distraction_IllIlIlIIl=distraction_IlllllIIlIIlllIIlllIII[distraction_IllIIIIlIIIIIlIl];distraction_IlIlIIllI=distraction_IllIlIlIIl[#{{890;694;413;375};}];if distraction_IlIlIIllI
