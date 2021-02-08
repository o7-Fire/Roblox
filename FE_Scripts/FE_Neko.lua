HumanDied = false
local CountSCIFIMOVIELOL = 1
function SCIFIMOVIELOL(Part0, Part1, Position, Angle)
    local AlignPos = Instance.new('AlignPosition', Part1);
    AlignPos.Name = "AliP_" .. CountSCIFIMOVIELOL
    AlignPos.ApplyAtCenterOfMass = true;
    AlignPos.MaxForce = 5772000 -- 67752;
    AlignPos.MaxVelocity = math.huge / 9e110;
    AlignPos.ReactionForceEnabled = false;
    AlignPos.Responsiveness = 200;
    AlignPos.RigidityEnabled = false;
    local AlignOri = Instance.new('AlignOrientation', Part1);
    AlignOri.Name = "AliO_" .. CountSCIFIMOVIELOL
    AlignOri.MaxAngularVelocity = math.huge / 9e110;
    AlignOri.MaxTorque = 5772000
    AlignOri.PrimaryAxisOnly = false;
    AlignOri.ReactionTorqueEnabled = false;
    AlignOri.Responsiveness = 200;
    AlignOri.RigidityEnabled = false;
    local AttachmentA = Instance.new('Attachment', Part1);
    AttachmentA.Name = "AthP_" .. CountSCIFIMOVIELOL
    local AttachmentB = Instance.new('Attachment', Part0);
    AttachmentB.Name = "AthP_" .. CountSCIFIMOVIELOL
    local AttachmentC = Instance.new('Attachment', Part1);
    AttachmentC.Name = "AthO_" .. CountSCIFIMOVIELOL
    local AttachmentD = Instance.new('Attachment', Part0);
    AttachmentD.Name = "AthO_" .. CountSCIFIMOVIELOL
    AttachmentC.Orientation = Angle or Vector3.new(0, 0, 0)
    AttachmentA.Position = Position or Vector3.new(0, 0, 0)
    AlignPos.Attachment1 = AttachmentA;
    AlignPos.Attachment0 = AttachmentB;
    AlignOri.Attachment1 = AttachmentC;
    AlignOri.Attachment0 = AttachmentD;
    CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
    return {
        AlignPos, AttachmentA, AttachmentB, AlignOri, AttachmentC, AttachmentD
    }
end

if _G.netted ~= true then
    _G.netted = true
    coroutine.wrap(function()
        settings().Physics.PhysicsEnvironmentalThrottle =
            Enum.EnviromentalPhysicsThrottle.Disabled
        settings().Physics.ThrottleAdjustTime = math.huge * math.huge
        settings().Physics.AllowSleep = false
        game:GetService("RunService").RenderStepped:Connect(
            function()
                game:FindFirstChildOfClass("Players").LocalPlayer
                    .MaximumSimulationRadius = math.pow(math.huge, math.huge)
                sethiddenproperty(
                    game:FindFirstChildOfClass("Players").LocalPlayer,
                    "SimulationRadius", math.huge * math.huge)
            end)
    end)()
end

game:FindFirstChildOfClass("Players").LocalPlayer["Character"].Archivable = true
local hatnameclone = {}
for _, v in next,
            game:FindFirstChildOfClass("Players").LocalPlayer["Character"]:GetChildren() do
    if v:IsA("Accessory") then
        if hatnameclone[v.Name] then
            if hatnameclone[v.Name] == "s" then
                hatnameclone[v.Name] = {}
            end
            table.insert(hatnameclone[v.Name], v)
        else
            hatnameclone[v.Name] = "s"
        end
    end
end
for _, v in pairs(hatnameclone) do
    if type(v) == "table" then
        local num = 1
        for _, w in pairs(v) do
            w.Name = w.Name .. num
            num = num + 1
        end
    end
end
hatnameclone = nil
local CloneChar =
    game:FindFirstChildOfClass("Players").LocalPlayer["Character"]:Clone()
CloneChar.Parent = game:FindFirstChildOfClass("Workspace")
                       :FindFirstChildOfClass("Terrain")
CloneChar.HumanoidRootPart.CFrame =
    game:FindFirstChildOfClass("Players").LocalPlayer["Character"]
        .HumanoidRootPart.CFrame
CloneChar.Humanoid.BreakJointsOnDeath = false
CloneChar.Name = "non"
CloneChar.Humanoid.DisplayDistanceType = "None"

local DeadChar = game:FindFirstChildOfClass("Players").LocalPlayer.Character

for _, v in next, DeadChar:GetChildren() do
    if v:IsA("Accessory") then
        local topacc = false
        if v.Handle:FindFirstChildOfClass("Weld") then
            v.Handle:FindFirstChildOfClass("Weld"):Destroy()
        end
        if v.Handle:FindFirstChildOfClass("Attachment") then
            local ath__ = v.Handle:FindFirstChildOfClass("Attachment")
            if ath__.Name == "HatAttachment" or ath__.Name == "HairAttachment" or
                ath__.Name == "FaceFrontAttachment" or ath__.Name ==
                "FaceCenterAttachment" then topacc = ath__.Name end
        end
        local bv = Instance.new("BodyVelocity", v.Handle)
        bv.Velocity = Vector3.new(0, 0, 0)
        coroutine.wrap(function()
            if topacc then
                local allthings = SCIFIMOVIELOL(v.Handle, DeadChar.Torso,
                                                Vector3.new(0, 1.5, 0) +
                                                    (DeadChar.Head[topacc]
                                                        .Position +
                                                        (v.Handle[topacc]
                                                            .Position * -1)),
                                                Vector3.new(0, 0, 0))
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
                            p0.CFrame = (((DeadChar.Torso.CFrame *
                                            CFrame.new(0, 1.5, 0)) *
                                            p1[topacc].CFrame) *
                                            p0[topacc].CFrame:inverse())
                        else
                            v.Handle.CFrame =
                                alipos.Attachment1.Parent.CFrame *
                                    CFrame.new(alipos.Attachment1.Position) *
                                    CFrame.Angles(
                                        math.rad(alirot.Attachment1.Rotation.X),
                                        math.rad(alirot.Attachment1.Rotation.Y),
                                        math.rad(alirot.Attachment1.Rotation.Z))
                        end
                    end)()
                end
            else
                SCIFIMOVIELOL(v.Handle, CloneChar[v.Name].Handle,
                              Vector3.new(0, 0, 0), Vector3.new(0, 0, 0))
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

if CloneChar.Head:FindFirstChildOfClass("Decal") then
    CloneChar.Head:FindFirstChildOfClass("Decal").Transparency = 1
end
if DeadChar:FindFirstChild("Animate") then
    DeadChar:FindFirstChild("Animate"):Destroy()
end

local Collider
function UnCollide()
    if HumanDied then
        Collider:Disconnect();
        return
    end
    --[[for _,Parts in next, CloneChar:GetDescendants() do
        if Parts:IsA("BasePart") then
            Parts.CanCollide = false 
        end 
    end]]
    for _, Parts in next, DeadChar:GetDescendants() do
        if Parts:IsA("BasePart") then Parts.CanCollide = false end
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
        for _, v in pairs(game:FindFirstChildOfClass("Workspace")
                              :FindFirstChildOfClass("Terrain"):GetChildren()) do
            if v.Name == "non" then v:Destroy() end
        end
    end)
end)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

coroutine.wrap(function()
    while true do
        game:GetService("RunService").RenderStepped:wait()
        if not CloneChar or not CloneChar:FindFirstChild("Head") or
            not CloneChar:FindFirstChild("Humanoid") or
            CloneChar:FindFirstChild("Humanoid").Health <= 0 and not DeadChar or
            not DeadChar:FindFirstChild("Head") or
            not DeadChar:FindFirstChild("hum") or
            DeadChar:FindFirstChild("hum").Health <= 0 then
            HumanDied = true
            pcall(function()
                game:FindFirstChildOfClass("Players").LocalPlayer.Character =
                    DeadChar
                DeadChar.hum.Name = "Humanoid"
                DeadChar.Humanoid.Health = 0
                DeadChar.Head:Destroy()
                game:FindFirstChildOfClass("Players").LocalPlayer.Character =
                    CloneChar
                CloneChar.Humanoid.Health = 0
                CloneChar.Head:Destroy()
                for _, v in pairs(game:FindFirstChildOfClass("Workspace")
                                      :FindFirstChildOfClass("Terrain")
                                      :GetChildren()) do
                    if v.Name == "non" then v:Destroy() end
                end
            end)
            if resetBindable then
                game:GetService("StarterGui"):SetCore("ResetButtonCallback",
                                                      true)
                resetBindable:Destroy()
            end
            break
        end
    end
end)()

SCIFIMOVIELOL(DeadChar["Head"], CloneChar["Head"], Vector3.new(0, 0, 0),
              Vector3.new(0, 0, 0))
SCIFIMOVIELOL(DeadChar["Torso"], CloneChar["Torso"], Vector3.new(0, 0, 0),
              Vector3.new(0, 0, 0))
SCIFIMOVIELOL(DeadChar["Left Arm"], CloneChar["Left Arm"], Vector3.new(0, 0, 0),
              Vector3.new(0, 0, 0))
SCIFIMOVIELOL(DeadChar["Right Arm"], CloneChar["Right Arm"],
              Vector3.new(0, 0, 0), Vector3.new(0, 0, 0))
SCIFIMOVIELOL(DeadChar["Left Leg"], CloneChar["Left Leg"], Vector3.new(0, 0, 0),
              Vector3.new(0, 0, 0))
SCIFIMOVIELOL(DeadChar["Right Leg"], CloneChar["Right Leg"],
              Vector3.new(0, 0, 0), Vector3.new(0, 0, 0))

for _, v in pairs(DeadChar:GetChildren()) do
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
        local bv = Instance.new("BodyVelocity", v)
        bv.Velocity = Vector3.new(0, 0, 0)
        coroutine.wrap(function()
            while true do
                game:GetService("RunService").RenderStepped:wait()
                if HumanDied then break end
                v.CFrame = DeadChar.Torso.CFrame * CFrame.new(0, 1.5, 0)
            end
        end)()
    end
end

for _, BodyParts in next, CloneChar:GetDescendants() do
    if BodyParts:IsA("BasePart") or BodyParts:IsA("Part") then
        BodyParts.Transparency = 1
    end
end
game:GetService("RunService").RenderStepped:wait()
game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
game:FindFirstChildOfClass("Workspace"):FindFirstChildOfClass("Camera").CameraSubject =
    CloneChar.Humanoid

function RUNANIMATESCRIPT(FOLDER)

    local Figure = FOLDER.Parent
    local Torso = Figure:WaitForChild("Torso")
    local RightShoulder = Torso:WaitForChild("Right Shoulder")
    local LeftShoulder = Torso:WaitForChild("Left Shoulder")
    local RightHip = Torso:WaitForChild("Right Hip")
    local LeftHip = Torso:WaitForChild("Left Hip")
    local Neck = Torso:WaitForChild("Neck")
    local Humanoid = Figure:WaitForChild("Humanoid")
    local pose = "Standing"

    local currentAnim = ""
    local currentAnimInstance = nil
    local currentAnimTrack = nil
    local currentAnimKeyframeHandler = nil
    local currentAnimSpeed = 1.0
    local animTable = {}
    local animNames = {
        idle = {
            {id = "http://www.roblox.com/asset/?id=180435571", weight = 9},
            {id = "http://www.roblox.com/asset/?id=180435792", weight = 1}
        },
        walk = {{id = "http://www.roblox.com/asset/?id=180426354", weight = 10}},
        run = {{id = "run.xml", weight = 10}},
        jump = {{id = "http://www.roblox.com/asset/?id=125750702", weight = 10}},
        fall = {{id = "http://www.roblox.com/asset/?id=180436148", weight = 10}},
        climb = {
            {id = "http://www.roblox.com/asset/?id=180436334", weight = 10}
        },
        sit = {{id = "http://www.roblox.com/asset/?id=178130996", weight = 10}},
        toolnone = {
            {id = "http://www.roblox.com/asset/?id=182393478", weight = 10}
        },
        toolslash = {
            {id = "http://www.roblox.com/asset/?id=129967390", weight = 10}
            --				{ id = "slash.xml", weight = 10 } 
        },
        toollunge = {
            {id = "http://www.roblox.com/asset/?id=129967478", weight = 10}
        },
        wave = {{id = "http://www.roblox.com/asset/?id=128777973", weight = 10}},
        point = {
            {id = "http://www.roblox.com/asset/?id=128853357", weight = 10}
        },
        dance1 = {
            {id = "http://www.roblox.com/asset/?id=182435998", weight = 10},
            {id = "http://www.roblox.com/asset/?id=182491037", weight = 10},
            {id = "http://www.roblox.com/asset/?id=182491065", weight = 10}
        },
        dance2 = {
            {id = "http://www.roblox.com/asset/?id=182436842", weight = 10},
            {id = "http://www.roblox.com/asset/?id=182491248", weight = 10},
            {id = "http://www.roblox.com/asset/?id=182491277", weight = 10}
        },
        dance3 = {
            {id = "http://www.roblox.com/asset/?id=182436935", weight = 10},
            {id = "http://www.roblox.com/asset/?id=182491368", weight = 10},
            {id = "http://www.roblox.com/asset/?id=182491423", weight = 10}
        },
        laugh = {
            {id = "http://www.roblox.com/asset/?id=129423131", weight = 10}
        },
        cheer = {
            {id = "http://www.roblox.com/asset/?id=129423030", weight = 10}
        }
    }
    local dances = {"dance1", "dance2", "dance3"}

    -- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
    local emoteNames = {
        wave = false,
        point = false,
        dance1 = true,
        dance2 = true,
        dance3 = true,
        laugh = false,
        cheer = false
    }

    function configureAnimationSet(name, fileList)
        if (animTable[name] ~= nil) then
            for _, connection in pairs(animTable[name].connections) do
                connection:disconnect()
            end
        end
        animTable[name] = {}
        animTable[name].count = 0
        animTable[name].totalWeight = 0
        animTable[name].connections = {}

        -- check for config values
        local config = FOLDER:FindFirstChild(name)
        if (config ~= nil) then
            --		print("Loading anims " .. name)
            table.insert(animTable[name].connections,
                         config.ChildAdded:connect(
                             function(child)
                    configureAnimationSet(name, fileList)
                end))
            table.insert(animTable[name].connections,
                         config.ChildRemoved:connect(
                             function(child)
                    configureAnimationSet(name, fileList)
                end))
            local idx = 1
            for _, childPart in pairs(config:GetChildren()) do
                if (childPart:IsA("Animation")) then
                    table.insert(animTable[name].connections,
                                 childPart.Changed:connect(
                                     function(property)
                            configureAnimationSet(name, fileList)
                        end))
                    animTable[name][idx] = {}
                    animTable[name][idx].anim = childPart
                    local weightObject = childPart:FindFirstChild("Weight")
                    if (weightObject == nil) then
                        animTable[name][idx].weight = 1
                    else
                        animTable[name][idx].weight = weightObject.Value
                    end
                    animTable[name].count = animTable[name].count + 1
                    animTable[name].totalWeight =
                        animTable[name].totalWeight +
                            animTable[name][idx].weight
                    --			print(name .. " [" .. idx .. "] " .. animTable[name][idx].anim.AnimationId .. " (" .. animTable[name][idx].weight .. ")")
                    idx = idx + 1
                end
            end
        end

        -- fallback to defaults
        if (animTable[name].count <= 0) then
            for idx, anim in pairs(fileList) do
                animTable[name][idx] = {}
                animTable[name][idx].anim = Instance.new("Animation")
                animTable[name][idx].anim.Name = name
                animTable[name][idx].anim.AnimationId = anim.id
                animTable[name][idx].weight = anim.weight
                animTable[name].count = animTable[name].count + 1
                animTable[name].totalWeight =
                    animTable[name].totalWeight + anim.weight
                --			print(name .. " [" .. idx .. "] " .. anim.id .. " (" .. anim.weight .. ")")
            end
        end
    end

    -- Setup animation objects
    function scriptChildModified(child)
        local fileList = animNames[child.Name]
        if (fileList ~= nil) then
            configureAnimationSet(child.Name, fileList)
        end
    end

    FOLDER.ChildAdded:connect(scriptChildModified)
    FOLDER.ChildRemoved:connect(scriptChildModified)

    for name, fileList in pairs(animNames) do
        configureAnimationSet(name, fileList)
    end

    -- ANIMATION

    -- declarations
    local toolAnim = "None"
    local toolAnimTime = 0

    local jumpAnimTime = 0
    local jumpAnimDuration = 0.3

    local toolTransitionTime = 0.1
    local fallTransitionTime = 0.3
    local jumpMaxLimbVelocity = 0.75

    -- functions

    function stopAllAnimations()
        local oldAnim = currentAnim

        -- return to idle if finishing an emote
        if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then
            oldAnim = "idle"
        end

        currentAnim = ""
        currentAnimInstance = nil
        if (currentAnimKeyframeHandler ~= nil) then
            currentAnimKeyframeHandler:disconnect()
        end

        if (currentAnimTrack ~= nil) then
            currentAnimTrack:Stop()
            currentAnimTrack:Destroy()
            currentAnimTrack = nil
        end
        return oldAnim
    end

    function setAnimationSpeed(speed)
        if speed ~= currentAnimSpeed then
            currentAnimSpeed = speed
            currentAnimTrack:AdjustSpeed(currentAnimSpeed)
        end
    end

    function keyFrameReachedFunc(frameName)
        if (frameName == "End") then

            local repeatAnim = currentAnim
            -- return to idle if finishing an emote
            if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] ==
                false) then repeatAnim = "idle" end

            local animSpeed = currentAnimSpeed
            playAnimation(repeatAnim, 0.0, Humanoid)
            setAnimationSpeed(animSpeed)
        end
    end

    -- Preload animations
    function playAnimation(animName, transitionTime, humanoid)

        local roll = math.random(1, animTable[animName].totalWeight)
        local origRoll = roll
        local idx = 1
        while (roll > animTable[animName][idx].weight) do
            roll = roll - animTable[animName][idx].weight
            idx = idx + 1
        end
        --		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
        local anim = animTable[animName][idx].anim

        -- switch animation		
        if (anim ~= currentAnimInstance) then

            if (currentAnimTrack ~= nil) then
                currentAnimTrack:Stop(transitionTime)
                currentAnimTrack:Destroy()
            end

            currentAnimSpeed = 1.0

            -- load it to the humanoid; get AnimationTrack
            currentAnimTrack = humanoid:LoadAnimation(anim)
            currentAnimTrack.Priority = Enum.AnimationPriority.Core

            -- play the animation
            currentAnimTrack:Play(transitionTime)
            currentAnim = animName
            currentAnimInstance = anim

            -- set up keyframe name triggers
            if (currentAnimKeyframeHandler ~= nil) then
                currentAnimKeyframeHandler:disconnect()
            end
            currentAnimKeyframeHandler =
                currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc)

        end

    end

    -------------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------

    local toolAnimName = ""
    local toolAnimTrack = nil
    local toolAnimInstance = nil
    local currentToolAnimKeyframeHandler = nil

    function toolKeyFrameReachedFunc(frameName)
        if (frameName == "End") then
            --		print("Keyframe : ".. frameName)	
            playToolAnimation(toolAnimName, 0.0, Humanoid)
        end
    end

    function playToolAnimation(animName, transitionTime, humanoid, priority)

        local roll = math.random(1, animTable[animName].totalWeight)
        local origRoll = roll
        local idx = 1
        while (roll > animTable[animName][idx].weight) do
            roll = roll - animTable[animName][idx].weight
            idx = idx + 1
        end
        --		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
        local anim = animTable[animName][idx].anim

        if (toolAnimInstance ~= anim) then

            if (toolAnimTrack ~= nil) then
                toolAnimTrack:Stop()
                toolAnimTrack:Destroy()
                transitionTime = 0
            end

            -- load it to the humanoid; get AnimationTrack
            toolAnimTrack = humanoid:LoadAnimation(anim)
            if priority then toolAnimTrack.Priority = priority end

            -- play the animation
            toolAnimTrack:Play(transitionTime)
            toolAnimName = animName
            toolAnimInstance = anim

            currentToolAnimKeyframeHandler =
                toolAnimTrack.KeyframeReached:connect(toolKeyFrameReachedFunc)
        end
    end

    function stopToolAnimations()
        local oldAnim = toolAnimName

        if (currentToolAnimKeyframeHandler ~= nil) then
            currentToolAnimKeyframeHandler:disconnect()
        end

        toolAnimName = ""
        toolAnimInstance = nil
        if (toolAnimTrack ~= nil) then
            toolAnimTrack:Stop()
            toolAnimTrack:Destroy()
            toolAnimTrack = nil
        end

        return oldAnim
    end

    -------------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------

    function onRunning(speed)
        if speed > 0.01 then
            playAnimation("walk", 0.1, Humanoid)
            if currentAnimInstance and currentAnimInstance.AnimationId ==
                "http://www.roblox.com/asset/?id=180426354" then
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

    function onDied() pose = "Dead" end

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

    function onGettingUp() pose = "GettingUp" end

    function onFreeFall()
        if (jumpAnimTime <= 0) then
            playAnimation("fall", fallTransitionTime, Humanoid)
        end
        pose = "FreeFall"
    end

    function onFallingDown() pose = "FallingDown" end

    function onSeated() pose = "Seated" end

    function onPlatformStanding() pose = "PlatformStanding" end

    function onSwimming(speed)
        if speed > 0 then
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
            playToolAnimation("toolnone", toolTransitionTime, Humanoid,
                              Enum.AnimationPriority.Idle)
            return
        end

        if (toolAnim == "Slash") then
            playToolAnimation("toolslash", 0, Humanoid,
                              Enum.AnimationPriority.Action)
            return
        end

        if (toolAnim == "Lunge") then
            playToolAnimation("toollunge", 0, Humanoid,
                              Enum.AnimationPriority.Action)
            return
        end
    end

    function moveSit()
        RightShoulder.MaxVelocity = 0.15
        LeftShoulder.MaxVelocity = 0.15
        RightShoulder:SetDesiredAngle(3.14 / 2)
        LeftShoulder:SetDesiredAngle(-3.14 / 2)
        RightHip:SetDesiredAngle(3.14 / 2)
        LeftHip:SetDesiredAngle(-3.14 / 2)
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

        if (pose == "FreeFall" and jumpAnimTime <= 0) then
            playAnimation("fall", fallTransitionTime, Humanoid)
        elseif (pose == "Seated") then
            playAnimation("sit", 0.5, Humanoid)
            return
        elseif (pose == "Running") then
            playAnimation("walk", 0.1, Humanoid)
        elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or
            pose == "Seated" or pose == "PlatformStanding") then
            --		print("Wha " .. pose)
            stopAllAnimations()
            amplitude = 0.1
            frequency = 1
            setAngles = true
        end

        if (setAngles) then
            local desiredAngle = amplitude * math.sin(time * frequency)

            RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
            LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
            RightHip:SetDesiredAngle(-desiredAngle)
            LeftHip:SetDesiredAngle(-desiredAngle)
        end

        -- Tool Animation handling
        local tool = getTool()
        if tool and tool:FindFirstChild("Handle") then

            local animStringValueObject = getToolAnim(tool)

            if animStringValueObject then
                toolAnim = animStringValueObject.Value
                -- message recieved, delete StringValue
                animStringValueObject.Parent = nil
                toolAnimTime = time + .3
            end

            if time > toolAnimTime then
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
        for i = 1, #events do events[i]:Disconnect() end
        events = {}
    end

    local function onHook()
        onUnhook()

        pose = eventHum.Sit and "Seated" or "Standing"

        events = {
            eventHum.Died:connect(onDied), eventHum.Running:connect(onRunning),
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
    -- FOLDER:WaitForChild("Loaded").Value = true

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

--[[
	//----------------------------------\\
	         Edited by hacker8990
	\\----------------------------------//
--]]

loadstring(game:GetObjects("rbxassetid://5425999987")[1].Source)()

local TweenService = game:GetService("TweenService")
local RbxUtility = LoadLibrary("RbxUtility")
local Create = RbxUtility.Create

local script = game:GetObjects("rbxassetid://5277902239")[1]

local Player = game.Players.LocalPlayer
local mouse = Player:GetMouse()

ZTfade = false
ZT = false

EffectPack = script.Extras:Clone()
script.Extras:Destroy()
local agresive = false
Target = Vector3.new()
Character = Player.Character
Torso = Character.Torso
Head = Character.Head
Humanoid = Character.Humanoid
LeftArm = Character["Left Arm"]
LeftLeg = Character["Left Leg"]
RightArm = Character["Right Arm"]
RightLeg = Character["Right Leg"]
RootPart = Character["HumanoidRootPart"]
local Anim = "Idle"
local inairvel = 0
local WalkAnimStep = 0
local sine = 0
local change = 1
local pantdown = false
local reap = false
local gpressed = false
Animstep = 0
WalkAnimMove = 0.05
Combo = 0
local attack = false
local pant = false
local RJ = Character.HumanoidRootPart:FindFirstChild("RootJoint")
local Neck = Character.Torso:FindFirstChild("Neck")

local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
local NeckCF = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)

local forWFB = 0
local forWRL = 0

Effects = Instance.new("Folder", Character)
Effects.Name = "Effects"
it = Instance.new
vt = Vector3.new
cf = CFrame.new
euler = CFrame.fromEulerAnglesXYZ
angles = CFrame.Angles
local cn = CFrame.new
mr = math.rad
mememode = false
IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

local lastid = "http://www.roblox.com/asset/?id=876316256"
local s2 = it("Sound", Torso)
local CurId = 1
s2.EmitterSize = 30
local s2c = s2:Clone()

playsong = true

s2.SoundId = lastid
if playsong == true then
    s2:play()
elseif playsong == false then
    s2:stop()
end
lastsongpos = 0

crosshair = Instance.new("BillboardGui", Character)
crosshair.Size = UDim2.new(10, 0, 10, 0)
crosshair.Enabled = false
imgl = Instance.new("ImageLabel", crosshair)
imgl.Position = UDim2.new(0, 0, 0, 0)
imgl.Size = UDim2.new(1, 0, 1, 0)
imgl.Image = "rbxassetid://578065407"
imgl.BackgroundTransparency = 1
imgl.ImageTransparency = .7
imgl.ImageColor3 = Color3.new(1, 1, 1)
crosshair.StudsOffset = Vector3.new(0, 0, -1)

-- //=================================\\
-- ||          LOCAL IDS
-- \\=================================//

local GROWL = 1544355717
local ROAR = 528589382
local ECHOBLAST = 376976397
local CAST = 459523898
local ALCHEMY = 424195979
local BUILDUP = 698824317
local BIGBUILDUP = 874376217
local IMPACT = 231917744
local LARGE_EXPLOSION = 168513088
local TURNUP = 299058146
local Weld37 = Instance.new("Weld")
local Weld39 = Instance.new("Weld")
local Part36 = Instance.new("Part")
local Part38 = Instance.new("Part")
local Model13 = Instance.new("Model")

if Character:FindFirstChild("Animate") then Character.Animate:Destroy() end

function RemoveOutlines(part)
    part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface =
        10, 10, 10, 10, 10, 10
end

CFuncs = {
    Part = {
        Create = function(Parent, Material, Reflectance, Transparency, BColor,
                          Name, Size)

            local Part = Create("Part")({
                Parent = Parent,
                Reflectance = Reflectance,
                Transparency = Transparency,
                CanCollide = false,
                Locked = true,
                BrickColor = BrickColor.new(tostring(BColor)),
                Name = Name,
                Size = Size,
                Material = Material
            })
            RemoveOutlines(Part)
            return Part
        end
    },
    Mesh = {
        Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)

            local Msh = Create(Mesh)({
                Parent = Part,
                Offset = OffSet,
                Scale = Scale
            })
            if Mesh == "SpecialMesh" then
                Msh.MeshType = MeshType
                Msh.MeshId = MeshId
            end
            return Msh
        end
    },
    Mesh = {
        Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)

            local Msh = Create(Mesh)({
                Parent = Part,
                Offset = OffSet,
                Scale = Scale
            })
            if Mesh == "SpecialMesh" then
                Msh.MeshType = MeshType
                Msh.MeshId = MeshId
            end
            return Msh
        end
    },
    Weld = {
        Create = function(Parent, Part0, Part1, C0, C1)

            local Weld = Create("Weld")({
                Parent = Parent,
                Part0 = Part0,
                Part1 = Part1,
                C0 = C0,
                C1 = C1
            })
            return Weld
        end
    },
    Sound = {
        Create = function(id, par, vol, pit)

            coroutine.resume(coroutine.create(
                                 function()

                    local S = Create("Sound")(
                                  {
                            Volume = vol,
                            Pitch = pit or 1,
                            SoundId = "http://www.roblox.com/asset/?id=" .. id,
                            Parent = par or workspace
                        })
                    wait()
                    S:play()
                    game:GetService("Debris"):AddItem(S, 6)
                end))
        end
    },
    ParticleEmitter = {
        Create = function(Parent, Color1, Color2, LightEmission, Size, Texture,
                          Transparency, ZOffset, Accel, Drag, LockedToPart,
                          VelocityInheritance, EmissionDirection, Enabled,
                          LifeTime, Rate, Rotation, RotSpeed, Speed,
                          VelocitySpread)

            local fp = Create("ParticleEmitter")(
                           {
                    Parent = Parent,
                    Color = ColorSequence.new(Color1, Color2),
                    LightEmission = LightEmission,
                    Size = Size,
                    Texture = Texture,
                    Transparency = Transparency,
                    ZOffset = ZOffset,
                    Acceleration = Accel,
                    Drag = Drag,
                    LockedToPart = LockedToPart,
                    VelocityInheritance = VelocityInheritance,
                    EmissionDirection = EmissionDirection,
                    Enabled = Enabled,
                    Lifetime = LifeTime,
                    Rate = Rate,
                    Rotation = Rotation,
                    RotSpeed = RotSpeed,
                    Speed = Speed,
                    VelocitySpread = VelocitySpread
                })
            return fp
        end
    }
}

coroutine.resume(coroutine.create(function()
    if Head.face then Head.face.Texture = "rbxassetid://2712760435" end

end))

coroutine.resume(coroutine.create(function()
    wait(.5)
    for i, v in pairs(Character:GetDescendants()) do
        if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("ShirtGraphic") or
            v:IsA("Pants") or v:IsA("CharacterMesh") or v:IsA("Decal") or
            v:IsA("Hat") or v:IsA("BodyColors") then v:Destroy() end
    end
    local Decal0 = Instance.new("Decal", Character.Head)
    local Decal1 = Instance.new("Decal", Character.Head)
    Decal0.Texture = "rbxassetid://2801759774" -- mouth
    Decal1.Texture = "rbxassetid://2801594973" -- eyes

    local outfit = EffectPack.Outfit:Clone()

    for i, v in pairs(outfit:GetChildren()) do
        if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") or
            v:IsA("CharacterMesh") then v.Parent = Character end
        if v:IsA("BasePart") then
            local at1 = v:FindFirstChildOfClass("Attachment")
            local at2 = nil
            for i, v2 in pairs(Character:GetDescendants()) do

                if v2:IsA("Attachment") and v2.Name == at1.Name and
                    v2.Parent.Parent == Character then at2 = v2 end

            end

            Part36.Name = "Left"
            Part36.Parent = Player.Character
            Part36.CFrame = CFrame.new(-0.864785671, 5.40298271, 1.08804584,
                                       0.00171390176, 0.0015738951, 0.999997795,
                                       0.0481499843, 0.998839736,
                                       -0.00165481726, -0.998839498,
                                       0.0481527671, 0.00163629651)
            Part36.Orientation = Vector3.new(0.0900000036, 89.9100037,
                                             2.75999999)
            Part36.Position = Vector3.new(-0.864785671, 5.40298271, 1.08804584)
            Part36.Rotation = Vector3.new(45.3199997, 89.8799973, -42.5600014)
            Part36.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
            Part36.Size = Vector3.new(1.03999996, 0.419999987, 1.05999994)
            Part36.BottomSurface = Enum.SurfaceType.Smooth
            Part36.BrickColor = BrickColor.new("Really black")
            Part36.CanCollide = false
            Part36.Locked = true
            Part36.Material = Enum.Material.SmoothPlastic
            Part36.brickColor = BrickColor.new("Really black")
            Part36.FormFactor = Enum.FormFactor.Symmetric
            Part36.formFactor = Enum.FormFactor.Symmetric
            Weld37.Name = "Left Leg"
            Weld37.Parent = Part36
            Weld37.C0 = CFrame.new(0, -0.8, 0)
            Weld37.Part0 = Part36
            Weld37.Part1 = LeftLeg
            Weld37.part1 = LeftLeg
            Part38.Name = "Right"
            Part38.Parent = Player.Character
            Part38.CFrame = CFrame.new(-0.862425506, 5.4220829, 2.09170222,
                                       -0.34028101, -0.0131851267, 0.940231562,
                                       -0.0387370177, 0.99925065,
                                       -6.86116982e-06, -0.939526379,
                                       -0.0364240296, -0.340536386)
            Part38.Orientation = Vector3.new(0, 109.910004, -2.22000003)
            Part38.Position = Vector3.new(-0.862425506, 5.4220829, 2.09170222)
            Part38.Rotation = Vector3.new(180, 70.0899963, 177.779999)
            Part38.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
            Part38.Size = Vector3.new(1.03999996, 0.419999808, 1.05999994)
            Part38.BottomSurface = Enum.SurfaceType.Smooth
            Part38.BrickColor = BrickColor.new("Really black")
            Part38.CanCollide = false
            Part38.Locked = true
            Part38.Material = Enum.Material.SmoothPlastic
            Part38.brickColor = BrickColor.new("Really black")
            Part38.FormFactor = Enum.FormFactor.Symmetric
            Part38.formFactor = Enum.FormFactor.Symmetric
            Weld39.Name = "Right Leg"
            Weld39.Parent = Part38
            Weld39.C0 = CFrame.new(0, -0.8, 0)
            Weld39.Part0 = Part38
            Weld39.Part1 = RightLeg
            Weld39.part1 = RightLeg

            local Model0 = Instance.new("Model")
            local Part1 = Instance.new("Part")
            local SpecialMesh2 = Instance.new("SpecialMesh")
            local Weld3 = Instance.new("Weld")
            local Part4 = Instance.new("Part")
            local SpecialMesh5 = Instance.new("SpecialMesh")
            local Weld6 = Instance.new("Weld")
            local Part7 = Instance.new("Part")
            local SpecialMesh8 = Instance.new("SpecialMesh")
            local Weld9 = Instance.new("Weld")
            local Part10 = Instance.new("Part")
            local SpecialMesh11 = Instance.new("SpecialMesh")
            local Weld12 = Instance.new("Weld")
            local Part14 = Instance.new("Part")
            local SpecialMesh15 = Instance.new("SpecialMesh")
            local Weld16 = Instance.new("Weld")
            local Part17 = Instance.new("Part")
            local SpecialMesh18 = Instance.new("SpecialMesh")
            local Weld19 = Instance.new("Weld")
            local Part20 = Instance.new("Part")
            local SpecialMesh21 = Instance.new("SpecialMesh")
            local Weld22 = Instance.new("Weld")
            local Part23 = Instance.new("Part")
            local SpecialMesh24 = Instance.new("SpecialMesh")
            local Weld25 = Instance.new("Weld")
            Model0.Name = "vag"
            Model0.Parent = Torso
            Model0.PrimaryPart = Part1
            Part1.Name = "mainskin"
            Part1.Parent = Model0
            Part1.CFrame = CFrame.new(-0.866321027, 5.57360649, 1.57845628,
                                      0.00160500058, -0.0125150038, 0.999920428,
                                      0.999988377, -0.00454756292,
                                      -0.00166202663, 0.00456800172,
                                      0.999911368, 0.0125075588)
            Part1.Orientation = Vector3.new(0.100000001, 89.2799988, 90.2600021)
            Part1.Position = Vector3.new(-0.866321027, 5.57360649, 1.57845628)
            Part1.Rotation = Vector3.new(7.57000017, 89.2799988, 82.6900024)
            Part1.Color = Color3.new(1, 0.8, 0.6)
            Part1.Size = Vector3.new(0.900895953, 1.80179191, 0.900895953)
            Part1.Anchored = false
            Part1.BottomSurface = Enum.SurfaceType.Smooth
            Part1.BrickColor = BrickColor.new("Pastel brown")
            Part1.CanCollide = false
            Part1.Material = Enum.Material.SmoothPlastic
            Part1.TopSurface = Enum.SurfaceType.Smooth
            Part1.brickColor = BrickColor.new("Pastel brown")
            SpecialMesh2.Parent = Part1
            SpecialMesh2.Scale = Vector3.new(0.899999976, 0.400000006,
                                             0.899999976)
            SpecialMesh2.MeshType = Enum.MeshType.Sphere
            Weld3.Name = "Torso"
            Weld3.Parent = Part1
            Weld3.C0 = CFrame.new(1.00810242, 0.00668120384, -0.0114426017,
                                  5.99958003e-06, 0.999901295, 0.0141194807,
                                  -0.999941111, 0.000160070136, -0.0109077049,
                                  -0.0109090386, -0.0141187282, 0.999840915)
            Weld3.Part0 = Part1
            Weld3.Part1 = Torso
            Weld3.part1 = Torso
            Part4.Name = "Vg"
            Part4.Parent = Model0
            Part4.CFrame = CFrame.new(-0.866321027, 5.57360649, 1.57845628,
                                      0.00160500058, -0.0125150038, 0.999920428,
                                      0.999988377, -0.00454756292,
                                      -0.00166202663, 0.00456800172,
                                      0.999911368, 0.0125075588)
            Part4.Orientation = Vector3.new(0.100000001, 89.2799988, 90.2600021)
            Part4.Position = Vector3.new(-0.866321027, 5.57360649, 1.57845628)
            Part4.Rotation = Vector3.new(7.57000017, 89.2799988, 82.6900024)
            Part4.Color = Color3.new(0.854902, 0.52549, 0.478431)
            Part4.Size = Vector3.new(0.900895953, 1.80179191, 0.900895953)
            Part4.Anchored = false
            Part4.BottomSurface = Enum.SurfaceType.Smooth
            Part4.BrickColor = BrickColor.new("Medium red")
            Part4.CanCollide = false
            Part4.Material = Enum.Material.SmoothPlastic
            Part4.TopSurface = Enum.SurfaceType.Smooth
            Part4.brickColor = BrickColor.new("Medium red")
            SpecialMesh5.Parent = Part4
            SpecialMesh5.Scale = Vector3.new(0.910000026, 0.300000012,
                                             0.910000026)
            SpecialMesh5.MeshType = Enum.MeshType.Sphere
            Weld6.Name = "mainskin"
            Weld6.Parent = Part4
            Weld6.C0 = CFrame.new(0, 0, 0, 1.00000024, 4.65661287e-10,
                                  1.23691279e-10, 4.65661287e-10, 1,
                                  9.31322575e-10, 1.23691279e-10,
                                  9.31322575e-10, 1)
            Weld6.Part0 = Part4
            Weld6.Part1 = Part1
            Weld6.part1 = Part1
            Part7.Name = "Vg2"
            Part7.Parent = Model0
            Part7.CFrame = CFrame.new(-0.865878761, 5.55604744, 1.57808244,
                                      0.00160500058, -0.0125150038, 0.999920428,
                                      0.999988377, -0.00454756292,
                                      -0.00166202663, 0.00456800172,
                                      0.999911368, 0.0125075588)
            Part7.Orientation = Vector3.new(0.100000001, 89.2799988, 90.2600021)
            Part7.Position = Vector3.new(-0.865878761, 5.55604744, 1.57808244)
            Part7.Rotation = Vector3.new(7.57000017, 89.2799988, 82.6900024)
            Part7.Color = Color3.new(0.639216, 0.294118, 0.294118)
            Part7.Size = Vector3.new(0.900895953, 0.900895953, 0.900895953)
            Part7.Anchored = false
            Part7.BottomSurface = Enum.SurfaceType.Smooth
            Part7.BrickColor = BrickColor.new("Dusty Rose")
            Part7.CanCollide = false
            Part7.Material = Enum.Material.SmoothPlastic
            Part7.TopSurface = Enum.SurfaceType.Smooth
            Part7.brickColor = BrickColor.new("Dusty Rose")
            SpecialMesh8.Parent = Part7
            SpecialMesh8.Scale = Vector3.new(0.910000026, 0.300000012,
                                             0.910000026)
            SpecialMesh8.MeshType = Enum.MeshType.Sphere
            Weld9.Name = "mainskin"
            Weld9.Parent = Part7
            Weld9.C0 = CFrame.new(0.0175599698, 0.000299525098, -0.00046673941,
                                  1.00000024, 4.65661287e-10, 1.23691279e-10,
                                  4.65661287e-10, 1, 9.31322575e-10,
                                  1.23691279e-10, 9.31322575e-10, 1)
            Weld9.Part0 = Part7
            Weld9.Part1 = Part1
            Weld9.part1 = Part1
            Part10.Name = "Skin"
            Part10.Parent = Model0
            Part10.CFrame = CFrame.new(-0.776254952, 5.58247375, 1.58018422,
                                       -0.572227836, -0.0160920434, 0.819936872,
                                       0.820094705, -0.0112283546, 0.572117686,
                                       0, 0.999807537, 0.0196221787)
            Part10.Orientation =
                Vector3.new(-34.9000015, 88.6299973, 90.7799988)
            Part10.Position = Vector3.new(-0.776254952, 5.58247375, 1.58018422)
            Part10.Rotation = Vector3.new(-88.0400009, 55.0800018, 178.389999)
            Part10.Color = Color3.new(1, 0.8, 0.6)
            Part10.Size = Vector3.new(0.891887307, 1.49548769, 0.900895953)
            Part10.Anchored = false
            Part10.BottomSurface = Enum.SurfaceType.Smooth
            Part10.BrickColor = BrickColor.new("Pastel brown")
            Part10.CanCollide = false
            Part10.Material = Enum.Material.SmoothPlastic
            Part10.TopSurface = Enum.SurfaceType.Smooth
            Part10.brickColor = BrickColor.new("Pastel brown")
            SpecialMesh11.Parent = Part10
            SpecialMesh11.Scale = Vector3.new(0.899999976, 0.400000006,
                                              0.899999976)
            SpecialMesh11.MeshType = Enum.MeshType.Sphere
            Weld12.Name = "mainskin"
            Weld12.Parent = Part10
            Weld12.C0 = CFrame.new(0.0442657135, -0.000178598173, -0.0789558589,
                                   0.81916672, 0.00343200099, -0.573545337,
                                   -0.00668692915, 0.99997133, -0.00356695056,
                                   0.573516667, 0.00675718486, 0.819166183)
            Weld12.Part0 = Part10
            Weld12.Part1 = Part1
            Weld12.part1 = Part1
            Model13.Name = "vagcover"
            Model13.Parent = Torso
            Model13.PrimaryPart = Part14
            Part14.Name = "mainskin"
            Part14.Parent = Model13
            Part14.CFrame = CFrame.new(-0.866962552, 5.56903839, 1.57845902,
                                       0.00160500058, -0.0125150038,
                                       0.999920428, 0.999988377, -0.00454756292,
                                       -0.00166202663, 0.00456800172,
                                       0.999911368, 0.0125075588)
            Part14.Orientation =
                Vector3.new(0.100000001, 89.2799988, 90.2600021)
            Part14.Position = Vector3.new(-0.866962552, 5.56903839, 1.57845902)
            Part14.Rotation = Vector3.new(7.57000017, 89.2799988, 82.6900024)
            Part14.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
            Part14.Size = Vector3.new(0.90731889, 1.81463778, 0.90731889)
            Part14.Anchored = false
            Part14.BottomSurface = Enum.SurfaceType.Smooth
            Part14.BrickColor = BrickColor.new("Really black")
            Part14.CanCollide = false
            Part14.Material = Enum.Material.SmoothPlastic
            Part14.TopSurface = Enum.SurfaceType.Smooth
            Part14.brickColor = BrickColor.new("Really black")
            SpecialMesh15.Parent = Part14
            SpecialMesh15.Scale = Vector3.new(0.899999976, 0.400000006,
                                              0.899999976)
            SpecialMesh15.MeshType = Enum.MeshType.Sphere
            Weld16.Name = "Torso"
            Weld16.Parent = Part14
            Weld16.C0 = CFrame.new(1.01267099, 0.00664961338, -0.0108087659,
                                   6.00004569e-06, 0.999901056, 0.0141194789,
                                   -0.999941051, 0.000160070136, -0.0109077059,
                                   -0.0109090377, -0.0141187273, 0.999840915)
            Weld16.Part0 = Part14
            Weld16.Part1 = Torso
            Weld16.part1 = Torso
            Part17.Name = "Vg"
            Part17.Parent = Model13
            Part17.CFrame = CFrame.new(-0.866962552, 5.56903839, 1.57845902,
                                       0.00160500058, -0.0125150038,
                                       0.999920428, 0.999988377, -0.00454756292,
                                       -0.00166202663, 0.00456800172,
                                       0.999911368, 0.0125075588)
            Part17.Orientation =
                Vector3.new(0.100000001, 89.2799988, 90.2600021)
            Part17.Position = Vector3.new(-0.866962552, 5.56903839, 1.57845902)
            Part17.Rotation = Vector3.new(7.57000017, 89.2799988, 82.6900024)
            Part17.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
            Part17.Size = Vector3.new(0.90731889, 1.81463778, 0.90731889)
            Part17.Anchored = false
            Part17.BottomSurface = Enum.SurfaceType.Smooth
            Part17.BrickColor = BrickColor.new("Really black")
            Part17.CanCollide = false
            Part17.Material = Enum.Material.SmoothPlastic
            Part17.TopSurface = Enum.SurfaceType.Smooth
            Part17.brickColor = BrickColor.new("Really black")
            SpecialMesh18.Parent = Part17
            SpecialMesh18.Scale = Vector3.new(0.910000026, 0.300000012,
                                              0.910000026)
            SpecialMesh18.MeshType = Enum.MeshType.Sphere
            Weld19.Name = "mainskin"
            Weld19.Parent = Part17
            Weld19.C0 = CFrame.new(0, 0, 0, 1.00000024, 4.65661287e-10,
                                   1.23691279e-10, 4.65661287e-10, 1,
                                   9.31322575e-10, 1.23691279e-10,
                                   9.31322575e-10, 1)
            Weld19.Part0 = Part17
            Weld19.Part1 = Part14
            Weld19.part1 = Part14
            Part20.Name = "Vg2"
            Part20.Parent = Model13
            Part20.CFrame = CFrame.new(-0.86652112, 5.55135584, 1.57807875,
                                       0.00160500058, -0.0125150038,
                                       0.999920428, 0.999988377, -0.00454756292,
                                       -0.00166202663, 0.00456800172,
                                       0.999911368, 0.0125075588)
            Part20.Orientation =
                Vector3.new(0.100000001, 89.2799988, 90.2600021)
            Part20.Position = Vector3.new(-0.86652112, 5.55135584, 1.57807875)
            Part20.Rotation = Vector3.new(7.57000017, 89.2799988, 82.6900024)
            Part20.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
            Part20.Size = Vector3.new(0.90731889, 0.90731889, 0.90731889)
            Part20.Anchored = false
            Part20.BottomSurface = Enum.SurfaceType.Smooth
            Part20.BrickColor = BrickColor.new("Really black")
            Part20.CanCollide = false
            Part20.Material = Enum.Material.SmoothPlastic
            Part20.TopSurface = Enum.SurfaceType.Smooth
            Part20.brickColor = BrickColor.new("Really black")
            SpecialMesh21.Parent = Part20
            SpecialMesh21.Scale = Vector3.new(0.910000026, 0.300000012,
                                              0.910000026)
            SpecialMesh21.MeshType = Enum.MeshType.Sphere
            Weld22.Name = "mainskin"
            Weld22.Parent = Part20
            Weld22.C0 = CFrame.new(0.0176836904, 0.00030521708, -0.000466041354,
                                   1.00000024, 4.65661287e-10, 1.23691279e-10,
                                   4.65661287e-10, 1, 9.31322575e-10,
                                   1.23691279e-10, 9.31322575e-10, 1)
            Weld22.Part0 = Part20
            Weld22.Part1 = Part14
            Weld22.part1 = Part14
            Part23.Name = "Skin"
            Part23.Parent = Model13
            Part23.CFrame = CFrame.new(-0.776253998, 5.57796907, 1.58019507,
                                       -0.572227836, -0.0160920434, 0.819936872,
                                       0.820094705, -0.0112283546, 0.572117686,
                                       0, 0.999807537, 0.0196221787)
            Part23.Orientation =
                Vector3.new(-34.9000015, 88.6299973, 90.7799988)
            Part23.Position = Vector3.new(-0.776253998, 5.57796907, 1.58019507)
            Part23.Rotation = Vector3.new(-88.0400009, 55.0800018, 178.389999)
            Part23.Color = Color3.new(0.0666667, 0.0666667, 0.0666667)
            Part23.Size = Vector3.new(0.898245931, 1.50614965, 0.90731889)
            Part23.Anchored = false
            Part23.BottomSurface = Enum.SurfaceType.Smooth
            Part23.BrickColor = BrickColor.new("Really black")
            Part23.CanCollide = false
            Part23.Material = Enum.Material.SmoothPlastic
            Part23.TopSurface = Enum.SurfaceType.Smooth
            Part23.brickColor = BrickColor.new("Really black")
            SpecialMesh24.Parent = Part23
            SpecialMesh24.Scale = Vector3.new(0.899999976, 0.400000006,
                                              0.899999976)
            SpecialMesh24.MeshType = Enum.MeshType.Sphere
            Weld25.Name = "mainskin"
            Weld25.Parent = Part23
            Weld25.C0 = CFrame.new(0.0445814133, -0.000175714493, -0.0795190334,
                                   0.81916672, 0.00343200099, -0.573545337,
                                   -0.00668692915, 0.99997133, -0.00356695056,
                                   0.573516667, 0.00675718486, 0.819166183)
            Weld25.Part0 = Part23
            Weld25.Part1 = Part14
            Weld25.part1 = Part14

            v.Parent = at2.Parent
            local Weldhat = weld(v, at2.Parent, v, CF())
            Weldhat.C0 = CF(at2.Position) *
                             ANGLES(mr(at2.Orientation.x),
                                    mr(at2.Orientation.y), mr(at2.Orientation.z))
            Weldhat.C1 = CF(at1.Position) *
                             ANGLES(mr(at1.Orientation.x),
                                    mr(at1.Orientation.y), mr(at1.Orientation.z))
        end
    end

end))

-- //=================================\\
-- \\=================================//

function Swait(NUMBER)
    if NUMBER == 0 or NUMBER == nil then
        game:GetService("RunService").RenderStepped:wait()
    else
        for i = 1, NUMBER do
            game:GetService("RunService").RenderStepped:wait()
        end
    end
end

---------------
-- [Functions]--
---------------
so = function(id, par, vol, pit) CFuncs.Sound.Create(id, par, vol, pit) end

function weld(parent, part0, part1, c0)
    local weld = it("Weld")
    weld.Parent = parent
    weld.Part0 = part0
    weld.Part1 = part1
    weld.C0 = c0
    return weld
end

rayCast = function(Pos, Dir, Max, Ignore)

    return game:service("Workspace"):FindPartOnRay(
               Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore)
end

function SetTween(SPart, CFr, MoveStyle2, outorin2, AnimTime)
    local MoveStyle = Enum.EasingStyle[MoveStyle2]
    local outorin = Enum.EasingDirection[outorin2]

    local dahspeed = 1
    if attack == true and mememode == true then dahspeed = 5 end

    if SPart.Name == "Bullet" then dahspeed = 1 end

    local tweeningInformation = TweenInfo.new(AnimTime / dahspeed, MoveStyle,
                                              outorin, 0, false, 0)
    local MoveCF = CFr
    local tweenanim = TweenService:Create(SPart, tweeningInformation, MoveCF)
    tweenanim:Play()
end

function GatherAllInstances(Parent, ig)
    local Instances = {}
    local Ignore = nil
    if ig ~= nil then Ignore = ig end

    local function GatherInstances(Parent, Ignore)
        for i, v in pairs(Parent:GetChildren()) do

            if v ~= Ignore then
                GatherInstances(v, Ignore)
                table.insert(Instances, v)
            end
        end
    end
    GatherInstances(Parent, Ignore)
    return Instances
end

function weld(parent, part0, part1, c0)
    local weld = it("Weld")
    weld.Parent = parent
    weld.Part0 = part0
    weld.Part1 = part1
    weld.C0 = c0
    return weld
end
function joint(parent, part0, part1, c0)
    local weld = it("Motor6D")
    weld.Parent = parent
    weld.Part0 = part0
    weld.Part1 = part1
    weld.C0 = c0
    return weld
end
ArmorParts = {}
-- ArmorParts = {}
function WeldAllTo(Part1, Part2, scan, Extra)
    local EXCF = Part2.CFrame * Extra
    for i, v3 in pairs(scan:GetDescendants()) do
        if v3:isA("BasePart") then
            local STW = weld(v3, v3, Part1,
                             EXCF:toObjectSpace(v3.CFrame):inverse())
            v3.Anchored = false
            v3.Massless = true
            v3.CanCollide = false
            v3.Parent = Part1
            v3.Locked = true
            if not v3:FindFirstChild("Destroy") then
                table.insert(ArmorParts, {
                    Part = v3,
                    Par = v3.Parent,
                    Col = v3.Color,
                    Mat = v3.Material.Name
                })
            else
                v3:Destroy()
            end
        end
    end
    Part1.Transparency = 1
    -- Part2:Destroy()
end

function JointAllTo(Part1, Part2, scan, Extra)
    local EXCF = Part2.CFrame * Extra
    for i, v3 in pairs(scan:GetDescendants()) do
        if v3:isA("BasePart") then
            local STW = joint(v3, v3, Part1,
                              EXCF:toObjectSpace(v3.CFrame):inverse())
            v3.Anchored = false
            v3.Massless = true
            v3.CanCollide = false
            v3.Parent = Part1
            v3.Locked = true
            if not v3:FindFirstChild("Destroy") then
                --	table.insert(ArmorParts,{Part = v3,Par = v3.Parent,Col = v3.Color,Mat=v3.Material.Name })	
            else
                v3:Destroy()
            end
        end
    end
    Part1.Transparency = 1
    -- Part2:Destroy()
end

--------------------------------------------Claws
local RClaw = EffectPack.Part:Clone()
RClaw.Parent = Character
RClaw.Name = "RightClaw"
RCW = weld(RightArm, RightArm, RClaw, cf(0, 0, 0))

--------------------------------------------
local LClaw = EffectPack.Part:Clone()
LClaw.Parent = Character
LClaw.Name = "LeftClaw"
LCW = weld(LeftArm, LeftArm, LClaw, cf(0, 0, 0))

--------------------------------------------
tailw = Torso:WaitForChild("Tail").Weld
tailc0 = tailw.C0

for _, v in pairs(script.Armor:children()) do
    if v:IsA("Model") then

        if Character:FindFirstChild("" .. v.Name) then
            local Part1 = Character:FindFirstChild("" .. v.Name)
            local Part2 = v.Handle

            WeldAllTo(Part1, Part2, v, CFrame.new(0, 0, 0))

        end

    end
end

local SToneTexture = Create("Texture")({

    Texture = "http://www.roblox.com/asset/?id=1693385655",
    Color3 = Color3.new(163 / 255, 162 / 255, 165 / 255)

})

function AddStoneTexture(part)
    coroutine.resume(coroutine.create(function()
        for i = 0, 6, 1 do
            local Tx = SToneTexture:Clone()
            Tx.Face = i
            Tx.Parent = part
        end
    end))
end

New = function(Object, Parent, Name, Data)
    local Object = Instance.new(Object)
    for Index, Value in pairs(Data or {}) do Object[Index] = Value end
    Object.Parent = Parent
    Object.Name = Name
    return Object
end

function Tran(Num)
    local GivenLeter = ""
    if Num == "1" then
        GivenLeter = "a"
    elseif Num == "2" then
        GivenLeter = "b"
    elseif Num == "3" then
        GivenLeter = "c"
    elseif Num == "4" then
        GivenLeter = "d"
    elseif Num == "5" then
        GivenLeter = "e"
    elseif Num == "6" then
        GivenLeter = "f"
    elseif Num == "7" then
        GivenLeter = "g"
    elseif Num == "8" then
        GivenLeter = "h"
    elseif Num == "9" then
        GivenLeter = "i"
    elseif Num == "10" then
        GivenLeter = "j"
    elseif Num == "11" then
        GivenLeter = "k"
    elseif Num == "12" then
        GivenLeter = "l"
    elseif Num == "13" then
        GivenLeter = "m"
    elseif Num == "14" then
        GivenLeter = "n"
    elseif Num == "15" then
        GivenLeter = "o"
    elseif Num == "16" then
        GivenLeter = "p"
    elseif Num == "17" then
        GivenLeter = "q"
    elseif Num == "18" then
        GivenLeter = "r"
    elseif Num == "19" then
        GivenLeter = "s"
    elseif Num == "20" then
        GivenLeter = "t"
    elseif Num == "21" then
        GivenLeter = "u"
    elseif Num == "22" then
        GivenLeter = "v"
    elseif Num == "23" then
        GivenLeter = "w"
    elseif Num == "24" then
        GivenLeter = "x"
    elseif Num == "25" then
        GivenLeter = "y"
    elseif Num == "26" then
        GivenLeter = "z"
    elseif Num == "27" then
        GivenLeter = "_"
    elseif Num == "28" then
        GivenLeter = "0"
    elseif Num == "29" then
        GivenLeter = "1"
    elseif Num == "30" then
        GivenLeter = "2"
    elseif Num == "31" then
        GivenLeter = "3"
    elseif Num == "32" then
        GivenLeter = "4"
    elseif Num == "33" then
        GivenLeter = "5"
    elseif Num == "34" then
        GivenLeter = "6"
    elseif Num == "35" then
        GivenLeter = "7"
    elseif Num == "36" then
        GivenLeter = "8"
    elseif Num == "37" then
        GivenLeter = "9"
    end
    return GivenLeter

end

function MaybeOk(Mode, Extra)
    local ReturningValue = ""
    if Mode == 1 then

        --	v.C0 = CFrame.new(1,1,1)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))

        -- print(v.C0)
        local GivenText = ""
        local msg = Extra
        local Txt = ""
        local FoundTime = 0
        local LastFound = 0
        delay(wait(0), function()
            for v3 = 1, #msg do

                if string.sub(msg, 0 + v3, v3) == "," then

                    local TheN = string.sub(msg, LastFound, v3 - 1)

                    local NumTranslate =
                        Tran(string.sub(msg, LastFound, v3 - 1))

                    FoundTime = FoundTime + 1

                    GivenText = GivenText .. NumTranslate

                    LastFound = v3 + 1
                    Txt = ""
                end
                Txt = string.sub(msg, 1, v3)

                --    Gui.ExtentsOffset = Vector3.new(0,3,0)

                --  Gui.ExtentsOffset = Vector3.new(0,3,0)                    
                wait()
                -- Gui.ExtentsOffset = Vector3.new(0,3,0)   
            end

            ReturningValue = GivenText
            for v3 = 1, #Txt do Txt = string.sub(msg, -1, v3) end
            --   Gui:remove()
        end)

    elseif Mode == 2 then

        print("fat")
    end

    while ReturningValue == "" do wait() end
    return ReturningValue

end

function CreateMesh2(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
    local NEWMESH = IT(MESH)
    if MESH == "SpecialMesh" then
        NEWMESH.MeshType = MESHTYPE
        if MESHID ~= "nil" and MESHID ~= "" then
            NEWMESH.MeshId = "http://www.roblox.com/asset/?id=" .. MESHID
        end
        if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
            NEWMESH.TextureId = "http://www.roblox.com/asset/?id=" .. TEXTUREID
        end
    end
    NEWMESH.Offset = OFFSET or VT(0, 0, 0)
    NEWMESH.Scale = SCALE
    NEWMESH.Parent = PARENT
    return NEWMESH
end

function CreatePart2(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY,
                     BRICKCOLOR, NAME, SIZE, ANCHOR)
    local NEWPART = IT("Part")
    NEWPART.formFactor = FORMFACTOR
    NEWPART.Reflectance = REFLECTANCE
    NEWPART.Transparency = TRANSPARENCY
    NEWPART.CanCollide = false
    NEWPART.Locked = true
    NEWPART.Anchored = true
    if ANCHOR == false then NEWPART.Anchored = false end
    NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
    NEWPART.Name = NAME
    NEWPART.Size = SIZE
    NEWPART.Position = Torso.Position
    NEWPART.Material = MATERIAL
    NEWPART:BreakJoints()
    NEWPART.Parent = PARENT
    return NEWPART
end

local S = IT("Sound")
function CreateSound2(ID, PARENT, VOLUME, PITCH, DOESLOOP)
    local NEWSOUND = nil
    coroutine.resume(coroutine.create(function()
        NEWSOUND = S:Clone()
        NEWSOUND.Parent = PARENT
        NEWSOUND.Volume = VOLUME
        NEWSOUND.Pitch = PITCH
        NEWSOUND.SoundId = "http://www.roblox.com/asset/?id=" .. ID
        NEWSOUND:play()
        if DOESLOOP == true then
            NEWSOUND.Looped = true
        else
            repeat wait(1) until NEWSOUND.Playing == false
            NEWSOUND:remove()
        end
    end))
    return NEWSOUND
end

function WACKYEFFECT(Table)
    local TYPE = (Table.EffectType or "Sphere")
    local SIZE = (Table.Size or VT(1, 1, 1))
    local ENDSIZE = (Table.Size2 or VT(0, 0, 0))
    local TRANSPARENCY = (Table.Transparency or 0)
    local ENDTRANSPARENCY = (Table.Transparency2 or 1)
    local CFRAME = (Table.CFrame or Torso.CFrame)
    local MOVEDIRECTION = (Table.MoveToPos or nil)
    local ROTATION1 = (Table.RotationX or 0)
    local ROTATION2 = (Table.RotationY or 0)
    local ROTATION3 = (Table.RotationZ or 0)
    local MATERIAL = (Table.Material or "Neon")
    local COLOR = (Table.Color or C3(1, 1, 1))
    local TIME = (Table.Time or 45)
    local SOUNDID = (Table.SoundID or nil)
    local SOUNDPITCH = (Table.SoundPitch or nil)
    local SOUNDVOLUME = (Table.SoundVolume or nil)
    coroutine.resume(coroutine.create(function()
        local PLAYSSOUND = false
        local SOUND = nil
        local EFFECT = CreatePart2(3, Effects, MATERIAL, 0, TRANSPARENCY,
                                   BRICKC("Pearl"), "Effect", VT(1, 1, 1), true)
        if SOUNDID ~= nil and SOUNDPITCH ~= nil and SOUNDVOLUME ~= nil then
            PLAYSSOUND = true
            SOUND =
                CreateSound2(SOUNDID, EFFECT, SOUNDVOLUME, SOUNDPITCH, false)
        end
        EFFECT.Color = COLOR
        local MSH = nil
        if TYPE == "Sphere" then
            MSH = CreateMesh2("SpecialMesh", EFFECT, "Sphere", "", "", SIZE,
                              VT(0, 0, 0))
        elseif TYPE == "Cylinder" then
            MSH = CreateMesh2("SpecialMesh", EFFECT, "Cylinder", "", "", SIZE,
                              VT(0, 0, 0))
        elseif TYPE == "Block" then
            MSH = IT("BlockMesh", EFFECT)
            MSH.Scale = VT(SIZE.X, SIZE.X, SIZE.X)
        elseif TYPE == "Cube" then
            MSH = IT("BlockMesh", EFFECT)
            MSH.Scale = VT(SIZE.X, SIZE.X, SIZE.X)

        elseif TYPE == "Wave" then
            MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "20329976", "",
                              SIZE, VT(0, 0, -SIZE.X / 8))
        elseif TYPE == "Ring" then
            MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "559831844",
                              "", VT(SIZE.X, SIZE.X, 0.1), VT(0, 0, 0))
        elseif TYPE == "Slash" then
            MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "662586858",
                              "", VT(SIZE.X / 10, 0, SIZE.X / 10), VT(0, 0, 0))
        elseif TYPE == "Round Slash" then
            MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "662585058",
                              "", VT(SIZE.X / 10, 0, SIZE.X / 10), VT(0, 0, 0))
        elseif TYPE == "Swirl" then
            MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "1051557", "",
                              SIZE, VT(0, 0, 0))
        elseif TYPE == "Skull" then
            MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "4770583", "",
                              SIZE, VT(0, 0, 0))
        elseif TYPE == "Crystal" then
            MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "9756362", "",
                              SIZE, VT(0, 0, 0))
        elseif TYPE == "Crown" then
            MSH = CreateMesh2("SpecialMesh", EFFECT, "FileMesh", "173770780",
                              "", SIZE, VT(0, 0, 0))
        end
        if MSH ~= nil then
            local MOVESPEED = nil
            if MOVEDIRECTION ~= nil then
                MOVESPEED = (CFRAME.p - MOVEDIRECTION).Magnitude / TIME
            end
            local GROWTH = SIZE - ENDSIZE
            local TRANS = TRANSPARENCY - ENDTRANSPARENCY
            if TYPE == "Block" then

                SetTween(EFFECT, {
                    CFrame = CFRAME *
                        ANGLES(RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)),
                               RAD(MRANDOM(0, 360)))
                }, "Linear", "InOut", TIME / 60)
            else

                SetTween(EFFECT, {CFrame = CFRAME}, "Linear", "InOut", 0)

            end

            wait()

            SetTween(EFFECT, {Transparency = EFFECT.Transparency - TRANS},
                     "Linear", "InOut", TIME / 60)

            if TYPE == "Block" then

                SetTween(EFFECT, {
                    CFrame = CFRAME *
                        ANGLES(RAD(MRANDOM(0, 360)), RAD(MRANDOM(0, 360)),
                               RAD(MRANDOM(0, 360)))
                }, "Linear", "InOut", 0)
            else

                SetTween(EFFECT, {
                    CFrame = EFFECT.CFrame *
                        ANGLES(RAD(ROTATION1), RAD(ROTATION2), RAD(ROTATION3))
                }, "Linear", "InOut", 0)

            end
            if MOVEDIRECTION ~= nil then
                local ORI = EFFECT.Orientation

                SetTween(EFFECT, {CFrame = CF(MOVEDIRECTION)}, "Linear",
                         "InOut", TIME / 60)
                SetTween(EFFECT, {Orientation = ORI}, "Linear", "InOut",
                         TIME / 60)

            end
            MSH.Scale = MSH.Scale - GROWTH / TIME
            SetTween(MSH, {Scale = ENDSIZE}, "Linear", "InOut", TIME / 60)
            if TYPE == "Wave" then

                SetTween(MSH, {Offset = VT(0, 0, -MSH.Scale.X / 8)}, "Linear",
                         "InOut", TIME / 60)
            end
            for LOOP = 1, TIME + 1 do
                wait(.05)

                -- SetTween(EFFECT,{Transparency = EFFECT.Transparency - TRANS/TIME},"Linear","InOut",0)

                if TYPE == "Block" then

                    --				SetTween(EFFECT,{CFrame = CFRAME*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))},"Linear","InOut",0)
                else

                    --				SetTween(EFFECT,{CFrame = EFFECT.CFrame*ANGLES(RAD(ROTATION1),RAD(ROTATION2),RAD(ROTATION3))},"Linear","InOut",0)

                end
                if MOVEDIRECTION ~= nil then
                    local ORI = EFFECT.Orientation

                    --					SetTween(EFFECT,{CFrame=CF(EFFECT.Position,MOVEDIRECTION)*CF(0,0,-MOVESPEED)},"Linear","InOut",0)
                    --						SetTween(EFFECT,{Orientation=ORI},"Linear","InOut",0)

                end
            end
            game:GetService("Debris"):AddItem(EFFECT, 15)
            if PLAYSSOUND == false then
                EFFECT:remove()
            else
                SOUND.Stopped:Connect(function() EFFECT:remove() end)
            end
        else
            if PLAYSSOUND == false then
                EFFECT:remove()
            else
                repeat wait() until SOUND.Playing == false
                EFFECT:remove()
            end
        end
    end))
end
----------------------
-- [End Of Functions]--
----------------------

------------------
-- [Gun]--
------------------

function CreatePart(Parent, Material, Reflectance, Transparency, BColor, Name,
                    Size)
    local Part = Create("Part") {

        Parent = Parent,
        Reflectance = Reflectance,
        Transparency = Transparency,
        CanCollide = false,
        Locked = true,
        BrickColor = BrickColor.new(tostring(BColor)),
        Name = Name,
        Size = Size,
        Material = Material
    }
    RemoveOutlines(Part)
    return Part
end

------------------
-- [End of Gun]--
------------------

---------------
-- [Particles]--
---------------

local Particle2_1 = Create("ParticleEmitter") {
    Color = ColorSequence.new(Color3.new(1, 1, 1),
                              Color3.new(170 / 255, 255 / 255, 255 / 255)),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(.75, .4),
        NumberSequenceKeypoint.new(1, 1)
    }),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, .5), NumberSequenceKeypoint.new(1, .0)
    }),
    Texture = "rbxassetid://241922778",
    Lifetime = NumberRange.new(0.55, 0.95),
    Rate = 100,
    VelocitySpread = 180,
    Rotation = NumberRange.new(0),
    RotSpeed = NumberRange.new(-200, 200),
    Speed = NumberRange.new(8.0),
    LightEmission = 1,
    LockedToPart = false,
    Acceleration = Vector3.new(0, 0, 0),
    EmissionDirection = "Top",
    Drag = 4,
    Enabled = false
}

local BEGONE_Particle = Create("ParticleEmitter") {
    Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.new(1, 1, 1)),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.1, 0),
        NumberSequenceKeypoint.new(0.3, 0), NumberSequenceKeypoint.new(0.5, .2),
        NumberSequenceKeypoint.new(1, 1)
    }),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(.15, 1.5),
        NumberSequenceKeypoint.new(.75, 1.5), NumberSequenceKeypoint.new(1, 0)
    }),
    Texture = "rbxassetid://936193661",
    Lifetime = NumberRange.new(1.5),
    Rate = 100,
    VelocitySpread = 0,
    Rotation = NumberRange.new(0),
    RotSpeed = NumberRange.new(-10, 10),
    Speed = NumberRange.new(0),
    LightEmission = .25,
    LockedToPart = true,
    Acceleration = Vector3.new(0, -0, 0),
    EmissionDirection = "Top",
    Drag = 4,
    ZOffset = 1,
    Enabled = false
}

----------------------
-- [End Of Particles]--
----------------------

-----------------

Damagefunc = function(Part, hit, minim, maxim, knockback, Type, Property, Delay,
                      HitSound, HitPitch)

    if hit.Parent == nil then return end
    local h = hit.Parent:FindFirstChildOfClass("Humanoid")
    for _, v in pairs(hit.Parent:children()) do
        if v:IsA("Humanoid") then
            if h.Health > 0.0001 then
                h = v
            else
            end
        end
    end

    if h == nil then
        return
    elseif h ~= nil and h.Health < 0.001 then
        return
    elseif h ~= nil and h.Parent:FindFirstChild("Fly away") then
        return
    end

    -- gg

    -- local FoundTorso = hit.Parent:FindFirstChild("Torso") or hit.Parent:FindFirstChild("UpperTorso")	
    coroutine.resume(coroutine.create(function()
        if h.Health > 9999999 and minim < 9999 and Type ~= "IgnoreType" and
            (h.Parent:FindFirstChild("Torso") or
                h.Parent:FindFirstChild("UpperTorso")) and
            not h.Parent:FindFirstChild("Fly away") then

            local FATag = Instance.new("Model", h.Parent)

            FATag.Name = "Fly away"
            game:GetService("Debris"):AddItem(FATag, 2.5)

            for _, v in pairs(h.Parent:children()) do
                if v:IsA("BasePart") and
                    v.Parent:FindFirstChildOfClass("Humanoid") then
                    v.Anchored = true
                end
            end

            wait(.25)

            if h.Parent:FindFirstChildOfClass("Body Colors") then
                h.Parent:FindFirstChildOfClass("Body Colors"):Destroy()
            end

            local FoundTorso = h.Parent:FindFirstChild("Torso") or
                                   h.Parent:FindFirstChild("UpperTorso")

            coroutine.resume(coroutine.create(
                                 function()

                    local YourGone = Instance.new("Part")
                    YourGone.Reflectance = 0
                    YourGone.Transparency = 1
                    YourGone.CanCollide = false
                    YourGone.Locked = true
                    YourGone.Anchored = true
                    YourGone.BrickColor = BrickColor.new("Really blue")
                    YourGone.Name = "YourGone"
                    YourGone.Size = Vector3.new()
                    YourGone.Material = "SmoothPlastic"
                    YourGone:BreakJoints()
                    YourGone.Parent = FoundTorso
                    YourGone.CFrame = FoundTorso.CFrame

                    local NewParticle = Instance.new("ParticleEmitter")
                    NewParticle.Parent = YourGone
                    NewParticle.Acceleration = Vector3.new(0, 0, 0)
                    NewParticle.Size = NumberSequence.new(
                                           {
                            NumberSequenceKeypoint.new(0, 10),
                            NumberSequenceKeypoint.new(1, .0)
                        })
                    NewParticle.Color = ColorSequence.new(Color3.new(1, 0, 0),
                                                          Color3.new(1, 0, 0))
                    NewParticle.Lifetime = NumberRange.new(0.55, 0.95)
                    NewParticle.Transparency =
                        NumberSequence.new(
                            {
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(.25, .0),
                                NumberSequenceKeypoint.new(1, 1)
                            })
                    NewParticle.Speed = NumberRange.new(0, 0.0)
                    NewParticle.ZOffset = 2
                    NewParticle.Texture = "rbxassetid://243660364"
                    NewParticle.RotSpeed = NumberRange.new(-0, 0)
                    NewParticle.Rotation = NumberRange.new(-180, 180)
                    NewParticle.Enabled = false
                    game:GetService("Debris"):AddItem(YourGone, 3)
                    for i = 0, 2, 1 do
                        NewParticle:Emit(1)
                        so("1448044156", FoundTorso, 2, 1)
                        YourGone.CFrame = FoundTorso.CFrame
                        for _, v in pairs(h.Parent:children()) do
                            if v:IsA("BasePart") and
                                v.Parent:FindFirstChildOfClass("Humanoid") then
                                v.Anchored = false
                                --			v.Material = "Neon"
                                -- v.BrickColor = BrickColor.new("Really red")
                                if v:FindFirstChildOfClass("SpecialMesh") then
                                    -- v:Destroy()
                                end
                                if v:FindFirstChildOfClass("Decal") and v.Name ==
                                    "face" then
                                    --	v:Destroy()
                                end

                            end

                        end

                        wait(.2)
                    end
                    wait(.1)
                    NewParticle:Emit(3)
                    so("1448044156", FoundTorso, 2, .8)
                    YourGone.CFrame = FoundTorso.CFrame
                    for _, v in pairs(h.Parent:children()) do
                        if v:IsA("BasePart") and
                            v.Parent:FindFirstChildOfClass("Humanoid") then
                            v.Anchored = false
                            --			v.Material = "Neon"
                            -- v.BrickColor = BrickColor.new("Really red")
                            if v:FindFirstChildOfClass("SpecialMesh") then
                                -- v:Destroy()
                            end
                            if v:FindFirstChildOfClass("Decal") and v.Name ==
                                "face" then
                                --	v:Destroy()
                            end

                        end

                    end

                end))

            wait(.1)

        end

    end))
    if h ~= nil and hit.Parent ~= Character and
        hit.Parent:FindFirstChild("Torso") or
        hit.Parent:FindFirstChild("UpperTorso") ~= nil then
        if hit.Parent:findFirstChild("DebounceHit") ~= nil and
            hit.Parent.DebounceHit.Value == true then return end
        local c = Create("ObjectValue")({
            Name = "creator",
            Value = game:service("Players").LocalPlayer,
            Parent = h
        })
        game:GetService("Debris"):AddItem(c, 0.5)
        if HitSound ~= nil and HitPitch ~= nil then
            so(HitSound, hit, 1, HitPitch)
        end
        local Damage = math.random(minim, maxim)
        local blocked = false
        local block = hit.Parent:findFirstChild("Block")
        if block ~= nil and block.className == "IntValue" and block.Value > 0 then
            blocked = true
            block.Value = block.Value - 1
            print(block.Value)
        end
        if blocked == false then
            -- h.Health = h.Health - Damage
            ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p +
                           Vector3.new(0, 1.5, 0), -Damage, 1.5,
                       Color3.new(0, 0, 0))
        else
            -- h.Health = h.Health - Damage / 2
            ShowDamage(Part.CFrame * CFrame.new(0, 0, Part.Size.Z / 2).p +
                           Vector3.new(0, 1.5, 0), -Damage, 1.5,
                       Color3.new(0, 0, 0))

        end

        if Type == "Knockdown" then
            local hum = h

            hum.PlatformStand = true
            coroutine.resume(coroutine.create(
                                 function(HHumanoid)

                    wait(.2)
                    HHumanoid.PlatformStand = false
                end), hum)

            local FoundTorso = h.Parent:FindFirstChild("Torso") or
                                   h.Parent:FindFirstChild("UpperTorso")
            local angle = hit.Position -
                              (Property.Position + Vector3.new(0, 0, 0)).unit

        elseif Type == "Knockdown2" then
            local hum = h

            hum.PlatformStand = true
            coroutine.resume(coroutine.create(
                                 function(HHumanoid)

                    Combo = 1
                    wait(.2)
                    HHumanoid.PlatformStand = false
                end), hum)
            local angle = hit.Position -
                              (Property.Position + Vector3.new(0, 0, 0)).unit

        elseif Type == "Normal" then
            local FoundTorso = h.Parent:FindFirstChild("Torso") or
                                   h.Parent:FindFirstChild("UpperTorso")
            local angle = hit.Position -
                              (Property.Position + Vector3.new(0, 0, 0)).unit

        elseif Type == "Fire" then
            local HTorso = hit.Parent:FindFirstChild("Torso") or
                               hit.Parent:FindFirstChild("UpperTorso")

            local tags = 0
            for _, v2 in next, HTorso:GetChildren() do
                if v2:IsA("Folder") and v2.Name == "OnFire" then
                    tags = tags + 1
                end
            end

            if tags < 2 then

                local fireef = EffectPack.FireEffect:Clone()

                local tag = Instance.new("Folder", HTorso)
                tag.Name = "OnFire"
                game:GetService("Debris"):AddItem(tag, 4.5)
                for _, v in next, fireef:GetDescendants() do
                    if v:IsA("ParticleEmitter") or v:IsA("SpotLight") then
                        game:GetService("Debris"):AddItem(v, 5)
                        v.Parent = HTorso
                        coroutine.resume(
                            coroutine.create(
                                function()
                                    for i = 1, 35 do
                                        coroutine.resume(
                                            coroutine.create(
                                                function()
                                                    v:Emit(2)
                                                end))
                                        coroutine.resume(
                                            coroutine.create(
                                                function()
                                                    Damagefunc(HTorso, HTorso,
                                                               4 / 2, 6 / 2, 0,
                                                               "Normal",
                                                               RootPart, 0.1,
                                                               "1273118342",
                                                               math.random(10,
                                                                           30) /
                                                                   10)
                                                end))
                                        if HTorso.Parent:FindFirstChildOfClass(
                                            "Humanoid") and
                                            HTorso.Parent:FindFirstChildOfClass(
                                                "Humanoid").Health > .01 then
                                        else
                                            for _, v2 in next,
                                                         HTorso.Parent:GetDescendants() do
                                                if v2:isA("BasePart") then
                                                    SetTween(v2, {
                                                        Color = C3(0, 0, 0)
                                                    }, "Quad", "Out", .5)
                                                end
                                            end
                                            break
                                        end
                                        wait(.1)
                                    end
                                end))

                    end
                end

                fireef:Destroy()
            else -- print("Hit Max")		
            end
        elseif Type == "Instakill" then
            coroutine.resume(coroutine.create(
                                 function()
                    if (h.Parent:FindFirstChild("Torso") or
                        h.Parent:FindFirstChild("UpperTorso")) and
                        not h.Parent:FindFirstChild("Fly away") then

                        local FATag = Instance.new("Model", h.Parent)

                        FATag.Name = "Fly away"
                        game:GetService("Debris"):AddItem(FATag, 2.5)

                        for _, v in pairs(h.Parent:children()) do
                            if v:IsA("BasePart") and
                                v.Parent:FindFirstChildOfClass("Humanoid") then
                                v.Anchored = true
                            end
                        end

                        wait(.25)

                        if h.Parent:FindFirstChildOfClass("Body Colors") then
                            h.Parent:FindFirstChildOfClass("Body Colors")
                                :Destroy()
                        end

                        local FoundTorso =
                            h.Parent:FindFirstChild("Torso") or
                                h.Parent:FindFirstChild("UpperTorso")

                        coroutine.resume(
                            coroutine.create(
                                function()

                                    local YourGone = Instance.new("Part")
                                    YourGone.Reflectance = 0
                                    YourGone.Transparency = 1
                                    YourGone.CanCollide = false
                                    YourGone.Locked = true
                                    YourGone.Anchored = true
                                    YourGone.BrickColor =
                                        BrickColor.new("Really blue")
                                    YourGone.Name = "YourGone"
                                    YourGone.Size = Vector3.new()
                                    YourGone.Material = "SmoothPlastic"
                                    YourGone:BreakJoints()
                                    YourGone.Parent = FoundTorso
                                    YourGone.CFrame = FoundTorso.CFrame

                                    local NewParticle =
                                        Instance.new("ParticleEmitter")
                                    NewParticle.Parent = YourGone
                                    NewParticle.Acceleration =
                                        Vector3.new(0, 0, 0)
                                    NewParticle.Size =
                                        NumberSequence.new(
                                            {
                                                NumberSequenceKeypoint.new(0, 10),
                                                NumberSequenceKeypoint.new(1, .0)
                                            })
                                    NewParticle.Color =
                                        ColorSequence.new(Color3.new(1, 0, 0),
                                                          Color3.new(1, 0, 0))
                                    NewParticle.Lifetime =
                                        NumberRange.new(0.55, 0.95)
                                    NewParticle.Transparency =
                                        NumberSequence.new(
                                            {
                                                NumberSequenceKeypoint.new(0, 1),
                                                NumberSequenceKeypoint.new(.25,
                                                                           .0),
                                                NumberSequenceKeypoint.new(1, 1)
                                            })
                                    NewParticle.Speed = NumberRange.new(0, 0.0)
                                    NewParticle.ZOffset = 2
                                    NewParticle.Texture =
                                        "rbxassetid://243660364"
                                    NewParticle.RotSpeed =
                                        NumberRange.new(-0, 0)
                                    NewParticle.Rotation =
                                        NumberRange.new(-180, 180)
                                    NewParticle.Enabled = false
                                    game:GetService("Debris"):AddItem(YourGone,
                                                                      3)
                                    for i = 0, 2, 1 do
                                        NewParticle:Emit(1)
                                        so("1448044156", FoundTorso, 2, 1)
                                        YourGone.CFrame = FoundTorso.CFrame
                                        for _, v in pairs(h.Parent:children()) do
                                            if v:IsA("BasePart") and
                                                v.Parent:FindFirstChildOfClass(
                                                    "Humanoid") then
                                                v.Anchored = false
                                                --			v.Material = "Neon"
                                                -- v.BrickColor = BrickColor.new("Really red")
                                                if v:FindFirstChildOfClass(
                                                    "SpecialMesh") then
                                                    -- v:Destroy()
                                                end
                                                if v:FindFirstChildOfClass(
                                                    "Decal") and v.Name ==
                                                    "face" then
                                                    --	v:Destroy()
                                                end

                                            end

                                        end

                                        wait(.2)
                                    end
                                    wait(.1)
                                    NewParticle:Emit(3)
                                    so("1448044156", FoundTorso, 2, .8)
                                    YourGone.CFrame = FoundTorso.CFrame
                                    for _, v in pairs(h.Parent:children()) do
                                        if v:IsA("BasePart") and
                                            v.Parent:FindFirstChildOfClass(
                                                "Humanoid") then
                                            v.Anchored = false
                                            --			v.Material = "Neon"
                                            -- v.BrickColor = BrickColor.new("Really red")
                                            if v:FindFirstChildOfClass(
                                                "SpecialMesh") then
                                                -- v:Destroy()
                                            end
                                            if v:FindFirstChildOfClass("Decal") and
                                                v.Name == "face" then
                                                --	v:Destroy()
                                            end

                                        end

                                    end

                                end))

                        wait(.1)

                    end

                end))

        elseif Type == "HPSteal" then
            -- Humanoid.Health = Humanoid.Health + Damage
            local hum = h

            hum.PlatformStand = true
            coroutine.resume(coroutine.create(
                                 function(HHumanoid)

                    Combo = 1
                    wait(.2)
                    HHumanoid.PlatformStand = false
                end), hum)
            local angle = hit.Position -
                              (Property.Position + Vector3.new(0, 0, 0)).unit

        elseif Type == "Impale" then

            CFuncs.Sound.Create("http://www.roblox.com/asset/?id=268249319",
                                Spike, .8, 2)
            hit.Parent.Humanoid.PlatformStand = true

            wait(1)
            hit.Parent.Humanoid.PlatformStand = false
        elseif Type == "IgnoreType" then

        elseif Type == "Up" then

        elseif Type == "Snare" then

        elseif Type == "Freeze2" then
            hit.Parent.Torso.Anchored = true
            coroutine.resume(coroutine.create(
                                 function(Part)

                    wait(1.5)
                    Part.Anchored = false
                end), hit.Parent.Torso)

        end
        local debounce = Create("BoolValue")(
                             {
                Name = "DebounceHit",
                Parent = hit.Parent,
                Value = true
            })
        game:GetService("Debris"):AddItem(debounce, Delay)
        c = Instance.new("ObjectValue")
        c.Name = "creator"
        c.Value = Player
        c.Parent = h
        game:GetService("Debris"):AddItem(c, 0.5)
    end
end

ShowDamage = function(Pos, Text, Time, Color)

    local Rate = 0.033333333333333
    if not Pos then local Pos = Vector3.new(0, 0, 0) end
    local Text = Text or ""
    local Time = Time or 2
    if not Color then local Color = Color3.new(1, 0, 1) end
    local EffectPart = CreatePart(workspace, "SmoothPlastic", 0, 1,
                                  BrickColor.new(Color), "Effect",
                                  Vector3.new(0, 0, 0))
    EffectPart.Anchored = true
    local BillboardGui = Create("BillboardGui")(
                             {
            Size = UDim2.new(2, 0, 2, 0),
            Adornee = EffectPart,
            Parent = EffectPart
        })
    local TextLabel = Create("TextLabel")(
                          {
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            Text = "DMG: " .. Text .. "",
            TextColor3 = Color,
            TextScaled = true,
            Font = Enum.Font.ArialBold,
            Parent = BillboardGui
        })
    TextLabel.TextTransparency = 1
    game.Debris:AddItem(EffectPart, Time + 0.1)
    EffectPart.Parent = game:GetService("Workspace")
    delay(0, function()

        local Frames = Time / Rate

        -- print(Frames)

        EffectPart.CFrame = CFrame.new(Pos)
        wait()
        TextLabel.TextTransparency = 0
        SetTween(TextLabel, {TextTransparency = 1}, "Quad", "In", Frames / 60)
        SetTween(TextLabel, {Rotation = math.random(-25, 25)}, "Elastic",
                 "InOut", Frames / 60)
        SetTween(TextLabel, {TextColor3 = Color3.new(1, 0, 0)}, "Elastic",
                 "InOut", Frames / 60)

        SetTween(EffectPart, {
            CFrame = CFrame.new(Pos) +
                Vector3.new(math.random(-5, 5), math.random(1, 5),
                            math.random(-5, 5))
        }, "Linear", "InOut", Frames / 60)

        wait(Frames / 60)

        if EffectPart and EffectPart.Parent then EffectPart:Destroy() end
    end)
end

MagniDamage = function(Part, magni, mindam, maxdam, knock, Type2)

    local Type = ""

    if mememode == true then

        Type = "Instakill"

    else
        Type = Type2
    end
    if Type2 == "NormalKnockdown" then Type = "Knockdown" end

    for _, c in pairs(workspace:children()) do

        local hum = c:FindFirstChild("Humanoid")
        for _, v in pairs(c:children()) do
            if v:IsA("Humanoid") then hum = v end
        end

        if hum ~= nil then
            local head = c:findFirstChild("Head")
            if head ~= nil then
                local targ = head.Position - Part.Position
                local mag = targ.magnitude
                if mag <= magni and c.Name ~= Player.Name then
                    Damagefunc(Part, head, mindam, maxdam, knock, Type,
                               RootPart, 0.1, "851453784", 1.2)
                end
            end
        end
    end
end

function CFMagniDamage(HTCF, magni, mindam, maxdam, knock, Type)
    local DGP = Instance.new("Part")

    DGP.Parent = Character
    DGP.Size = Vector3.new(0.05, 0.05, 0.05)
    DGP.Transparency = 1
    DGP.CanCollide = false
    DGP.Anchored = true
    RemoveOutlines(DGP)
    DGP.Position = DGP.Position + Vector3.new(0, -.1, 0)
    DGP.CFrame = HTCF

    coroutine.resume(coroutine.create(function()
        MagniDamage(DGP, magni, mindam, maxdam, knock, Type)
    end))
    game:GetService("Debris"):AddItem(DGP, .05)

    DGP.Archivable = false
end

-----------------

function BulletHitEffectSpawn(EffectCF, EffectName)
    local MainEffectHolder = Instance.new("Part", Effects)
    MainEffectHolder.Reflectance = 0
    MainEffectHolder.Transparency = 1
    MainEffectHolder.CanCollide = false
    MainEffectHolder.Locked = true
    MainEffectHolder.Anchored = true
    MainEffectHolder.BrickColor = BrickColor.new("Bright green")
    MainEffectHolder.Name = "Bullet"
    MainEffectHolder.Size = Vector3.new(.05, .05, .05)
    MainEffectHolder.Material = "Neon"
    MainEffectHolder:BreakJoints()
    MainEffectHolder.CFrame = EffectCF
    local EffectAttach = Instance.new("Attachment", MainEffectHolder)
    game:GetService("Debris"):AddItem(MainEffectHolder, 15)

    if EffectName == "Explode" then
        EffectAttach.Orientation = Vector3.new(90, 0, 0)

        local SpawnedParticle1 = EffectPack.Bang2:Clone()
        SpawnedParticle1.Parent = MainEffectHolder
        SpawnedParticle1:Emit(150)

        local SpawnedParticle2 = EffectPack.Bang1:Clone()
        SpawnedParticle2.Parent = MainEffectHolder
        SpawnedParticle2:Emit(25)

        local SpawnedParticle3 = EffectPack.Bang3:Clone()
        SpawnedParticle3.Parent = MainEffectHolder
        SpawnedParticle3:Emit(185)
        game:GetService("Debris"):AddItem(MainEffectHolder, 2)

    end

    if EffectName == "Spark" then

        EffectAttach.Orientation = Vector3.new(90, 0, 0)

        local SpawnedParticle1 = EffectPack.Spark:Clone()
        SpawnedParticle1.Parent = MainEffectHolder
        SpawnedParticle1:Emit(1)

        game:GetService("Debris"):AddItem(MainEffectHolder, 2)

    end

    if EffectName == "ShockWave" then

        EffectAttach.Orientation = Vector3.new(90, 0, 0)

        local SpawnedParticle1 = EffectPack.ShockWave1:Clone()
        SpawnedParticle1.Parent = MainEffectHolder
        SpawnedParticle1:Emit(0)
        local SpawnedParticle2 = EffectPack.ShockWave2:Clone()
        SpawnedParticle2.Parent = MainEffectHolder
        SpawnedParticle2:Emit(2)

        game:GetService("Debris"):AddItem(MainEffectHolder, 2)

    end

    if EffectName == "Nuke" then
        so(923073285, MainEffectHolder, 8, 2)
        EffectAttach.Orientation = Vector3.new(0, 0, 0)
        local EffectAttach2 = Instance.new("Attachment", MainEffectHolder)
        EffectAttach2.Orientation = Vector3.new(0, 0, 0)

        local SpawnedParticle1 = EffectPack.Nuke_Flash:Clone()
        SpawnedParticle1.Parent = EffectAttach
        SpawnedParticle1:Emit(20)

        local SpawnedParticle2 = EffectPack.Nuke_Smoke:Clone()
        SpawnedParticle2.Parent = EffectAttach2
        SpawnedParticle2.Enabled = true
        coroutine.resume(coroutine.create(
                             function()

                for i = 0, 2, .025 / 1.5 do

                    SpawnedParticle2.Transparency =
                        NumberSequence.new(
                            {
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(.15, .5 + (i / 4)),
                                NumberSequenceKeypoint.new(.95, .5 + (i / 4)),
                                NumberSequenceKeypoint.new(1, 1)
                            })
                    Swait()
                end
                SpawnedParticle2.Transparency =
                    NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(1, 1)
                    })

                SpawnedParticle2.Enabled = false
            end))

        local SpawnedParticle3 = EffectPack.Nuke_Wave:Clone()
        SpawnedParticle3.Parent = EffectAttach
        SpawnedParticle3:Emit(185)
        game:GetService("Debris"):AddItem(EffectAttach, 10)

    end

end

--[[
		for i, v in pairs(C:GetChildren()) do
if v:IsA("Accessory")then
v:Destroy()	
end
if v:IsA("BasePart")then
v.Transparency =1
if v.Name == "Head" then
	v:FindFirstChildOfClass("Decal"):Destroy()
end
end
		end--]]
--[[













local tweeningInformation = TweenInfo.new(
	0.5,	
	Enum.EasingStyle.Back,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
--]]

local RJW = weld(RJ.Parent, RJ.Part0, RJ.Part1, RJ.C0)
RJW.C1 = RJ.C1
RJW.Name = RJ.Name

local NeckW = weld(Neck.Parent, Neck.Part0, Neck.Part1, Neck.C0)
NeckW.C1 = Neck.C1
NeckW.Name = Neck.Name

-- print(WRJ.Parent.Name)

local RW = weld(Torso, Torso, RightArm, cf(0, 0, 0))

local LW = weld(Torso, Torso, LeftArm, cf(0, 0, 0))

local RH = weld(Torso, Torso, RightLeg, cf(0, 0, 0))

local LH = weld(Torso, Torso, LeftLeg, cf(0, 0, 0))

RW.C1 = cn(0, 0.5, 0)
LW.C1 = cn(0, 0.5, 0)
RH.C1 = cn(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
LH.C1 = cn(0, 1, 0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

--------
-- (#Torso)
SetTween(RJW, {C0 = RootCF * CFrame.new(0, 0, 0)}, "Quad", "InOut", 0.1)
--------
-- (#Head)
SetTween(NeckW, {C0 = NeckCF * CFrame.new(0, 0, 0)}, "Quad", "InOut", 0.1)
--------
-- (#Right Arm)
SetTween(RW, {C0 = CFrame.new(1.5, 0.5, -.0)}, "Quad", "InOut", 0.1)
--------
-- (#Left Arm)
SetTween(LW, {C0 = CFrame.new(-1.5, 0.5, -.0)}, "Quad", "InOut", 0.1)
--------
-- (#Right Leg)
SetTween(RH, {C0 = CFrame.new(.5, -0.90, 0)}, "Quad", "InOut", 0.1)
--------
-- (#Left Leg)
SetTween(LH, {C0 = CFrame.new(-.5, -0.90, 0)}, "Quad", "InOut", 0.1)

--[[
SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
--]]

function AT1()
    attack = true
    local dahspeed = 1
    if attack == true and mememode == true then dahspeed = 5 end -- /dahspeed
    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, 0, 0) *
            angles(math.rad(20), math.rad(0), math.rad(-40))
    }, "Quad", "InOut", 0.2)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(0), math.rad(0), math.rad(40))
    }, "Quad", "InOut", 0.2)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(30), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(30), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)
    SetTween(RH, {
        C0 = CFrame.new(.5, -.6, -.4) *
            angles(math.rad(-20), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -1, 0) *
            angles(math.rad(20), math.rad(0), math.rad(20))
    }, "Quad", "InOut", 0.2)

    wait(.2 / dahspeed)

    -- coroutine.resume(coroutine.create(function()	
    --	so("1428541279", RightArm,1.6, math.random(120,220)/100)

    CFMagniDamage(RootPart.CFrame * CF(0, -1, -1), 7, 10, 20, 20, "Normal")
    -- end))

    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, -1, 0) *
            angles(math.rad(-40), math.rad(0), math.rad(40))
    }, "Back", "Out", 0.2)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(0), math.rad(0), math.rad(-40))
    }, "Back", "Out", 0.2)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(-30), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(-30), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(RH, {
        C0 = CFrame.new(.5, -1, 0) *
            angles(math.rad(120), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -1, 0) *
            angles(math.rad(-60), math.rad(0), math.rad(-20))
    }, "Back", "Out", 0.2)

    wait(.2 / dahspeed)

    attack = false
end

function AT2()
    attack = true
    local dahspeed = 1
    if attack == true and mememode == true then dahspeed = 5 end -- /dahspeed

    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, 0, 0) *
            angles(math.rad(-20), math.rad(0), math.rad(60))
    }, "Quad", "InOut", 0.2)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(0), math.rad(0), math.rad(-60))
    }, "Quad", "InOut", 0.2)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(90), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)
    SetTween(RH, {
        C0 = CFrame.new(.5, -.5, -.4) *
            angles(math.rad(-20), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -1, 0) *
            angles(math.rad(-20), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)

    CFMagniDamage(RootPart.CFrame * CF(0, -0, -1), 9, 10, 15, 0, "Normal")

    wait(.2 / dahspeed)

    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, -1, 0) *
            angles(math.rad(0), math.rad(0), math.rad(-70))
    }, "Back", "Out", 0.2)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(0), math.rad(0), math.rad(70))
    }, "Back", "Out", 0.2)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(-20), math.rad(-90))
    }, "Back", "Out", 0.2)
    SetTween(RH, {
        C0 = CFrame.new(.5, -1, -0) *
            angles(math.rad(20), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -1, 0) *
            angles(math.rad(-20), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)

    wait(.2 / dahspeed)
    attack = false
end

function AT3()
    attack = true
    local dahspeed = 1
    if attack == true and mememode == true then dahspeed = 5 end -- /dahspeed
    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, 0, 0) *
            angles(math.rad(-20), math.rad(0), math.rad(120))
    }, "Quad", "In", 0.2)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(0), math.rad(0), math.rad(-80))
    }, "Quad", "InOut", 0.2)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(90), math.rad(0), math.rad(20))
    }, "Quad", "InOut", 0.2)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(20), math.rad(-0), math.rad(-0))
    }, "Quad", "InOut", 0.2)
    SetTween(RH, {
        C0 = CFrame.new(.5, -1, -0) *
            angles(math.rad(-20), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -.8, 0) *
            angles(math.rad(20), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)

    wait(.2 / dahspeed)
    CFMagniDamage(RootPart.CFrame * CF(-2, -.25, -1), 9, 20, 30, 10, "Knockdown")

    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, -1, 0) *
            angles(math.rad(20), math.rad(0), math.rad(-0))
    }, "Back", "Out", 0.2)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(0), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(0), math.rad(90))
    }, "Back", "Out", 0.2)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(20), math.rad(-0), math.rad(-0))
    }, "Back", "Out", 0.2)
    SetTween(RH, {
        C0 = CFrame.new(.5, -1, -0) *
            angles(math.rad(-40), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -1, 0) *
            angles(math.rad(0), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    wait(.2 / dahspeed)
    attack = false
end

function AT4()
    attack = true
    local dahspeed = 1
    if attack == true and mememode == true then dahspeed = 5 end -- /dahspeed

    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, 0, 0) *
            angles(math.rad(-20), math.rad(0), math.rad(-80))
    }, "Quad", "InOut", 0.2)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(20), math.rad(0), math.rad(80))
    }, "Quad", "InOut", 0.2)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(-20), math.rad(-70), math.rad(-90))
    }, "Quad", "InOut", 0.2)
    SetTween(RH, {
        C0 = CFrame.new(.5, -1, -.0) *
            angles(math.rad(20), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -.5, -0.4) *
            angles(math.rad(20), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)

    CFMagniDamage(RootPart.CFrame * CF(0, -0, -1), 9, 30, 45, 0, "Normal")
    so("3051417237", LeftArm, 3, math.random(100, 155) / 100)
    wait(0.2 / dahspeed)

    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, -1, 0) *
            angles(math.rad(20), math.rad(0), math.rad(45))
    }, "Back", "Out", 0.2)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(-20), math.rad(0), math.rad(-45))
    }, "Back", "Out", 0.2)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(-0), math.rad(-90))
    }, "Back", "Out", 0.2)
    SetTween(RH, {
        C0 = CFrame.new(.5, -1, -0) *
            angles(math.rad(20), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -1, 0) *
            angles(math.rad(-10), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)

    wait(.2 / dahspeed)
    attack = false
end

function AT5()
    attack = true
    local dahspeed = 1
    if attack == true and mememode == true then dahspeed = 5 end -- /dahspeed

    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, 0, 0) *
            angles(math.rad(-20), math.rad(0), math.rad(80))
    }, "Quad", "InOut", 0.2)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(20), math.rad(0), math.rad(-80))
    }, "Quad", "InOut", 0.2)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(-20), math.rad(70), math.rad(90))
    }, "Quad", "InOut", 0.2)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(0), math.rad(-90))
    }, "Quad", "InOut", 0.2)
    SetTween(RH, {
        C0 = CFrame.new(.5, -.5, -0.4) *
            angles(math.rad(20), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -1, -0) *
            angles(math.rad(20), math.rad(0), math.rad(0))
    }, "Quad", "InOut", 0.2)

    CFMagniDamage(RootPart.CFrame * CF(0, -0, -1), 9, 30, 45, 0, "Normal")
    so("3051417237", RightArm, 3, math.random(100, 155) / 80)
    wait(0.2 / dahspeed)

    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, -1, 0) *
            angles(math.rad(20), math.rad(0), math.rad(-45))
    }, "Back", "Out", 0.2)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(-20), math.rad(0), math.rad(45))
    }, "Back", "Out", 0.2)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(0), math.rad(90))
    }, "Back", "Out", 0.2)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(-0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(RH, {
        C0 = CFrame.new(.5, -1, -0) *
            angles(math.rad(-10), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -1, 0) *
            angles(math.rad(20), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)

    wait(.2 / dahspeed)
    attack = false
end

function AT6()
    attack = true
    local dahspeed = 1
    if attack == true and mememode == true then dahspeed = 5 end -- /dahspeed

    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, -1, -.3) *
            angles(math.rad(45), math.rad(0), math.rad(0))
    }, "Quad", "Out", 0.3)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(-20), math.rad(0), math.rad(0))
    }, "Quad", "Out", 0.3)
    SetTween(RW, {
        C0 = CFrame.new(1.1, 0.5, -.3) *
            angles(math.rad(20), math.rad(115), math.rad(90))
    }, "Quad", "In", 0.15)
    SetTween(LW, {
        C0 = CFrame.new(-1.1, 0.5, -.3) *
            angles(math.rad(20), math.rad(-115), math.rad(-90))
    }, "Quad", "In", 0.15)
    SetTween(RH, {
        C0 = CFrame.new(.5, -1, 0) *
            angles(math.rad(-60), math.rad(0), math.rad(0))
    }, "Quad", "Out", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -1, 0) *
            angles(math.rad(60), math.rad(0), math.rad(0))
    }, "Quad", "Out", 0.3)

    so("3051417237", Torso, 3, math.random(140, 185) / 80)
    CFMagniDamage(RootPart.CFrame * CF(-1.4, -0, -1), 9, 40, 55, 10, "Knockdown")
    CFMagniDamage(RootPart.CFrame * CF(1.4, -0, -1), 9, 40, 55, 10, "Knockdown")

    wait(0.175 / dahspeed)

    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, -1.7, -.4) *
            angles(math.rad(45), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(0), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(0), math.rad(90))
    }, "Back", "Out", 0.2)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(0), math.rad(-90))
    }, "Back", "Out", 0.2)
    SetTween(RH, {
        C0 = CFrame.new(.5, -1, 0) *
            angles(math.rad(0), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -1, 0) *
            angles(math.rad(65), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.2)

    wait(.2 / dahspeed)
    attack = false
end

function AT7()
    attack = true
    local dahspeed = 1
    if attack == true and mememode == true then dahspeed = 5 end -- /dahspeed
    so("3051417237", Torso, 3, .8)

    coroutine.resume(coroutine.create(function()
        for i = 1, 2 do
            Swait(3)
            so("3051417087", RightArm, 3, math.random(100, 155) / 100)
        end
    end))
    for i = 1, 10, 1 do
        SetTween(RJW, {
            C0 = RootCF * CFrame.new(0, -1.7 + .17 * i, -.4) *
                angles(math.rad(25 - 5 * i), math.rad(0), math.rad(36 * i))
        }, "Quad", "Out", 0.1)
        SetTween(NeckW, {
            C0 = NeckCF * CFrame.new(0, 0, 0) *
                angles(math.rad(0), math.rad(0), math.rad(0))
        }, "Quad", "Out", 0.2)
        SetTween(RW, {
            C0 = CFrame.new(1.5, 0.5, -.0) *
                angles(math.rad(180), math.rad(0), math.rad(90))
        }, "Quad", "Out", 0.2)
        SetTween(LW, {
            C0 = CFrame.new(-1.5, 0.5, -.0) *
                angles(math.rad(0), math.rad(0), math.rad(-90))
        }, "Quad", "Out", 0.2)
        SetTween(RH, {
            C0 = CFrame.new(.5, -1, 0) *
                angles(math.rad(-25), math.rad(0), math.rad(0))
        }, "Quad", "Out", 0.2)
        SetTween(LH, {
            C0 = CFrame.new(-.5, -1, 0) *
                angles(math.rad(25), math.rad(0), math.rad(0))
        }, "Quad", "Out", 0.2)
        CFMagniDamage(RootPart.CFrame * CF(1.4, -0, -1 + .17 * i), 9, 10, 15,
                      10, "Knockdown")
        Swait()
    end

    attack = false
end
--[[
how to make an cat fly


	SetTween(RJW,{C0=RootCF*CFrame.new(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(-20))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(20))},"Quad","InOut",0.1)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.25)*angles(math.rad(0),math.rad(0),math.rad(40))},"Quad","Out",0.1)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
Swait(.1*30)
for i = 1,100,0.3 do	
	SetTween(RJW,{C0=RootCF*CFrame.new(-20.5*math.sin(i),20.5*math.cos(i),i/.5)*angles(math.rad(25-4.5*10*i),math.rad(0),math.rad(36*i*2))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(20),math.rad(0),math.rad(-80))},"Quad","InOut",0.15)
SetTween(RW,{C0=CFrame.new(1.5 , 0.65, -.0)*angles(math.rad(160+2*i),math.rad(0),math.rad(30-3*i))},"Quad","Out",0.15)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.15)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(0+6.5*i),math.rad(0),math.rad(0))},"Quad","InOut",0.15)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0-6.5*i),math.rad(0),math.rad(0))},"Quad","InOut",0.15)
Swait() end	

	SetTween(RJW,{C0=RootCF*CFrame.new(0,0,20)*angles(math.rad(-20),math.rad(0),math.rad(-20))},"Quad","InOut",0.1)
SetTween(NeckW,{C0=NeckCF*CFrame.new(0,0,0)*angles(math.rad(0),math.rad(0),math.rad(20))},"Quad","InOut",0.1)
SetTween(RW,{C0=CFrame.new(1.5 , 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(LW,{C0=CFrame.new(-1.5, 0.5, -.0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","Out",0.1)
SetTween(RH,{C0=CFrame.new(.5, -1, 0)*angles(math.rad(90),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
SetTween(LH,{C0=CFrame.new(-.5, -1, 0)*angles(math.rad(0),math.rad(0),math.rad(0))},"Quad","InOut",0.1)
Swait(1.1*30)


]] --

function joke() end

function Attack1()
    attack = true

    Humanoid.JumpPower = 0
    Humanoid.WalkSpeed = 0.1
    so("299058146", RightArm, 2, 2.5)
    SetTween(RJW, {
        C0 = RootCF * CFrame.new(0, 0, 0) *
            angles(math.rad(20), math.rad(0), math.rad(-20))
    }, "Back", "Out", 0.6)
    SetTween(NeckW, {
        C0 = NeckCF * CFrame.new(0, 0, 0) *
            angles(math.rad(0), math.rad(0), math.rad(20))
    }, "Back", "Out", 0.6)
    SetTween(RW, {
        C0 = CFrame.new(1.5, 0.5, -.0) *
            angles(math.rad(-10), math.rad(0), math.rad(20))
    }, "Back", "Out", 0.6)
    SetTween(LW, {
        C0 = CFrame.new(-1.5, 0.5, -.0) *
            angles(math.rad(0), math.rad(0), math.rad(-20))
    }, "Back", "Out", 0.6)
    SetTween(RH, {
        C0 = CFrame.new(.5, -1, 0) *
            angles(math.rad(-20), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.6)
    SetTween(LH, {
        C0 = CFrame.new(-.5, -1, 0) *
            angles(math.rad(20), math.rad(0), math.rad(0))
    }, "Back", "Out", 0.6)
    Swait(.2 * 30)

    coroutine.resume(coroutine.create(function()
        local EffectAttach = Instance.new("Attachment", RightArm)
        EffectAttach.Orientation = Vector3.new(0, 0, 0)
        EffectAttach.Position = Vector3.new(0, -1, 0)
        local SpawnedParticle1 = EffectPack.Spark:Clone()
        SpawnedParticle1.Parent = EffectAttach
        SpawnedParticle1:Emit(1)

        game:GetService("Debris"):AddItem(EffectAttach, 2)
    end))

    local TheGunHandle = Instance.new("Part")
    TheGunHandle.Reflectance = 0
    TheGunHandle.Transparency = 1
    TheGunHandle.CanCollide = false
    TheGunHandle.Locked = true
    TheGunHandle.Anchored = false
    TheGunHandle.BrickColor = BrickColor.new("Really blue")
    TheGunHandle.Name = "BHandle"
    TheGunHandle.Size = Vector3.new(2.5, 1, 2.5)
    TheGunHandle.Material = "SmoothPlastic"
    TheGunHandle:BreakJoints()
    TheGunHandle.Parent = Effects
    TheGunHandle.CFrame = RootPart.CFrame
    TheGunHandle.Massless = false

    local SWeld = weld(TheGunHandle, RootPart, TheGunHandle, cf(0, 0, -3) *
                           angles(math.rad(0), math.rad(0), math.rad(0)))
    local IsHit = false
    local function onTouch(HitPa)
        if IsHit == false then
            local c = HitPa.Parent
            local h = HitPa.Parent:FindFirstChild("Humanoid")
            for _, v in pairs(HitPa.Parent:children()) do
                if v:IsA("Humanoid") then h = v end

            end
            local head = c:FindFirstChild("Torso") or
                             c:FindFirstChild("UpperTorso")
            local realhead = c:FindFirstChild("Head")
            if h ~= nil and head ~= nil and realhead ~= nil then

                IsHit = true
                head.Anchored = true
                coroutine.resume(coroutine.create(
                                     function()
                        TheGunHandle:Destroy()
                    end))
                ----------------------------------------------------------------------------------------------------------------------------------	

                local TheFlyHandle = Instance.new("Part")
                TheFlyHandle.Reflectance = 0
                TheFlyHandle.Transparency = 1
                TheFlyHandle.CanCollide = false
                TheFlyHandle.Locked = true
                TheFlyHandle.Anchored = true
                TheFlyHandle.BrickColor = BrickColor.new("Really blue")
                TheFlyHandle.Name = "FHandle"
                TheFlyHandle.Size = Vector3.new(1, 1, 1)
                TheFlyHandle.Material = "SmoothPlastic"
                TheFlyHandle:BreakJoints()
                TheFlyHandle.Parent = Effects
                TheFlyHandle.CFrame = RootPart.CFrame
                TheFlyHandle.Massless = false

                local thejoint = joint(TheFlyHandle, RootPart, TheFlyHandle,
                                       cf())

                local risingnum = (25 - 4.5 * 1)

                local EffectAttach = Instance.new("Attachment", RightArm)
                EffectAttach.Orientation = Vector3.new(0, 0, 0)
                EffectAttach.Position = Vector3.new(0, -1, 0)
                local SpawnedParticle1 = EffectPack.UpperCutSmoke:Clone()
                SpawnedParticle1.Parent = EffectAttach
                SpawnedParticle1.Enabled = true

                game:GetService("Debris"):AddItem(EffectAttach, 5)

                so("231917750", Torso, 2, 0.9)
                for i = 1, 10, 0.4 do
                    SetTween(RJW, {
                        C0 = RootCF *
                            CFrame.new(-0.5 * math.sin(i), 0.5 * math.cos(i), 0) *
                            angles(math.rad(25 - 4.5 * i), math.rad(0),
                                   math.rad(36 * i * 2))
                    }, "Quad", "InOut", 0.05)
                    SetTween(NeckW, {
                        C0 = NeckCF * CFrame.new(0, 0, 0) *
                            angles(math.rad(20), math.rad(0), math.rad(-80))
                    }, "Quad", "InOut", 0.15)
                    SetTween(RW, {
                        C0 = CFrame.new(1.5, 0.65, -.0) *
                            angles(math.rad(160 + 2 * i), math.rad(0),
                                   math.rad(30 - 3 * i))
                    }, "Quad", "Out", 0.15)
                    SetTween(LW, {
                        C0 = CFrame.new(-1.5, 0.5, -.0) *
                            angles(math.rad(0), math.rad(0), math.rad(0))
                    }, "Quad", "Out", 0.15)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -1, 0) *
                            angles(math.rad(0 + 6.5 * i), math.rad(0),
                                   math.rad(0))
                    }, "Quad", "InOut", 0.15)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -1, 0) *
                            angles(math.rad(0 - 6.5 * i), math.rad(0),
                                   math.rad(0))
                    }, "Quad", "InOut", 0.15)

                    SetTween(head, {
                        CFrame = RootPart.CFrame * CF(0, 0, -1) *
                            angles(math.rad(math.random(-180, 180)),
                                   math.rad(math.random(-180, 180)),
                                   math.rad(math.random(-180, 180)))
                    }, "Quad", "InOut", 0.05)

                    SetTween(thejoint, {C0 = CFrame.new(0, -i * 2, i / 2)},
                             "Quad", "InOut", 0.05)

                    risingnum = risingnum + 75
                    if risingnum > 180 then
                        risingnum = -180
                        print(1)
                    end
                    if risingnum > -45 and risingnum < 45 then
                        BulletHitEffectSpawn(head.CFrame, "ShockWave")
                        so("471882019", head, 3, 2.5)
                    end
                    Swait()

                end
                SpawnedParticle1.Enabled = false

                coroutine.resume(coroutine.create(
                                     function()
                        local EffectAttach =
                            Instance.new("Attachment", RightArm)
                        EffectAttach.Orientation = Vector3.new(0, 0, 0)
                        EffectAttach.Position = Vector3.new(0, -1, 0)
                        local SpawnedParticle1 = EffectPack.Spark:Clone()
                        SpawnedParticle1.Parent = EffectAttach
                        SpawnedParticle1:Emit(1)

                        game:GetService("Debris"):AddItem(EffectAttach, 2)
                    end))
                coroutine.resume(coroutine.create(
                                     function()
                        local EffectAttach = Instance.new("Attachment", LeftArm)
                        EffectAttach.Orientation = Vector3.new(0, 0, 0)
                        EffectAttach.Position = Vector3.new(0, -1, 0)
                        local SpawnedParticle1 = EffectPack.Spark:Clone()
                        SpawnedParticle1.Parent = EffectAttach
                        SpawnedParticle1:Emit(1)

                        game:GetService("Debris"):AddItem(EffectAttach, 2)
                    end))
                so("782353117", Torso, 2, 0.9)
                so("588738949", RightArm, 3, math.random(90, 110) / 100)
                so("588738949", LeftArm, 3, math.random(90, 110) / 100)
                SetTween(RJW, {
                    C0 = RootCF * CFrame.new(0, 0, 0) *
                        angles(math.rad(-65), math.rad(0), math.rad(-0))
                }, "Back", "Out", 0.3)
                SetTween(NeckW, {
                    C0 = NeckCF * CFrame.new(0, 0, 0) *
                        angles(math.rad(65), math.rad(0), math.rad(0))
                }, "Back", "Out", 0.3)
                SetTween(RW, {
                    C0 = CFrame.new(1.5, 0.5, -.0) *
                        angles(math.rad(90), math.rad(0), math.rad(90))
                }, "Back", "Out", 0.3)
                SetTween(LW, {
                    C0 = CFrame.new(-1.5, 0.5, -.0) *
                        angles(math.rad(90), math.rad(0), math.rad(-90))
                }, "Back", "Out", 0.3)
                SetTween(RH, {
                    C0 = CFrame.new(.5, -.7, -.2) *
                        angles(math.rad(-40), math.rad(0), math.rad(0))
                }, "Back", "Out", 0.3)
                SetTween(LH, {
                    C0 = CFrame.new(-.5, -1, 0) *
                        angles(math.rad(-30), math.rad(0), math.rad(0))
                }, "Back", "Out", 0.3)

                SetTween(thejoint, {C0 = CFrame.new(0, -30, 5)}, "Back", "Out",
                         0.6)

                for i = 1, 3 do
                    SetTween(head, {
                        CFrame = RootPart.CFrame * CF(0, 0, -6) *
                            angles(mr(0), mr(180), mr(0))
                    }, "Linear", "Out", 0.1)

                    Swait(0.1 * 30)
                end

                for i = 1, 2.5, .225 do
                    SetTween(RJW, {
                        C0 = RootCF *
                            CFrame.new(0, 2 + (-0.75 * i), 20 - 1.8 * i) *
                            angles(math.rad(15 + 30 * i * 2), math.rad(0),
                                   math.rad(-0))
                    }, "Quad", "Out", 0.2)
                    SetTween(NeckW, {
                        C0 = NeckCF * CFrame.new(0, 0, 0) *
                            angles(math.rad(-25), math.rad(0), math.rad(0))
                    }, "Quad", "Out", 0.3)
                    SetTween(RW, {
                        C0 = CFrame.new(1.5, 0.5, -.0) *
                            angles(math.rad(170), math.rad(0),
                                   math.rad(90 - (90 / 2.0) * i))
                    }, "Quad", "Out", 0.2)
                    SetTween(LW, {
                        C0 = CFrame.new(-1.5, 0.5, -.0) *
                            angles(math.rad(170), math.rad(0),
                                   math.rad(-90 + (90 / 2.0) * i))
                    }, "Quad", "Out", 0.2)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -1, 0) *
                            angles(math.rad(40), math.rad(0), math.rad(0))
                    }, "Quad", "Out", 0.3)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -1, -0) *
                            angles(math.rad(40), math.rad(0), math.rad(0))
                    }, "Quad", "Out", 0.3)
                    Swait()

                    SetTween(thejoint, {
                        C0 = CFrame.new(0, -(20 - 1.8 * i), 13 - 1.2 * i)
                    }, "Quad", "Out", 0.2)

                end
                so("231917750", Torso, 5, 0.9)
                local EffectAttach2 = Instance.new("Attachment", Torso)
                EffectAttach2.Orientation = Vector3.new(0, 0, 0)
                EffectAttach2.Position = Vector3.new(0, 0, 0)
                local SpawnedParticle2 = EffectPack.SmashSmoke:Clone()
                SpawnedParticle2.Parent = EffectAttach2
                SpawnedParticle2.Enabled = true

                game:GetService("Debris"):AddItem(EffectAttach2, 7)

                coroutine.resume(coroutine.create(
                                     function()
                        local parsave = c.Parent
                        c.Parent = Effects
                        local hitground, hitgp, dir =
                            rayCast(Torso.Position, CFrame.new(Torso.Position,
                                                               (RootPart.CFrame *
                                                                   CF(0, -4, -10)).p)
                                        .lookVector, 54, Character)
                        c.Parent = parsave
                        SetTween(head, {
                            CFrame = cf(hitgp - VT(0, 0, 0), Torso.Position) *
                                angles(mr(0), mr(180), mr(-45))
                        }, "Quad", "In", 0.3)
                        Swait(.3 * 30)
                        so("231917744", head, 4, 1.25)
                        BulletHitEffectSpawn(CF(hitgp, hitgp + dir), "Explode")
                    end))
                coroutine.resume(coroutine.create(
                                     function()
                        Swait(0.3 * 30)

                        head.Anchored = false
                    end))

                SetTween(thejoint, {C0 = CFrame.new(0, 0, 27)}, "Quad", "In",
                         0.3)
                SetTween(RJW, {
                    C0 = RootCF * CFrame.new(0, -0, -.5) *
                        angles(math.rad(85), math.rad(0), math.rad(-0))
                }, "Quad", "Out", 0.2)
                SetTween(NeckW, {
                    C0 = NeckCF * CFrame.new(0, 0, 0) *
                        angles(math.rad(-65), math.rad(0), math.rad(0))
                }, "Back", "Out", 0.2)
                SetTween(RW, {
                    C0 = CFrame.new(1.5, 0.5, -.0) *
                        angles(math.rad(130), math.rad(0), math.rad(0))
                }, "Back", "Out", 0.2)
                SetTween(LW, {
                    C0 = CFrame.new(-1.5, 0.5, -.0) *
                        angles(math.rad(130), math.rad(0), math.rad(-0))
                }, "Back", "Out", 0.2)
                SetTween(RH, {
                    C0 = CFrame.new(.5, -1, 0) *
                        angles(math.rad(-25), math.rad(0), math.rad(0))
                }, "Back", "Out", 0.2)
                SetTween(LH, {
                    C0 = CFrame.new(-.5, -1, 0) *
                        angles(math.rad(-25), math.rad(0), math.rad(0))
                }, "Back", "Out", 0.2)
                Swait(0.3 * 30)

                SpawnedParticle2.Enabled = false
                SetTween(RJW, {
                    C0 = RootCF * CFrame.new(0, -0, 0) *
                        angles(math.rad(-0), math.rad(0), math.rad(-0))
                }, "Quad", "Out", 0.25)
                SetTween(NeckW, {
                    C0 = NeckCF * CFrame.new(0, 0, 0) *
                        angles(math.rad(35), math.rad(0), math.rad(0))
                }, "Back", "Out", 0.25)
                SetTween(RW, {
                    C0 = CFrame.new(1.5, 0.5, -.0) *
                        angles(math.rad(30), math.rad(0), math.rad(30))
                }, "Back", "Out", 0.25)
                SetTween(LW, {
                    C0 = CFrame.new(-1.5, 0.5, -.0) *
                        angles(math.rad(30), math.rad(0), math.rad(-30))
                }, "Back", "Out", 0.25)
                SetTween(RH, {
                    C0 = CFrame.new(.5, -1, 0) *
                        angles(math.rad(10), math.rad(0), math.rad(0))
                }, "Back", "Out", 0.25)
                SetTween(LH, {
                    C0 = CFrame.new(-.5, -1, 0) *
                        angles(math.rad(-10), math.rad(0), math.rad(0))
                }, "Back", "Out", 0.25)
                Swait(0.25 * 30)
                TheFlyHandle:Destroy()

                attack = false
                ----------------------------------------------------------------------------------------------------------------------------------

            end

        end
    end
    local combothingy = TheGunHandle.Touched:connect(onTouch)
    Swait(.5 * 30)
    if TheGunHandle.Parent == Effects then
        combothingy:disconnect()
        TheGunHandle:Destroy()
        attack = false
    end
    while true do
        Swait()

        if attack == false then break end

    end
    print("aaaaaaaaaaaaaaaaaa")
    combothingy:disconnect()
    Humanoid.JumpPower = 60
    Humanoid.WalkSpeed = 16

end

function Attack6()

    for i, v in pairs(GatherAllInstances(Effects)) do
        if v.Name == "Zombie" then v.Parent:Destroy() end
    end
end

function ClickCombo()
    if Anim == "Fall" or Anim == "Jump" then
        if Combo == 0 then
            -- DownAT()	
        end
    else
        if agresive == false then
            if Combo == 0 then
                AT1()
                Combo = 1
            elseif Combo == 1 then
                AT2()
                Combo = 2
            elseif Combo == 2 then
                AT3()
                Combo = 0
            elseif Combo == 3 then
                Combo = 0
                ClickCombo()
            end

        else
            if Combo == 0 then
                AT4()
                Combo = 1
            elseif Combo == 1 then
                AT5()
                Combo = 2
            elseif Combo == 2 then
                AT6()
                Combo = 3
            elseif Combo == 3 then
                AT7()
                Combo = 0
            end

        end
    end
end

local Hold = false

Button1DownF = function()

    Hold = true
    while Hold == true do
        if attack == false then
            ClickCombo()
        else

        end
        Swait()
    end

end

Button1UpF = function() if Hold == true then Hold = false end end

KeyUpF = function(key) end

KeyDownF = function(key)
    if key == "f" and attack == false then
        -- Attack1()
        if agresive == false then
            SetTween(RCW, {C0 = CF(0, -.75, 0)}, "Quad", "Out", .5)
            SetTween(LCW, {C0 = CF(0, -.75, 0)}, "Quad", "Out", .5)
            agresive = true
            so("3051417649", RightArm, 1.5, .8)
            so("3051417649", LeftArm, 1.5, .8)
        else
            SetTween(RCW, {C0 = CF(0, -0, 0)}, "Quad", "In", .5)
            SetTween(LCW, {C0 = CF(0, -0, 0)}, "Quad", "In", .5)
            agresive = false
            so("3051417791", RightArm, 1.5, .8)
            so("3051417791", LeftArm, 1.5, .8)
        end

    end
    if key == "r" and attack == false then

        attack = true
        local laying = true
        while laying == true do

            SetTween(RJW, {
                C0 = RootCF * CFrame.new(0, 0, -2.20) *
                    angles(math.rad(75), math.rad(5 * math.cos(sine / 8)),
                           math.rad(5 * math.cos(sine / 8)))
            }, "Linear", "InOut", 0.1)
            SetTween(NeckW, {
                C0 = NeckCF * CFrame.new(0, 0, 0) *
                    angles(math.rad(-40), math.rad(15 * math.sin(sine / 8)),
                           math.rad(0))
            }, "Linear", "InOut", 0.1)
            SetTween(RW, {
                C0 = CFrame.new(1.0, 0.5, -.4) *
                    angles(math.rad(160), math.rad(5 * math.cos(sine / 8)),
                           math.rad(-50 + 5 * math.cos(sine / 8)))
            }, "Linear", "Out", 0.1)
            SetTween(LW, {
                C0 = CFrame.new(-1.0, 0.5, -.4) *
                    angles(math.rad(160), math.rad(5 * math.cos(sine / 8)),
                           math.rad(40 + 5 * math.cos(sine / 8)))
            }, "Linear", "Out", 0.1)
            SetTween(RH, {
                C0 = CFrame.new(.5, -.9 - .1 * math.cos(sine / 8),
                                -.4 + .4 * math.cos(sine / 8)) *
                    angles(math.rad(-50 + 35 * math.cos(sine / 8)),
                           math.rad(5 * math.cos(sine / 8)),
                           math.rad(-15 * math.cos(sine / 8)))
            }, "Linear", "InOut", 0.1)
            SetTween(LH, {
                C0 = CFrame.new(-.5, -.9 + .1 * math.cos(sine / 8),
                                -.4 - .4 * math.cos(sine / 8)) *
                    angles(math.rad(-50 - 35 * math.cos(sine / 8)),
                           math.rad(5 * math.cos(sine / 8)),
                           math.rad(-15 * math.cos(sine / 8)))
            }, "Linear", "InOut", 0.1)

            SetTween(tailw, {
                C0 = CF(-.2 * math.cos(sine / 8), 0,
                        .30 + .15 * math.sin(sine / 4)) *
                    ANGLES(mr(80 + 10 * math.sin(sine / 4)),
                           mr(10 * math.cos(sine / 8)),
                           mr(10 - 30 * math.cos(sine / 8)))
            }, "Linear", "In", .1)
            Swait()
            if (Humanoid.MoveDirection * Vector3.new(1, 0, 1)).magnitude > .5 then
                laying = false
            end
        end

        attack = false

    end
    if key == "z" and attack == false then Attack1() end
    if key == "x" and attack == false then
        -- Attack2()
    end
    if key == "c" and attack == false then
        -- Attack3()
    end
    if key == "v" and attack == false then
        -- Attack4()
    end
    if key == "f" and attack == false then
        -- Attack5()
    end
    if key == "y" and attack == false then joke() end
    if key == "t" and attack == false then
        -- Tuant()
        attack = true

        SetTween(RJW, {
            C0 = RootCF * CFrame.new(0, 0, 0) *
                angles(math.rad(0), math.rad(0), math.rad(30))
        }, "Back", "Out", 0.3)
        SetTween(NeckW, {
            C0 = NeckCF * CFrame.new(0, 0, 0) *
                angles(math.rad(0), math.rad(0), math.rad(-30))
        }, "Back", "Out", 0.3)
        SetTween(RW, {
            C0 = CFrame.new(1.3, 0.5, -.0) *
                angles(math.rad(120), math.rad(0), math.rad(-40))
        }, "Back", "Out", 0.3)
        SetTween(LW, {
            C0 = CFrame.new(-1.5, 0.5, -.0) *
                angles(math.rad(0), math.rad(0), math.rad(0))
        }, "Back", "Out", 0.3)
        SetTween(RH, {
            C0 = CFrame.new(.5, -1, 0) *
                angles(math.rad(0), math.rad(0), math.rad(0))
        }, "Back", "Out", 0.3)
        SetTween(LH, {
            C0 = CFrame.new(-.5, -1, 0) *
                angles(math.rad(0), math.rad(0), math.rad(0))
        }, "Back", "Out", 0.3)
        Swait(.3 * 30)

        so("3051419970", Character, 4, .9)
        change = 4.3
        for i = 1, 4, 0.1 do

            SetTween(RJW, {
                C0 = RootCF * CFrame.new(0, 0, -.1 - .05 * math.cos(sine / 8)) *
                    angles(math.rad(1 + 1 * math.cos(sine / 8)), math.rad(0),
                           math.rad(30 + 1 * math.cos(sine / 8)))
            }, "Quad", "InOut", 0.1)
            SetTween(NeckW, {
                C0 = NeckCF * CFrame.new(0, 0, 0) *
                    angles(math.rad(0), math.rad(0),
                           math.rad(-30 + 1 * math.cos(sine / 8)))
            }, "Quad", "InOut", 0.1)
            SetTween(RW, {
                C0 = CFrame.new(1.3, 0.5, -.0) *
                    angles(math.rad(120), math.rad(0), math.rad(-40))
            }, "Quad", "InOut", 0.1)
            SetTween(LW, {
                C0 = CFrame.new(-1.5, 0.5, -.0) *
                    angles(math.rad(0), math.rad(0), math.rad(0))
            }, "Quad", "InOut", 0.1)
            SetTween(RH, {
                C0 = CFrame.new(.5, -.95 + .05 * math.cos(sine / 8),
                                -.2 + .05 * math.cos(sine / 8)) *
                    angles(math.rad(-10 + 1 * math.cos(sine / 8)),
                           math.rad(25 * math.cos(sine / 16)), math.rad(0))
            }, "Quad", "InOut", 0.1)
            SetTween(LH, {
                C0 = CFrame.new(-.5, -.95 + .05 * math.cos(sine / 8), 0) *
                    angles(math.rad(1 + 1 * math.cos(sine / 8)), math.rad(0),
                           math.rad(0))
            }, "Quad", "InOut", 0.1)
            Swait()
        end
        attack = false
    end
    if key == "g" and gpressed == true and reap == true then gpressed = false end
    if key == "g" and attack == false and reap == false and pantdown == true then
        attack = true
        gpressed = true
        local target = mouse.Target
        if target.Parent ~= nil then
            local find = target.Parent:FindFirstChild("HumanoidRootPart")
            local find2 = target.Parent:FindFirstChildOfClass("Humanoid")
            if find == nil then
                find = target.Parent:FindFirstChild("Torso")
            end
            if find == nil or find2 == nil then attack = false end
            if find ~= nil and find2 ~= nil then
                local root = find
                local beforecframeroot = root.CFrame
                local beforecframe = RootPart.CFrame
                local hum = find2
                root.CFrame = root.CFrame * CFrame.new(0, -2.5, 0) *
                                  angles(math.rad(90), 0, 0)
                local Poof = Instance.new("Part")
                local ParticleEmitter1 = Instance.new("ParticleEmitter")
                Poof.Parent = Player.Character
                Poof.CFrame = CFrame.new(51.1425285, 1.88000441, -7.34444237, 1,
                                         0, 0, 0, 1, 0, 0, 0, 1)
                Poof.Position = Vector3.new(51.1425285, 1.88000441, -7.34444237)
                Poof.Transparency = 1
                Poof.Size = Vector3.new(5.54000139, 3.71999788, 4.06999826)
                Poof.BottomSurface = Enum.SurfaceType.Smooth
                Poof.TopSurface = Enum.SurfaceType.Smooth
                Poof.CanCollide = false
                Poof.Anchored = true
                ParticleEmitter1.Parent = Poof
                ParticleEmitter1.Speed = NumberRange.new(0.5, 0.5)
                ParticleEmitter1.Rotation = NumberRange.new(0, 360)
                ParticleEmitter1.Enabled = true
                ParticleEmitter1.Texture = "rbxassetid://244221440"
                ParticleEmitter1.Transparency =
                    NumberSequence.new(0.89999997615814, 0.89999997615814)
                ParticleEmitter1.ZOffset = 5
                ParticleEmitter1.Size = NumberSequence.new(3.7200000286102,
                                                           3.7200000286102)
                ParticleEmitter1.Acceleration = Vector3.new(0, 1, 0)
                ParticleEmitter1.Lifetime =
                    NumberRange.new(0.10000000149012, 0.20000000298023)
                ParticleEmitter1.Rate = 20000
                ParticleEmitter1.RotSpeed = NumberRange.new(-30, 30)
                ParticleEmitter1.SpreadAngle = Vector2.new(360, 360)
                ParticleEmitter1.VelocitySpread = 360
                Poof.CFrame = root.CFrame * CFrame.Angles(0, 0, math.rad(90))
                Poof.CFrame = Poof.CFrame * CFrame.new(0, 0, -2)
                RootPart.Anchored = true
                RootPart.CFrame = root.CFrame * CFrame.new(0, -0.2, 0) *
                                      angles(math.rad(-90), 0, 0)
                RootPart.CFrame = RootPart.CFrame * CFrame.new(0, 1.5, 0) *
                                      angles(0, math.rad(180), 0)
                coroutine.resume(coroutine.create(
                                     function()
                        wait(0.3)
                        ParticleEmitter1.Enabled = false
                    end))
                local D = Instance.new("Model")
                local Part1 = Instance.new("Part")
                local SpecialMesh2 = Instance.new("SpecialMesh")
                local Weld3 = Instance.new("Weld")
                local Part4 = Instance.new("Part")
                local Weld5 = Instance.new("Weld")
                local Part6 = Instance.new("Part")
                local Weld7 = Instance.new("Weld")
                D.Name = "D"
                D.Parent = target.Parent
                Part1.Parent = D
                Part1.CFrame = CFrame.new(60.5641861, 1.69272184, -20.9960651,
                                          0.000150388281, 0.0221676175,
                                          0.999754369, -1.6669499e-05,
                                          0.999754369, -0.0221676137, -1,
                                          -1.33316544e-05, 0.000150720865)
                Part1.Orientation = Vector3.new(1.26999998, 89.9899979, 0)
                Part1.Position =
                    Vector3.new(60.5641861, 1.69272184, -20.9960651)
                Part1.Rotation =
                    Vector3.new(89.6100006, 88.7300034, -89.6100006)
                Part1.Color = Color3.new(0.745098, 0.407843, 0.384314)
                Part1.Size = Vector3.new(0.0600000024, 0.950895786, 0.220896259)
                Part1.BottomSurface = Enum.SurfaceType.Smooth
                Part1.BrickColor = BrickColor.new("Terra Cotta")
                Part1.CanCollide = false
                Part1.Material = Enum.Material.SmoothPlastic
                Part1.TopSurface = Enum.SurfaceType.Smooth
                Part1.brickColor = BrickColor.new("Terra Cotta")
                SpecialMesh2.Parent = Part1
                SpecialMesh2.Scale = Vector3.new(0.910000026, 0.300000012,
                                                 0.910000026)
                SpecialMesh2.MeshType = Enum.MeshType.Sphere
                Weld3.Name = "Part"
                Weld3.Parent = Part1
                Weld3.C0 = CFrame.new(-5.7220459e-05, -0.414992213,
                                      3.05175781e-05, 3.20026317e-07, -1,
                                      5.29796484e-11, -1, -3.20026317e-07,
                                      -1.69109037e-15, 1.70804522e-15,
                                      -5.29796484e-11, -1)
                Weld3.Part0 = Part1
                Weld3.Part1 = Part6
                Weld3.part1 = Part6
                Part4.Parent = D
                Part4.CFrame = CFrame.new(60.5637436, 1.67272615, -20.9960651,
                                          0.999754369, 0.0221676175,
                                          -0.000150395441, -0.0221676137,
                                          0.999754369, 1.63495533e-05,
                                          0.000150720924, -1.30116277e-05, 1)
                Part4.Orientation = Vector3.new(0, -0.00999999978, -1.26999998)
                Part4.Position =
                    Vector3.new(60.5637436, 1.67272615, -20.9960651)
                Part4.Rotation = Vector3.new(0, -0.00999999978, -1.26999998)
                Part4.Color = Color3.new(1, 0.580392, 0.580392)
                Part4.Size = Vector3.new(0.310000956, 0.310000956, 0.310000956)
                Part4.BottomSurface = Enum.SurfaceType.Smooth
                Part4.BrickColor = BrickColor.new("Salmon")
                Part4.Material = Enum.Material.SmoothPlastic
                Part4.TopSurface = Enum.SurfaceType.Smooth
                Part4.brickColor = BrickColor.new("Salmon")
                Part4.Shape = Enum.PartType.Ball
                Part4.CanCollide = false
                Weld5.Name = "Part"
                Weld5.Parent = Part4
                Weld5.C0 = CFrame.new(2.67028809e-05, -0.394991755,
                                      5.7220459e-05, -3.47415857e-23, 0, -1, -1,
                                      0, -3.47415857e-23, 0, 1, 0)
                Weld5.Part0 = Part4
                Weld5.Part1 = Part6
                Weld5.part1 = Part6
                Part6.Parent = D
                Part6.CFrame = CFrame.new(60.5550156, 1.27783084, -20.9960022,
                                          -0.0221676175, -0.000150395441,
                                          -0.999754369, -0.999754369,
                                          1.63495533e-05, 0.0221676137,
                                          1.30116277e-05, 1, -0.000150720924)
                Part6.Orientation = Vector3.new(-1.26999998, -90.0100021, -90)
                Part6.Position =
                    Vector3.new(60.5550156, 1.27783084, -20.9960022)
                Part6.Rotation = Vector3.new(-90.3899994, -88.7300034,
                                             179.610001)
                Part6.Color = Color3.new(1, 0.8, 0.6)
                Part6.Size = Vector3.new(0.789999664, 0.315000653, 0.315000653)
                Part6.BottomSurface = Enum.SurfaceType.Smooth
                Part6.BrickColor = BrickColor.new("Pastel brown")
                Part6.Material = Enum.Material.SmoothPlastic
                Part6.TopSurface = Enum.SurfaceType.Smooth
                Part6.brickColor = BrickColor.new("Pastel brown")
                Part6.Shape = Enum.PartType.Cylinder
                if root.Name == "Torso" then
                    Part6.BrickColor = root.BrickColor
                elseif root.Name ~= "Torso" then
                    local bodycolors = root.Parent:FindFirstChildOfClass(
                                           "BodyColors")
                    if bodycolors ~= nil then
                        Part6.BrickColor = bodycolors.TorsoColor
                    end
                end
                Part6.CanCollide = false
                Weld7.Name = "Torso"
                Weld7.Parent = Part6
                Weld7.C0 = CFrame.new(0.749751091, -0.000104904175, -1.27482605,
                                      -1.30116277e-05, -0.0221676175,
                                      0.999754369, -1, -0.000150395441,
                                      -1.63495533e-05, 0.000150720924,
                                      -0.999754369, -0.0221676137)
                Weld7.Part0 = Part6
                Weld7.Part1 = root
                Weld7.part1 = root
                wait(0.2)
                for i = 0, 0.1, 0.1 do
                    SetTween(NeckW, {C0 = NeckCF}, "Quad", "InOut", 0.1)
                end
                local times = 0
                reap = true
                repeat
                    times = times + 1
                    for i = 0, 0.8, 0.1 do
                        SetTween(RJW, {
                            C0 = CFrame.fromEulerAnglesXYZ(-2.9, 0, 3.14)
                        }, "Quad", "InOut", 0.1)
                        SetTween(LH, {
                            C0 = CFrame.new(-.5, -.95 + .05, 0) *
                                angles(math.rad(30), 0, math.rad(-25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(RH, {
                            C0 = CFrame.new(.5, -.95 + .05, 0) *
                                angles(math.rad(30), 0, math.rad(25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(LW, {
                            C0 = CFrame.new(-1.5, 0.4, -.0) *
                                angles(math.rad(90), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        SetTween(RW, {
                            C0 = CFrame.new(1.5, 0.4, -.0) *
                                angles(math.rad(90), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        Swait()
                    end
                    for i = 0, 0.8, 0.1 do
                        SetTween(RJW, {
                            C0 = CFrame.fromEulerAnglesXYZ(-3.05, 0, 3.14)
                        }, "Quad", "InOut", 0.1)
                        SetTween(LH, {
                            C0 = CFrame.new(-.5, -.95 + .05, 0) *
                                angles(math.rad(45), 0, math.rad(-25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(RH, {
                            C0 = CFrame.new(.5, -.95 + .05, 0) *
                                angles(math.rad(45), 0, math.rad(25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(LW, {
                            C0 = CFrame.new(-1.5, 0.4, -.0) *
                                angles(math.rad(100), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        SetTween(RW, {
                            C0 = CFrame.new(1.5, 0.4, -.0) *
                                angles(math.rad(100), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        Swait()
                    end
                    local sound = CreateSound2("836796971", Torso, 10, 1, false)
                    game:GetService("Debris"):AddItem(sound, 2)
                    wait(0.5)
                until times > 20 or gpressed == false
                repeat
                    times = times + 1
                    for i = 0, 0.5, 0.1 do
                        SetTween(RJW, {
                            C0 = CFrame.fromEulerAnglesXYZ(-2.9, 0, 3.14)
                        }, "Quad", "InOut", 0.1)
                        SetTween(LH, {
                            C0 = CFrame.new(-.5, -.95 + .05, 0) *
                                angles(math.rad(30), 0, math.rad(-25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(RH, {
                            C0 = CFrame.new(.5, -.95 + .05, 0) *
                                angles(math.rad(30), 0, math.rad(25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(LW, {
                            C0 = CFrame.new(-1.5, 0.4, -.0) *
                                angles(math.rad(90), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        SetTween(RW, {
                            C0 = CFrame.new(1.5, 0.4, -.0) *
                                angles(math.rad(90), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        Swait()
                    end
                    local sound = CreateSound2("836796971", Torso, 10, 1, false)
                    game:GetService("Debris"):AddItem(sound, 2)
                    for i = 0, 0.5, 0.1 do
                        SetTween(RJW, {
                            C0 = CFrame.fromEulerAnglesXYZ(-3.05, 0, 3.14)
                        }, "Quad", "InOut", 0.1)
                        SetTween(LH, {
                            C0 = CFrame.new(-.5, -.95 + .05, 0) *
                                angles(math.rad(45), 0, math.rad(-25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(RH, {
                            C0 = CFrame.new(.5, -.95 + .05, 0) *
                                angles(math.rad(45), 0, math.rad(25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(LW, {
                            C0 = CFrame.new(-1.5, 0.4, -.0) *
                                angles(math.rad(100), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        SetTween(RW, {
                            C0 = CFrame.new(1.5, 0.4, -.0) *
                                angles(math.rad(100), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        Swait()
                    end
                    wait(0.2)
                until times > 35 or gpressed == false
                repeat
                    wait()
                    for i = 0, 0.4, 0.1 do
                        SetTween(RJW,
                                 {C0 = CFrame.fromEulerAnglesXYZ(-3, 0, 3.14)},
                                 "Quad", "InOut", 0.1)
                        SetTween(LH, {
                            C0 = CFrame.new(-.5, -.95 + .05, 0) *
                                angles(math.rad(35), 0, math.rad(-25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(RH, {
                            C0 = CFrame.new(.5, -.95 + .05, 0) *
                                angles(math.rad(35), 0, math.rad(25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(LW, {
                            C0 = CFrame.new(-1.5, 0.4, -.0) *
                                angles(math.rad(90), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        SetTween(RW, {
                            C0 = CFrame.new(1.5, 0.4, -.0) *
                                angles(math.rad(90), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        Swait()
                    end
                    local sound = CreateSound2("836796971", Torso, 10, 1, false)
                    game:GetService("Debris"):AddItem(sound, 5)
                    for i = 0, 0.4, 0.1 do
                        SetTween(RJW, {
                            C0 = CFrame.fromEulerAnglesXYZ(-2.7, 0, 3.14)
                        }, "Quad", "InOut", 0.1)
                        SetTween(LH, {
                            C0 = CFrame.new(-.5, -.95 + .05, 0) *
                                angles(math.rad(10), 0, math.rad(-25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(RH, {
                            C0 = CFrame.new(.5, -.95 + .05, 0) *
                                angles(math.rad(10), 0, math.rad(25))
                        }, "Quad", "InOut", 0.1)
                        SetTween(LW, {
                            C0 = CFrame.new(-1.5, 0.4, -.0) *
                                angles(math.rad(75), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        SetTween(RW, {
                            C0 = CFrame.new(1.5, 0.4, -.0) *
                                angles(math.rad(75), 0, 0)
                        }, "Quad", "InOut", 0.1)
                        Swait()
                    end
                    wait(0.1)
                until gpressed == false
                for i = 0, 0.4, 0.1 do
                    SetTween(RJW, {C0 = CFrame.fromEulerAnglesXYZ(-3, 0, 3.14)},
                             "Quad", "InOut", 0.1)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -.95 + .05, 0) *
                            angles(math.rad(35), 0, math.rad(-25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -.95 + .05, 0) *
                            angles(math.rad(35), 0, math.rad(25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(LW, {
                        C0 = CFrame.new(-1.5, 0.4, -.0) *
                            angles(math.rad(90), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    SetTween(RW, {
                        C0 = CFrame.new(1.5, 0.4, -.0) *
                            angles(math.rad(90), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    Swait()
                end
                wait(0.5)
                for i = 0, 0.4, 0.1 do
                    SetTween(RJW,
                             {C0 = CFrame.fromEulerAnglesXYZ(-2.65, 0, 3.14)},
                             "Quad", "InOut", 0.1)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -.95 + .05, 0) *
                            angles(math.rad(8), 0, math.rad(-25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -.95 + .05, 0) *
                            angles(math.rad(8), 0, math.rad(25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(LW, {
                        C0 = CFrame.new(-1.5, 0.4, -.0) *
                            angles(math.rad(72), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    SetTween(RW, {
                        C0 = CFrame.new(1.5, 0.4, -.0) *
                            angles(math.rad(72), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    Swait()
                end
                local sound = CreateSound2("1430568042", Torso, 10, 1, false)
                game:GetService("Debris"):AddItem(sound, 5)
                wait(0.5)
                for i = 0, 0.4, 0.1 do
                    SetTween(RJW, {C0 = CFrame.fromEulerAnglesXYZ(-3, 0, 3.14)},
                             "Quad", "InOut", 0.1)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -.95 + .05, 0) *
                            angles(math.rad(35), 0, math.rad(-25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -.95 + .05, 0) *
                            angles(math.rad(35), 0, math.rad(25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(LW, {
                        C0 = CFrame.new(-1.5, 0.4, -.0) *
                            angles(math.rad(90), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    SetTween(RW, {
                        C0 = CFrame.new(1.5, 0.4, -.0) *
                            angles(math.rad(90), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    Swait()
                end
                wait(0.5)
                for i = 0, 0.4, 0.1 do
                    SetTween(RJW,
                             {C0 = CFrame.fromEulerAnglesXYZ(-2.65, 0, 3.14)},
                             "Quad", "InOut", 0.1)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -.95 + .05, 0) *
                            angles(math.rad(8), 0, math.rad(-25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -.95 + .05, 0) *
                            angles(math.rad(8), 0, math.rad(25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(LW, {
                        C0 = CFrame.new(-1.5, 0.4, -.0) *
                            angles(math.rad(72), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    SetTween(RW, {
                        C0 = CFrame.new(1.5, 0.4, -.0) *
                            angles(math.rad(72), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    Swait()
                end
                local sound = CreateSound2("1430568042", Torso, 10, 1, false)
                game:GetService("Debris"):AddItem(sound, 5)
                wait(0.5)
                for i = 0, 0.4, 0.1 do
                    SetTween(RJW, {C0 = CFrame.fromEulerAnglesXYZ(-3, 0, 3.14)},
                             "Quad", "InOut", 0.1)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -.95 + .05, 0) *
                            angles(math.rad(35), 0, math.rad(-25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -.95 + .05, 0) *
                            angles(math.rad(35), 0, math.rad(25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(LW, {
                        C0 = CFrame.new(-1.5, 0.4, -.0) *
                            angles(math.rad(90), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    SetTween(RW, {
                        C0 = CFrame.new(1.5, 0.4, -.0) *
                            angles(math.rad(90), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    Swait()
                end
                wait(0.5)
                for i = 0, 0.4, 0.1 do
                    SetTween(RJW,
                             {C0 = CFrame.fromEulerAnglesXYZ(-2.65, 0, 3.14)},
                             "Quad", "InOut", 0.1)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -.95 + .05, 0) *
                            angles(math.rad(8), 0, math.rad(-25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -.95 + .05, 0) *
                            angles(math.rad(8), 0, math.rad(25))
                    }, "Quad", "InOut", 0.1)
                    SetTween(LW, {
                        C0 = CFrame.new(-1.5, 0.4, -.0) *
                            angles(math.rad(72), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    SetTween(RW, {
                        C0 = CFrame.new(1.5, 0.4, -.0) *
                            angles(math.rad(72), 0, 0)
                    }, "Quad", "InOut", 0.1)
                    Swait()
                end
                local sound = CreateSound2("1430568042", Torso, 10, 1, false)
                game:GetService("Debris"):AddItem(sound, 5)
                wait(0.5)
                attack = false
                ParticleEmitter1.Enabled = true
                RootPart.CFrame = beforecframe
                RootPart.Anchored = false
                coroutine.resume(coroutine.create(
                                     function()
                        wait(0.3)
                        ParticleEmitter1.Enabled = false
                        game:GetService("Debris"):AddItem(ParticleEmitter1, 2)
                    end))
                D:Destroy()
                root.CFrame = beforecframeroot
                root.Anchored = false
                reap = false
            end
        end
    end
    if key == "c" and pant == false and attack == false and pantdown == false then
        attack = true
        RootPart.Anchored = true
        pant = true
        pantdown = true
        local rdup = Part38:Clone()
        local ldup = Part36:Clone()
        rdup.Parent = Player.Character
        ldup.Parent = Player.Character
        rdup.Name = "pantdownr"
        ldup.Name = "pantdownl"
        local blush = Instance.new("Decal", Character.Head)
        blush.Name = "blush"
        blush.Texture = "rbxassetid://3523974768"
        Part36.Transparency = 1
        Part38.Transparency = 1
        local Beam0 = Instance.new("Beam")
        local RightAttachment = Instance.new("Attachment")
        RightAttachment.Position = Vector3.new(0.353, 0.014, -0.014)
        RightAttachment.Orientation = Vector3.new(87.866, 90.001, 87.691)
        RightAttachment.Parent = rdup
        local LeftAttachment = Instance.new("Attachment")
        LeftAttachment.Position = Vector3.new(-0.356, 0.014, -0.013)
        LeftAttachment.Orientation = Vector3.new(87.871, 90.002, 87.691)
        LeftAttachment.Parent = ldup
        Beam0.Parent = Player.Character
        Beam0.Attachment0 = RightAttachment
        Beam0.Attachment1 = LeftAttachment
        Beam0.Color =
            ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0))
        Beam0.LightInfluence = 1
        Beam0.Transparency = NumberSequence.new(0, 0)
        local Weld37 = ldup["Left Leg"]
        local Weld39 = rdup["Right Leg"]
        for i = 0, 0.3, 0.1 do
            SetTween(RJW, {C0 = CFrame.fromEulerAnglesXYZ(-1.57, 0, 2.8)},
                     "Quad", "InOut", 0.1)
            SetTween(LH, {
                C0 = CFrame.new(-.5, -.95 + .05, 0) * angles(0, 0, math.rad(-5))
            }, "Quad", "InOut", 0.1)
            SetTween(RH, {
                C0 = CFrame.new(.5, -.95 + .05, 0) * angles(0, 0, math.rad(5))
            }, "Quad", "InOut", 0.1)
            SetTween(LW, {
                C0 = CFrame.new(-1.5, 0.4, -.0) * angles(0, 0, math.rad(10))
            }, "Quad", "InOut", 0.1)
            SetTween(RW, {
                C0 = CFrame.new(1.5, 0.4, -.0) * angles(0, 0, math.rad(-10))
            }, "Quad", "InOut", 0.1)
            Swait()
        end
        for i = 0, 0.3, 0.1 do
            SetTween(RJW, {
                C0 = CFrame.fromEulerAnglesXYZ(-1.57, 0, 2.8) *
                    CFrame.new(0, 0, -0.1) *
                    angles(math.rad(20), math.rad(0), math.rad(0))
            }, "Quad", "InOut", 0.1)
            SetTween(LH, {
                C0 = CFrame.new(-.5, -.95 + .05, 0) *
                    angles(math.rad(20), 0, math.rad(-5))
            }, "Quad", "InOut", 0.1)
            SetTween(RH, {
                C0 = CFrame.new(.5, -.95 + .05, 0) *
                    angles(math.rad(20), 0, math.rad(5))
            }, "Quad", "InOut", 0.1)
            SetTween(LW, {
                C0 = CFrame.new(-1.5, 0.4, -.0) * angles(0, 0, math.rad(10))
            }, "Quad", "InOut", 0.1)
            SetTween(RW, {
                C0 = CFrame.new(1.5, 0.4, -.0) * angles(0, 0, math.rad(-10))
            }, "Quad", "InOut", 0.1)
            Swait()
        end
        local first = true
        for i = 0, 0.6, 0.1 do
            SetTween(RJW, {
                C0 = CFrame.fromEulerAnglesXYZ(-1.57, 0, 2.8) *
                    CFrame.new(0, 0, -0.3) *
                    angles(math.rad(40), math.rad(0), math.rad(0))
            }, "Quad", "InOut", 0.1)
            SetTween(LH, {
                C0 = CFrame.new(-.5, -.95 + .05, 0) *
                    angles(math.rad(40), 0, math.rad(-5))
            }, "Quad", "InOut", 0.1)
            SetTween(RH, {
                C0 = CFrame.new(.5, -.95 + .05, 0) *
                    angles(math.rad(40), 0, math.rad(5))
            }, "Quad", "InOut", 0.1)
            SetTween(LW, {
                C0 = CFrame.new(-1.5, 0.4, 0.2) *
                    angles(math.rad(30), 0, math.rad(10))
            }, "Quad", "InOut", 0.1)
            SetTween(RW, {
                C0 = CFrame.new(1.5, 0.4, 0.2) *
                    angles(math.rad(30), 0, math.rad(-10))
            }, "Quad", "InOut", 0.1)
            SetTween(Weld37, {C0 = CFrame.new(0, -0.6, 0)}, "Quad", "InOut", 0.1)
            SetTween(Weld39, {C0 = CFrame.new(0, -0.6, 0)}, "Quad", "InOut", 0.1)
            if first == true then first = false end
            Swait()
        end
        for i = 0, 1, 0.1 do
            SetTween(LW, {
                C0 = CFrame.new(-1.5, 0, 0) *
                    angles(math.rad(30), 0, math.rad(10))
            }, "Quad", "InOut", 0.1)
            SetTween(RW, {
                C0 = CFrame.new(1.5, 0, 0) *
                    angles(math.rad(30), 0, math.rad(-10))
            }, "Quad", "InOut", 0.1)
            SetTween(Weld37, {C0 = CFrame.new(0, 0.8, 0)}, "Quad", "InOut", 0.1)
            SetTween(Weld39, {C0 = CFrame.new(0, 0.8, 0)}, "Quad", "InOut", 0.1)
            Swait()
        end
        local pants = Player.Character:WaitForChild("Pants")
        pants.PantsTemplate = "rbxassetid://0"
        Weld37:Destroy()
        Weld39:Destroy()
        rdup.CanCollide = true
        ldup.CanCollide = true
        local Weld = Instance.new("Weld")
        Weld.Name = "Left"
        Weld.Parent = Player.Character
        Weld.C0 = CFrame.new(1.50121498, -1.66893005e-05, -0.00495427847, 1, 0,
                             0, 0, 1, 0, 0, 0, 1)
        Weld.Part0 = ldup
        Weld.Part1 = rdup
        RootPart.Anchored = false
        attack = false
        pant = false
    elseif key == "c" and attack == false and pantdown == true then
        pant = true
        pantdown = false
        local ParticleEmitter0 = Instance.new("ParticleEmitter")
        ParticleEmitter0.Parent = Part36
        ParticleEmitter0.Speed = NumberRange.new(0.5, 0.5)
        ParticleEmitter0.Rotation = NumberRange.new(0, 360)
        ParticleEmitter0.Enabled = true
        ParticleEmitter0.Texture = "rbxassetid://244221440"
        ParticleEmitter0.Transparency = NumberSequence.new(0.89999997615814,
                                                           0.89999997615814)
        ParticleEmitter0.ZOffset = 5
        ParticleEmitter0.Acceleration = Vector3.new(0, 1, 0)
        ParticleEmitter0.Lifetime = NumberRange.new(0.10000000149012,
                                                    0.20000000298023)
        ParticleEmitter0.Rate = 20000
        ParticleEmitter0.RotSpeed = NumberRange.new(-30, 30)
        ParticleEmitter0.SpreadAngle = Vector2.new(360, 360)
        ParticleEmitter0.VelocitySpread = 360
        local ParticleEmitter1 = Instance.new("ParticleEmitter")
        ParticleEmitter1.Parent = Part38
        ParticleEmitter1.Speed = NumberRange.new(0.5, 0.5)
        ParticleEmitter1.Rotation = NumberRange.new(0, 360)
        ParticleEmitter1.Enabled = true
        ParticleEmitter1.Texture = "rbxassetid://244221440"
        ParticleEmitter1.Transparency = NumberSequence.new(0.89999997615814,
                                                           0.89999997615814)
        ParticleEmitter1.ZOffset = 5
        ParticleEmitter1.Acceleration = Vector3.new(0, 1, 0)
        ParticleEmitter1.Lifetime = NumberRange.new(0.10000000149012,
                                                    0.20000000298023)
        ParticleEmitter1.Rate = 20000
        ParticleEmitter1.RotSpeed = NumberRange.new(-30, 30)
        ParticleEmitter1.SpreadAngle = Vector2.new(360, 360)
        ParticleEmitter1.VelocitySpread = 360
        Part36.Transparency = 0
        Part38.Transparency = 0
        Character.Head.blush:Destroy()
        for i, v in pairs(Player.Character:GetChildren()) do
            if v.Name == "pantdownl" or v.Name == "pantdownr" then
                local ParticleEmitter3 = Instance.new("ParticleEmitter")
                ParticleEmitter3.Parent = v
                ParticleEmitter3.Speed = NumberRange.new(0.5, 0.5)
                ParticleEmitter3.Rotation = NumberRange.new(0, 360)
                ParticleEmitter3.Enabled = true
                ParticleEmitter3.Texture = "rbxassetid://244221440"
                ParticleEmitter3.Transparency =
                    NumberSequence.new(0.89999997615814, 0.89999997615814)
                ParticleEmitter3.ZOffset = 5
                ParticleEmitter3.Acceleration = Vector3.new(0, 1, 0)
                ParticleEmitter3.Lifetime =
                    NumberRange.new(0.10000000149012, 0.20000000298023)
                ParticleEmitter3.Rate = 20000
                ParticleEmitter3.RotSpeed = NumberRange.new(-30, 30)
                ParticleEmitter3.SpreadAngle = Vector2.new(360, 360)
                ParticleEmitter3.VelocitySpread = 360
                v.Transparency = 1
                v.Anchored = true
                v.CanCollide = false
                coroutine.resume(coroutine.create(
                                     function()
                        wait(0.2)
                        ParticleEmitter3.Enabled = false
                        game:GetService("Debris"):AddItem(v, 2)
                    end))
            elseif v:IsA("Beam") then
                game:GetService("Debris"):AddItem(v, 0.2)
            end
        end
        local pants = Player.Character:WaitForChild("Pants")
        pants.PantsTemplate = "rbxassetid://3548530993"
        wait(0.2)
        ParticleEmitter0.Enabled = false
        ParticleEmitter1.Enabled = false
        game:GetService("Debris"):AddItem(ParticleEmitter0, 2)
        game:GetService("Debris"):AddItem(ParticleEmitter1, 2)
        pant = false
    end
    if key == "p" and attack == false and Player.Name == "Yarin111" then
        if mememode == false then
            mememode = true

            -- so("1499015636", Character,3, 1)
            lastid = "http://www.roblox.com/asset/?id=876542935"

            lastsongpos = 0
            s2.TimePosition = lastsongpos

        else
            mememode = false
            CurId = CurId - 1
            KeyDownF("n")

        end
    end

    if key == "0" then if isruning == false then isruning = true end end

    if key == "m" then

        if playsong == true then
            playsong = false
            s2:stop()
        elseif playsong == false then
            playsong = true

            s2:play()
        end

    end

    if key == "n" and mememode == false then

        CurId = CurId + 1

        if CurId > 5 then CurId = 1 end
        warn("now playing song Nr" .. CurId)
        if CurId == 1 then
            lastid = "http://www.roblox.com/asset/?id=876316256"
        elseif CurId == 2 then
            lastid = "http://www.roblox.com/asset/?id=1134656111"
        elseif CurId == 3 then
            lastid = "http://www.roblox.com/asset/?id=1021627251"
        elseif CurId == 4 then
            lastid = "http://www.roblox.com/asset/?id=224845627"
        elseif CurId == 5 then
            lastid = "http://www.roblox.com/asset/?id=3060405736"
        end
        lastsongpos = 0
        s2.TimePosition = lastsongpos
    end
end

Humanoid.DisplayDistanceType = "None"

coroutine.resume(coroutine.create(function()
    while Humanoid.Health > 0.001 do
        sine = sine + change
        hitfloor = rayCast(RootPart.Position,
                           CFrame.new(RootPart.Position,
                                      RootPart.Position - Vector3.new(0, 1, 0))
                               .lookVector, 4, Character)
        if Character:FindFirstChild("Sound") then
            Character:FindFirstChild("Sound"):Destroy()
        end
        local torvel = (Humanoid.MoveDirection * Vector3.new(1, 0, 1)).magnitude
        local velderp = RootPart.Velocity.y
        if RootPart.Velocity.y > 1 and hitfloor == nil then
            Anim = "Jump"

        elseif RootPart.Velocity.y < -1 and hitfloor == nil then
            Anim = "Fall"
        elseif Humanoid.Sit == true then
            Anim = "Sit"
        elseif torvel < .5 and hitfloor ~= nil then
            Anim = "Idle"
        elseif torvel > .5 and hitfloor ~= nil then

            Anim = "Walk"

        else
            Anim = ""

        end

        local Ccf = RootPart.CFrame
        -- warn(Humanoid.MoveDirection*RootPart.CFrame.lookVector)
        local Walktest1 = Humanoid.MoveDirection * Ccf.LookVector
        local Walktest2 = Humanoid.MoveDirection * Ccf.RightVector
        -- warn(Walktest1.Z.."/"..Walktest1.X)
        -- warn(Walktest2.Z.."/"..Walktest2.X)
        forWFB = Walktest1.X + Walktest1.Z
        forWRL = Walktest2.X + Walktest2.Z

        -- print(Humanoid.MoveDirection)
        -- warn(Torso.CFrame.lookVector)

        coroutine.resume(coroutine.create(
                             function()
                if s2.Parent == nil or s2 == nil then

                    s2 = s2c:Clone()
                    s2.Parent = Torso
                    s2.Name = "BGMusic"
                    --	s2.SoundId = lastid
                    s2.Pitch = 1
                    s2.Volume = 1.5
                    s2.Looped = true
                    s2.archivable = false
                    s2.TimePosition = lastsongpos
                    if playsong == true then
                        s2:play()
                    elseif playsong == false then
                        s2:stop()
                    end

                else
                    lastsongpos = s2.TimePosition
                    s2.Pitch = 1

                    s2.Volume = 1.5

                    s2.Looped = true
                    s2.SoundId = lastid
                    s2.EmitterSize = 30
                end

            end))

        inairvel = torvel * 1

        -- forWRL
        if inairvel > 30 then inairvel = 30 end
        inairvel = inairvel / 50 * 2

        if attack == false then
            if Anim == "Jump" then
                change = 0.60 * 2
                SetTween(RJW, {
                    C0 = RootCF *
                        cn(0, 0 + (0.0395 / 2) * math.cos(sine / 8),
                           -0.1 + 0.0395 * math.cos(sine / 8)) *
                        angles(math.rad(-6.5 - 1.5 * math.cos(sine / 8)) +
                                   (inairvel * forWFB) / 2,
                               math.rad(0) - (inairvel * forWRL) / 2,
                               math.rad(0))
                }, "Quad", "Out", 0.25)
                SetTween(NeckW, {
                    C0 = NeckCF * CFrame.new(0, 0, 0) *
                        angles(math.rad(-26.5 + 2.5 * math.cos(sine / 8)),
                               math.rad(0), math.rad(-0))
                }, "Quad", "Out", 0.25)
                SetTween(RW, {
                    C0 = cf(1.4 + .05 * math.cos(sine / 8),
                            0.5 + .05 * math.cos(sine / 8), .0) *
                        angles(math.rad(140 - 2 * math.cos(sine / 8)),
                               math.rad(-5),
                               math.rad(8 + 4 * math.cos(sine / 8)))
                }, "Quad", "Out", 0.2)
                SetTween(LW, {
                    C0 = cf(-1.4 + .05 * math.cos(sine / 8),
                            0.5 + .05 * math.cos(sine / 8), .0) *
                        angles(math.rad(140 - 2 * math.cos(sine / 8)),
                               math.rad(5),
                               math.rad(-8 - 4 * math.cos(sine / 8)))
                }, "Quad", "Out", 0.2)
                SetTween(RH, {
                    C0 = CFrame.new(.5, -0.85 + .05 * math.cos(sine / 15), -.2) *
                        CFrame.Angles(math.rad(-15 - 1 * math.cos(sine / 10)),
                                      math.rad(0), math.rad(0))
                }, "Quad", "InOut", 0.075)
                SetTween(LH, {
                    C0 = CFrame.new(-.5, -0.35 + .05 * math.cos(sine / 15), -.4) *
                        CFrame.Angles(math.rad(-25 + 1 * math.cos(sine / 10)),
                                      math.rad(0), math.rad(0))
                }, "Quad", "InOut", 0.075)

            elseif Anim == "Fall" then
                change = 0.60 * 2
                SetTween(RJW, {
                    C0 = RootCF *
                        cn(0, 0 + (0.0395 / 2) * math.cos(sine / 8),
                           -0.5 + 0.0395 * math.cos(sine / 8)) *
                        angles(math.rad(5.5 - 1.5 * math.cos(sine / 8)) -
                                   (inairvel * forWFB) / 2,
                               math.rad(0) + (inairvel * forWRL) / 2,
                               math.rad(0))
                }, "Quad", "Out", 0.35)
                SetTween(NeckW, {
                    C0 = NeckCF * CFrame.new(0, 0, 0) *
                        angles(math.rad(26.5 + 2.5 * math.cos(sine / 8)),
                               math.rad(0), math.rad(-0))
                }, "Quad", "Out", 0.25)
                SetTween(RW, {
                    C0 = cf(1.4 + .05 * math.cos(sine / 8),
                            0.5 + .05 * math.cos(sine / 8), .0) *
                        angles(math.rad(105 - 2 * math.cos(sine / 8)),
                               math.rad(-15),
                               math.rad(80 + 4 * math.cos(sine / 8)))
                }, "Quad", "Out", 0.2)
                SetTween(LW, {
                    C0 = cf(-1.4 + .05 * math.cos(sine / 8),
                            0.5 + .05 * math.cos(sine / 8), .0) *
                        angles(math.rad(105 - 2 * math.cos(sine / 8)),
                               math.rad(15),
                               math.rad(-80 - 4 * math.cos(sine / 8)))
                }, "Quad", "Out", 0.2)
                SetTween(RH, {
                    C0 = CFrame.new(.5, -0.15 + .05 * math.cos(sine / 15), -.4) *
                        CFrame.Angles(math.rad(-15 - 1 * math.cos(sine / 10)),
                                      math.rad(0), math.rad(0))
                }, "Quad", "InOut", 0.1)
                SetTween(LH, {
                    C0 = CFrame.new(-.5, -0.55 + .05 * math.cos(sine / 15), -.4) *
                        CFrame.Angles(math.rad(-0 + 1 * math.cos(sine / 10)),
                                      math.rad(0), math.rad(0))
                }, "Quad", "InOut", 0.1)

            elseif Anim == "Idle" then

                local dahspeed = 1
                if attack == true and mememode == true then
                    dahspeed = 5
                end

                if agresive == false then

                    change = (0.60 * 1.75) * dahspeed
                    Humanoid.JumpPower = 60
                    Humanoid.WalkSpeed = 16

                    local ADNum = 0
                    SetTween(RJW, {
                        C0 = RootCF *
                            cn(0, 0, -0.1 + 0.0395 *
                                   math.cos(
                                       sine / 8 + ADNum * math.cos(sine / 8 * 2))) *
                            angles(math.rad(1.5 - 1 * math.cos(sine / 8)),
                                   math.rad((0 + 0 * math.cos(sine / 8) / 20)),
                                   math.rad(-20))
                    }, "Quad", "InOut", 0.1)
                    SetTween(NeckW, {
                        C0 = NeckCF * angles(
                            math.rad(6.5 - 3.5 *
                                         math.sin(
                                             sine / 8 + ADNum *
                                                 math.cos(sine / 8 * 2))),
                            math.rad(2.5 - 5.5 * math.cos(sine / 16)), math.rad(
                                20 - 6.5 *
                                    math.cos(
                                        sine / 15 + .4 * math.cos(sine / 10))))
                    }, "Quad", "InOut", 0.1)
                    SetTween(RW, {
                        C0 = cf(1.45 + .0 * math.cos(sine / 8),
                                0.5 + .05 * math.cos(sine / 8), .0) *
                            angles(math.rad(0 + 3 * math.sin(sine / 8)),
                                   math.rad(-5),
                                   math.rad(4 + 4 * math.cos(sine / 8)))
                    }, "Quad", "Out", 0.2)
                    SetTween(LW, {
                        C0 = cf(-1.45 + .0 * math.cos(sine / 8),
                                0.5 + .05 * math.cos(sine / 8), .0) *
                            angles(math.rad(0 + 3 * math.sin(sine / 8)),
                                   math.rad(5),
                                   math.rad(-4 - 4 * math.cos(sine / 8)))
                    }, "Quad", "Out", 0.2)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -0.95 - .04 *
                                            math.cos(
                                                sine / 8 + ADNum *
                                                    math.cos(sine / 8 * 2)), 0) *
                            CFrame.Angles(
                                math.rad(1.5 - 1 * math.cos(sine / 8)),
                                math.rad(0),
                                math.rad(2.5 - 0.0 * math.cos(sine / 8)))
                    }, "Quad", "InOut", 0.1)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -0.95 - .04 *
                                            math.cos(
                                                sine / 8 + ADNum *
                                                    math.cos(sine / 8 * 2)), 0) *
                            CFrame.Angles(
                                math.rad(1.5 - 1 * math.cos(sine / 8)),
                                math.rad(20),
                                math.rad(-2.5 - 0.0 * math.cos(sine / 8)))
                    }, "Quad", "InOut", 0.1)
                else

                    change = (0.60 * 1.75) * dahspeed
                    Humanoid.JumpPower = 60
                    Humanoid.WalkSpeed = 16

                    local ADNum = 0
                    SetTween(RJW, {
                        C0 = RootCF *
                            cn(0, 0, -0.1 + 0.0395 *
                                   math.cos(
                                       sine / 8 + ADNum * math.cos(sine / 8 * 2))) *
                            angles(math.rad(10.5 - 1 * math.cos(sine / 8)),
                                   math.rad((0 + 0 * math.cos(sine / 8) / 20)),
                                   math.rad(-5))
                    }, "Quad", "InOut", 0.1)
                    SetTween(NeckW, {
                        C0 = NeckCF * angles(
                            math.rad(-6.5 - 3.5 *
                                         math.sin(
                                             sine / 8 + ADNum *
                                                 math.cos(sine / 8 * 2))),
                            math.rad(2.5 - 5.5 * math.cos(sine / 16)), math.rad(
                                5 - 6.5 *
                                    math.cos(
                                        sine / 15 + .4 * math.cos(sine / 10))))
                    }, "Quad", "InOut", 0.1)
                    SetTween(RW, {
                        C0 = cf(1.45 + .0 * math.cos(sine / 8),
                                0.5 + .05 * math.cos(sine / 8), .0) *
                            angles(math.rad(10 + 3 * math.sin(sine / 8)),
                                   math.rad(25),
                                   math.rad(40 + 4 * math.cos(sine / 8)))
                    }, "Quad", "Out", 0.2)
                    SetTween(LW, {
                        C0 = cf(-1.45 + .0 * math.cos(sine / 8),
                                0.5 + .05 * math.cos(sine / 8), .0) *
                            angles(math.rad(10 + 3 * math.sin(sine / 8)),
                                   math.rad(-25),
                                   math.rad(-40 - 4 * math.cos(sine / 8)))
                    }, "Quad", "Out", 0.2)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -0.95 - .04 *
                                            math.cos(
                                                sine / 8 + ADNum *
                                                    math.cos(sine / 8 * 2)), 0) *
                            CFrame.Angles(
                                math.rad(20.5 - 1 * math.cos(sine / 8)),
                                math.rad(0),
                                math.rad(2.5 - 0.0 * math.cos(sine / 8)))
                    }, "Quad", "InOut", 0.1)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -0.95 - .04 *
                                            math.cos(
                                                sine / 8 + ADNum *
                                                    math.cos(sine / 8 * 2)), 0) *
                            CFrame.Angles(
                                math.rad(1.5 - 1 * math.cos(sine / 8)),
                                math.rad(20),
                                math.rad(-2.5 - 0.0 * math.cos(sine / 8)))
                    }, "Quad", "InOut", 0.1)

                end

            elseif Anim == "Walk" then

                if agresive == false then

                    local speed = 1.0
                    if mememode == true then speed = 4 end

                    change = 2.4 * speed
                    Humanoid.JumpPower = 60 * speed
                    Humanoid.WalkSpeed = 16 * speed

                    local RH2 = cf(-forWRL / 7 * math.cos(sine / 8), 0,
                                   forWFB / 7 * math.cos(sine / 8)) *
                                    angles(
                                        math.rad(-forWFB * 30) *
                                            math.cos(sine / 8), 0, math.rad(
                                            -forWRL * 30) * math.cos(sine / 8))
                    local LH2 = cf(forWRL / 7 * math.cos(sine / 8), 0,
                                   -forWFB / 7 * math.cos(sine / 8)) *
                                    angles(
                                        math.rad(forWFB * 30) *
                                            math.cos(sine / 8), 0, math.rad(
                                            forWRL * 30) * math.cos(sine / 8))

                    SetTween(RJW, {
                        C0 = RootCF *
                            CFrame.new(0, 0,
                                       -0.05 + 0.055 * math.cos(sine / 4) +
                                           -math.sin(sine / 4) / 8) *
                            angles(math.rad(
                                       (forWFB * 2 - forWFB * math.cos(sine / 4)) *
                                           7), math.rad(
                                       (-forWRL * 2 - -forWRL *
                                           math.cos(sine / 4)) * 5),
                                   math.rad(8 * math.cos(sine / 8)))
                    }, "Linear", "InOut", WalkAnimMove / speed)
                    SetTween(NeckW, {
                        C0 = NeckCF *
                            CFrame.new(0, 0, 0 + 0.025 * math.cos(sine / 4)) *
                            angles(math.rad(
                                       (-forWFB * 1 - -forWFB *
                                           math.cos(sine / 4)) * 7), math.rad(
                                       (forWRL * 2 - forWRL * math.cos(sine / 4)) *
                                           3.5), math.rad(
                                       -forWRL * 45 + -8 * math.cos(sine / 8)))
                    }, "Linear", "InOut", WalkAnimMove / speed)
                    SetTween(RW, {
                        C0 = cf(1.45 + .0 * math.cos(sine / 8),
                                0.5 + forWRL / 50 * math.cos(sine / 8), 0) *
                            angles(
                                math.rad(0 + forWFB * 15 * math.cos(sine / 8)),
                                math.rad(0),
                                math.rad(8 + forWRL * 5 * math.cos(sine / 8)))
                    }, "Linear", "Out", WalkAnimMove / speed)
                    SetTween(LW, {
                        C0 = cf(-1.45 + .0 * math.cos(sine / 8),
                                0.5 + forWRL / 50 * math.cos(sine / 8), 0) *
                            angles(
                                math.rad(0 - forWFB * 15 * math.cos(sine / 8)),
                                math.rad(0),
                                math.rad(-8 - forWRL * 5 * math.cos(sine / 8)))
                    }, "Linear", "Out", WalkAnimMove / speed)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -0.85 + .15 * math.sin(sine / 8),
                                        -.15 + .15 * math.cos(sine / 8)) * RH2 *
                            CFrame.Angles(math.rad(0 - 5 * math.cos(sine / 8)),
                                          math.rad(0), math.rad(
                                              2.5 - 0.0 * math.cos(sine / 8)))
                    }, "Linear", "InOut", WalkAnimMove / speed)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -0.85 - .15 * math.sin(sine / 8),
                                        -.15 - .15 * math.cos(sine / 8)) * LH2 *
                            CFrame.Angles(math.rad(0 + 5 * math.cos(sine / 8)),
                                          math.rad(0), math.rad(
                                              -2.5 - 0.0 * math.cos(sine / 8)))
                    }, "Linear", "InOut", WalkAnimMove / speed)

                else

                    local speed = 1.6
                    if mememode == true then speed = 4 end

                    change = 2.5 * speed
                    Humanoid.JumpPower = 60 * speed
                    Humanoid.WalkSpeed = 22 * speed

                    local RH2 = cf(-forWRL / 7 * math.cos(sine / 8), 0,
                                   forWFB / 7 * math.cos(sine / 8)) *
                                    angles(
                                        math.rad(forWFB * 89) *
                                            math.cos(sine / 8), mr(
                                            -forWRL * 55 / 2 *
                                                math.cos(sine / 8)), math.rad(
                                            forWRL * 55 / 1 * math.cos(sine / 8)))
                    local LH2 = cf(forWRL / 7 * math.sin(sine / 8), 0,
                                   -forWFB / 7 * math.cos(sine / 8)) *
                                    angles(
                                        math.rad(forWFB * 89) *
                                            math.cos(sine / 8), mr(
                                            forWRL * 55 / 2 * math.sin(sine / 8)),
                                        math.rad(
                                            -forWRL * 55 / 1 *
                                                math.sin(sine / 8)))

                    SetTween(RJW, {
                        C0 = RootCF *
                            CFrame.new(forWRL * 1 * math.sin(sine / 8),
                                       forWFB * 1 * math.sin(sine / 8), -0.5 -
                                           0.255 * math.cos(sine / 8) +
                                           -math.sin(sine / 8) / 8) *
                            angles(math.rad(
                                       85 + (forWFB * math.cos(sine / 8)) * 20),
                                   math.rad((-forWRL * math.cos(sine / 4)) * 1),
                                   math.rad((-forWRL * math.cos(sine / 8)) * 10))
                    }, "Linear", "InOut", WalkAnimMove / speed)
                    SetTween(NeckW, {
                        C0 = NeckCF *
                            CFrame.new(0, 0, 0 + 0.025 * math.cos(sine / 4)) *
                            angles(math.rad(
                                       -20 +
                                           (-forWFB * 1 - -forWFB *
                                               math.cos(sine / 4)) * 5),
                                   math.rad(
                                       (forWRL * 2 - forWRL * math.cos(sine / 4)) *
                                           3.5), math.rad(
                                       -forWRL * 45 + -8 * math.cos(sine / 8)))
                    }, "Linear", "InOut", WalkAnimMove / speed)
                    SetTween(RW, {
                        C0 = cf(1.0 + .0 * math.cos(sine / 8),
                                .5 - forWFB * 0.5 * math.sin(sine / 8), -.4) *
                            angles(math.rad(
                                       95 - forWFB * 75 * math.sin(sine / 8)),
                                   math.rad(0), math.rad(
                                       -8 + (-forWRL * 55 * math.sin(sine / 8)) +
                                           10 * math.cos(sine / 8)))
                    }, "Linear", "Out", WalkAnimMove / speed)
                    SetTween(LW, {
                        C0 = cf(-1.0 + .0 * math.cos(sine / 8),
                                .5 - forWFB * 0.5 * math.sin(sine / 8), -.4) *
                            angles(math.rad(
                                       95 - forWFB * 75 * math.sin(sine / 8)),
                                   math.rad(0), math.rad(
                                       8 + (forWRL * 55 * math.cos(sine / 8)) -
                                           10 * math.cos(sine / 8)))
                    }, "Linear", "Out", WalkAnimMove / speed)
                    SetTween(RH, {
                        C0 = CFrame.new(.5, -0.85 - .25 * math.sin(sine / 8),
                                        -.15 - .25 * math.sin(sine / 8)) * RH2 *
                            CFrame.Angles(math.rad(60 - 5 * math.cos(sine / 8)),
                                          math.rad(0), math.rad(
                                              -2.5 - 0.0 * math.cos(sine / 8)))
                    }, "Linear", "InOut", WalkAnimMove / speed)
                    SetTween(LH, {
                        C0 = CFrame.new(-.5, -0.85 - .25 * math.sin(sine / 8),
                                        -.15 - .25 * math.sin(sine / 8)) * LH2 *
                            CFrame.Angles(math.rad(60 - 5 * math.sin(sine / 8)),
                                          math.rad(0), math.rad(
                                              2.5 - 0.0 * math.sin(sine / 8)))
                    }, "Linear", "InOut", WalkAnimMove / speed)

                    SetTween(tailw, {
                        C0 = CF(0, 0, .3) *
                            ANGLES(mr(90 + 10 * math.cos(sine / 8)), 0,
                                   mr(20 * math.cos(sine / 16)))
                    }, "Linear", "In", .1)

                end

            elseif Anim == "Sit" then
                SetTween(RJW, {
                    C0 = RootCF * CFrame.new(0, 0, 0) *
                        angles(math.rad(0), math.rad(0), math.rad(0))
                }, "Quad", "InOut", 0.1)
                SetTween(NeckW, {
                    C0 = NeckCF * CFrame.new(0, 0, 0) *
                        angles(math.rad(0), math.rad(0), math.rad(0))
                }, "Quad", "InOut", 0.1)
                SetTween(RW, {
                    C0 = CFrame.new(1.5, 0.5, -.0) *
                        angles(math.rad(0), math.rad(0), math.rad(0))
                }, "Quad", "Out", 0.1)
                SetTween(LW, {
                    C0 = CFrame.new(-1.5, 0.5, -.0) *
                        angles(math.rad(0), math.rad(0), math.rad(0))
                }, "Quad", "Out", 0.1)
                SetTween(RH, {
                    C0 = CFrame.new(.5, -1, 0) *
                        angles(math.rad(90), math.rad(0), math.rad(0))
                }, "Quad", "InOut", 0.1)
                SetTween(LH, {
                    C0 = CFrame.new(-.5, -1, 0) *
                        angles(math.rad(90), math.rad(0), math.rad(0))
                }, "Quad", "InOut", 0.1)

            end
        end
        if attack == false and not (agresive == true and Anim == "Walk") then
            SetTween(tailw, {
                C0 = tailc0 * CF(0, .2, 0) *
                    ANGLES(mr(4 + 2 * math.cos(sine / 8)), 0,
                           mr(20 + 20 * math.cos(sine / 16)))
            }, "Linear", "In", .1)

        end
        Swait(Animstep * 30)
    end
end))
for _, v in pairs(Character.Torso:GetChildren()) do
    if v.Name == "vag" then v:Destroy() end
end

mouse.Button1Down:connect(Button1DownF)
mouse.Button1Up:connect(Button1DownF)
mouse.KeyDown:connect(KeyDownF)
mouse.KeyUp:connect(KeyUpF)
Model13:Destroy()
