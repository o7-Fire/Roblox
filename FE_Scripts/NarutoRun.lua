function LoadLibrary(a)
    return loadstring(game:HttpGet("https://pastebin.com/raw/UfzKgS6T", true))()
end

loadstring(game:GetObjects("rbxassetid://4480871791")[1].Source)()

--[[
==================================]}
//{Script: Memuto          
//{User: Solavenge               
==================================]}
//{Controls:              
// F - Toggle Memes
==================================]}
--]]

Player = game:GetService("Players").LocalPlayer
Character = workspace.CloneCharacter
PlayerGui = Player.PlayerGui
Backpack = Player.Backpack
Torso = Character.Torso
Head = Character.Head
Humanoid = Character.Humanoid
m = Instance.new('Model', Character)
LeftArm = Character["Left Arm"]
LeftLeg = Character["Left Leg"]
RightArm = Character["Right Arm"]
RightLeg = Character["Right Leg"]
LS = Torso["Left Shoulder"]
LH = Torso["Left Hip"]
RS = Torso["Right Shoulder"]
RH = Torso["Right Hip"]
Neck = Torso.Neck
it = Instance.new
attacktype = 1
vt = Vector3.new
cf = CFrame.new
euler = CFrame.fromEulerAnglesXYZ
angles = CFrame.Angles
necko = cf(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
necko2 = cf(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
LHC0 = cf(-1, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
LHC1 = cf(-0.5, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
RHC0 = cf(1, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
RHC1 = cf(0.5, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
RootPart = Character.HumanoidRootPart
RootJoint = RootPart.RootJoint
RootCF = euler(-1.57, 0, 3.14)
attack = false
attackdebounce = false
deb = false
equipped = true
hand = false
MMouse = nil
combo = 0
mana = 0
cam = workspace.CurrentCamera
RocketTarget = nil
Targetting = false
trispeed = .2
attackmode = 'none'
local idle = 0
local Anim = "Idle"
local Effects = {}
local gun = false
local shoot = false
local issprinting = false
local memeing = false
player = nil
mouse = Player:GetMouse()
-- save shoulders 
RSH, LSH = nil, nil
-- welds 
RW, LW = Instance.new("Weld"), Instance.new("Weld")
RW.Name = "Right Shoulder"
LW.Name = "Left Shoulder"
LH = Torso["Left Hip"]
RH = Torso["Right Hip"]
TorsoColor = Torso.BrickColor
function NoOutline(Part)
    Part.TopSurface, Part.BottomSurface, Part.LeftSurface, Part.RightSurface, Part.FrontSurface, Part.BackSurface =
        10, 10, 10, 10, 10, 10
end
player = Player
ch = Character
RSH = ch.Torso["Right Shoulder"]
LSH = ch.Torso["Left Shoulder"]
-- 
RSH.Parent = nil
LSH.Parent = nil
-- 
RW.Name = "Right Shoulder"
RW.Part0 = ch.Torso
RW.C0 = cf(1.5, 0.5, 0) -- * CFrame.fromEulerAnglesXYZ(1.3, 0, -0.5) 
RW.C1 = cf(0, 0.5, 0)
RW.Part1 = ch["Right Arm"]
RW.Parent = ch.Torso
-- 
LW.Name = "Left Shoulder"
LW.Part0 = ch.Torso
LW.C0 = cf(-1.5, 0.5, 0) -- * CFrame.fromEulerAnglesXYZ(1.7, 0, 0.8) 
LW.C1 = cf(0, 0.5, 0)
LW.Part1 = ch["Left Arm"]
LW.Parent = ch.Torso

if Humanoid:findFirstChild("Animate") then
    Humanoid:findFirstChild("Animate"):Destroy()
elseif Character:findFirstChild("Animate") then
    Character:findFirstChild("Animate"):Destroy()
end

local WEEB = Instance.new("Sound", Torso)
WEEB.Volume = 0
WEEB.Pitch = 0
WEEB.SoundId = "http://www.roblox.com/asset/?id=186860903"
WEEB.Looped = true
wait()
WEEB:play()

local Stats = Instance.new("BoolValue")
Stats.Name = "Stats"
Stats.Parent = Character
local Atk = Instance.new("NumberValue")
Atk.Name = "Damage"
Atk.Parent = Stats
Atk.Value = 1
local Def = Instance.new("NumberValue")
Def.Name = "Defense"
Def.Parent = Stats
Def.Value = 1
local Speed = Instance.new("NumberValue")
Speed.Name = "Speed"
Speed.Parent = Stats
Speed.Value = 1
local Mvmt = Instance.new("NumberValue")
Mvmt.Name = "Movement"
Mvmt.Parent = Stats
Mvmt.Value = 1

local donum = 0

function part(formfactor, parent, reflectance, transparency, brickcolor, name,
              size)
    local fp = it("Part")
    fp.formFactor = formfactor
    fp.Parent = parent
    fp.Reflectance = reflectance
    fp.Transparency = transparency
    fp.CanCollide = false
    fp.Locked = true
    fp.BrickColor = brickcolor
    fp.Name = name
    fp.Size = size
    fp.Position = Torso.Position
    NoOutline(fp)
    fp.Material = "SmoothPlastic"
    fp:BreakJoints()
    return fp
end

function part2(formfactor, parent, material, reflectance, transparency,
               brickcolor, name, size)
    local fp = Instance.new("Part")
    fp.formFactor = formfactor
    fp.Parent = parent
    fp.Reflectance = reflectance
    fp.Transparency = transparency
    fp.CanCollide = false
    fp.Locked = true
    fp.BrickColor = BrickColor.new(tostring(brickcolor))
    fp.Name = name
    fp.Size = size
    fp.Position = Character.Torso.Position
    fp.Material = material

    NoOutline(fp)
    return fp
end

function mesh(Mesh, part, meshtype, meshid, offset, scale)
    local mesh = it(Mesh)
    mesh.Parent = part
    if Mesh == "SpecialMesh" then
        mesh.MeshType = meshtype
        mesh.MeshId = meshid
    end
    mesh.Offset = offset
    mesh.Scale = scale
    return mesh
end

function weld(parent, part0, part1, c0)
    local weld = it("Weld")
    weld.Parent = parent
    weld.Part0 = part0
    weld.Part1 = part1
    weld.C0 = c0
    return weld
end

function weld2(parent, part0, part1, c0, c1)
    local Weld = Instance.new("Weld")
    Weld.Parent = parent
    Weld.Part0 = part0
    Weld.Part1 = part1
    Weld.C0 = c0
    Weld.C1 = c1

    return Weld
end

local Color1 = Torso.BrickColor

local bodvel = Instance.new("BodyVelocity")
local bg = Instance.new("BodyGyro")

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"

script:WaitForChild("Heartbeat")

frame = 1 / 60
tf = 0
allowframeloss = true
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()

game:GetService("RunService").Heartbeat:connect(
    function(s, p)
        tf = tf + s
        if tf >= frame then
            if allowframeloss then
                script.Heartbeat:Fire()
                lastframe = tick()
            else
                for i = 1, math.floor(tf / frame) do
                    script.Heartbeat:Fire()
                end
                lastframe = tick()
            end
            if tossremainder then
                tf = 0
            else
                tf = tf - frame * math.floor(tf / frame)
            end
        end
    end)

function swait(num)
    if num == 0 or num == nil then
        ArtificialHB.Event:wait()
    else
        for i = 0, num do ArtificialHB.Event:wait() end
    end
end

so = function(id, par, vol, pit)
    coroutine.resume(coroutine.create(function()
        local sou = Instance.new("Sound", par or workspace)
        sou.Volume = vol
        sou.Pitch = pit or 1
        sou.SoundId = id
        swait()
        sou:play()
        game:GetService("Debris"):AddItem(sou, 6)
    end))
end

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
        if m11 > m00 then i = 1 end
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
    local startInterp, finishInterp;
    if cosTheta >= 0.0001 then
        if (1 - cosTheta) > 0.0001 then
            local theta = math.acos(cosTheta)
            local invSinTheta = 1 / math.sin(theta)
            startInterp = math.sin((1 - t) * theta) * invSinTheta
            finishInterp = math.sin(t * theta) * invSinTheta
        else
            startInterp = 1 - t
            finishInterp = t
        end
    else
        if (1 + cosTheta) > 0.0001 then
            local theta = math.acos(-cosTheta)
            local invSinTheta = 1 / math.sin(theta)
            startInterp = math.sin((t - 1) * theta) * invSinTheta
            finishInterp = math.sin(t * theta) * invSinTheta
        else
            startInterp = t - 1
            finishInterp = t
        end
    end
    return a[1] * startInterp + b[1] * finishInterp,
           a[2] * startInterp + b[2] * finishInterp,
           a[3] * startInterp + b[3] * finishInterp,
           a[4] * startInterp + b[4] * finishInterp
end

function rayCast(Pos, Dir, Max, Ignore) -- Origin Position , Direction, MaxDistance , IgnoreDescendants
    return game:service("Workspace"):FindPartOnRay(
               Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore)
end

Damagefunc = function(Part, hit, minim, maxim, knockback, Type, Property, Delay,
                      HitSound, HitPitch) -- bm1
    if hit.Parent == nil then return end
    local h = hit.Parent:FindFirstChild("Humanoid")
    for _, v in pairs(hit.Parent:children()) do
        if v:IsA("Humanoid") then h = v end
    end
    if h ~= nil and hit.Parent.Name ~= Character.Name and
        hit.Parent:FindFirstChild("Torso") ~= nil then
        if hit.Parent:findFirstChild("DebounceHit") ~= nil then
            if hit.Parent.DebounceHit.Value == true then return end
        end
        if h.MaxHealth >= math.huge then hit:BreakJoints() end
        --[[                if game.Players:GetPlayerFromCharacter(hit.Parent)~=nil then
                        return
                end]]
        --                        hs(hit,1.2) 
        local c = Instance.new("ObjectValue")
        c.Name = "creator"
        c.Value = game:service("Players").LocalPlayer
        c.Parent = h

        game:GetService("Debris"):AddItem(c, .5)
        if HitSound ~= nil and HitPitch ~= nil then
            so(HitSound, hit, 1, HitPitch)
        end
        local Damage = math.random(minim, maxim)
        --                h:TakeDamage(Damage)
        local blocked = false
        local block = hit.Parent:findFirstChild("Block")
        if block ~= nil then
            if block.className == "IntValue" then
                if block.Value > 0 then
                    blocked = true
                    block.Value = block.Value - 1
                    print(block.Value)
                end
            end
        end
        if blocked == false then
            --                h:TakeDamage(Damage)
            h.Health = h.Health - Damage
            if Damage ~= 0 then
                ShowDamage2(
                    (Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 2)).p +
                        Vector3.new(0, 1.5, 0)), -Damage, 1.5,
                    BrickColor.new("Institutional white").Color)
            end
        else
            h.Health = h.Health - (Damage / 2)
            if Damage ~= 0 then
                ShowDamage2(
                    (Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 2)).p +
                        Vector3.new(0, 1.5, 0)), -Damage, 1.5,
                    BrickColor.new("Institutional white").Color)
            end
        end
        if Type == "Knockdown" then
            local hum = hit.Parent.Humanoid
            hum.PlatformStand = true
            coroutine.resume(coroutine.create(
                                 function(HHumanoid)
                    swait(1)
                    HHumanoid.PlatformStand = false
                end), hum)
            local angle = (hit.Position -
                              (Property.Position + Vector3.new(0, 0, 0))).unit
            local bodvol = Instance.new("BodyVelocity")
            bodvol.velocity = angle * knockback
            bodvol.P = 5000
            bodvol.maxForce = Vector3.new(8e+003, 8e+003, 8e+003)
            bodvol.Parent = hit

            local rl = Instance.new("BodyAngularVelocity")
            rl.P = 3000
            rl.maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000
            rl.angularvelocity = Vector3.new(math.random(-10, 10),
                                             math.random(-10, 10),
                                             math.random(-10, 10))
            rl.Parent = hit

            game:GetService("Debris"):AddItem(bodvol, .5)
            game:GetService("Debris"):AddItem(rl, .5)
        elseif Type == "Plat" then
            local hum = hit.Parent.Humanoid
            hum.PlatformStand = true
            coroutine.resume(coroutine.create(
                                 function(HHumanoid)
                    swait(2)
                    HHumanoid.PlatformStand = false
                end), hum)

            local rl = Instance.new("BodyAngularVelocity")
            rl.P = 3000
            rl.maxTorque = Vector3.new(100, 100, 100) * 500
            rl.angularvelocity = Vector3.new(math.random(-10, 10),
                                             math.random(-10, 10),
                                             math.random(-10, 10))
            rl.Parent = hit

            game:GetService("Debris"):AddItem(rl, .5)
        elseif Type == "Normal" then
            local vp = Instance.new("BodyVelocity")
            vp.P = 500
            vp.maxForce = Vector3.new(math.huge, 0, math.huge)
            vp.velocity = Property.CFrame.lookVector * knockback +
                              Property.Velocity / 1.05

            if knockback > 0 then vp.Parent = hit.Parent.Torso end
            game:GetService("Debris"):AddItem(vp, .5)
        elseif Type == "Up" then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.velocity = vt(0, 20, 0)
            bodyVelocity.P = 5000
            bodyVelocity.maxForce = Vector3.new(8e+003, 8e+003, 8e+003)
            bodyVelocity.Parent = hit

            game:GetService("Debris"):AddItem(bodyVelocity, .5)
        elseif Type == "Snare" then
            local bp = Instance.new("BodyPosition")
            bp.P = 2000
            bp.D = 100
            bp.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            bp.position = hit.Parent.Torso.Position
            bp.Parent = hit.Parent.Torso
            game:GetService("Debris"):AddItem(bp, 1)

        elseif Type == "Freeze" then
            local BodPos = Instance.new("BodyPosition")
            BodPos.P = 50000
            BodPos.D = 1000
            BodPos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            BodPos.position = hit.Parent.Torso.Position
            BodPos.Parent = hit.Parent.Torso

            local BodGy = Instance.new("BodyGyro")
            BodGy.maxTorque = Vector3.new(4e+005, 4e+005, 4e+005) * math.huge
            BodGy.P = 20e+003
            BodGy.Parent = hit.Parent.Torso
            BodGy.cframe = hit.Parent.Torso.CFrame

            hit.Parent.Torso.Anchored = true
            coroutine.resume(coroutine.create(
                                 function(Part)
                    swait(1.5)
                    Part.Anchored = false
                end), hit.Parent.Torso)
            game:GetService("Debris"):AddItem(BodPos, 3)
            game:GetService("Debris"):AddItem(BodGy, 3)

        elseif Type == "Target" then
            if Targetting == false then
                ZTarget = hit.Parent.Torso
                coroutine.resume(coroutine.create(
                                     function(Part)
                        so("http://www.roblox.com/asset/?id=15666462", Part, 1,
                           1.5)
                        swait(5)
                        so("http://www.roblox.com/asset/?id=15666462", Part, 1,
                           1.5)
                    end), ZTarget)
                TargHum = ZTarget.Parent:findFirstChild("Humanoid")
                targetgui = Instance.new("BillboardGui")
                targetgui.Parent = ZTarget
                targetgui.Size = UDim2.new(10, 100, 10, 100)
                targ = Instance.new("ImageLabel")
                targ.Parent = targetgui
                targ.BackgroundTransparency = 1
                targ.Image = "rbxassetid://4834067"
                targ.Size = UDim2.new(1, 0, 1, 0)
                cam.CameraType = "Scriptable"
                cam.CoordinateFrame =
                    CFrame.new(Head.CFrame.p, ZTarget.Position)
                dir = Vector3.new(cam.CoordinateFrame.lookVector.x, 0,
                                  cam.CoordinateFrame.lookVector.z)
                workspace.CurrentCamera.CoordinateFrame =
                    CFrame.new(Head.CFrame.p, ZTarget.Position)
                Targetting = true
                RocketTarget = ZTarget
                for i = 1, Property do
                    if Humanoid.Health > 0 and Character.Parent ~= nil and
                        TargHum.Health > 0 and TargHum.Parent ~= nil and
                        Targetting == true then swait() end
                    cam.CoordinateFrame =
                        CFrame.new(Head.CFrame.p, ZTarget.Position)
                    dir = Vector3.new(cam.CoordinateFrame.lookVector.x, 0,
                                      cam.CoordinateFrame.lookVector.z)
                    cam.CoordinateFrame =
                        CFrame.new(Head.CFrame.p, ZTarget.Position) *
                            cf(0, 5, 10) * euler(-0.3, 0, 0)
                end
                Targetting = false
                RocketTarget = nil
                targetgui.Parent = nil
                cam.CameraType = "Custom"
            end
        end

        local debounce = Instance.new("BoolValue")
        debounce.Name = "DebounceHit"
        debounce.Parent = hit.Parent
        debounce.Value = true
        game:GetService("Debris"):AddItem(debounce, Delay)
        c = Instance.new("ObjectValue")
        c.Name = "creator"
        c.Value = Player
        c.Parent = h
        game:GetService("Debris"):AddItem(c, .5)
    end
end

function ShowDamage2(Pos, Text, Time, Color)
    local Rate = (1 / 30)
    local Pos = (Pos or Vector3.new(0, 0, 0))
    local Text = (Text or "")
    local Time = (Time or 2)
    local Color = (Color or Color3.new(1, 0, 0))
    local EffectPart = part2("Custom", workspace, "Neon", 0, 1,
                             BrickColor.new(Color), "Effect", vt(0, 0, 0))
    EffectPart.Anchored = true
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Size = UDim2.new(3, 0, 3, 0)
    BillboardGui.Adornee = EffectPart
    BillboardGui.Parent = EffectPart

    local TextLabel = Instance.new("TextLabel")
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Text = Text
    TextLabel.TextColor3 = Color
    TextLabel.TextScaled = true
    TextLabel.Font = Enum.Font.ArialBold
    TextLabel.Parent = BillboardGui

    game.Debris:AddItem(EffectPart, (Time + 0.1))
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

function BlastEffect(brickcolor, cframe, x1, y1, z1, x2, y2, z2)
    local prt = part2(3, workspace, "Neon", 0, 0, brickcolor, "Effect",
                      vt(0.5, 0.5, 0.5))
    prt.Anchored = true
    prt.CFrame = cframe
    local msh = mesh("SpecialMesh", prt, "FileMesh",
                     "http://www.roblox.com/asset/?id=20329976", vt(0, 0, 0),
                     vt(x1, y1, z1))
    coroutine.resume(coroutine.create(function()
        for i = 0, 1, 0.05 do
            wait()
            prt.Transparency = i
            msh.Scale = msh.Scale + vt(x2, y2, z2)
        end
        prt.Parent = nil
    end))
end

function weld(parent, part0, part1, c0, c1)
    local Weld = Instance.new("Weld")
    Weld.Parent = parent
    Weld.Part0 = part0
    Weld.Part1 = part1
    Weld.C0 = c0
    Weld.C1 = c1

    return Weld
end

function MagniDamage(Hit, Part, magni, mindam, maxdam, knock, Type)
    for _, c in pairs(workspace:children()) do
        local hum = c:findFirstChild("Humanoid")
        if hum ~= nil then
            local head = c:findFirstChild("Torso")
            if head ~= nil then
                local targ = head.Position - Part.Position
                local mag = targ.magnitude
                if mag <= magni and c.Name ~= Player.Name then
                    Damagefunc(head, head, mindam, maxdam, knock, Type,
                               RootPart, .2, 1, 3)
                end
            end
        end
    end
end

function MagicCircle(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
    local prt = part2(3, workspace, "Neon", 0, 0, brickcolor, "Effect",
                      vt(0.5, 0.5, 0.5))
    prt.Anchored = true
    prt.CFrame = cframe
    local msh = mesh("SpecialMesh", prt, "Sphere", "", vt(0, 0, 0),
                     vt(x1, y1, z1))
    game:GetService("Debris"):AddItem(prt, 2)
    coroutine.resume(coroutine.create(function(Part, Mesh)
        for i = 0, 1, delay do
            swait()
            Part.CFrame = Part.CFrame
            Part.Transparency = i
            Mesh.Scale = Mesh.Scale + vt(x3, y3, z3)
        end
        Part.Parent = nil
    end), prt, msh)
end

function MagicBlock(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
    local prt = part(3, workspace, "SmoothPlastic", 0, 0, brickcolor, "Effect",
                     vt())
    prt.Anchored = true
    prt.CFrame = cframe
    local msh = mesh("BlockMesh", prt, "", "", vt(0, 0, 0), vt(x1, y1, z1))
    game:GetService("Debris"):AddItem(prt, 2)
    coroutine.resume(coroutine.create(function(Part, Mesh)
        for i = 0, 1, delay do
            swait()
            Part.CFrame = Part.CFrame *
                              euler(math.random(-50, 50), math.random(-50, 50),
                                    math.random(-50, 50))
            Part.Transparency = i
            Mesh.Scale = Mesh.Scale + vt(x3, y3, z3)
        end
        Part.Parent = nil
    end), prt, msh)
end

user = game:service 'Players'.localPlayer
char = workspace.CloneCharacter
mouse = user:GetMouse()

local function weldBetween(a, b, name)
    local weld = Instance.new("ManualWeld")
    weld.Part0 = a
    weld.Part1 = b
    weld.C0 = CFrame.new()
    weld.C1 = b.CFrame:inverse() * a.CFrame
    weld.Parent = a
    weld.Name = name or 'weldb1'
    weld.Parent = m
    return weld;
end

player = game.Players.localPlayer
char = workspace.CloneCharacter
Effects = {}
vt = Vector3.new
cf = CFrame.new
euler = CFrame.fromEulerAnglesXYZ
m = Instance.new("Model", char)

mouse.Button1Down:connect(function() print("NEIN") end)

local mdel = false

mouse.KeyDown:connect(function(k)
    k = k:lower()
    if k == 'f' then if attack == false then ToggleMemes() end end
end)

function ToggleMemes()
    if memeing == true and mdel == false then
        memeing = false
        issprinting = false
        Humanoid.WalkSpeed = 16
        mdel = true
        for i = 1, 0, -0.1 do
            wait(0.05)
            WEEB.Volume = i
        end
        WEEB.Pitch = 0
        mdel = false
    elseif memeing == false and mdel == false then
        memeing = true
        issprinting = true
        Humanoid.WalkSpeed = 35
        WEEB.Pitch = 1
        mdel = true
        for i = 0, 1, .1 do
            wait(0.05)
            WEEB.Volume = i
        end
        mdel = false
    end
end

local function CFrameFromTopBack(at, top, back)
    local right = top:Cross(back)
    return CFrame.new(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y,
                      back.y, right.z, top.z, back.z)
end

function Triangle(a, b, c)
    local edg1 = (c - a):Dot((b - a).unit)
    local edg2 = (a - b):Dot((c - b).unit)
    local edg3 = (b - c):Dot((a - c).unit)
    if edg1 <= (b - a).magnitude and edg1 >= 0 then
        a, b, c = a, b, c
    elseif edg2 <= (c - b).magnitude and edg2 >= 0 then
        a, b, c = b, c, a
    elseif edg3 <= (a - c).magnitude and edg3 >= 0 then
        a, b, c = c, a, b
    else
        assert(false, "unreachable")
    end

    local len1 = (c - a):Dot((b - a).unit)
    local len2 = (b - a).magnitude - len1
    local width = (a + (b - a).unit * len1 - c).magnitude

    local maincf =
        CFrameFromTopBack(a, (b - a):Cross(c - b).unit, -(b - a).unit)

    local list = {}

    if len1 > 0.01 then
        local w1 = Instance.new('WedgePart', m)
        game:GetService("Debris"):AddItem(w1, 5)
        w1.Material = "SmoothPlastic"
        w1.FormFactor = 'Custom'
        w1.BrickColor = TorsoColor
        w1.Transparency = 0
        w1.Reflectance = 0
        w1.Material = "SmoothPlastic"
        w1.CanCollide = false
        NoOutline(w1)
        local sz = Vector3.new(0.2, width, len1)
        w1.Size = sz
        local sp = Instance.new("SpecialMesh", w1)
        sp.MeshType = "Wedge"
        sp.Scale = Vector3.new(0, 1, 1) * sz / w1.Size
        w1:BreakJoints()
        w1.Anchored = true
        w1.Parent = workspace
        w1.Transparency = 0.7
        table.insert(Effects, {w1, "Disappear", .01})
        w1.CFrame = maincf * CFrame.Angles(math.pi, 0, math.pi / 2) *
                        CFrame.new(0, width / 2, len1 / 2)
        table.insert(list, w1)
    end

    if len2 > 0.01 then
        local w2 = Instance.new('WedgePart', m)
        game:GetService("Debris"):AddItem(w2, 5)
        w2.Material = "SmoothPlastic"
        w2.FormFactor = 'Custom'
        w2.BrickColor = TorsoColor
        w2.Transparency = 0
        w2.Reflectance = 0
        w2.Material = "SmoothPlastic"
        w2.CanCollide = false
        NoOutline(w2)
        local sz = Vector3.new(0.2, width, len2)
        w2.Size = sz
        local sp = Instance.new("SpecialMesh", w2)
        sp.MeshType = "Wedge"
        sp.Scale = Vector3.new(0, 1, 1) * sz / w2.Size
        w2:BreakJoints()
        w2.Anchored = true
        w2.Parent = workspace
        w2.Transparency = 0.7
        table.insert(Effects, {w2, "Disappear", .01})
        w2.CFrame = maincf * CFrame.Angles(math.pi, math.pi, -math.pi / 2) *
                        CFrame.new(0, width / 2, -len1 - len2 / 2)
        table.insert(list, w2)
    end
    return unpack(list)
end

function NoOutline(Part)
    Part.TopSurface, Part.BottomSurface, Part.LeftSurface, Part.RightSurface, Part.FrontSurface, Part.BackSurface =
        10, 10, 10, 10, 10, 10
end

local sine = 0
local change = 1
local val = 0

if #Effects > 0 then
    -- table.insert(Effects,{prt,"Block1",delay})
    for e = 1, #Effects do
        if Effects[e] ~= nil then
            -- for j=1,#Effects[e] do
            local Thing = Effects[e]
            if Thing ~= nil then
                local Part = Thing[1]
                local Mode = Thing[2]
                local Delay = Thing[3]
                local IncX = Thing[4]
                local IncY = Thing[5]
                local IncZ = Thing[6]
                if Thing[1].Transparency <= 1 then
                    if Thing[2] == "Block1" then
                        Thing[1].CFrame =
                            Thing[1].CFrame *
                                euler(math.random(-50, 50),
                                      math.random(-50, 50), math.random(-50, 50))
                        Mesh = Thing[1].Mesh
                        Mesh.Scale = Mesh.Scale +
                                         vt(Thing[4], Thing[5], Thing[6])
                        Thing[1].Transparency = Thing[1].Transparency + Thing[3]
                    elseif Thing[2] == "Cylinder" then
                        Mesh = Thing[1].Mesh
                        Mesh.Scale = Mesh.Scale +
                                         vt(Thing[4], Thing[5], Thing[6])
                        Thing[1].Transparency = Thing[1].Transparency + Thing[3]
                    elseif Thing[2] == "Blood" then
                        Mesh = Thing[1].Mesh
                        Thing[1].CFrame = Thing[1].CFrame * cf(0, .5, 0)
                        Mesh.Scale = Mesh.Scale +
                                         vt(Thing[4], Thing[5], Thing[6])
                        Thing[1].Transparency = Thing[1].Transparency + Thing[3]
                    elseif Thing[2] == "Elec" then
                        Mesh = Thing[1].Mesh
                        Mesh.Scale = Mesh.Scale +
                                         vt(Thing[7], Thing[8], Thing[9])
                        Thing[1].Transparency = Thing[1].Transparency + Thing[3]
                    elseif Thing[2] == "Disappear" then
                        Thing[1].Transparency = Thing[1].Transparency + Thing[3]
                    end
                else
                    Part.Parent = nil
                    table.remove(Effects, e)
                end
            end
            -- end
        end
    end
end

cn = CFrame.new
local NeckCF = cn(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
local RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
local RHCF = CFrame.fromEulerAnglesXYZ(0, 1.6, 0)
local LHCF = CFrame.fromEulerAnglesXYZ(0, -1.6, 0)

local mananum = 0
while true do
    swait()
    sine = sine + change
    local torvel = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude
    local velderp = RootPart.Velocity.y
    hitfloor, posfloor = rayCast(RootPart.Position, (CFrame.new(
                                     RootPart.Position,
                                     RootPart.Position - Vector3.new(0, 1, 0))).lookVector,
                                 4, Character)
    if equipped == true or equipped == false then
        if attack == false then
            idle = idle + 1
        else
            idle = 0
        end
        if idle >= 500 then
            if attack == false then
                -- Sheath()
            end
        end
        if RootPart.Velocity.y > 1 and hitfloor == nil then
            Anim = "Jump"
            if attack == false then
                Neck.C0 = clerp(Neck.C0, necko * euler(-0.2, 0, 0), .3)
                Neck.C1 = clerp(Neck.C1, necko2 * euler(0, 0, 0), .3)
                RootJoint.C0 = clerp(RootJoint.C0, RootCF * euler(0, 0, 0), .3)
                RW.C0 = clerp(RW.C0, cf(1.5, 0.5, 0) * euler(-.5, 0, 0.5), .3)
                RW.C1 = clerp(LW.C1, cf(0, 0.5, 0) * euler(0, 0, 0), .3)
                LW.C0 = clerp(LW.C0, cf(-1.5, 0.5, 0) * euler(-.5, 0, -0.5), .3)
                LW.C1 = clerp(LW.C1, cf(0, 0.5, 0) * euler(0, 0, 0), .3)
                RH.C0 = clerp(RH.C0, cf(1, -1, -.3) * euler(-0.5, 1.57, 0) *
                                  euler(-.2, 0, 0), .3)
                LH.C0 = clerp(LH.C0, cf(-1, -1, -.3) * euler(-0.5, -1.57, 0) *
                                  euler(-.2, 0, 0), .3)
            end
        elseif RootPart.Velocity.y < -1 and hitfloor == nil then
            Anim = "Fall"
            if attack == false then
                Neck.C0 = clerp(Neck.C0, necko * euler(0.4, 0, 0), .3)
                Neck.C1 = clerp(Neck.C1, necko2 * euler(0, 0, 0), .3)
                RootJoint.C0 = clerp(RootJoint.C0, RootCF * euler(0, 0, 0), .3)
                RW.C0 = clerp(RW.C0, cf(1.5, 0.5, 0) * euler(0.3, 0, 0.2), .3)
                RW.C1 = clerp(LW.C1, cf(0, 0.5, 0) * euler(0, 0, 0), .3)
                LW.C0 = clerp(LW.C0, cf(-1.5, 0.5, 0) * euler(0.3, 0, -0.2), .3)
                LW.C1 = clerp(LW.C1, cf(0, 0.5, 0) * euler(0, 0, 0), .3)
                RH.C0 = clerp(RH.C0, cf(1, -1, 0) * euler(0.4, 1.57, 0), .3)
                LH.C0 = clerp(LH.C0, cf(-1, -1, 0) * euler(-0.2, -1.57, 0), .3)
            end
        elseif torvel < 1 and hitfloor ~= nil then
            Anim = "Idle"
            if attack == false then
                RootJoint.C0 = clerp(RootJoint.C0,
                                     RootCF *
                                         cn(0, 0,
                                            -0.1 + 0.1 * math.cos(sine / 25)) *
                                         angles(math.rad(0), math.rad(0),
                                                math.rad(5)), .3)
                Torso.Neck.C0 = clerp(Torso.Neck.C0, NeckCF *
                                          angles(
                                              math.rad(
                                                  5 - 2 * math.cos(sine / 25)),
                                              math.rad(0), math.rad(-5)), .3)
                RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) *
                                  angles(math.rad(0), math.rad(0),
                                         math.rad(5 + 3 * math.cos(sine / 25))),
                              0.3)
                LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) *
                                  angles(math.rad(0), math.rad(0),
                                         math.rad(-5 - 3 * math.cos(sine / 25))),
                              0.3)
                RH.C0 = clerp(RH.C0,
                              cn(1, -.9 - 0.1 * math.cos(sine / 25), 0) * RHCF *
                                  angles(math.rad(-2 + 2 * math.cos(sine / 25)),
                                         math.rad(-5),
                                         math.rad(0 + 2 * math.cos(sine / 25))),
                              .3)
                LH.C0 = clerp(LH.C0,
                              cn(-1, -.9 - 0.1 * math.cos(sine / 25), 0) * LHCF *
                                  angles(math.rad(-2 + 2 * math.cos(sine / 25)),
                                         math.rad(-5),
                                         math.rad(0 + 2 * math.cos(sine / 25))),
                              .3)
            end
        elseif torvel > 2 and torvel < 22 and hitfloor ~= nil then
            Anim = "Walk"
            if attack == false then
                RootJoint.C0 = clerp(RootJoint.C0,
                                     RootCF *
                                         cn(0, 0,
                                            -0.05 + .1 * math.cos(sine / 5)) *
                                         angles(math.rad(5), math.rad(0) +
                                                    RootPart.RotVelocity.Y / 30,
                                                math.rad(5 * math.cos(sine / 10))),
                                     .2)
                Torso.Neck.C0 = clerp(Torso.Neck.C0,
                                      NeckCF * angles(math.rad(-3), math.rad(0),
                                                      math.rad(
                                                          -5 *
                                                              math.cos(sine / 10)) +
                                                          RootPart.RotVelocity.Y /
                                                          15), .2)
                RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0) *
                                  angles(math.rad(-10 * math.cos(sine / 13)),
                                         math.rad(0),
                                         math.rad(4 * math.cos(sine / 13))), .2)
                LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0) *
                                  angles(math.rad(10 * math.cos(sine / 13)),
                                         math.rad(0),
                                         math.rad(4 * math.cos(sine / 13))), .2)
                RH.C0 = clerp(RH.C0,
                              cn(1, -1 + .1 * math.cos(sine / 5), 0) * RHCF *
                                  angles(math.rad(-2), math.rad(0),
                                         math.rad(30 * math.cos(sine / 7))), .3)
                LH.C0 = clerp(LH.C0,
                              cn(-1, -1 + .1 * math.cos(sine / 5), 0) * LHCF *
                                  angles(math.rad(-2), math.rad(0),
                                         math.rad(30 * math.cos(sine / 7))), .3)
            end
        elseif torvel >= 22 and issprinting == true and hitfloor ~= nil then
            Anim = "Run"
            if attack == false then
                RootJoint.C0 = clerp(RootJoint.C0,
                                     RootCF *
                                         cn(0, 0.5, -0.05 + .1 * 2.5 *
                                                math.cos(sine / 2)) *
                                         angles(math.rad(50), math.rad(2) +
                                                    RootPart.RotVelocity.Y / 30,
                                                math.rad(5 * math.cos(sine / 2))),
                                     .2)
                Torso.Neck.C0 = clerp(Torso.Neck.C0,
                                      cn(0, 1.1, -0.2, -1, -0, -0, 0, 0, 1, 0,
                                         1, 0) *
                                          angles(math.rad(-50), math.rad(0),
                                                 math.rad(
                                                     -5 * math.cos(sine / 10)) +
                                                     RootPart.RotVelocity.Y / 15),
                                      .2)
                RW.C0 = clerp(RW.C0, CFrame.new(1.5, 0.5, 0.4) *
                                  angles(math.rad(75 * math.cos(6 / 2)),
                                         math.rad(-5),
                                         math.rad(25 * math.cos(sine / 3))), .2)
                LW.C0 = clerp(LW.C0, CFrame.new(-1.5, 0.5, 0.4) *
                                  angles(math.rad(75 * math.cos(6 / 2)),
                                         math.rad(5),
                                         math.rad(25 * math.cos(sine / 3))), .2)
                RH.C0 = clerp(RH.C0,
                              cn(1, -1 + .1 * math.cos(sine / 5), 0) * RHCF *
                                  angles(math.rad(-2), math.rad(0),
                                         math.rad(55 * math.cos(sine / 3))), .3)
                LH.C0 = clerp(LH.C0,
                              cn(-1, -1 + .1 * math.cos(sine / 5), 0) * LHCF *
                                  angles(math.rad(-2), math.rad(0),
                                         math.rad(55 * math.cos(sine / 3))), .3)
            end
        end
    end
end
