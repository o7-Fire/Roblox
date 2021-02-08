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
    AttachmentA.Name = "Ath_" .. CountSCIFIMOVIELOL
    local AttachmentB = Instance.new('Attachment', Part0);
    AttachmentB.Name = "Ath_" .. CountSCIFIMOVIELOL
    AttachmentA.Orientation = Angle or Vector3.new(0, 0, 0)
    AttachmentA.Position = Position or Vector3.new(0, 0, 0)
    AlignPos.Attachment1 = AttachmentA;
    AlignPos.Attachment0 = AttachmentB;
    AlignOri.Attachment1 = AttachmentA;
    AlignOri.Attachment0 = AttachmentB;
    CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
    return {AlignPos, AlignOri, AttachmentA, AttachmentB}
end

if _G.netted ~= true then
    _G.netted = true
    coroutine.wrap(function()
        settings().Physics.PhysicsEnvironmentalThrottle =
            Enum.EnviromentalPhysicsThrottle.Disabled
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

local DeadChar = game:FindFirstChildOfClass("Players").LocalPlayer.Character

local fldr = Instance.new("Folder",
                          game:FindFirstChildOfClass("Players").LocalPlayer["Character"])
fldr.Name = "DMYF"
local CloneChar = DeadChar:Clone()
local ANIMATIONHERE
if CloneChar:FindFirstChild("Animate") then
    ANIMATIONHERE = CloneChar:FindFirstChild("Animate"):Clone()
    CloneChar:FindFirstChild("Animate"):Destroy()
end
if CloneChar:FindFirstChildOfClass("Folder") then
    CloneChar:FindFirstChildOfClass("Folder"):Destroy()
end
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

for _, v in next, DeadChar:GetChildren() do
    if v:IsA("Accessory") then
        local topacc = false
        if v.Handle:FindFirstChildOfClass("Weld") then
            v.Handle:FindFirstChildOfClass("Weld"):Destroy()
        end
        v.Handle.Massless = true
        v.Handle.CanCollide = false
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
                            p0.CFrame = p0.CFrame:lerp(
                                            (((DeadChar.Torso.CFrame *
                                                CFrame.new(0, 1.5, 0)) *
                                                p1[topacc].CFrame) *
                                                p0[topacc].CFrame:inverse()), 1)
                        else
                            v.Handle.CFrame =
                                v.Handle.CFrame:lerp(
                                    alipos.Attachment1.Parent.CFrame *
                                        CFrame.new(alipos.Attachment1.Position) *
                                        CFrame.Angles(
                                            math.rad(
                                                alipos.Attachment1.Rotation.X),
                                            math.rad(
                                                alipos.Attachment1.Rotation.Y),
                                            math.rad(
                                                alipos.Attachment1.Rotation.Z)),
                                    1)
                        end
                    end)()
                end
            else
                SCIFIMOVIELOL(v.Handle, CloneChar[v.Name].Handle,
                              Vector3.new(0, 0, 0), Vector3.new(0, 0, 0))
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
    --[[for _,Parts in next, CloneChar:GetChildren() do
        if Parts:IsA("BasePart") then
            Parts.CanCollide = false 
        end 
    end]]
    for _, Parts in next, DeadChar:GetChildren() do
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
        DeadChar.Head:Destroy()
        DeadChar:FindFirstChildOfClass("Humanoid"):Destroy()
        game:FindFirstChildOfClass("Players").LocalPlayer.Character = CloneChar
        if DeadChar:FindFirstChildOfClass("Folder") then
            DeadChar:FindFirstChildOfClass("Folder"):Destroy()
        end
    end)
end)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", resetBindable)

coroutine.wrap(function()
    while true do
        game:GetService("RunService").RenderStepped:wait()
        if not CloneChar or not CloneChar:FindFirstChild("Head") or
            not CloneChar:FindFirstChildOfClass("Humanoid") or
            CloneChar:FindFirstChildOfClass("Humanoid").Health <= 0 and
            not DeadChar or not DeadChar:FindFirstChild("Head") or
            not DeadChar:FindFirstChildOfClass("Humanoid") or
            DeadChar:FindFirstChildOfClass("Humanoid").Health <= 0 then
            HumanDied = true
            pcall(function()
                game:FindFirstChildOfClass("Players").LocalPlayer.Character =
                    DeadChar
                DeadChar.Head:Destroy()
                DeadChar:FindFirstChildOfClass("Humanoid"):Destroy()
                game:FindFirstChildOfClass("Players").LocalPlayer.Character =
                    CloneChar
                if DeadChar:FindFirstChildOfClass("Folder") then
                    DeadChar:FindFirstChildOfClass("Folder"):Destroy()
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

SCIFIMOVIELOL(DeadChar["Head"], CloneChar["Head"])
SCIFIMOVIELOL(DeadChar["Torso"], CloneChar["Torso"])
SCIFIMOVIELOL(DeadChar["Left Arm"], CloneChar["Left Arm"])
SCIFIMOVIELOL(DeadChar["Right Arm"], CloneChar["Right Arm"])
SCIFIMOVIELOL(DeadChar["Left Leg"], CloneChar["Left Leg"])
SCIFIMOVIELOL(DeadChar["Right Leg"], CloneChar["Right Leg"])

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

for _, v in next, DeadChar:GetChildren() do
    if v:IsA("Accessory") then
        if v.Handle:FindFirstChildOfClass("Weld") then
            v.Handle:FindFirstChildOfClass("Weld"):Destroy()
        end
    end
end

if ANIMATIONHERE then ANIMATIONHERE.Parent = CloneChar end

-----------------------
--[[ Name : Chips ]] --
--[[ Description : I think I found my specialty in scripts ]] --
--[[ \ None / ]] --
-------------------------------------------------------
-- A script By Creterisk/makhail07
-- Discord Creterisk#2958 
-------------------------------------------------------

-- Everything is Meaningless.....

wait(1 / 60)

loadstring(game:GetObjects("rbxassetid://5425999987")[1].Source)()

local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local char = plr.Character
local hum = char:FindFirstChildOfClass 'Humanoid'
local hed = char.Head
local root = char:FindFirstChild 'HumanoidRootPart'
local rootj = root.RootJoint
local tors = char.Torso
local ra = char["Right Arm"]
local la = char["Left Arm"]
local rl = char["Right Leg"]
local ll = char["Left Leg"]
local neck = tors["Neck"]
local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
local LHCF = CFrame.fromEulerAnglesXYZ(0, -1.6, 0)
local maincolor = BrickColor.new("Institutional white")
-------------------------------------------------------
-- Start Good Stuff--
-------------------------------------------------------
cam = game.Workspace.CurrentCamera
CF = CFrame.new
angles = CFrame.Angles
attack = false
Euler = CFrame.fromEulerAnglesXYZ
Rad = math.rad
IT = Instance.new
BrickC = BrickColor.new
Cos = math.cos
Acos = math.acos
Sin = math.sin
Asin = math.asin
Abs = math.abs
Mrandom = math.random
Floor = math.floor
-------------------------------------------------------
-- End Good Stuff--
-------------------------------------------------------
necko = CF(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
RSH, LSH = nil, nil
RW = Instance.new("Weld")
LW = Instance.new("Weld")
RH = tors["Right Hip"]
LH = tors["Left Hip"]
RSH = tors["Right Shoulder"]
LSH = tors["Left Shoulder"]
RSH.Parent = nil
LSH.Parent = nil
RW.Name = "RW"
RW.Part0 = tors
RW.C0 = CF(1.5, 0.5, 0)
RW.C1 = CF(0, 0.5, 0)
RW.Part1 = ra
RW.Parent = tors
LW.Name = "LW"
LW.Part0 = tors
LW.C0 = CF(-1.5, 0.5, 0)
LW.C1 = CF(0, 0.5, 0)
LW.Part1 = la
LW.Parent = tors
Effects = {}
newWeld = function(wp0, wp1, wc0x, wc0y, wc0z)
    local wld = Instance.new("Weld", wp1)
    wld.Part0 = wp0
    wld.Part1 = wp1
    wld.C0 = CFrame.new(wc0x, wc0y, wc0z)
end
newWeld(tors, ll, -0.5, -1, 0)
ll.Weld.C1 = CFrame.new(0, 1, 0)
newWeld(tors, rl, 0.5, -1, 0)
rl.Weld.C1 = CFrame.new(0, 1, 0)
-------------------------------------------------------
-- Start Important Functions--
-------------------------------------------------------
function swait(num)
    if num == 0 or num == nil then
        game:service("RunService").Stepped:wait(0)
    else
        for i = 0, num do game:service("RunService").Stepped:wait(0) end
    end
end
function thread(f) coroutine.resume(coroutine.create(f)) end
function clerp(a, b, t)
    local qa = {QuaternionFromCFrame(a)}
    local qb = {QuaternionFromCFrame(b)}
    local ax, ay, az = a.x, a.y, a.z
    local bx, by, bz = b.x, b.y, b.z
    local _t = 1 - t
    return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by,
                              _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end
function QuaternionFromCFrame(cf)
    local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 =
        cf:components()
    local trace = m00 + m11 + m22
    if trace > 0 then
        local s = math.sqrt(1 + trace)
        local recip = 0.5 / s
        return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip,
               s * 0.5
    else
        local i = 0
        if m00 < m11 then i = 1 end
        if m22 > (i == 0 and m00 or m11) then i = 2 end
        if i == 0 then
            local s = math.sqrt(m00 - m11 - m22 + 1)
            local recip = 0.5 / s
            return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip,
                   (m21 - m12) * recip
        elseif i == 1 then
            local s = math.sqrt(m11 - m22 - m00 + 1)
            local recip = 0.5 / s
            return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip,
                   (m02 - m20) * recip
        elseif i == 2 then
            local s = math.sqrt(m22 - m00 - m11 + 1)
            local recip = 0.5 / s
            return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s,
                   (m10 - m01) * recip
        end
    end
end
function QuaternionToCFrame(px, py, pz, x, y, z, w)
    local xs, ys, zs = x + x, y + y, z + z
    local wx, wy, wz = w * xs, w * ys, w * zs
    local xx = x * xs
    local xy = x * ys
    local xz = x * zs
    local yy = y * ys
    local yz = y * zs
    local zz = z * zs
    return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz,
                      1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end
function QuaternionSlerp(a, b, t)
    local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
    local startInterp, finishInterp
    if cosTheta >= 1.0E-4 then
        if 1 - cosTheta > 1.0E-4 then
            local theta = math.acos(cosTheta)
            local invSinTheta = 1 / Sin(theta)
            startInterp = Sin((1 - t) * theta) * invSinTheta
            finishInterp = Sin(t * theta) * invSinTheta
        else
            startInterp = 1 - t
            finishInterp = t
        end
    elseif 1 + cosTheta > 1.0E-4 then
        local theta = math.acos(-cosTheta)
        local invSinTheta = 1 / Sin(theta)
        startInterp = Sin((t - 1) * theta) * invSinTheta
        finishInterp = Sin(t * theta) * invSinTheta
    else
        startInterp = t - 1
        finishInterp = t
    end
    return a[1] * startInterp + b[1] * finishInterp,
           a[2] * startInterp + b[2] * finishInterp,
           a[3] * startInterp + b[3] * finishInterp,
           a[4] * startInterp + b[4] * finishInterp
end
function rayCast(Position, Direction, Range, Ignore)
    return game:service("Workspace"):FindPartOnRay(
               Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore)
end
local RbxUtility = LoadLibrary("RbxUtility")
local Create = RbxUtility.Create

-------------------------------------------------------
-- Start Damage Function--
-------------------------------------------------------
function Damage(Part, hit, minim, maxim, knockback, Type, Property, Delay,
                HitSound, HitPitch) return true end
-------------------------------------------------------
-- End Damage Function--
-------------------------------------------------------

-------------------------------------------------------
-- Start Damage Function Customization--
-------------------------------------------------------
function ShowDamage(Pos, Text, Time, Color)
    local Rate = (1 / 30)
    local Pos = (Pos or Vector3.new(0, 0, 0))
    local Text = (Text or "")
    local Time = (Time or 2)
    local Color = (Color or Color3.new(1, 0, 1))
    local EffectPart = CFuncs.Part.Create(workspace, "SmoothPlastic", 0, 1,
                                          BrickColor.new(Color), "Effect",
                                          Vector3.new(0, 0, 0))
    EffectPart.Anchored = true
    local BillboardGui = Create("BillboardGui") {
        Size = UDim2.new(3, 0, 3, 0),
        Adornee = EffectPart,
        Parent = EffectPart
    }
    local TextLabel = Create("TextLabel") {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Text = Text,
        Font = "Bodoni",
        TextColor3 = Color,
        TextScaled = true,
        TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
        Parent = BillboardGui
    }
    game.Debris:AddItem(EffectPart, (Time))
    EffectPart.Parent = game:GetService("Workspace")
    delay(0, function()
        local Frames = (Time / Rate)
        for Frame = 1, Frames do
            wait(Rate)
            local Percent = (Frame / Frames)
            EffectPart.CFrame = CFrame.new(Pos) + Vector3.new(0, Percent, 0)
            TextLabel.TextTransparency = Percent
        end
        if EffectPart and EffectPart.Parent then EffectPart:Destroy() end
    end)
end
-------------------------------------------------------
-- End Damage Function Customization--
-------------------------------------------------------

function MagniDamage(Part, magni, mindam, maxdam, knock, Type)
    for _, c in pairs(workspace:children()) do
        local hum = c:findFirstChild("Humanoid")
        if hum ~= nil then
            local head = c:findFirstChild("Head")
            if head ~= nil then
                local targ = head.Position - Part.Position
                local mag = targ.magnitude
                if magni >= mag and c.Name ~= plr.Name then
                    Damage(head, head, mindam, maxdam, knock, Type, root, 0.1,
                           "http://www.roblox.com/asset/?id=0", 1.2)
                end
            end
        end
    end
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
                            SoundId = id,
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
function RemoveOutlines(part)
    part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface =
        10, 10, 10, 10, 10, 10
end
function CreatePart(FormFactor, Parent, Material, Reflectance, Transparency,
                    BColor, Name, Size)
    local Part = Create("Part")({
        formFactor = FormFactor,
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
function CreateMesh(Mesh, Part, MeshType, MeshId, OffSet, Scale)
    local Msh = Create(Mesh)({Parent = Part, Offset = OffSet, Scale = Scale})
    if Mesh == "SpecialMesh" then
        Msh.MeshType = MeshType
        Msh.MeshId = MeshId
    end
    return Msh
end
function CreateWeld(Parent, Part0, Part1, C0, C1)
    local Weld = Create("Weld")({
        Parent = Parent,
        Part0 = Part0,
        Part1 = Part1,
        C0 = C0,
        C1 = C1
    })
    return Weld
end

-------------------------------------------------------
-- Start Effect Function--
-------------------------------------------------------
EffectModel = Instance.new("Model", char)
Effects = {
    Block = {
        Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay,
                          Type)
            local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0,
                                           brickcolor, "Effect", Vector3.new())
            prt.Anchored = true
            prt.CFrame = cframe
            local msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "",
                                           Vector3.new(0, 0, 0),
                                           Vector3.new(x1, y1, z1))
            game:GetService("Debris"):AddItem(prt, 10)
            if Type == 1 or Type == nil then
                table.insert(Effects, {prt, "Block1", delay, x3, y3, z3, msh})
            elseif Type == 2 then
                table.insert(Effects, {prt, "Block2", delay, x3, y3, z3, msh})
            else
                table.insert(Effects, {prt, "Block3", delay, x3, y3, z3, msh})
            end
        end
    },
    Sphere = {
        Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
            local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0,
                                           brickcolor, "Effect", Vector3.new())
            prt.Anchored = true
            prt.CFrame = cframe
            local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "",
                                           Vector3.new(0, 0, 0),
                                           Vector3.new(x1, y1, z1))
            game:GetService("Debris"):AddItem(prt, 10)
            table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
        end
    },
    Cylinder = {
        Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
            local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0,
                                           brickcolor, "Effect", Vector3.new())
            prt.Anchored = true
            prt.CFrame = cframe
            local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "",
                                           Vector3.new(0, 0, 0),
                                           Vector3.new(x1, y1, z1))
            game:GetService("Debris"):AddItem(prt, 10)
            table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
        end
    },
    Wave = {
        Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
            local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0,
                                           brickcolor, "Effect", Vector3.new())
            prt.Anchored = true
            prt.CFrame = cframe
            local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh",
                                           "rbxassetid://20329976",
                                           Vector3.new(0, 0, 0), Vector3.new(
                                               x1 / 60, y1 / 60, z1 / 60))
            game:GetService("Debris"):AddItem(prt, 10)
            table.insert(Effects, {
                prt, "Cylinder", delay, x3 / 60, y3 / 60, z3 / 60, msh
            })
        end
    },
    Ring = {
        Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
            local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0,
                                           brickcolor, "Effect", Vector3.new())
            prt.Anchored = true
            prt.CFrame = cframe
            local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh",
                                           "rbxassetid://3270017",
                                           Vector3.new(0, 0, 0),
                                           Vector3.new(x1, y1, z1))
            game:GetService("Debris"):AddItem(prt, 10)
            table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
        end
    },
    Break = {
        Create = function(brickcolor, cframe, x1, y1, z1)
            local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0,
                                           brickcolor, "Effect",
                                           Vector3.new(0.5, 0.5, 0.5))
            prt.Anchored = true
            prt.CFrame = cframe *
                             CFrame.fromEulerAnglesXYZ(math.random(-50, 50),
                                                       math.random(-50, 50),
                                                       math.random(-50, 50))
            local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "",
                                           Vector3.new(0, 0, 0),
                                           Vector3.new(x1, y1, z1))
            local num = math.random(10, 50) / 1000
            game:GetService("Debris"):AddItem(prt, 10)
            table.insert(Effects, {
                prt, "Shatter", num, prt.CFrame, math.random() - math.random(),
                0, math.random(50, 100) / 100
            })
        end
    },
    Spiral = {
        Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
            local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0,
                                           brickcolor, "Effect", Vector3.new())
            prt.Anchored = true
            prt.CFrame = cframe
            local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh",
                                           "rbxassetid://1051557",
                                           Vector3.new(0, 0, 0),
                                           Vector3.new(x1, y1, z1))
            game:GetService("Debris"):AddItem(prt, 10)
            table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
        end
    },
    Push = {
        Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
            local prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 0,
                                           brickcolor, "Effect", Vector3.new())
            prt.Anchored = true
            prt.CFrame = cframe
            local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh",
                                           "rbxassetid://437347603",
                                           Vector3.new(0, 0, 0),
                                           Vector3.new(x1, y1, z1))
            game:GetService("Debris"):AddItem(prt, 10)
            table.insert(Effects, {prt, "Cylinder", delay, x3, y3, z3, msh})
        end
    }
}
function part(formfactor, parent, reflectance, transparency, brickcolor, name,
              size)
    local fp = IT("Part")
    fp.formFactor = formfactor
    fp.Parent = parent
    fp.Reflectance = reflectance
    fp.Transparency = transparency
    fp.CanCollide = false
    fp.Locked = true
    fp.BrickColor = brickcolor
    fp.Name = name
    fp.Size = size
    fp.Position = tors.Position
    RemoveOutlines(fp)
    fp.Material = "SmoothPlastic"
    fp:BreakJoints()
    return fp
end

function mesh(Mesh, part, meshtype, meshid, offset, scale)
    local mesh = IT(Mesh)
    mesh.Parent = part
    if Mesh == "SpecialMesh" then
        mesh.MeshType = meshtype
        if meshid ~= "nil" then
            mesh.MeshId = "http://www.roblox.com/asset/?id=" .. meshid
        end
    end
    mesh.Offset = offset
    mesh.Scale = scale
    return mesh
end

function Magic(bonuspeed, type, pos, scale, value, color, MType)
    local type = type
    local rng = Instance.new("Part", char)
    rng.Anchored = true
    rng.BrickColor = color
    rng.CanCollide = false
    rng.FormFactor = 3
    rng.Name = "Ring"
    rng.Material = "Neon"
    rng.Size = Vector3.new(1, 1, 1)
    rng.Transparency = 0
    rng.TopSurface = 0
    rng.BottomSurface = 0
    rng.CFrame = pos
    local rngm = Instance.new("SpecialMesh", rng)
    rngm.MeshType = MType
    rngm.Scale = scale
    local scaler2 = 1
    if type == "Add" then
        scaler2 = 1 * value
    elseif type == "Divide" then
        scaler2 = 1 / value
    end
    coroutine.resume(coroutine.create(function()
        for i = 0, 10 / bonuspeed, 0.1 do
            swait()
            if type == "Add" then
                scaler2 = scaler2 - 0.01 * value / bonuspeed
            elseif type == "Divide" then
                scaler2 = scaler2 - 0.01 / value * bonuspeed
            end
            rng.Transparency = rng.Transparency + 0.01 * bonuspeed
            rngm.Scale = rngm.Scale +
                             Vector3.new(scaler2 * bonuspeed,
                                         scaler2 * bonuspeed,
                                         scaler2 * bonuspeed)
        end
        rng:Destroy()
    end))
end

function Eviscerate(dude)
    if dude.Name ~= char then
        local bgf = IT("BodyGyro", dude.Head)
        bgf.CFrame = bgf.CFrame * CFrame.fromEulerAnglesXYZ(Rad(-90), 0, 0)
        local val = IT("BoolValue", dude)
        val.Name = "IsHit"
        local ds = coroutine.wrap(function()
            dude:WaitForChild("Head"):BreakJoints()
            wait(0.5)
            target = nil
            coroutine.resume(coroutine.create(
                                 function()
                    for i, v in pairs(dude:GetChildren()) do
                        if v:IsA("Accessory") then
                            v:Destroy()
                        end
                        if v:IsA("Humanoid") then
                            v:Destroy()
                        end
                        if v:IsA("CharacterMesh") then
                            v:Destroy()
                        end
                        if v:IsA("Model") then
                            v:Destroy()
                        end
                        if v:IsA("Part") or v:IsA("MeshPart") then
                            for x, o in pairs(v:GetChildren()) do
                                if o:IsA("Decal") then
                                    o:Destroy()
                                end
                            end
                            coroutine.resume(
                                coroutine.create(
                                    function()
                                        v.Material = "Neon"
                                        v.CanCollide = false
                                        local PartEmmit1 =
                                            IT("ParticleEmitter", v)
                                        PartEmmit1.LightEmission = 1
                                        PartEmmit1.Texture =
                                            "rbxassetid://284205403"
                                        PartEmmit1.Color =
                                            ColorSequence.new(maincolor.Color)
                                        PartEmmit1.Rate = 150
                                        PartEmmit1.Lifetime = NumberRange.new(1)
                                        PartEmmit1.Size =
                                            NumberSequence.new(
                                                {
                                                    NumberSequenceKeypoint.new(
                                                        0, 0.75, 0),
                                                    NumberSequenceKeypoint.new(
                                                        1, 0, 0)
                                                })
                                        PartEmmit1.Transparency =
                                            NumberSequence.new(
                                                {
                                                    NumberSequenceKeypoint.new(
                                                        0, 0, 0),
                                                    NumberSequenceKeypoint.new(
                                                        1, 1, 0)
                                                })
                                        PartEmmit1.Speed = NumberRange.new(0, 0)
                                        PartEmmit1.VelocitySpread = 30000
                                        PartEmmit1.Rotation =
                                            NumberRange.new(-500, 500)
                                        PartEmmit1.RotSpeed =
                                            NumberRange.new(-500, 500)
                                        local BodPoss = IT("BodyPosition", v)
                                        BodPoss.P = 3000
                                        BodPoss.D = 1000
                                        BodPoss.maxForce =
                                            Vector3.new(50000000000,
                                                        50000000000, 50000000000)
                                        BodPoss.position =
                                            v.Position +
                                                Vector3.new(Mrandom(-15, 15),
                                                            Mrandom(-15, 15),
                                                            Mrandom(-15, 15))
                                        v.Color = maincolor.Color
                                        coroutine.resume(
                                            coroutine.create(
                                                function()
                                                    for i = 0, 49 do
                                                        swait(1)
                                                        v.Transparency =
                                                            v.Transparency +
                                                                0.08
                                                    end
                                                    wait(0.5)
                                                    PartEmmit1.Enabled = false
                                                    wait(3)
                                                    v:Destroy()
                                                    dude:Destroy()
                                                end))
                                    end))
                        end
                    end
                end))
        end)
        ds()
    end
end

function FindNearestHead(Position, Distance, SinglePlayer)
    if SinglePlayer then
        return Distance > (SinglePlayer.Torso.CFrame.p - Position).magnitude
    end
    local List = {}
    for i, v in pairs(workspace:GetChildren()) do
        if v:IsA("Model") and v:findFirstChild("Head") and v ~= char and
            Distance >= (v.Head.Position - Position).magnitude then
            table.insert(List, v)
        end
    end
    return List
end

function Aura(bonuspeed, FastSpeed, type, pos, x1, y1, z1, value, color,
              outerpos, MType)
    local type = type
    local rng = Instance.new("Part", char)
    rng.Anchored = true
    rng.BrickColor = color
    rng.CanCollide = false
    rng.FormFactor = 3
    rng.Name = "Ring"
    rng.Material = "Neon"
    rng.Size = Vector3.new(1, 1, 1)
    rng.Transparency = 0
    rng.TopSurface = 0
    rng.BottomSurface = 0
    rng.CFrame = pos
    rng.CFrame = rng.CFrame + rng.CFrame.lookVector * outerpos
    local rngm = Instance.new("SpecialMesh", rng)
    rngm.MeshType = MType
    rngm.Scale = Vector3.new(x1, y1, z1)
    local scaler2 = 1
    local speeder = FastSpeed
    if type == "Add" then
        scaler2 = 1 * value
    elseif type == "Divide" then
        scaler2 = 1 / value
    end
    coroutine.resume(coroutine.create(function()
        for i = 0, 10 / bonuspeed, 0.1 do
            swait()
            if type == "Add" then
                scaler2 = scaler2 - 0.01 * value / bonuspeed
            elseif type == "Divide" then
                scaler2 = scaler2 - 0.01 / value * bonuspeed
            end
            speeder = speeder - 0.01 * FastSpeed * bonuspeed
            rng.CFrame = rng.CFrame + rng.CFrame.lookVector * speeder *
                             bonuspeed
            rng.Transparency = rng.Transparency + 0.01 * bonuspeed
            rngm.Scale = rngm.Scale +
                             Vector3.new(scaler2 * bonuspeed,
                                         scaler2 * bonuspeed, 0)
        end
        rng:Destroy()
    end))
end

function SoulSteal(dude)
    if dude.Name ~= char then
        local bgf = IT("BodyGyro", dude.Head)
        bgf.CFrame = bgf.CFrame * CFrame.fromEulerAnglesXYZ(Rad(-90), 0, 0)
        local val = IT("BoolValue", dude)
        val.Name = "IsHit"
        local torso =
            (dude:FindFirstChild 'Head' or dude:FindFirstChild 'Torso' or
                dude:FindFirstChild 'UpperTorso' or
                dude:FindFirstChild 'LowerTorso' or
                dude:FindFirstChild 'HumanoidRootPart')
        local soulst = coroutine.wrap(function()
            local soul = Instance.new("Part", dude)
            soul.Size = Vector3.new(1, 1, 1)
            soul.CanCollide = false
            soul.Anchored = false
            soul.Position = torso.Position
            soul.Transparency = 1
            local PartEmmit1 = IT("ParticleEmitter", soul)
            PartEmmit1.LightEmission = 1
            PartEmmit1.Texture = "rbxassetid://569507414"
            PartEmmit1.Color = ColorSequence.new(maincolor.Color)
            PartEmmit1.Rate = 250
            PartEmmit1.Lifetime = NumberRange.new(1.6)
            PartEmmit1.Size = NumberSequence.new(
                                  {
                    NumberSequenceKeypoint.new(0, 1, 0),
                    NumberSequenceKeypoint.new(1, 0, 0)
                })
            PartEmmit1.Transparency = NumberSequence.new(
                                          {
                    NumberSequenceKeypoint.new(0, 0, 0),
                    NumberSequenceKeypoint.new(1, 1, 0)
                })
            PartEmmit1.Speed = NumberRange.new(0, 0)
            PartEmmit1.VelocitySpread = 30000
            PartEmmit1.Rotation = NumberRange.new(-360, 360)
            PartEmmit1.RotSpeed = NumberRange.new(-360, 360)
            local BodPoss = IT("BodyPosition", soul)
            BodPoss.P = 3000
            BodPoss.D = 1000
            BodPoss.maxForce =
                Vector3.new(50000000000, 50000000000, 50000000000)
            BodPoss.position = torso.Position +
                                   Vector3.new(Mrandom(-15, 15),
                                               Mrandom(-15, 15),
                                               Mrandom(-15, 15))
            wait(1.6)
            soul.Touched:connect(function(hit)
                if hit.Parent == char then soul:Destroy() end
            end)
            wait(1.2)
            while soul do
                swait()
                PartEmmit1.Color = ColorSequence.new(maincolor.Color)
                BodPoss.Position = tors.Position
            end
        end)
        soulst()
    end
end
function FaceMouse()
    local Cam = workspace.CurrentCamera
    return {
        CFrame.new(char.Torso.Position, Vector3.new(mouse.Hit.p.x,
                                                    char.Torso.Position.y,
                                                    mouse.Hit.p.z)),
        Vector3.new(mouse.Hit.p.x, mouse.Hit.p.y, mouse.Hit.p.z)
    }
end
Effects = {
    Block = function(cf, partsize, meshstart, meshadd, matr, colour, spin,
                     inverse, factor)
        local p = Instance.new("Part", EffectModel)
        p.BrickColor = BrickColor.new(colour)
        p.Size = partsize
        p.Anchored = true
        p.CanCollide = false
        p.Material = matr
        p.CFrame = cf
        if inverse == true then
            p.Transparency = 1
        else
            p.Transparency = 0
        end
        local m = Instance.new("BlockMesh", p)
        m.Scale = meshstart
        coroutine.wrap(function()
            for i = 0, 1, factor do
                swait()
                if inverse == true then
                    p.Transparency = 1 - i
                else
                    p.Transparency = i
                end
                m.Scale = m.Scale + meshadd
                if spin == true then
                    p.CFrame = p.CFrame *
                                   CFrame.Angles(math.random(-50, 50),
                                                 math.random(-50, 50),
                                                 math.random(-50, 50))
                end
            end
            p:Destroy()
        end)()
        return p
    end,
    Sphere = function(cf, partsize, meshstart, meshadd, matr, colour, inverse,
                      factor)
        local p = Instance.new("Part", EffectModel)
        p.BrickColor = BrickColor.new(colour)
        p.Size = partsize
        p.Anchored = true
        p.CanCollide = false
        p.Material = matr
        p.CFrame = cf
        if inverse == true then
            p.Transparency = 1
        else
            p.Transparency = 0
        end
        local m = Instance.new("SpecialMesh", p)
        m.MeshType = "Sphere"
        m.Scale = meshstart
        coroutine.wrap(function()
            for i = 0, 1, factor do
                swait()
                if inverse == true then
                    p.Transparency = 1 - i
                else
                    p.Transparency = i
                end
                m.Scale = m.Scale + meshadd
            end
            p:Destroy()
        end)()
        return p
    end,

    Cylinder = function(cf, partsize, meshstart, meshadd, matr, colour, inverse,
                        factor)
        local p = Instance.new("Part", EffectModel)
        p.BrickColor = BrickColor.new(colour)
        p.Size = partsize
        p.Anchored = true
        p.CanCollide = false
        p.Material = matr
        p.CFrame = cf
        if inverse == true then
            p.Transparency = 1
        else
            p.Transparency = 0
        end
        local m = Instance.new("CylinderMesh", p)
        m.Scale = meshstart
        coroutine.wrap(function()
            for i = 0, 1, factor do
                swait()
                if inverse == true then
                    p.Transparency = 1 - i
                else
                    p.Transparency = i
                end
                m.Scale = m.Scale + meshadd
            end
            p:Destroy()
        end)()
        return p
    end,

    Wave = function(cf, meshstart, meshadd, colour, spin, inverse, factor)
        local p = Instance.new("Part", EffectModel)
        p.BrickColor = BrickColor.new(colour)
        p.Size = Vector3.new()
        p.Anchored = true
        p.CanCollide = false
        p.CFrame = cf
        if inverse == true then
            p.Transparency = 1
        else
            p.Transparency = 0
        end
        local m = Instance.new("SpecialMesh", p)
        m.MeshId = "rbxassetid://20329976"
        m.Scale = meshstart
        coroutine.wrap(function()
            for i = 0, 1, factor do
                swait()
                if inverse == true then
                    p.Transparency = 1 - i
                else
                    p.Transparency = i
                end
                m.Scale = m.Scale + meshadd
                p.CFrame = p.CFrame * CFrame.Angles(0, math.rad(spin), 0)
            end
            p:Destroy()
        end)()
        return p
    end,

    Ring = function(cf, meshstart, meshadd, colour, inverse, factor)
        local p = Instance.new("Part", EffectModel)
        p.BrickColor = BrickColor.new(colour)
        p.Size = Vector3.new()
        p.Anchored = true
        p.CanCollide = false
        p.CFrame = cf
        if inverse == true then
            p.Transparency = 1
        else
            p.Transparency = 0
        end
        local m = Instance.new("SpecialMesh", p)
        m.MeshId = "rbxassetid://3270017"
        m.Scale = meshstart
        coroutine.wrap(function()
            for i = 0, 1, factor do
                swait()
                if inverse == true then
                    p.Transparency = 1 - i
                else
                    p.Transparency = i
                end
                m.Scale = m.Scale + meshadd
            end
            p:Destroy()
        end)()
        return p
    end,

    Meshed = function(cf, meshstart, meshadd, colour, meshid, textid, spin,
                      inverse, factor)
        local p = Instance.new("Part", EffectModel)
        p.BrickColor = BrickColor.new(colour)
        p.Size = Vector3.new()
        p.Anchored = true
        p.CanCollide = false
        p.CFrame = cf
        if inverse == true then
            p.Transparency = 1
        else
            p.Transparency = 0
        end
        local m = Instance.new("SpecialMesh", p)
        m.MeshId = meshid
        m.TextureId = textid
        m.Scale = meshstart
        coroutine.wrap(function()
            for i = 0, 1, factor do
                swait()
                if inverse == true then
                    p.Transparency = 1 - i
                else
                    p.Transparency = i
                end
                m.Scale = m.Scale + meshadd
                p.CFrame = p.CFrame * CFrame.Angles(0, math.rad(spin), 0)
            end
            p:Destroy()
        end)()
        return p
    end,

    Explode = function(cf, partsize, meshstart, meshadd, matr, colour, move,
                       inverse, factor)
        local p = Instance.new("Part", EffectModel)
        p.BrickColor = BrickColor.new(colour)
        p.Size = partsize
        p.Anchored = true
        p.CanCollide = false
        p.Material = matr
        p.CFrame = cf * CFrame.Angles(math.rad(math.random(-360, 360)),
                                      math.rad(math.random(-360, 360)),
                                      math.rad(math.random(-360, 360)))
        if inverse == true then
            p.Transparency = 1
        else
            p.Transparency = 0
        end
        local m = Instance.new("SpecialMesh", p)
        m.MeshType = "Sphere"
        m.Scale = meshstart
        coroutine.wrap(function()
            for i = 0, 1, factor do
                swait()
                if inverse == true then
                    p.Transparency = 1 - i
                else
                    p.Transparency = i
                end
                m.Scale = m.Scale + meshadd
                p.CFrame = p.CFrame * CFrame.new(0, move, 0)
            end
            p:Destroy()
        end)()
        return p
    end

}
-------------------------------------------------------
-- End Effect Function--
-------------------------------------------------------
function Cso(ID, PARENT, VOLUME, PITCH)
    local NSound = nil
    coroutine.resume(coroutine.create(function()
        NSound = IT("Sound", PARENT)
        NSound.Volume = VOLUME
        NSound.Pitch = PITCH
        NSound.SoundId = "http://www.roblox.com/asset/?id=" .. ID
        swait()
        NSound:play()
        game:GetService("Debris"):AddItem(NSound, 10)
    end))
    return NSound
end
function CamShake(Length, Intensity)
    coroutine.resume(coroutine.create(function()
        local intensity = 1 * Intensity
        local rotM = 0.01 * Intensity
        for i = 0, Length, 0.1 do
            swait()
            intensity = intensity - 0.05 * Intensity / Length
            rotM = rotM - 5.0E-4 * Intensity / Length
            hum.CameraOffset = Vector3.new(Rad(Mrandom(-intensity, intensity)),
                                           Rad(Mrandom(-intensity, intensity)),
                                           Rad(Mrandom(-intensity, intensity)))
            cam.CFrame = cam.CFrame *
                             CF(Rad(Mrandom(-intensity, intensity)),
                                Rad(Mrandom(-intensity, intensity)),
                                Rad(Mrandom(-intensity, intensity))) *
                             Euler(Rad(Mrandom(-intensity, intensity)) * rotM,
                                   Rad(Mrandom(-intensity, intensity)) * rotM,
                                   Rad(Mrandom(-intensity, intensity)) * rotM)
        end
        hum.CameraOffset = Vector3.new(0, 0, 0)
    end))
end
NewInstance = function(instance, parent, properties)
    local inst = Instance.new(instance)
    inst.Parent = parent
    if (properties) then
        for i, v in next, properties do pcall(function() inst[i] = v end) end
    end
    return inst;
end
hum.MaxHealth = 1.0E298
hum.Health = 1.0E298
game:GetService("RunService"):BindToRenderStep("HOT", 0, function()
    if hum.Health > 0.1 and hum.Health < 1.0E298 then
        hum.MaxHealth = 1.0E298
        hum.Health = 1.0E298
    end
end)
-------------------------------------------------------
-- End Important Functions--
-------------------------------------------------------

-------------------------------------------------------
-- Start Customization--
-------------------------------------------------------
local Player_Size = 1
if Player_Size ~= 1 then
    root.Size = root.Size * Player_Size
    tors.Size = tors.Size * Player_Size
    hed.Size = hed.Size * Player_Size
    ra.Size = ra.Size * Player_Size
    la.Size = la.Size * Player_Size
    rl.Size = rl.Size * Player_Size
    ll.Size = ll.Size * Player_Size
    ----------------------------------------------------------------------------------
    rootj.Parent = root
    neck.Parent = tors
    RW.Parent = tors
    LW.Parent = tors
    RH.Parent = tors
    LH.Parent = tors
    ----------------------------------------------------------------------------------
    rootj.C0 = RootCF * CF(0 * Player_Size, 0 * Player_Size, 0 * Player_Size) *
                   angles(Rad(0), Rad(0), Rad(0))
    rootj.C1 = RootCF * CF(0 * Player_Size, 0 * Player_Size, 0 * Player_Size) *
                   angles(Rad(0), Rad(0), Rad(0))
    neck.C0 = necko *
                  CF(0 * Player_Size, 0 * Player_Size,
                     0 + ((1 * Player_Size) - 1)) *
                  angles(Rad(0), Rad(0), Rad(0))
    neck.C1 = CF(0 * Player_Size, -0.5 * Player_Size, 0 * Player_Size) *
                  angles(Rad(-90), Rad(0), Rad(180))
    RW.C0 = CF(1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) *
                angles(Rad(0), Rad(0), Rad(0)) -- * RIGHTSHOULDERC0
    LW.C0 = CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) *
                angles(Rad(0), Rad(0), Rad(0)) -- * LEFTSHOULDERC0
    ----------------------------------------------------------------------------------
    RH.C0 = CF(1 * Player_Size, -1 * Player_Size, 0 * Player_Size) *
                angles(Rad(0), Rad(90), Rad(0)) * angles(Rad(0), Rad(0), Rad(0))
    LH.C0 = CF(-1 * Player_Size, -1 * Player_Size, 0 * Player_Size) *
                angles(Rad(0), Rad(-90), Rad(0)) *
                angles(Rad(0), Rad(0), Rad(0))
    RH.C1 = CF(0.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) *
                angles(Rad(0), Rad(90), Rad(0)) * angles(Rad(0), Rad(0), Rad(0))
    LH.C1 = CF(-0.5 * Player_Size, 1 * Player_Size, 0 * Player_Size) *
                angles(Rad(0), Rad(-90), Rad(0)) *
                angles(Rad(0), Rad(0), Rad(0))
    -- hat.Parent = Character
end
----------------------------------------------------------------------------------
local SONG = 525565668
local SONG2 = 0
local Music = Instance.new("Sound", tors)
Music.Volume = 2.5
Music.Looped = true
Music.Pitch = 1 -- Pitcher
----------------------------------------------------------------------------------
local equipped = false
local idle = 0
local change = 1
local val = 0
local toim = 0
local idleanim = 0.4
local sine = 0
local Sit = 1
local WasAir = false
local InAir = false
local LandTick = 0
local movelegs = false
local FF = Instance.new("ForceField", char)
FF.Visible = false
local Speed = 56
local Chips = "onebearnakedwoman"
----------------------------------------------------------------------------------
hum.JumpPower = 55
hum.Animator.Parent = nil
----------------------------------------------------------------------------------
Chips = IT("Model")
Chips.Parent = char
Chips.Name = "Chips"
RHe = IT("Part")
RHe.Parent = Chips
RHe.BrickColor = BrickColor.new("Really black")
RHe.Locked = true
RHe.CanCollide = false
RHe.Transparency = 0
PMesh = IT("SpecialMesh")
RHe.formFactor = "Symmetric"
PMesh.MeshType = "FileMesh"
PMesh.MeshId = "rbxassetid://19106014"
PMesh.TextureId = "rbxassetid://342435650"
PMesh.Scale = Vector3.new(1, 1.4, 0.8)
PMesh.Parent = RHe
local RWeld = IT("Weld")
RWeld.Parent = RHe
RWeld.Part0 = RHe
RWeld.Part1 = ra
RWeld.C0 = CF(-1.2, -0.5, 0) * angles(Rad(90), Rad(0), Rad(90))
-------------------------------------------------------
-- End Customization--
-------------------------------------------------------

-------------------------------------------------------
-- Start Attacks N Stuff--
-------------------------------------------------------
function AttackTemplate()
    attack = true
    for i = 0, 2, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF *
                             CF(0 * Player_Size, 0 * Player_Size,
                                -0.1 + 0.1 * Player_Size * Cos(sine / 20)) *
                             angles(Rad(0), Rad(0), Rad(0)), 0.1)
        neck.C0 = clerp(neck.C0,
                        necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                            angles(Rad(0 - 5 * Sin(sine / 20)), Rad(0), Rad(0)),
                        0.1)
        rl.Weld.C0 = clerp(rl.Weld.C0,
                           CF(0.5 * Player_Size,
                              -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                              0 * Player_Size) *
                               angles(Rad(0), Rad(-10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(5)), 0.1)
        ll.Weld.C0 = clerp(ll.Weld.C0,
                           CF(-0.5 * Player_Size,
                              -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                              0 * Player_Size) * angles(Rad(0), Rad(10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(-5)), 0.1)
        RW.C0 = clerp(RW.C0,
                      CF(1.5 * Player_Size,
                         0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                         0 * Player_Size) *
                          angles(Rad(0), Rad(0 + 5 * Sin(sine / 20)),
                                 Rad(10 + 5 * Sin(sine / 20))), 0.1)
        LW.C0 = clerp(LW.C0,
                      CF(-1.5 * Player_Size,
                         0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                         0 * Player_Size) *
                          angles(Rad(0), Rad(0 - 5 * Sin(sine / 20)),
                                 Rad(-10 - 5 * Sin(sine / 20))), 0.1)
    end
    attack = false
end
function HitboxFunction(Pose, lifetime, siz1, siz2, siz3, Radie, Min, Max, kb,
                        atype)
    local Hitboxpart = Instance.new("Part", EffectModel)
    RemoveOutlines(Hitboxpart)
    Hitboxpart.Size = Vector3.new(siz1, siz2, siz3)
    Hitboxpart.CanCollide = false
    Hitboxpart.Transparency = 1
    Hitboxpart.Anchored = true
    Hitboxpart.CFrame = Pose
    game:GetService("Debris"):AddItem(Hitboxpart, lifetime)
    MagniDamage(Hitboxpart, Radie, Min, Max, kb, atype)
end
wait2 = false
combo = 1
mouse.Button1Down:connect(function(key)
    if attack == false then
        attack = true
        Speed = 3.01
        if combo == 1 and wait2 == false then
            wait2 = true
            for i = 0, 1.6, 0.1 do
                swait()
                rootj.C0 = clerp(rootj.C0, RootCF *
                                     CF(0 * Player_Size, 0 * Player_Size, -0.1 +
                                            0.1 * Player_Size * Cos(sine / 20)) *
                                     angles(Rad(0), Rad(0), Rad(-45)), 0.2)
                neck.C0 = clerp(neck.C0,
                                necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                    angles(Rad(0 - 5 * Sin(sine / 20)), Rad(0),
                                           Rad(45)), 0.2)
                rl.Weld.C0 = clerp(rl.Weld.C0,
                                   CF(0.5 * Player_Size, -0.9 - 0.1 *
                                          Cos(sine / 20) * Player_Size,
                                      0 * Player_Size) *
                                       angles(Rad(0), Rad(-45), Rad(0)) *
                                       angles(Rad(0), Rad(0), Rad(15)), 0.2)
                ll.Weld.C0 = clerp(ll.Weld.C0,
                                   CF(-0.5 * Player_Size, -0.9 - 0.1 *
                                          Cos(sine / 20) * Player_Size,
                                      0 * Player_Size) *
                                       angles(Rad(0), Rad(10), Rad(0)) *
                                       angles(Rad(0), Rad(0), Rad(-15)), 0.2)
                RW.C0 = clerp(RW.C0,
                              CF(1.5 * Player_Size,
                                 0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(180), Rad(0 + 5 * Sin(sine / 20)),
                                         Rad(25 + 5 * Sin(sine / 20))), 0.2)
                LW.C0 = clerp(LW.C0,
                              CF(-1.5 * Player_Size,
                                 0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(-20), Rad(0 - 5 * Sin(sine / 20)),
                                         Rad(-10 - 5 * Sin(sine / 20))), 0.2)
            end
            Cso("138097048", ra, 1.2, 0.8)
            HitboxFunction(ra.CFrame, 0.01, 1, 1, 1, 7, 6, 9, 3, "Normal")
            for i = 0, 1.2, 0.1 do
                swait()
                rootj.C0 = clerp(rootj.C0, RootCF *
                                     CF(0 * Player_Size, 0 * Player_Size, -0.1 +
                                            0.1 * Player_Size * Cos(sine / 20)) *
                                     angles(Rad(20), Rad(0), Rad(45)), 0.3)
                neck.C0 = clerp(neck.C0,
                                necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                    angles(Rad(20 - 5 * Sin(sine / 20)), Rad(0),
                                           Rad(-45)), 0.3)
                rl.Weld.C0 = clerp(rl.Weld.C0,
                                   CF(0.5 * Player_Size, -0.9 - 0.1 *
                                          Cos(sine / 20) * Player_Size,
                                      0 * Player_Size) *
                                       angles(Rad(20), Rad(-10), Rad(0)) *
                                       angles(Rad(0), Rad(0), Rad(15)), 0.3)
                ll.Weld.C0 = clerp(ll.Weld.C0,
                                   CF(-0.5 * Player_Size, -0.9 - 0.1 *
                                          Cos(sine / 20) * Player_Size,
                                      0 * Player_Size) *
                                       angles(Rad(-20), Rad(45), Rad(0)) *
                                       angles(Rad(0), Rad(0), Rad(-15)), 0.3)
                RW.C0 = clerp(RW.C0,
                              CF(1.5 * Player_Size,
                                 0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(85), Rad(0 + 5 * Sin(sine / 20)),
                                         Rad(45 + 5 * Sin(sine / 20))), 0.3)
                LW.C0 = clerp(LW.C0,
                              CF(-1.5 * Player_Size,
                                 0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(-45), Rad(0 - 5 * Sin(sine / 20)),
                                         Rad(-25 - 5 * Sin(sine / 20))), 0.3)
            end
            combo = 1
        end
        Speed = 56
        wait2 = false
        attack = false
    end
end)
function Taunt()
    attack = true
    Speed = 3
    if Chips == "onebearnakedwoman" then
        local Munch = Cso("1575472350", hed, 5, 1)
        swait(2)
        repeat
            swait()
            rootj.C0 = clerp(rootj.C0, RootCF *
                                 CF(0 * Player_Size, 0 * Player_Size,
                                    -0.2 + 0.1 * Player_Size * Cos(sine / 20)) *
                                 angles(Rad(-20), Rad(0), Rad(0)), 0.3)
            neck.C0 = clerp(neck.C0,
                            necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                angles(Rad(-35 - 5 * Sin(sine / 20)), Rad(0),
                                       Rad(0)), 0.3)
            rl.Weld.C0 = clerp(rl.Weld.C0,
                               CF(0.5 * Player_Size,
                                  -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(-20), Rad(-10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(5)), 0.3)
            ll.Weld.C0 = clerp(ll.Weld.C0,
                               CF(-0.5 * Player_Size,
                                  -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(-20), Rad(10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(-5)), 0.3)
            RW.C0 = clerp(RW.C0,
                          CF(1 * Player_Size,
                             0.1 + 0.1 * Sin(sine / 20) * Player_Size,
                             -0.6 * Player_Size) *
                              angles(Rad(160), Rad(0), Rad(-35)), 0.1)
            LW.C0 = clerp(LW.C0,
                          CF(-1.5 * Player_Size,
                             0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                             0 * Player_Size) *
                              angles(Rad(-20), Rad(0 - 5 * Sin(sine / 20)),
                                     Rad(-10 - 5 * Sin(sine / 20))), 0.3)
        until Munch.Playing == false
    elseif Chips == "layonme" then
        for i = 0, 6, 0.1 do
            swait()
            rootj.C0 = clerp(rootj.C0, RootCF *
                                 CF(0 * Player_Size, 0 * Player_Size,
                                    -0.1 + 0.1 * Player_Size * Cos(sine / 20)) *
                                 angles(Rad(0), Rad(0), Rad(0)), 0.1)
            neck.C0 = clerp(neck.C0,
                            necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                angles(Rad(0), Rad(0), Rad(0 - 255.45 * i)),
                            0.15)
            rl.Weld.C0 = clerp(rl.Weld.C0,
                               CF(0.5 * Player_Size,
                                  -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(0), Rad(-10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(5)), 0.1)
            ll.Weld.C0 = clerp(ll.Weld.C0,
                               CF(-0.5 * Player_Size,
                                  -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(0), Rad(10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(-5)), 0.1)
            RW.C0 = clerp(RW.C0,
                          CF(1.5 * Player_Size,
                             0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                             0 * Player_Size) *
                              angles(Rad(10), Rad(30 + 5 * Sin(sine / 20)),
                                     Rad(45 + 5 * Sin(sine / 20))), 0.1)
            LW.C0 = clerp(LW.C0,
                          CF(-1.5 * Player_Size,
                             0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                             0 * Player_Size) *
                              angles(Rad(10), Rad(-30 - 5 * Sin(sine / 20)),
                                     Rad(-45 - 5 * Sin(sine / 20))), 0.1)
        end
    elseif Chips == "howitfeelstochew5gum" then
        local Munch = Cso("1575472350", hed, 5, 1)
        swait(2)
        repeat
            swait()
            rootj.C0 = clerp(rootj.C0, RootCF *
                                 CF(0 * Player_Size, 0 * Player_Size,
                                    -0.2 + 0.1 * Player_Size * Cos(sine / 20)) *
                                 angles(Rad(-20), Rad(0), Rad(0)), 0.3)
            neck.C0 = clerp(neck.C0,
                            necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                angles(Rad(-35 - 5 * Sin(sine / 20)), Rad(0),
                                       Rad(0)), 0.3)
            rl.Weld.C0 = clerp(rl.Weld.C0,
                               CF(0.5 * Player_Size,
                                  -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(-20), Rad(-10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(5)), 0.3)
            ll.Weld.C0 = clerp(ll.Weld.C0,
                               CF(-0.5 * Player_Size,
                                  -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(-20), Rad(10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(-5)), 0.3)
            RW.C0 = clerp(RW.C0,
                          CF(1 * Player_Size,
                             0.1 + 0.1 * Sin(sine / 20) * Player_Size,
                             -0.6 * Player_Size) *
                              angles(Rad(160), Rad(0), Rad(-35)), 0.1)
            LW.C0 = clerp(LW.C0,
                          CF(-1.5 * Player_Size,
                             0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                             0 * Player_Size) *
                              angles(Rad(-20), Rad(0 - 5 * Sin(sine / 20)),
                                     Rad(-10 - 5 * Sin(sine / 20))), 0.3)
        until Munch.Playing == false
        Cso("172324194", hed, 5, 1)
        for i = 0, 5, 0.1 do
            swait()
            rootj.C0 = clerp(rootj.C0,
                             RootCF *
                                 CF(0 * Player_Size, 0 * Player_Size,
                                    -0.2 * Player_Size) *
                                 angles(Rad(-20), Rad(0), Rad(0)), 0.3)
            neck.C0 = clerp(neck.C0,
                            necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                angles(Rad(-35), Rad(0), Rad(0)), 0.3)
            rl.Weld.C0 = clerp(rl.Weld.C0,
                               CF(0.5 * Player_Size, -0.9 * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(-20), Rad(-10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(5)), 0.3)
            ll.Weld.C0 = clerp(ll.Weld.C0,
                               CF(-0.5 * Player_Size, -0.9 * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(-20), Rad(10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(-5)), 0.3)
            RW.C0 = clerp(RW.C0,
                          CF(1 * Player_Size, 0.1 * Player_Size,
                             -0.6 * Player_Size) *
                              angles(Rad(160), Rad(0), Rad(-35)), 0.1)
            LW.C0 = clerp(LW.C0,
                          CF(-1.5 * Player_Size, 0.5 * Player_Size,
                             0 * Player_Size) *
                              angles(Rad(-20), Rad(0), Rad(-10)), 0.3)
        end
        local RUN = Cso("957655044", hed, 5, 1)
        swait(2)
        repeat
            swait()
            Speed = 56
            local WALKSPEEDVALUE = 6 / (hum.WalkSpeed / 16)
            root.Velocity = root.CFrame.lookVector * 75
            rootj.C0 = clerp(rootj.C0,
                             RootCF * CF(0 * Player_Size, 0 * Player_Size,
                                         -0.3 - 0.65 *
                                             Cos(sine / (WALKSPEEDVALUE / 2))) *
                                 angles(Rad(-25), Rad(0), Rad(
                                            0 - 1.75 *
                                                Cos(sine / (WALKSPEEDVALUE / 2))) +
                                            root.RotVelocity.Y / 75), 0.1)
            neck.C0 = clerp(neck.C0,
                            necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                angles(Rad(
                                           -20 + 5 *
                                               Sin(sine / (WALKSPEEDVALUE / 2))),
                                       Rad(0), Rad(0) + root.RotVelocity.Y / 13),
                            0.1)
            rl.Weld.C0 = clerp(rl.Weld.C0, CF(0.5 * Player_Size, -0.8 - 0.5 *
                                                  Cos(sine / WALKSPEEDVALUE) / 2 *
                                                  Player_Size, 0.6 *
                                                  Cos(sine / WALKSPEEDVALUE) / 2 *
                                                  Player_Size) *
                                   angles(
                                       Rad(-15 - 95 * Cos(sine / WALKSPEEDVALUE)) -
                                           root.RotVelocity.Y / 75 +
                                           -Sin(sine / WALKSPEEDVALUE) / 2.5,
                                       Rad(0 - 10 * Cos(sine / WALKSPEEDVALUE)),
                                       Rad(0)) *
                                   angles(
                                       Rad(0 + 2 * Cos(sine / WALKSPEEDVALUE)),
                                       Rad(0), Rad(0)), 0.3)
            ll.Weld.C0 = clerp(ll.Weld.C0, CF(-0.5 * Player_Size, -0.8 + 0.5 *
                                                  Cos(sine / WALKSPEEDVALUE) / 2 *
                                                  Player_Size, -0.6 *
                                                  Cos(sine / WALKSPEEDVALUE) / 2 *
                                                  Player_Size) *
                                   angles(
                                       Rad(-15 + 95 * Cos(sine / WALKSPEEDVALUE)) +
                                           root.RotVelocity.Y / -75 +
                                           Sin(sine / WALKSPEEDVALUE) / 2.5,
                                       Rad(0 - 10 * Cos(sine / WALKSPEEDVALUE)),
                                       Rad(0)) *
                                   angles(
                                       Rad(0 - 2 * Cos(sine / WALKSPEEDVALUE)),
                                       Rad(0), Rad(0)), 0.3)
            RW.C0 = clerp(RW.C0,
                          CF(1.5 * Player_Size, 0.5 + 0.1 *
                                 Sin(sine / WALKSPEEDVALUE) * Player_Size,
                             0 * Player_Size) *
                              angles(Rad(215), Rad(0), Rad(45)), 0.1)
            LW.C0 = clerp(LW.C0,
                          CF(-1.5 * Player_Size, 0.5 + 0.1 *
                                 Sin(sine / WALKSPEEDVALUE) * Player_Size,
                             0 * Player_Size) *
                              angles(Rad(215), Rad(0), Rad(-45)), 0.1)
        until RUN.Playing == false
    elseif Chips == "5gumdowngrade" then
        Cso("1826625760", hed, 5, 1)
        for i = 0, 5, 0.1 do
            swait()
            rootj.C0 = clerp(rootj.C0, RootCF *
                                 CF(0 * Player_Size, 0 * Player_Size,
                                    -0.1 + 0.1 * Player_Size * Cos(sine / 20)) *
                                 angles(Rad(0), Rad(0), Rad(0)), 0.1)
            neck.C0 = clerp(neck.C0,
                            necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                angles(Rad(20 - 5 * Sin(sine / 20)), Rad(0),
                                       Rad(0)), 0.1)
            rl.Weld.C0 = clerp(rl.Weld.C0,
                               CF(0.5 * Player_Size,
                                  -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(0), Rad(-10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(5)), 0.1)
            ll.Weld.C0 = clerp(ll.Weld.C0,
                               CF(-0.5 * Player_Size,
                                  -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(0), Rad(10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(-5)), 0.1)
            RW.C0 = clerp(RW.C0,
                          CF(1.5 * Player_Size,
                             0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                             0 * Player_Size) *
                              angles(Rad(0), Rad(0 + 5 * Sin(sine / 20)),
                                     Rad(10 + 5 * Sin(sine / 20))), 0.1)
            LW.C0 = clerp(LW.C0,
                          CF(-1.5 * Player_Size,
                             0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                             0 * Player_Size) *
                              angles(Rad(0), Rad(0 - 5 * Sin(sine / 20)),
                                     Rad(-10 - 5 * Sin(sine / 20))), 0.1)
        end
    end
    Speed = 56
    movelegs = false
    attack = false
end
function Gum()
    attack = true
    Speed = 0
    local Senses = Cso("605297168", hed, 6, 1)
    swait(2)
    repeat
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF *
                             CF(0 * Player_Size, 0 * Player_Size,
                                -0.1 + 0.1 * Player_Size * Cos(sine / 20)) *
                             angles(Rad(0), Rad(0), Rad(20)), 0.2)
        neck.C0 = clerp(neck.C0,
                        necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                            angles(Rad(0 - 5 * Sin(sine / 20)), Rad(0), Rad(-20)),
                        0.2)
        rl.Weld.C0 = clerp(rl.Weld.C0,
                           CF(0.5 * Player_Size,
                              -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                              0 * Player_Size) *
                               angles(Rad(0), Rad(-10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(5)), 0.2)
        ll.Weld.C0 = clerp(ll.Weld.C0,
                           CF(-0.5 * Player_Size,
                              -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                              0 * Player_Size) * angles(Rad(0), Rad(10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(-5)), 0.2)
        RW.C0 = clerp(RW.C0,
                      CF(1.5 * Player_Size,
                         0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                         0 * Player_Size) *
                          angles(Rad(0), Rad(0 + 5 * Sin(sine / 20)),
                                 Rad(10 + 5 * Sin(sine / 20))), 0.2)
        LW.C0 = clerp(LW.C0,
                      CF(-1.5 * Player_Size,
                         0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                         0 * Player_Size) * angles(Rad(0), Rad(0), Rad(-90)),
                      0.2)
    until Senses.TimePosition > 2.7
    for i = 0, 3, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0,
                         RootCF *
                             CF(0 * Player_Size, 0 * Player_Size,
                                -0.1 + 0.1 * Player_Size) *
                             angles(Rad(-30), Rad(0), Rad(0)), 0.5)
        neck.C0 = clerp(neck.C0,
                        necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                            angles(Rad(0), Rad(0), Rad(0)), 0.5)
        rl.Weld.C0 = clerp(rl.Weld.C0,
                           CF(0.5 * Player_Size, -0.9 * Player_Size,
                              0 * Player_Size) *
                               angles(Rad(0), Rad(-10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(5)), 0.5)
        ll.Weld.C0 = clerp(ll.Weld.C0,
                           CF(-0.5 * Player_Size, -0.9 * Player_Size,
                              0 * Player_Size) * angles(Rad(0), Rad(10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(-5)), 0.5)
        RW.C0 = clerp(RW.C0,
                      CF(1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) *
                          angles(Rad(0), Rad(0), Rad(10)), 0.5)
        LW.C0 = clerp(LW.C0,
                      CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) *
                          angles(Rad(0), Rad(0), Rad(-90)), 0.5)
    end
    root.Anchored = true
    repeat
        swait()
        rootj.C0 = clerp(rootj.C0,
                         RootCF *
                             CF(0 * Player_Size, 0 * Player_Size,
                                -2.7 + 0.1 * Player_Size) *
                             angles(Rad(90), Rad(0), Rad(0)), 0.5)
        neck.C0 = clerp(neck.C0,
                        necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                            angles(Rad(0), Rad(0), Rad(0)), 0.5)
        rl.Weld.C0 = clerp(rl.Weld.C0,
                           CF(0.5 * Player_Size, -0.9 * Player_Size,
                              0 * Player_Size) *
                               angles(Rad(0), Rad(-10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(5)), 0.5)
        ll.Weld.C0 = clerp(ll.Weld.C0,
                           CF(-0.5 * Player_Size, -0.9 * Player_Size,
                              0 * Player_Size) * angles(Rad(0), Rad(10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(-5)), 0.5)
        RW.C0 = clerp(RW.C0,
                      CF(1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) *
                          angles(Rad(0), Rad(0), Rad(10)), 0.5)
        LW.C0 = clerp(LW.C0,
                      CF(-1.5 * Player_Size, 0.5 * Player_Size, 0 * Player_Size) *
                          angles(Rad(0), Rad(0), Rad(-90)), 0.5)
    until Senses.Playing == false
    Speed = 56
    attack = false
    root.Anchored = false
end
function OHHHHHHH()
    attack = true
    Speed = 0
    Cso("663306786", tors, 3, 1)
    for i = 0, 12, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0,
                         RootCF * CF(0 * Player_Size, 0 + 1 * i * Player_Size,
                                     -0.1 + 0.1 * Player_Size * Cos(sine / 20)) *
                             angles(Rad(-20), Rad(0), Rad(0)), 0.1)
        neck.C0 = clerp(neck.C0,
                        necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                            angles(Rad(20 - 5 * Sin(sine / 20)), Rad(0), Rad(0)),
                        0.1)
        rl.Weld.C0 = clerp(rl.Weld.C0,
                           CF(0.5 * Player_Size,
                              -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                              0 * Player_Size) *
                               angles(Rad(47), Rad(-10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(5)), 0.1)
        ll.Weld.C0 = clerp(ll.Weld.C0,
                           CF(-0.5 * Player_Size,
                              -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                              0 * Player_Size) *
                               angles(Rad(65), Rad(10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(-5)), 0.1)
        RW.C0 = clerp(RW.C0,
                      CF(1.5 * Player_Size,
                         0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                         0 * Player_Size) *
                          angles(Rad(75), Rad(0 + 5 * Sin(sine / 20)),
                                 Rad(10 + 5 * Sin(sine / 20))), 0.1)
        LW.C0 = clerp(LW.C0,
                      CF(-1.5 * Player_Size,
                         0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                         0 * Player_Size) *
                          angles(Rad(143), Rad(0 - 5 * Sin(sine / 20)),
                                 Rad(-10 - 5 * Sin(sine / 20))), 0.1)
    end
    Cso("663307468", tors, 6, 1)
    for i = 0, 6, 0.1 do
        swait()
        rootj.C0 = clerp(rootj.C0,
                         RootCF * CF(0 * Player_Size, 4500 * Player_Size,
                                     -0.1 + 0.1 * Player_Size * Cos(sine / 20)) *
                             angles(Rad(-20), Rad(0), Rad(0)), 0.15)
        neck.C0 = clerp(neck.C0,
                        necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                            angles(Rad(20 - 5 * Sin(sine / 20)), Rad(0), Rad(0)),
                        0.1)
        rl.Weld.C0 = clerp(rl.Weld.C0,
                           CF(0.5 * Player_Size,
                              -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                              0 * Player_Size) *
                               angles(Rad(47), Rad(-10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(5)), 0.1)
        ll.Weld.C0 = clerp(ll.Weld.C0,
                           CF(-0.5 * Player_Size,
                              -0.9 - 0.1 * Cos(sine / 20) * Player_Size,
                              0 * Player_Size) *
                               angles(Rad(65), Rad(10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(-5)), 0.1)
        RW.C0 = clerp(RW.C0,
                      CF(1.5 * Player_Size,
                         0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                         0 * Player_Size) *
                          angles(Rad(75), Rad(0 + 5 * Sin(sine / 20)),
                                 Rad(10 + 5 * Sin(sine / 20))), 0.1)
        LW.C0 = clerp(LW.C0,
                      CF(-1.5 * Player_Size,
                         0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                         0 * Player_Size) *
                          angles(Rad(156), Rad(0 - 5 * Sin(sine / 20)),
                                 Rad(-10 - 5 * Sin(sine / 20))), 0.1)
    end
    Speed = 56
    attack = false
end
function WoodyGotWood()
    attack = true
    Speed = 0
    local Woodlenny = Cso("1764642350", hed, 6, 1)
    swait(2)
    repeat
        swait()
        rootj.C0 = clerp(rootj.C0, RootCF *
                             CF(0 * Player_Size, 0 * Player_Size,
                                -0.1 + 0.1 * Player_Size * Cos(sine / 5)) *
                             angles(Rad(20), Rad(0), Rad(5)), 0.2)
        neck.C0 = clerp(neck.C0,
                        necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                            angles(Rad(20), Rad(0),
                                   Rad(-5 - 15 * Sin(sine / 20))), 0.2)
        rl.Weld.C0 = clerp(rl.Weld.C0,
                           CF(0.5 * Player_Size,
                              -0.9 - 0.1 * Cos(sine / 5) * Player_Size,
                              0 * Player_Size) *
                               angles(Rad(20), Rad(-10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(5)), 0.2)
        ll.Weld.C0 = clerp(ll.Weld.C0,
                           CF(-0.5 * Player_Size,
                              -0.9 - 0.1 * Cos(sine / 5) * Player_Size,
                              0 * Player_Size) *
                               angles(Rad(20), Rad(10), Rad(0)) *
                               angles(Rad(0), Rad(0), Rad(-5)), 0.2)
        RW.C0 = clerp(RW.C0,
                      CF(1.5 * Player_Size,
                         0.5 + 0.1 * Sin(sine / 5) * Player_Size,
                         0 * Player_Size) * angles(Rad(0), Rad(0), Rad(10)), 0.2)
        LW.C0 = clerp(LW.C0,
                      CF(-1.5 * Player_Size,
                         0.5 + 0.1 * Sin(sine / 5) * Player_Size,
                         0 * Player_Size) * angles(Rad(20), Rad(0), Rad(-10)),
                      0.2)
    until Woodlenny.TimePosition > 3.6
    root.Anchored = true
    repeat
        swait()
        for i = 0, 2, 0.1 do
            swait()
            rootj.C0 = clerp(rootj.C0,
                             RootCF *
                                 CF(0 * Player_Size, 0 * Player_Size,
                                    -2.7 + 0.1 * Player_Size) *
                                 angles(Rad(-90), Rad(0), Rad(0)), 0.5)
            neck.C0 = clerp(neck.C0, necko *
                                CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                angles(Rad(0), Rad(0), Rad(0)), 0.5)
            rl.Weld.C0 = clerp(rl.Weld.C0,
                               CF(0.5 * Player_Size, -0.9 * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(0), Rad(-10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(5)), 0.5)
            ll.Weld.C0 = clerp(ll.Weld.C0,
                               CF(-0.5 * Player_Size, -0.9 * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(0), Rad(10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(-5)), 0.5)
            RW.C0 = clerp(RW.C0,
                          CF(1.5 * Player_Size, 0.5 * Player_Size,
                             0 * Player_Size) * angles(Rad(0), Rad(0), Rad(90)),
                          0.5)
            LW.C0 = clerp(LW.C0,
                          CF(-1.5 * Player_Size, 0.5 * Player_Size,
                             0 * Player_Size) * angles(Rad(0), Rad(0), Rad(-90)),
                          0.5)
        end
        for i = 0, 1.6, 0.1 do
            swait()
            rootj.C0 = clerp(rootj.C0,
                             RootCF *
                                 CF(0 * Player_Size, 0 * Player_Size,
                                    -2.4 + 0.1 * Player_Size) *
                                 angles(Rad(-90), Rad(0), Rad(0)), 0.5)
            neck.C0 = clerp(neck.C0, necko *
                                CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                angles(Rad(0), Rad(0), Rad(0)), 0.5)
            rl.Weld.C0 = clerp(rl.Weld.C0,
                               CF(0.5 * Player_Size, -0.9 * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(0), Rad(-10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(5)), 0.5)
            ll.Weld.C0 = clerp(ll.Weld.C0,
                               CF(-0.5 * Player_Size, -0.9 * Player_Size,
                                  0 * Player_Size) *
                                   angles(Rad(0), Rad(10), Rad(0)) *
                                   angles(Rad(0), Rad(0), Rad(-5)), 0.5)
            RW.C0 = clerp(RW.C0,
                          CF(1.5 * Player_Size, 0.5 * Player_Size,
                             0 * Player_Size) * angles(Rad(0), Rad(0), Rad(75)),
                          0.5)
            LW.C0 = clerp(LW.C0,
                          CF(-1.5 * Player_Size, 0.5 * Player_Size,
                             0 * Player_Size) * angles(Rad(0), Rad(0), Rad(-75)),
                          0.5)
        end
    until Woodlenny.Playing == false
    Speed = 56
    attack = false
    root.Anchored = false
end
-------------------------------------------------------
-- End Attacks N Stuff--
-------------------------------------------------------
mouse.KeyDown:connect(function(key)
    if attack == false then
        if key == "t" then
            Taunt()
        elseif key == "z" then
            Gum()
        elseif key == "x" then
            OHHHHHHH()
        elseif key == "c" then
            WoodyGotWood()
        elseif key == "f" then
            SONG = 690663957
            Music.TimePosition = 0
            PMesh.TextureId = "rbxassetid://206977326"
            Chips = "cheesexd"

        elseif key == "m" then
            SONG = 525565668
            Music.TimePosition = 0
            PMesh.TextureId = "rbxassetid://342435650"
            Chips = "onebearnakedwoman"
        elseif key == "n" then
            SONG = 937445925
            Music.TimePosition = 0
            PMesh.TextureId = "rbxassetid://342436716"
            Chips = "layonme"
        elseif key == "b" then
            SONG = 1386299751
            Music.TimePosition = 0
            PMesh.TextureId = "rbxassetid://341999291"
            Chips = "howitfeelstochew5gum"
        elseif key == "v" then
            SONG = 554967156
            Music.TimePosition = 0
            PMesh.TextureId = "rbxassetid://341999245"
            Chips = "5gumdowngrade"
        end
    end
end)

-------------------------------------------------------
-- Start Animations--
-------------------------------------------------------
while true do
    swait()
    sine = sine + change
    local torvel = (root.Velocity * Vector3.new(1, 0, 1)).magnitude
    local velderp = root.Velocity.y
    hitfloor, posfloor = rayCast(root.Position, CFrame.new(root.Position,
                                                           root.Position -
                                                               Vector3.new(0, 1,
                                                                           0))
                                     .lookVector, 4 * Player_Size,
                                 workspace[plr.Name])
    if equipped == true or equipped == false then
        if attack == false then
            idle = idle + 1
        else
            idle = 0
        end
        local Landed = false
        if (hitfloor) then
            WasAir = false
        else
            WasAir = true
        end
        if (WasAir == false) then
            if (InAir == true) then
                LandTick = time()
                Landed = true
            end
        end
        if (time() - LandTick < .3) then Landed = true end
        if (hitfloor) then
            InAir = false
        else
            InAir = true
        end
        local WALKSPEEDVALUE = 6 / (hum.WalkSpeed / 16)
        local Walking = (math.abs(root.Velocity.x) > 1 or
                            math.abs(root.Velocity.z) > 1)
        local State = (hum.PlatformStand and 'Paralyzed' or hum.Sit and 'Sit' or
                          Landed and 'Land' or not hitfloor and root.Velocity.y <
                          -1 and "Fall" or not hitfloor and root.Velocity.y > 1 and
                          "Jump" or hitfloor and Walking and "Walk" or hitfloor and
                          "Idle")
        if (State == 'Jump') then
            hum.JumpPower = 55
            if attack == false then
                rootj.C0 = clerp(rootj.C0, RootCF *
                                     CF(0 * Player_Size, 0 * Player_Size, -0.1 +
                                            0.1 * Cos(sine / 20) * Player_Size) *
                                     angles(Rad(-16), Rad(0), Rad(0)), 0.1)
                neck.C0 = clerp(neck.C0,
                                necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                    angles(Rad(10 - 2.5 * Sin(sine / 30)),
                                           Rad(0), Rad(0)), 0.3)
                rl.Weld.C0 = clerp(rl.Weld.C0,
                                   CF(0.5 * Player_Size,
                                      -.2 - 0.1 * Cos(sine / 20),
                                      -.3 * Player_Size) *
                                       angles(Rad(0), Rad(-10), Rad(0)) *
                                       angles(Rad(-2.5), Rad(0), Rad(0)), 0.1)
                ll.Weld.C0 = clerp(ll.Weld.C0,
                                   CF(-0.5 * Player_Size,
                                      -.9 - 0.1 * Cos(sine / 20),
                                      -.5 * Player_Size) *
                                       angles(Rad(0), Rad(10), Rad(0)) *
                                       angles(Rad(-2.5), Rad(0), Rad(0)), 0.1)
                RW.C0 = clerp(RW.C0,
                              CF(1.5 * Player_Size,
                                 0.5 + 0.02 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(25), Rad(-.6),
                                         Rad(13 + 4.5 * Sin(sine / 20))), 0.1)
                LW.C0 = clerp(LW.C0,
                              CF(-1.5 * Player_Size,
                                 0.5 + 0.02 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(25), Rad(-.6),
                                         Rad(-13 - 4.5 * Sin(sine / 20))), 0.1)
            end
        elseif (State == 'Fall') then
            if attack == false then
                rootj.C0 = clerp(rootj.C0, RootCF *
                                     CF(0 * Player_Size, 0 * Player_Size, -0.1 +
                                            0.1 * Cos(sine / 20) * Player_Size) *
                                     angles(Rad(25), Rad(0), Rad(0)), 0.1)
                neck.C0 = clerp(neck.C0,
                                necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                    angles(Rad(10 - 2.5 * Sin(sine / 30)),
                                           Rad(0), Rad(0)), 0.3)
                rl.Weld.C0 = clerp(rl.Weld.C0,
                                   CF(0.5 * Player_Size,
                                      -1 - 0.1 * Cos(sine / 20) * Player_Size,
                                      -.3 * Player_Size) *
                                       angles(Rad(0), Rad(-10), Rad(0)) *
                                       angles(Rad(25), Rad(0), Rad(0)), 0.1)
                ll.Weld.C0 = clerp(ll.Weld.C0,
                                   CF(-0.5 * Player_Size,
                                      -.8 - 0.1 * Cos(sine / 20) * Player_Size,
                                      -.3 * Player_Size) *
                                       angles(Rad(0), Rad(10), Rad(0)) *
                                       angles(Rad(25), Rad(0), Rad(0)), 0.1)
                RW.C0 = clerp(RW.C0,
                              CF(1.5 * Player_Size,
                                 0.5 + 0.02 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(165), Rad(-.6),
                                         Rad(45 + 4.5 * Sin(sine / 20))), 0.1)
                LW.C0 = clerp(LW.C0,
                              CF(-1.5 * Player_Size,
                                 0.5 + 0.02 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(165), Rad(-.6),
                                         Rad(-45 - 4.5 * Sin(sine / 20))), 0.1)
            end
        elseif (State == 'Land') then
            hum.JumpPower = 0
            if attack == false then
                rootj.C0 = clerp(rootj.C0, RootCF *
                                     CF(0 * Player_Size, 0 * Player_Size,
                                        -1 + 0.1 * Cos(sine / 20) * Player_Size) *
                                     angles(Rad(10), Rad(0), Rad(0)), 0.15)
                neck.C0 = clerp(neck.C0,
                                necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                    angles(Rad(35 - 2.5 * Sin(sine / 30)),
                                           Rad(0), Rad(0)), 0.3)
                rl.Weld.C0 = clerp(rl.Weld.C0,
                                   CF(0.5 * Player_Size,
                                      0.1 - 0.1 * Cos(sine / 20) * Player_Size,
                                      -.3 * Player_Size) *
                                       angles(Rad(0), Rad(-10), Rad(0)) *
                                       angles(Rad(-3.5), Rad(0), Rad(5)), 0.15)
                ll.Weld.C0 = clerp(ll.Weld.C0,
                                   CF(-0.5 * Player_Size,
                                      0.1 - 0.1 * Cos(sine / 20) * Player_Size,
                                      -.3 * Player_Size) *
                                       angles(Rad(0), Rad(10), Rad(0)) *
                                       angles(Rad(-3.5), Rad(0), Rad(-5)), 0.15)
                RW.C0 = clerp(RW.C0,
                              CF(1.5 * Player_Size,
                                 0.5 + 0.02 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(65), Rad(0),
                                         Rad(25 + 4.5 * Sin(sine / 20))), 0.1)
                LW.C0 = clerp(LW.C0,
                              CF(-1.5 * Player_Size,
                                 0.5 + 0.02 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(55), Rad(0),
                                         Rad(-25 - 4.5 * Sin(sine / 20))), 0.1)
            end
        elseif (State == 'Idle') then
            change = 1
            if attack == false then
                rootj.C0 = clerp(rootj.C0, RootCF *
                                     CF(0 * Player_Size, 0 * Player_Size, -0.1 +
                                            0.1 * Player_Size * Cos(sine / 20)) *
                                     angles(Rad(0 - 5 * Sin(sine / 20)), Rad(0),
                                            Rad(0)), 0.1)
                neck.C0 = clerp(neck.C0,
                                necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                    angles(Rad(0 - 5 * Sin(sine / 20)), Rad(0),
                                           Rad(0)), 0.1)
                rl.Weld.C0 = clerp(rl.Weld.C0,
                                   CF(0.5 * Player_Size, -0.9 - 0.1 *
                                          Cos(sine / 20) * Player_Size,
                                      0 * Player_Size) *
                                       angles(Rad(0 - 5 * Sin(sine / 20)),
                                              Rad(-10), Rad(0)) *
                                       angles(Rad(0), Rad(0), Rad(5)), 0.1)
                ll.Weld.C0 = clerp(ll.Weld.C0,
                                   CF(-0.5 * Player_Size, -0.9 - 0.1 *
                                          Cos(sine / 20) * Player_Size,
                                      0 * Player_Size) *
                                       angles(Rad(0 - 5 * Sin(sine / 20)),
                                              Rad(10), Rad(0)) *
                                       angles(Rad(0), Rad(0), Rad(-5)), 0.1)
                RW.C0 = clerp(RW.C0,
                              CF(1.5 * Player_Size,
                                 0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(0 + 15 * Sin(sine / 20)),
                                         Rad(0 + 5 * Sin(sine / 20)),
                                         Rad(10 + 5 * Sin(sine / 20))), 0.1)
                LW.C0 = clerp(LW.C0,
                              CF(-1.5 * Player_Size,
                                 0.5 + 0.1 * Sin(sine / 20) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(0 + 15 * Sin(sine / 20)),
                                         Rad(0 - 5 * Sin(sine / 20)),
                                         Rad(-10 - 5 * Sin(sine / 20))), 0.1)
            end
        elseif (State == 'Walk') then
            change = 0.55
            hum.JumpPower = 55
            if attack == false then
                rootj.C0 = clerp(rootj.C0,
                                 RootCF * CF(0 * Player_Size, 0 * Player_Size,
                                             -0.3 - 0.65 *
                                                 Cos(sine / (WALKSPEEDVALUE / 2))) *
                                     angles(Rad(-25), Rad(0), Rad(
                                                0 - 1.75 *
                                                    Cos(
                                                        sine /
                                                            (WALKSPEEDVALUE / 2))) +
                                                root.RotVelocity.Y / 75), 0.1)
                neck.C0 = clerp(neck.C0,
                                necko * CF(0, 0, 0 + ((1 * Player_Size) - 1)) *
                                    angles(
                                        Rad(
                                            -20 + 5 *
                                                Sin(sine / (WALKSPEEDVALUE / 2))),
                                        Rad(0), Rad(0) + root.RotVelocity.Y / 13),
                                0.1)
                rl.Weld.C0 = clerp(rl.Weld.C0, CF(0.5 * Player_Size,
                                                  -0.8 - 0.5 *
                                                      Cos(sine / WALKSPEEDVALUE) /
                                                      2 * Player_Size, 0.6 *
                                                      Cos(sine / WALKSPEEDVALUE) /
                                                      2 * Player_Size) *
                                       angles(
                                           Rad(
                                               -15 - 95 *
                                                   Cos(sine / WALKSPEEDVALUE)) -
                                               root.RotVelocity.Y / 75 +
                                               -Sin(sine / WALKSPEEDVALUE) / 2.5,
                                           Rad(
                                               0 - 10 *
                                                   Cos(sine / WALKSPEEDVALUE)),
                                           Rad(0)) *
                                       angles(
                                           Rad(
                                               0 + 2 *
                                                   Cos(sine / WALKSPEEDVALUE)),
                                           Rad(0), Rad(0)), 0.3)
                ll.Weld.C0 = clerp(ll.Weld.C0, CF(-0.5 * Player_Size,
                                                  -0.8 + 0.5 *
                                                      Cos(sine / WALKSPEEDVALUE) /
                                                      2 * Player_Size, -0.6 *
                                                      Cos(sine / WALKSPEEDVALUE) /
                                                      2 * Player_Size) *
                                       angles(
                                           Rad(
                                               -15 + 95 *
                                                   Cos(sine / WALKSPEEDVALUE)) +
                                               root.RotVelocity.Y / -75 +
                                               Sin(sine / WALKSPEEDVALUE) / 2.5,
                                           Rad(
                                               0 - 10 *
                                                   Cos(sine / WALKSPEEDVALUE)),
                                           Rad(0)) *
                                       angles(
                                           Rad(
                                               0 - 2 *
                                                   Cos(sine / WALKSPEEDVALUE)),
                                           Rad(0), Rad(0)), 0.3)
                RW.C0 = clerp(RW.C0,
                              CF(1.5 * Player_Size, 0.5 + 0.1 *
                                     Sin(sine / WALKSPEEDVALUE) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(215), Rad(0), Rad(45)), 0.1)
                LW.C0 = clerp(LW.C0,
                              CF(-1.5 * Player_Size, 0.5 + 0.1 *
                                     Sin(sine / WALKSPEEDVALUE) * Player_Size,
                                 0 * Player_Size) *
                                  angles(Rad(215), Rad(0), Rad(-45)), 0.1)
            elseif attack == true and movelegs == true then
                rl.Weld.C0 = clerp(rl.Weld.C0, CF(0.5 * Player_Size,
                                                  -0.8 - 0.5 *
                                                      Cos(sine / WALKSPEEDVALUE) /
                                                      2 * Player_Size, 0.6 *
                                                      Cos(sine / WALKSPEEDVALUE) /
                                                      2 * Player_Size) *
                                       angles(
                                           Rad(
                                               -10 - 25 *
                                                   Cos(sine / WALKSPEEDVALUE)) -
                                               root.RotVelocity.Y / 75 +
                                               -Sin(sine / WALKSPEEDVALUE) / 2.5,
                                           Rad(
                                               0 - 10 *
                                                   Cos(sine / WALKSPEEDVALUE)),
                                           Rad(0)) *
                                       angles(
                                           Rad(
                                               0 + 2 *
                                                   Cos(sine / WALKSPEEDVALUE)),
                                           Rad(0), Rad(0)), 0.3)
                ll.Weld.C0 = clerp(ll.Weld.C0, CF(-0.5 * Player_Size,
                                                  -0.8 + 0.5 *
                                                      Cos(sine / WALKSPEEDVALUE) /
                                                      2 * Player_Size, -0.6 *
                                                      Cos(sine / WALKSPEEDVALUE) /
                                                      2 * Player_Size) *
                                       angles(
                                           Rad(
                                               -10 + 25 *
                                                   Cos(sine / WALKSPEEDVALUE)) +
                                               root.RotVelocity.Y / -75 +
                                               Sin(sine / WALKSPEEDVALUE) / 2.5,
                                           Rad(
                                               0 - 10 *
                                                   Cos(sine / WALKSPEEDVALUE)),
                                           Rad(0)) *
                                       angles(
                                           Rad(
                                               0 - 2 *
                                                   Cos(sine / WALKSPEEDVALUE)),
                                           Rad(0), Rad(0)), 0.3)
            end
        end
    end
    hum.Name = "HUM"
    hum.WalkSpeed = Speed
    Music.SoundId = "rbxassetid://" .. SONG
    Music.Looped = true
    Music.Pitch = 1
    Music.Volume = 1.5
    Music.Parent = tors
    Music.Playing = true
    if 0 < #Effects then
        for e = 1, #Effects do
            if Effects[e] ~= nil then
                local Thing = Effects[e]
                if Thing ~= nil then
                    local Part = Thing[1]
                    local Mode = Thing[2]
                    local Delay = Thing[3]
                    local IncX = Thing[4]
                    local IncY = Thing[5]
                    local IncZ = Thing[6]
                    if 1 >= Thing[1].Transparency then
                        if Thing[2] == "Block1" then
                            Thing[1].CFrame =
                                Thing[1].CFrame *
                                    CFrame.fromEulerAnglesXYZ(
                                        math.random(-50, 50),
                                        math.random(-50, 50),
                                        math.random(-50, 50))
                            local Mesh = Thing[1].Mesh
                            Mesh.Scale =
                                Mesh.Scale +
                                    Vector3.new(Thing[4], Thing[5], Thing[6])
                            Thing[1].Transparency =
                                Thing[1].Transparency + Thing[3]
                        elseif Thing[2] == "Block2" then
                            Thing[1].CFrame =
                                Thing[1].CFrame + Vector3.new(0, 0, 0)
                            local Mesh = Thing[7]
                            Mesh.Scale =
                                Mesh.Scale +
                                    Vector3.new(Thing[4], Thing[5], Thing[6])
                            Thing[1].Transparency =
                                Thing[1].Transparency + Thing[3]
                        elseif Thing[2] == "Block3" then
                            Thing[1].CFrame =
                                Thing[1].CFrame *
                                    CFrame.fromEulerAnglesXYZ(
                                        math.random(-50, 50),
                                        math.random(-50, 50),
                                        math.random(-50, 50)) +
                                    Vector3.new(0, 0.15, 0)
                            local Mesh = Thing[7]
                            Mesh.Scale =
                                Mesh.Scale +
                                    Vector3.new(Thing[4], Thing[5], Thing[6])
                            Thing[1].Transparency =
                                Thing[1].Transparency + Thing[3]
                        elseif Thing[2] == "Cylinder" then
                            local Mesh = Thing[1].Mesh
                            Mesh.Scale =
                                Mesh.Scale +
                                    Vector3.new(Thing[4], Thing[5], Thing[6])
                            Thing[1].Transparency =
                                Thing[1].Transparency + Thing[3]
                        elseif Thing[2] == "Blood" then
                            local Mesh = Thing[7]
                            Thing[1].CFrame =
                                Thing[1].CFrame * Vector3.new(0, 0.5, 0)
                            Mesh.Scale =
                                Mesh.Scale +
                                    Vector3.new(Thing[4], Thing[5], Thing[6])
                            Thing[1].Transparency =
                                Thing[1].Transparency + Thing[3]
                        elseif Thing[2] == "Elec" then
                            local Mesh = Thing[1].Mesh
                            Mesh.Scale =
                                Mesh.Scale +
                                    Vector3.new(Thing[7], Thing[8], Thing[9])
                            Thing[1].Transparency =
                                Thing[1].Transparency + Thing[3]
                        elseif Thing[2] == "Disappear" then
                            Thing[1].Transparency =
                                Thing[1].Transparency + Thing[3]
                        elseif Thing[2] == "Shatter" then
                            Thing[1].Transparency =
                                Thing[1].Transparency + Thing[3]
                            Thing[4] = Thing[4] * CFrame.new(0, Thing[7], 0)
                            Thing[1].CFrame =
                                Thing[4] *
                                    CFrame.fromEulerAnglesXYZ(Thing[6], 0, 0)
                            Thing[6] = Thing[6] + Thing[5]
                        end
                    else
                        Part.Parent = nil
                        table.remove(Effects, e)
                    end
                end
            end
        end
    end
end
-------------------------------------------------------
-- End Animations And Script--
-------------------------------------------------------
