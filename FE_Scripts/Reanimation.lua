--[[
   Original creator might be: not sure
   Edit by: dak#1111

   Made it less aids to read + some quality of life changes. :p
   (Who ever made this, for the love of god learn to not make spaghetti.)
--]] -- Variables and setting up the character
-- THIS IS NOT GODMODE
local rs = game:GetService("RunService")

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
char.Archivable = true
local cam = workspace:WaitForChild("Camera")

local fakechar = char:Clone()
fakechar.Head.face.Texture = ""
fakechar.Parent = workspace
cam.CameraSubject = fakechar:FindFirstChildOfClass("Humanoid")

local connections = {}
local kill = false

-- Align function
local function Align(Part1, Part0, Position, Angle)
    Part1.CanCollide = false

    local AlignPos = Instance.new("AlignPosition")
    AlignPos.ApplyAtCenterOfMass = true
    AlignPos.MaxForce = 100000
    AlignPos.MaxVelocity = math.huge
    AlignPos.ReactionForceEnabled = false
    AlignPos.Responsiveness = 200
    AlignPos.RigidityEnabled = false
    AlignPos.Parent = Part1

    local AlignOri = Instance.new("AlignOrientation")
    AlignOri.MaxAngularVelocity = math.huge
    AlignOri.MaxTorque = 100000
    AlignOri.PrimaryAxisOnly = false
    AlignOri.ReactionTorqueEnabled = false
    AlignOri.Responsiveness = 200
    AlignOri.RigidityEnabled = false
    AlignOri.Parent = Part1

    local at1 = Instance.new("Attachment")
    at1.Parent = Part1
    local at2 = Instance.new("Attachment")
    at2.Parent = Part0
    at2.Orientation = Angle
    at2.Position = Position

    AlignPos.Attachment0 = at1
    AlignPos.Attachment1 = at2
    AlignOri.Attachment0 = at1
    AlignOri.Attachment1 = at2
end

local success, fail = pcall(function()
    -- Make the fake character invisible
    for _, v in pairs(fakechar:GetDescendants()) do
        if v:IsA("Part") then
            v.Transparency = 1
        elseif v:IsA("SpecialMesh") then
            v.MeshId = "rbxassetid://0"
        end
    end

    -- Networking
    spawn(function()
        while rs.Stepped:wait() and not kill do
            settings().Physics.AllowSleep = false

            sethiddenproperty(plr, "MaximumSimulationRadius",
                              math.pow(math.huge, math.huge) * math.huge)
            sethiddenproperty(plr, "SimulationRadius",
                              math.pow(math.huge, math.huge) * math.huge)
        end
    end)

    -- Noclipping
    table.insert(connections, rs.Stepped:Connect(
                     function()
            fakechar:FindFirstChild("Head").CanCollide = false
            fakechar:FindFirstChild("Torso").CanCollide = false
            char.Head.CanCollide = false
            char.Torso.CanCollide = false
        end))
    table.insert(connections, rs.Heartbeat:Connect(
                     function()
            fakechar:FindFirstChild("Head").CanCollide = false
            fakechar:FindFirstChild("Torso").CanCollide = false
            char.Head.CanCollide = false
            char.Torso.CanCollide = false
        end))
    table.insert(connections, rs.RenderStepped:Connect(
                     function()
            fakechar:FindFirstChild("Head").CanCollide = false
            fakechar:FindFirstChild("Torso").CanCollide = false
            char.Head.CanCollide = false
            char.Torso.CanCollide = false
        end))

    -- Rigging
    char.Torso["Right Shoulder"]:Destroy()
    char.Torso["Left Shoulder"]:Destroy()
    char.Torso["Right Hip"]:Destroy()
    char.Torso["Left Hip"]:Destroy()
    char.HumanoidRootPart["RootJoint"]:Destroy()
    char.HumanoidRootPart.Anchored = true
    char.Humanoid.PlatformStand = true
    fakechar["Torso"].Position = char["Torso"].Position

    -- Align
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("Part") and v.Name ~= "Head" then
            if v.Name == "Torso" then
                Align(char[v.Name], fakechar[v.Name], Vector3.new(0, 0.5, 0),
                      Vector3.new(0, 0, 0))
            else
                Align(char[v.Name], fakechar[v.Name], Vector3.new(0, 0, 0),
                      Vector3.new(0, 0, 0))
            end
        end
    end
end)
if fail then
    warn(fail)
    plr.Character = char
    char:BreakJoints()
    fakechar:Destroy()

    kill = true
    return
end

-- Cleanup
fakechar.Humanoid.Died:Connect(function()
    plr.Character = char
    char:BreakJoints()
    fakechar:Destroy()

    kill = true

    for _, v in pairs(connections) do v:Disconnect() end
end)
char.Humanoid.Died:Connect(function()
    plr.Character = char
    char:BreakJoints()
    fakechar:Destroy()

    kill = true

    for _, v in pairs(connections) do v:Disconnect() end
end)

plr.Character = fakechar
wait(5)
math.randomseed(tick())
Player = game.Players.LocalPlayer
Character = Player.Character
hum = Character.Humanoid
LeftArm = Character["Left Arm"]
LeftLeg = Character["Left Leg"]
RightArm = Character["Right Arm"]
RightLeg = Character["Right Leg"]
Root = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Neck = Torso["Neck"]
mouse = Player:GetMouse()
walking = false
jumping = false
attacking = false
firsttime = false
tauntdebounce = false
position = nil
MseGuide = true
running = false
settime = 0
sine = 0
t = 0
ws = 18
change = 1
combo1 = true
dancing = false
equip = false
dgs = 75
combo2 = false
switch1 = true
switch2 = false
firsttime2 = false
combo3 = false
gunallowance = false
shooting = false
RunSrv = game:GetService("RunService")
RenderStepped = game:GetService("RunService").RenderStepped
removeuseless = game:GetService("Debris")

screenGui = Instance.new("ScreenGui")
screenGui.Parent = script.Parent

local TORSOLERP = Instance.new("ManualWeld")
TORSOLERP.Parent = Root
TORSOLERP.Part0 = Torso
TORSOLERP.C0 = CFrame.new(0, 0, 0) *
                   CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local ROOTLERP = Instance.new("ManualWeld")
ROOTLERP.Parent = Root
ROOTLERP.Part0 = Root
ROOTLERP.Part1 = Torso
ROOTLERP.C0 = CFrame.new(0, 0, 0) *
                  CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local RIGHTARMLERP = Instance.new("ManualWeld")
RIGHTARMLERP.Parent = RightArm
RIGHTARMLERP.Part0 = RightArm
RIGHTARMLERP.Part1 = Torso
RIGHTARMLERP.C0 = CFrame.new(-1.5, 0, -0) *
                      CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local LEFTARMLERP = Instance.new("ManualWeld")
LEFTARMLERP.Parent = LeftArm
LEFTARMLERP.Part0 = LeftArm
LEFTARMLERP.Part1 = Torso
LEFTARMLERP.C0 = CFrame.new(1.5, 0, -0) *
                     CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local RIGHTLEGLERP = Instance.new("ManualWeld")
RIGHTLEGLERP.Parent = RightLeg
RIGHTLEGLERP.Part0 = RightLeg
RIGHTLEGLERP.Part1 = Torso
RIGHTLEGLERP.C0 = CFrame.new(-0.5, 2, 0) *
                      CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local LEFTLEGLERP = Instance.new("ManualWeld")
LEFTLEGLERP.Parent = LeftLeg
LEFTLEGLERP.Part0 = LeftLeg
LEFTLEGLERP.Part1 = Torso
LEFTLEGLERP.C0 = CFrame.new(0.5, 2, 0) *
                     CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

local function weldBetween(a, b)
    local weld = Instance.new("ManualWeld", a)
    weld.Part0 = a
    weld.Part1 = b
    weld.C0 = a.CFrame:inverse() * b.CFrame
    return weld
end

coroutine.wrap(function() while wait() do hum.WalkSpeed = ws end end)()

coroutine.wrap(function()
    for i, v in pairs(Character:GetChildren()) do
        if v.Name == "Animate" then v:Remove() end
    end
end)()

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"
script:WaitForChild("Heartbeat")

frame = 1 / 60
tf = 0
allowframeloss = false
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
        game:service("RunService").Stepped:wait()
    else
        for i = 0, num do game:service("RunService").Stepped:wait() end
    end
end

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 'k' then
        if dancing then
            dancing = false
        else
            dancing = true
            ws = 0
            change = .5
            attacking = true
            lol90 = 0
            coroutine.wrap(function()
                while dancing do
                    lol90 = lol90 + 11
                    ROOTLERP.C0 = ROOTLERP.C0:Lerp(
                                      CFrame.new(1 * math.sin(sine / 10),
                                                 .1 + .8 * math.sin(sine / 3), 0) *
                                          CFrame.Angles(math.rad(0), math.rad(
                                                            0 *
                                                                math.sin(
                                                                    sine / 8)),
                                                        math.rad(
                                                            8 *
                                                                math.sin(
                                                                    sine / 7))),
                                      .25)
                    ROOTLERP.C1 = ROOTLERP.C1:lerp(
                                      CFrame.new(0 * math.sin(sine / 14), 0, 0) *
                                          CFrame.Angles(math.rad(0),
                                                        math.rad(lol90), 0), .25)
                    LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                         CFrame.new(1.4, 1.45, 0) *
                                             CFrame.Angles(math.rad(180),
                                                           math.rad(
                                                               -5 *
                                                                   math.sin(
                                                                       sine / 3)),
                                                           math.rad(
                                                               -6 *
                                                                   math.sin(
                                                                       sine / 3))),
                                         0.25)
                    RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(
                                          CFrame.new(-1.4, 1.45, 0) *
                                              CFrame.Angles(math.rad(180),
                                                            math.rad(
                                                                5 *
                                                                    math.sin(
                                                                        sine / 3)),
                                                            math.rad(
                                                                6 *
                                                                    math.sin(
                                                                        sine / 3))),
                                          0.25)
                    RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                          CFrame.new(-0.3, 2, 0) *
                                              CFrame.Angles(0, math.rad(0),
                                                            math.rad(
                                                                -10 + 5 *
                                                                    math.sin(
                                                                        sine / 3))),
                                          0.25)
                    LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                         CFrame.new(0.3, 2.0, 0) *
                                             CFrame.Angles(0, math.rad(0),
                                                           math.rad(
                                                               10 - 5 *
                                                                   math.sin(
                                                                       sine / 3))),
                                         0.25)
                    swait(0)
                end
                ws = 18
                ROOTLERP.C1 = CFrame.new(0, 0, 0) *
                                  CFrame.Angles(math.rad(0), math.rad(0),
                                                math.rad(0))
                attacking = false
            end)()
        end
    end
end)

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 'j' then
        if dancing then
            dancing = false
        else
            dancing = true
            ws = 7
            change = .5
            attacking = true
            g1 = Instance.new("BodyGyro", Root)
            g1.D = 175
            g1.P = 20000
            g1.MaxTorque = Vector3.new(0, 0, 0)
            robuxpile = Instance.new("Part", Torso)
            robuxpile.Size = Vector3.new(1, 1, 1)
            robuxpile.CFrame = LeftArm.CFrame
            robuxpile.CanCollide = false
            robuxpileweld = Instance.new("Weld", robuxpile)
            robuxpileweld.Part0 = robuxpile
            robuxpileweld.Part1 = Torso
            robuxpileweld.C0 = robuxpile.CFrame:inverse() * LeftArm.CFrame *
                                   CFrame.new(1, -.7, 1.5)
            mrobuxpile = Instance.new("SpecialMesh", robuxpile)
            mrobuxpile.MeshType = "FileMesh"
            mrobuxpile.Scale = Vector3.new(0.85, .85, .9)
            mrobuxpile.MeshId, mrobuxpile.TextureId =
                'http://www.roblox.com/asset/?id=1285245',
                'http://www.roblox.com/asset/?id=8587344'
            coroutine.wrap(function()
                coroutine.wrap(function()
                    while wait(.085) do
                        if not dancing then break end
                        local robux = Instance.new("Part", Torso)
                        robux.CFrame = robuxpile.CFrame *
                                           CFrame.Angles(math.rad(0),
                                                         math.rad(0),
                                                         math.rad(0))
                        robux.CanCollide = false
                        robux.Size = Vector3.new(1, 1, 1)
                        removeuseless:AddItem(robux, 6)
                        mrobux = Instance.new("SpecialMesh", robux)
                        mrobux.MeshType = "FileMesh"
                        mrobux.Scale = Vector3.new(1.25, 1.25, 1.25)
                        mrobux.MeshId, mrobux.TextureId =
                            'http://www.roblox.com/asset/?id=667285348',
                            'http://www.roblox.com/asset/?id=665939136'
                        bov = Instance.new("BodyVelocity", robux)
                        bov.maxForce = Vector3.new(99999, 99999, 99999)
                        robux.CFrame = CFrame.new(robux.Position, mouse.Hit.p) *
                                           CFrame.Angles(
                                               math.rad(math.random(-5, 5)),
                                               math.rad(0),
                                               math.rad(math.random(-180, 180)))
                        bov.velocity = robux.CFrame.lookVector *
                                           math.random(40, 100)
                        removeuseless:AddItem(bov, .15)
                    end
                end)()
                while dancing do
                    ROOTLERP.C0 = ROOTLERP.C0:Lerp(
                                      CFrame.new(0, -.3, 0) *
                                          CFrame.Angles(math.rad(20), math.rad(
                                                            0 *
                                                                math.sin(
                                                                    sine / 8)),
                                                        math.rad(0)), .25)
                    LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                         CFrame.new(1, .5 + .5 *
                                                        math.sin(sine / 2), .5) *
                                             CFrame.Angles(math.rad(-97),
                                                           math.rad(
                                                               40 - 20 *
                                                                   math.sin(
                                                                       sine / 2)),
                                                           math.rad(0)), 0.25)
                    RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(
                                          CFrame.new(-1, .5, .5) *
                                              CFrame.Angles(math.rad(-87),
                                                            math.rad(-20),
                                                            math.rad(0)), 0.25)
                    RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                          CFrame.new(-0.3, 2, .5) *
                                              CFrame.Angles(math.rad(20),
                                                            math.rad(0),
                                                            math.rad(-10)), 0.25)
                    LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                         CFrame.new(0.3, 2.0, .5) *
                                             CFrame.Angles(math.rad(20),
                                                           math.rad(0),
                                                           math.rad(10)), 0.25)
                    swait(0)
                end
                ws = 18
                removeuseless:AddItem(g1, 0)
                robuxpile:Remove()
                attacking = false
            end)()
        end
    end
end)

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 'h' then
        if dancing then
            dancing = false
        else
            dancing = true
            ws = 0
            change = .5
            attacking = true
            coroutine.wrap(function()
                while dancing do
                    for i = 1, 15 do
                        if not dancing then break end
                        ROOTLERP.C0 = ROOTLERP.C0:Lerp(
                                          CFrame.new(.5, -.4 + .1 *
                                                         math.sin(sine / 4), 0) *
                                              CFrame.Angles(math.rad(0),
                                                            math.rad(
                                                                20 *
                                                                    math.sin(
                                                                        sine / 8)),
                                                            math.rad(20)), .25)
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-.9, .65 + .4 * math.sin(sine / 12),
                                           1.2) *
                                    CFrame.Angles(
                                        math.rad(-35 - 15 * math.sin(sine / 12)),
                                        math.rad(50 + 3 * math.sin(sine / 12)),
                                        math.rad(3 - 1 * math.sin(sine / 12))),
                                .3)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(.9, .65 + .4 * math.sin(sine / 12),
                                           1.2) *
                                    CFrame.Angles(
                                        math.rad(-35 - 15 * math.sin(sine / 12)),
                                        math.rad(-50 - 3 * math.sin(sine / 12)),
                                        math.rad(-3 + 1 * math.sin(sine / 12))),
                                .3)
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(0.25, 2.05, -0) *
                                    CFrame.Angles(math.rad(0), math.rad(0),
                                                  math.rad(-35)), 0.25)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(0.31, 2.05, -0) *
                                    CFrame.Angles(math.rad(0), math.rad(0),
                                                  math.rad(14)), 0.25)
                        swait(0)
                    end
                    for i = 1, 15 do
                        if not dancing then break end
                        ROOTLERP.C0 = ROOTLERP.C0:Lerp(
                                          CFrame.new(0,
                                                     -.1 * math.sin(sine / 4), 0) *
                                              CFrame.Angles(math.rad(0),
                                                            math.rad(
                                                                20 *
                                                                    math.sin(
                                                                        sine / 8)),
                                                            math.rad(0)), .25)
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-.9, .65 + .4 * math.sin(sine / 12),
                                           1.2) *
                                    CFrame.Angles(
                                        math.rad(-35 - 15 * math.sin(sine / 12)),
                                        math.rad(50 + 3 * math.sin(sine / 12)),
                                        math.rad(3 - 1 * math.sin(sine / 12))),
                                .3)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(.9, .65 + .4 * math.sin(sine / 12),
                                           1.2) *
                                    CFrame.Angles(
                                        math.rad(-35 - 15 * math.sin(sine / 12)),
                                        math.rad(-50 - 3 * math.sin(sine / 12)),
                                        math.rad(-3 + 1 * math.sin(sine / 12))),
                                .3)
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(-0.25, .7, 1.5) *
                                    CFrame.Angles(math.rad(72), math.rad(25),
                                                  math.rad(-2)), 0.25)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(0.3, 2.0, 0) *
                                    CFrame.Angles(0, math.rad(0), math.rad(10)),
                                0.25)
                        swait(0)
                    end
                    for i = 1, 15 do
                        if not dancing then break end
                        ROOTLERP.C0 = ROOTLERP.C0:Lerp(
                                          CFrame.new(-.5, -.4 + .1 *
                                                         math.sin(sine / 4), 0) *
                                              CFrame.Angles(math.rad(0),
                                                            math.rad(
                                                                20 *
                                                                    math.sin(
                                                                        sine / 8)),
                                                            math.rad(-20)), .25)
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-.9, .65 + .4 * math.sin(sine / 12),
                                           1.2) *
                                    CFrame.Angles(
                                        math.rad(-35 - 15 * math.sin(sine / 12)),
                                        math.rad(50 + 3 * math.sin(sine / 12)),
                                        math.rad(3 - 1 * math.sin(sine / 12))),
                                .3)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(.9, .65 + .4 * math.sin(sine / 12),
                                           1.2) *
                                    CFrame.Angles(
                                        math.rad(-35 - 15 * math.sin(sine / 12)),
                                        math.rad(-50 - 3 * math.sin(sine / 12)),
                                        math.rad(-3 + 1 * math.sin(sine / 12))),
                                .3)
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(-0.3, 2, 0) *
                                    CFrame.Angles(0, math.rad(0), math.rad(-10)),
                                0.25)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(-0.25, 2.05, 0) *
                                    CFrame.Angles(math.rad(0), math.rad(0),
                                                  math.rad(35)), 0.25)
                        swait(0)
                    end
                    for i = 1, 15 do
                        if not dancing then break end
                        ROOTLERP.C0 = ROOTLERP.C0:Lerp(
                                          CFrame.new(-.5, -.1, 0) *
                                              CFrame.Angles(math.rad(0),
                                                            math.rad(
                                                                20 *
                                                                    math.sin(
                                                                        sine / 8)),
                                                            math.rad(0)), .25)
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-.9, .65 + .4 * math.sin(sine / 12),
                                           1.2) *
                                    CFrame.Angles(
                                        math.rad(-35 - 15 * math.sin(sine / 12)),
                                        math.rad(50 + 3 * math.sin(sine / 12)),
                                        math.rad(3 - 1 * math.sin(sine / 12))),
                                .3)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(.9, .65 + .4 * math.sin(sine / 12),
                                           1.2) *
                                    CFrame.Angles(
                                        math.rad(-35 - 15 * math.sin(sine / 12)),
                                        math.rad(-50 - 3 * math.sin(sine / 12)),
                                        math.rad(-3 + 1 * math.sin(sine / 12))),
                                .3)
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(-0.31, 2.05, 0) *
                                    CFrame.Angles(math.rad(0), math.rad(0),
                                                  math.rad(-14)), 0.3)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(0.25, .7, 1.5) *
                                    CFrame.Angles(math.rad(72), math.rad(-25),
                                                  math.rad(-2)), 0.25)
                        swait(0)
                    end
                    swait(0)
                end
                ws = 18
                attacking = false
            end)()
        end
    end
end)

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 'g' then
        if dancing then
            dancing = false
        else
            dancing = true
            ws = 0
            change = .5
            attacking = true
            coroutine.wrap(function()
                coroutine.wrap(function()
                    while dancing do
                        ROOTLERP.C0 = ROOTLERP.C0:Lerp(
                                          CFrame.new(2 * math.sin(sine / 9),
                                                     -.4 + .1 *
                                                         math.sin(sine / 3), 0) *
                                              CFrame.Angles(math.rad(0),
                                                            math.rad(
                                                                20 *
                                                                    math.sin(
                                                                        sine / 9)),
                                                            0), .25)
                        swait(0)
                    end
                end)()
                while dancing do
                    for i = 1, 28 do
                        if not dancing then break end
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-.9, .65 + .4 * math.sin(sine / 12),
                                           1.2) *
                                    CFrame.Angles(
                                        math.rad(-35 - 15 * math.sin(sine / 12)),
                                        math.rad(50 + 3 * math.sin(sine / 12)),
                                        math.rad(3 - 1 * math.sin(sine / 12))),
                                .2)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(1.2, 1.5, 0) *
                                    CFrame.Angles(
                                        math.rad(180 - 7 * math.sin(sine / 3)),
                                        math.rad(7 * math.sin(sine / 3)),
                                        math.rad(7 * math.sin(sine / 3))), 0.2)
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(-0.5, .7, 1) *
                                    CFrame.Angles(
                                        math.rad(75 - 10 * math.sin(sine / 2)),
                                        math.rad(0), math.rad(0)), 0.25)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(0.31, 2.05, -.1) *
                                    CFrame.Angles(math.rad(10), math.rad(0),
                                                  math.rad(-2)), 0.3)
                        swait(0)
                    end
                    for i = 1, 28 do
                        if not dancing then break end
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-.9, .65 + .4 * math.sin(sine / 12),
                                           1.2) *
                                    CFrame.Angles(
                                        math.rad(-35 - 15 * math.sin(sine / 12)),
                                        math.rad(50 + 3 * math.sin(sine / 12)),
                                        math.rad(3 - 1 * math.sin(sine / 12))),
                                .2)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(1.2, 1.5, 0) *
                                    CFrame.Angles(
                                        math.rad(180 - 7 * math.sin(sine / 3)),
                                        math.rad(7 * math.sin(sine / 3)),
                                        math.rad(7 * math.sin(sine / 3))), 0.2)
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(-0.31, 2.05, .1) *
                                    CFrame.Angles(math.rad(-10), math.rad(0),
                                                  math.rad(-8)), 0.25)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(0.5, .7, 1.1) *
                                    CFrame.Angles(
                                        math.rad(75 - 10 * math.sin(sine / 2)),
                                        math.rad(0), math.rad(-2)), 0.25)
                        swait(0)
                    end
                    swait(0)
                end
                ws = 18
                attacking = false
            end)()
        end
    end
end)

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 'f' then
        if dancing then
            dancing = false
        else
            dancing = true
            ws = 7
            change = .5
            attacking = true
            coroutine.wrap(function()
                while dancing do
                    ROOTLERP.C0 = ROOTLERP.C0:Lerp(
                                      CFrame.new(0, -.4, 0) *
                                          CFrame.Angles(
                                              math.rad(
                                                  20 + 5 * math.sin(sine / 2)),
                                              math.rad(10 * math.sin(sine / 4)),
                                              0), .25)
                    RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(
                                          CFrame.new(-1.5, .89 - .4 *
                                                         -math.sin(sine / 2),
                                                     .49) *
                                              CFrame.Angles(
                                                  math.rad(
                                                      -70 + 20 *
                                                          -math.sin(sine / 2)),
                                                  0, math.rad(0)), .25)
                    LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                         CFrame.new(1.5, .89 - .4 *
                                                        math.sin(sine / 2), .49) *
                                             CFrame.Angles(
                                                 math.rad(
                                                     -70 + 20 *
                                                         math.sin(sine / 2)), 0,
                                                 math.rad(0)), .25)
                    RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                          CFrame.new(-0.33, 2, -.2 + .3 *
                                                         math.sin(sine / 2)) *
                                              CFrame.Angles(
                                                  math.rad(
                                                      -20 - 20 *
                                                          -math.sin(sine / 2)),
                                                  math.rad(0), math.rad(-8)),
                                          0.25)
                    LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                         CFrame.new(0.33, 2.0, -.2 - .3 *
                                                        math.sin(sine / 2)) *
                                             CFrame.Angles(
                                                 math.rad(
                                                     -20 - 20 *
                                                         math.sin(sine / 2)),
                                                 math.rad(0), math.rad(8)), 0.25)
                    swait(0)
                end
                ws = 18
                attacking = false
            end)()
        end
    end
end)

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 'p' then
        if dancing then
            dancing = false
        else
            dancing = true
            ws = 0
            change = .5
            attacking = true
            barrelspin = 0
            barrol = Instance.new("Part", Torso)
            barrol.Size = Vector3.new(1, 1, 1)
            barrol.CFrame = Torso.CFrame
            barrol.CanCollide = false
            barrolweld = Instance.new("Weld", barrol)
            barrolweld.Part0 = barrol
            barrolweld.Part1 = Torso
            barrolweld.C0 = barrol.CFrame:inverse() * Torso.CFrame *
                                CFrame.new(0, 0, 0)
            mbarrol = Instance.new("SpecialMesh", barrol)
            mbarrol.MeshType = "FileMesh"
            mbarrol.Scale = Vector3.new(1.05, .95, 1.05)
            mbarrol.MeshId, mbarrol.TextureId =
                'http://www.roblox.com/asset/?id=29873142',
                'http://www.roblox.com/asset/?id=31082268'
            coroutine.wrap(function()
                while dancing do
                    ROOTLERP.C0 = ROOTLERP.C0:Lerp(
                                      CFrame.new(5 * math.sin(sine / 8), -1.8, 0) *
                                          CFrame.Angles(math.rad(-90),
                                                        math.rad(
                                                            180 *
                                                                math.sin(
                                                                    sine / 8)),
                                                        0), .25)
                    RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(
                                          CFrame.new(-1.5, 1.5, 0) *
                                              CFrame.Angles(math.rad(180), 0,
                                                            math.rad(0)), .25)
                    LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                         CFrame.new(1.5, 1.5, 0) *
                                             CFrame.Angles(math.rad(180), 0,
                                                           math.rad(0)), .25)
                    LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                         CFrame.new(.5, 2, 0) *
                                             CFrame.Angles(0, 0, 0), .25)
                    RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                          CFrame.new(-.5, 2, 0) *
                                              CFrame.Angles(0, 0, 0), .25)
                    swait(0)
                end
                ws = 18
                barrol:Destroy()
                attacking = false
            end)()
        end
    end
end)

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 'q' then
        if dancing then
            dancing = false
        else
            dancing = true
            ws = 0
            change = .5
            spinningmove = 0
            attacking = true
            coroutine.wrap(function()
                while dancing do
                    spinningmove = spinningmove + 10
                    RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                          CFrame.new(-0.52, 1.9, -.35) *
                                              CFrame.Angles(math.rad(-30),
                                                            math.rad(0),
                                                            math.rad(0)), .2)
                    LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                         CFrame.new(0.52, 1.9, .35) *
                                             CFrame.Angles(math.rad(30),
                                                           math.rad(0),
                                                           math.rad(0)), .2)
                    ROOTLERP.C0 = ROOTLERP.C0:lerp(
                                      CFrame.new(.2 * math.sin(sine / 3), -.52,
                                                 .2 * math.sin(sine / 4)) *
                                          CFrame.Angles(math.rad(180),
                                                        math.rad(spinningmove),
                                                        math.rad(
                                                            15 *
                                                                math.sin(
                                                                    sine / 9))),
                                      .2)
                    LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                         CFrame.new(1.4, 1.45, 0) *
                                             CFrame.Angles(math.rad(180),
                                                           math.rad(-1),
                                                           math.rad(
                                                               -3 *
                                                                   math.sin(
                                                                       sine / 2))),
                                         0.3)
                    RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(
                                          CFrame.new(-1.4, 1.45, 0) *
                                              CFrame.Angles(math.rad(180),
                                                            math.rad(1),
                                                            math.rad(
                                                                3 *
                                                                    math.sin(
                                                                        sine / 2))),
                                          0.3)
                    swait(0)
                end
                ws = 18
                attacking = false
            end)()
        end
    end
end)

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 'u' then
        if dancing then
            dancing = false
        else
            dancing = true
            ws = 7
            change = .5
            attacking = true
            coroutine.wrap(function()
                while dancing do
                    for i = 1, 17 do
                        if not dancing then break end
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(-0.52, 1.5, -.5) *
                                    CFrame.Angles(math.rad(-60), math.rad(0),
                                                  math.rad(0)), .2)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(0.52, 1.2, .55) *
                                    CFrame.Angles(math.rad(30), math.rad(0),
                                                  math.rad(0)), .2)
                        ROOTLERP.C0 = ROOTLERP.C0:lerp(
                                          CFrame.new(0, -.8 + .1 *
                                                         math.sin(sine / 3), 0) *
                                              CFrame.Angles(
                                                  math.rad(
                                                      22 - 2 *
                                                          math.sin(sine / 3)),
                                                  math.rad(0), math.rad(0)), .2)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(1, -.2, .4) *
                                    CFrame.Angles(
                                        math.rad(-87 + .01 * math.sin(sine / 9)),
                                        math.rad(80 - 3 * math.sin(sine / 9)),
                                        math.rad(0)), 0.3)
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-.7, -.2, .4) *
                                    CFrame.Angles(
                                        math.rad(-87 - .01 * math.sin(sine / 9)),
                                        math.rad(-88 + .7 * math.sin(sine / 9)),
                                        math.rad(0)), 0.3)
                        swait(0)
                    end
                    for i = 1, 17 do
                        if not dancing then break end
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(-0.52, 1.2, .55) *
                                    CFrame.Angles(math.rad(30), math.rad(0),
                                                  math.rad(0)), .2)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(0.52, 1.5, -.5) *
                                    CFrame.Angles(math.rad(-60), math.rad(0),
                                                  math.rad(0)), .2)
                        ROOTLERP.C0 = ROOTLERP.C0:lerp(
                                          CFrame.new(0, -.8 + .1 *
                                                         math.sin(sine / 3), 0) *
                                              CFrame.Angles(
                                                  math.rad(
                                                      22 - 2 *
                                                          math.sin(sine / 3)),
                                                  math.rad(0), math.rad(0)), .2)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(1, -.2, .4) *
                                    CFrame.Angles(
                                        math.rad(-87 + .01 * math.sin(sine / 9)),
                                        math.rad(80 - 3 * math.sin(sine / 9)),
                                        math.rad(0)), 0.3)
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-.7, -.2, .4) *
                                    CFrame.Angles(
                                        math.rad(-87 - .01 * math.sin(sine / 9)),
                                        math.rad(-88 + .7 * math.sin(sine / 9)),
                                        math.rad(0)), 0.3)
                        swait(0)
                    end
                    swait(0)
                end
                ws = 18
                attacking = false
            end)()
        end
    end
end)

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 'y' then
        if dancing then
            dancing = false
        else
            dancing = true
            ws = 0
            change = .5
            walkforward = 0
            walkrotation = 0
            attacking = true
            coroutine.wrap(function()
                while dancing do
                    for i = 1, 100 do
                        if not dancing then break end
                        walkforward = walkforward + .1
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(-0.31, 2.05, .1 * math.sin(sine / 4)) *
                                    CFrame.Angles(
                                        math.rad(10 * math.sin(sine / 4)),
                                        math.rad(0), math.rad(-8)), 0.3)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(0.31, 2.05, -.15 * math.sin(sine / 4)) *
                                    CFrame.Angles(
                                        math.rad(-10 * math.sin(sine / 4)),
                                        math.rad(0), math.rad(8)), 0.3)
                        ROOTLERP.C0 = ROOTLERP.C0:lerp(
                                          CFrame.new(0, -.2, walkforward) *
                                              CFrame.Angles(math.rad(0),
                                                            math.rad(0),
                                                            math.rad(0)), .2)
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-1.5, 0, 0) *
                                    CFrame.Angles(0, 0, math.rad(0)), .3)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(1.5, 0, 0) *
                                    CFrame.Angles(0, 0, math.rad(0)), .3)
                        swait(0)
                    end
                    for i = 1, 50 do
                        if not dancing then break end
                        walkrotation = walkrotation + 15
                        ROOTLERP.C0 = ROOTLERP.C0:lerp(
                                          CFrame.new(0, -.2, walkforward) *
                                              CFrame.Angles(math.rad(0),
                                                            math.rad(
                                                                walkrotation),
                                                            math.rad(-0)), .2)
                        swait(0)
                    end
                    walkrotation = 0
                    for i = 1, 100 do
                        if not dancing then break end
                        walkforward = walkforward - .1
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(-0.31, 2, .1 * math.sin(sine / 4)) *
                                    CFrame.Angles(
                                        math.rad(10 * math.sin(sine / 4)),
                                        math.rad(0), math.rad(-8)), 0.3)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(0.31, 2, -.15 * math.sin(sine / 4)) *
                                    CFrame.Angles(
                                        math.rad(-10 * math.sin(sine / 4)),
                                        math.rad(0), math.rad(8)), 0.3)
                        ROOTLERP.C0 = ROOTLERP.C0:lerp(
                                          CFrame.new(0, -.2, walkforward) *
                                              CFrame.Angles(math.rad(0),
                                                            math.rad(-180),
                                                            math.rad(-0)), .2)
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-1.3, .7, .2) *
                                    CFrame.Angles(math.rad(220), math.rad(0),
                                                  math.rad(-30)), 0.4)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(1.5, 0, 0) *
                                    CFrame.Angles(0, 0, math.rad(0)), .3)
                        swait(0)
                    end
                    for i = 1, 50 do
                        if not dancing then break end
                        walkrotation = walkrotation + 15
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-1.5, 0, 0) *
                                    CFrame.Angles(0, 0, math.rad(0)), .1)
                        ROOTLERP.C0 = ROOTLERP.C0:lerp(
                                          CFrame.new(0, -.2, walkforward) *
                                              CFrame.Angles(math.rad(0),
                                                            math.rad(
                                                                walkrotation),
                                                            math.rad(-0)), .2)
                        swait(0)
                    end
                    walkrotation = 0
                    swait(0)
                end
                ws = 18
                attacking = false
            end)()
        end
    end
end)

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 't' then
        if dancing then
            dancing = false
        else
            dancing = true
            ws = 0
            change = .5
            attacking = true
            coroutine.wrap(function()
                while dancing do
                    for i = 1, 20 do
                        if not dancing then break end
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(-0.33, 2, .05) *
                                    CFrame.Angles(math.rad(3), math.rad(0),
                                                  math.rad(-8)), 0.2)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(0.33, 2.0, -.05) *
                                    CFrame.Angles(math.rad(-3), math.rad(0),
                                                  math.rad(8)), 0.2)
                        ROOTLERP.C0 = ROOTLERP.C0:lerp(
                                          CFrame.new(0, -.2, 0) *
                                              CFrame.Angles(math.rad(0),
                                                            math.rad(
                                                                0 *
                                                                    math.sin(
                                                                        sine / 4)),
                                                            math.rad(15)), .2)
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(.5, 1.98, .05) *
                                    CFrame.Angles(0, 0, math.rad(-140)), .2)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(1, 1.3, .05) *
                                    CFrame.Angles(0, 0, math.rad(50)), .2)
                        swait(0)
                    end
                    for i = 1, 20 do
                        if not dancing then break end
                        RIGHTLEGLERP.C0 =
                            RIGHTLEGLERP.C0:lerp(
                                CFrame.new(-0.33, 2, .05) *
                                    CFrame.Angles(math.rad(3), math.rad(0),
                                                  math.rad(-8)), 0.2)
                        LEFTLEGLERP.C0 =
                            LEFTLEGLERP.C0:lerp(
                                CFrame.new(0.33, 2.0, -.05) *
                                    CFrame.Angles(math.rad(-3), math.rad(0),
                                                  math.rad(8)), 0.2)
                        ROOTLERP.C0 = ROOTLERP.C0:lerp(
                                          CFrame.new(0, -.2, 0) *
                                              CFrame.Angles(math.rad(0),
                                                            math.rad(
                                                                0 *
                                                                    math.sin(
                                                                        sine / 4)),
                                                            math.rad(-15)), .2)
                        RIGHTARMLERP.C0 =
                            RIGHTARMLERP.C0:lerp(
                                CFrame.new(-1, 1.4, .05) *
                                    CFrame.Angles(0, 0, math.rad(-50)), .2)
                        LEFTARMLERP.C0 =
                            LEFTARMLERP.C0:lerp(
                                CFrame.new(-.6, 2, .05) *
                                    CFrame.Angles(0, 0, math.rad(140)), .2)
                        swait(0)
                    end
                    swait(0)
                end
                ws = 18
                attacking = false
            end)()
        end
    end
end)

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 'e' then
        if dancing then
            dancing = false
        else
            dancing = true
            ws = 0
            change = .5
            attacking = true
            coroutine.wrap(function()
                while dancing do
                    RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                          CFrame.new(-0.3, 2, 0) *
                                              CFrame.Angles(0, math.rad(0),
                                                            math.rad(-10)), 0.1)
                    LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                         CFrame.new(0.3, 2.0, 0) *
                                             CFrame.Angles(0, math.rad(0),
                                                           math.rad(10)), 0.1)
                    ROOTLERP.C0 = ROOTLERP.C0:lerp(
                                      CFrame.new(0, -.2, 0) *
                                          CFrame.Angles(math.rad(0), math.rad(
                                                            0 *
                                                                math.sin(
                                                                    sine / 4)),
                                                        math.rad(
                                                            15 *
                                                                math.sin(
                                                                    sine / 4))),
                                      .2)
                    RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(
                                          CFrame.new(
                                              -1.3 + .3 * math.sin(sine / 3.5),
                                              .5 * -math.sin(sine / 3.5), .1) *
                                              CFrame.Angles(
                                                  math.rad(
                                                      0 * math.sin(sine / 2)),
                                                  0, math.rad(
                                                      30 * math.sin(sine / 3.5))),
                                          .2)
                    LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                         CFrame.new(
                                             1.3 + .3 * math.sin(sine / 3.5),
                                             .5 * math.sin(sine / 3.5), .1) *
                                             CFrame.Angles(
                                                 math.rad(0 * math.sin(sine / 2)),
                                                 0, math.rad(
                                                     30 * math.sin(sine / 3.5))),
                                         .2)
                    swait(0)
                end
                ws = 18
                attacking = false
            end)()
        end
    end
end)

mouse.KeyDown:connect(function(Press)
    Press = Press:lower()
    if Press == 'r' then
        if dancing then
            dancing = false
        else
            ws = 7
            recordbaby = 0
            dancing = true
            change = .5
            attacking = true
            coroutine.wrap(function()
                while dancing do
                    recordbaby = recordbaby + 10
                    RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                          CFrame.new(-0.27, 2,
                                                     .1 * math.sin(sine / 4)) *
                                              CFrame.Angles(
                                                  math.rad(
                                                      10 * math.sin(sine / 4)),
                                                  math.rad(0), math.rad(-8)),
                                          0.3)
                    LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                         CFrame.new(0.27, 2.0,
                                                    -.1 * math.sin(sine / 4)) *
                                             CFrame.Angles(
                                                 math.rad(
                                                     -10 * math.sin(sine / 4)),
                                                 math.rad(0), math.rad(8)), 0.3)
                    ROOTLERP.C0 = ROOTLERP.C0:lerp(
                                      CFrame.new(.5 * math.sin(sine / 5), -.2,
                                                 .5 * math.sin(sine / 4)) *
                                          CFrame.Angles(math.rad(0),
                                                        math.rad(recordbaby),
                                                        math.rad(0)), .3)
                    RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(
                                          CFrame.new(-.5, 1.98, 0) *
                                              CFrame.Angles(0, 0, math.rad(-90)),
                                          .3)
                    LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                         CFrame.new(.5, 1.98, 0) *
                                             CFrame.Angles(0, 0, math.rad(90)),
                                         .3)
                    swait(0)
                end
                ws = 18
                attacking = false
            end)()
        end
    end
end)

function ray(pos, dir, rang, ignoredesc)
    return workspace:FindPartOnRay(Ray.new(pos, dir.unit * rang), ignoredesc)
end

function ray2(startpos, endpos, distance, ignore)
    local dir = CFrame.new(startpos, endpos).lookVector
    return ray(startpos, dir, distance, ignore)
end

checks1 = coroutine.wrap(function()
    while true do
        hf = ray(Root.Position, (CFrame.new(Root.Position, Root.Position +
                                                Vector3.new(0, -1, 0))).lookVector,
                 3 * 3, Character)
        if Root.Velocity.y > 10 then
            position = "Jump"
        elseif Root.Velocity.y < -6 then
            position = "Falling"
        elseif Root.Velocity.Magnitude < 2 then
            position = "Idle"
        elseif Root.Velocity.Magnitude > 2 then
            position = "Walking"
        elseif Root.Velocity.Magnitude > 20 then
            position = "Running"
        else
        end
        swait(0)
    end
end)
checks1()

function ray(POSITION, DIRECTION, RANGE, IGNOREDECENDANTS)
    return workspace:FindPartOnRay(Ray.new(POSITION, DIRECTION.unit * RANGE),
                                   IGNOREDECENDANTS)
end

function ray2(StartPos, EndPos, Distance, Ignore)
    local DIRECTION = CFrame.new(StartPos, EndPos).lookVector
    return ray(StartPos, DIRECTION, Distance, Ignore)
end

OrgnC0 = Neck.C0
local movelimbs = coroutine.wrap(function()
    while RunSrv.RenderStepped:wait() do
        TrsoLV = Torso.CFrame.lookVector
        Dist = nil
        Diff = nil
    end
end)
movelimbs()

local anims = coroutine.wrap(function()
    while true do
        settime = 0.05
        sine = sine + change
        if position == "Jump" and attacking == false then
            change = 1
            spin = false
            for _, v in pairs(Torso:GetChildren()) do
                if v:IsA("Sound") then v:Remove() end
            end
            LEFTLEGLERP.C1 = LEFTLEGLERP.C1:lerp(
                                 CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
                                 .1)
            RIGHTLEGLERP.C1 = RIGHTLEGLERP.C1:lerp(
                                  CFrame.new(0, 0, 0) *
                                      CFrame.Angles(math.rad(0), 0, 0), .1)
            LEFTARMLERP.C1 = LEFTARMLERP.C1:lerp(
                                 CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
                                 .4)
            ROOTLERP.C0 = ROOTLERP.C0:lerp(
                              CFrame.new(0, 0, 0) *
                                  CFrame.Angles(math.rad(0), math.rad(0),
                                                math.rad(0)), 0.2)
            LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                 CFrame.new(1.4, .1, -.2) *
                                     CFrame.Angles(math.rad(20), math.rad(-3),
                                                   math.rad(-4)), 0.2)
            RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                  CFrame.new(-0.5, 2, 0) *
                                      CFrame.Angles(math.rad(10), math.rad(0),
                                                    math.rad(0)), 0.2)
            LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                 CFrame.new(0.5, 1.0, .9) *
                                     CFrame.Angles(math.rad(20), math.rad(0),
                                                   math.rad(0)), 0.2)
        elseif position == "Falling" and attacking == false then
            change = 1
            spin = false
            for _, v in pairs(Torso:GetChildren()) do
                if v:IsA("Sound") then v:Remove() end
            end
            ROOTLERP.C0 = ROOTLERP.C0:lerp(
                              CFrame.new(0, 0, 0) *
                                  CFrame.Angles(math.rad(15), math.rad(0),
                                                math.rad(0)), 0.15)
            LEFTLEGLERP.C1 = LEFTLEGLERP.C1:lerp(
                                 CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
                                 .1)
            RIGHTLEGLERP.C1 = RIGHTLEGLERP.C1:lerp(
                                  CFrame.new(0, 0, 0) *
                                      CFrame.Angles(math.rad(0), 0, 0), .1)
            LEFTARMLERP.C1 = LEFTARMLERP.C1:lerp(
                                 CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
                                 .4)
            RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                  CFrame.new(-0.5, 2, 0) *
                                      CFrame.Angles(math.rad(8), math.rad(4),
                                                    math.rad(0)), 0.2)
            LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                 CFrame.new(0.5, 2, 0) *
                                     CFrame.Angles(math.rad(8), math.rad(-4),
                                                   math.rad(0)), 0.2)
            LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                 CFrame.new(1.5,
                                            .94 + .02 * math.sin(sine / 12), -0) *
                                     CFrame.Angles(
                                         math.rad(28 + 5 * math.sin(sine / 12)),
                                         math.rad(0), math.rad(45)), 0.2)
            RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(
                                  CFrame.new(-1.5,
                                             .94 + .02 * math.sin(sine / 12), -0) *
                                      CFrame.Angles(
                                          math.rad(28 + 5 * math.sin(sine / 12)),
                                          math.rad(0), math.rad(-45)), 0.2)
        elseif position == "Walking" and attacking == false and running == false then
            change = 1.2
            walking = true
            spin = false
            for _, v in pairs(Torso:GetChildren()) do
                if v:IsA("Sound") then v:Remove() end
            end
            RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(
                                  CFrame.new(-1.5 + Root.RotVelocity.Y / 85,
                                             .35, -.5 * math.sin(sine / 11)) *
                                      CFrame.Angles(
                                          math.rad(35 * math.sin(sine / 11)),
                                          math.rad(0 * math.sin(sine / 11)),
                                          math.rad(
                                              -10 + Root.RotVelocity.Y / 10,
                                              math.sin(-20 * math.sin(sine / 4)))),
                                  .3)
            LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                 CFrame.new(1.5 + Root.RotVelocity.Y / 85, .45,
                                            .5 * math.sin(sine / 11)) *
                                     CFrame.Angles(
                                         math.rad(-55 * math.sin(sine / 11)),
                                         math.rad(-5 * math.sin(sine / 8)),
                                         math.rad(10 + Root.RotVelocity.Y / 10,
                                                  math.sin(
                                                      20 * math.sin(sine / 4)))),
                                 .3)
            ROOTLERP.C0 = ROOTLERP.C0:lerp(
                              CFrame.new(0, -.15 * 0.6 * -math.sin(sine / 5.5),
                                         0) *
                                  CFrame.Angles(math.rad(10), math.rad(
                                                    12 * -math.sin(sine / 11)),
                                                math.rad(0) + Root.RotVelocity.Y /
                                                    30, math.cos(
                                                    25 * math.cos(sine / 10))),
                              0.3)
            RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                  CFrame.new(-0.5, 1.92 - 0.35 *
                                                 math.cos(sine / 11) / 2.8,
                                             -.2 + 0.2 - math.sin(sine / 11) /
                                                 3.4) *
                                      CFrame.Angles(
                                          math.rad(25 - 25) +
                                              -math.sin(sine / 11) / 2.3,
                                          math.rad(0) * math.cos(sine / 1),
                                          math.rad(0), math.cos(
                                              -15 * 25 * math.cos(sine / 11))),
                                  0.3)
            LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                 CFrame.new(0.5, 1.92 + 0.35 *
                                                math.cos(sine / 11) / 2.8, -.2 +
                                                0.2 + math.sin(sine / 11) / 3.4) *
                                     CFrame.Angles(
                                         math.rad(25 - 25) -
                                             -math.sin(sine / 11) / 2.3,
                                         math.rad(0) * math.cos(sine / 1),
                                         math.rad(0), math.cos(
                                             -15 * 25 * math.cos(sine / 11))),
                                 0.3)
        elseif position == "Idle" and attacking == false and running == false then
            change = .5
            spin = true
            for _, v in pairs(Torso:GetChildren()) do
                if v:IsA("Sound") then v:Remove() end
            end
            ROOTLERP.C0 = ROOTLERP.C0:lerp(
                              CFrame.new(0, -.2 + -.1 * math.sin(sine / 12), 0) *
                                  CFrame.Angles(
                                      math.rad(6 * -math.sin(sine / 12)),
                                      math.rad(0), math.rad(0)), .1)
            LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                 CFrame.new(1.5,
                                            .27 + .02 * math.sin(sine / 12),
                                            .20 * -math.sin(sine / 12)) *
                                     CFrame.Angles(
                                         math.rad(20 * math.sin(sine / 12)),
                                         math.rad(0), math.rad(10)), 0.1)
            RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(
                                  CFrame.new(-1.5,
                                             .27 + .02 * math.sin(sine / 12),
                                             .20 * -math.sin(sine / 12)) *
                                      CFrame.Angles(
                                          math.rad(20 * math.sin(sine / 12)),
                                          math.rad(0), math.rad(-10)), 0.1)
            RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                  CFrame.new(-0.3, 2 - .1 * math.sin(sine / 12),
                                             0) *
                                      CFrame.Angles(
                                          math.rad(6 * -math.sin(sine / 12)),
                                          math.rad(0), math.rad(-10)), 0.1)
            LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                 CFrame.new(0.3, 2.0 - .1 * math.sin(sine / 12),
                                            0) *
                                     CFrame.Angles(
                                         math.rad(6 * -math.sin(sine / 12)),
                                         math.rad(0), math.rad(10)), 0.1)
        elseif position == "Running" and attacking == false then
            change = 1
            for _, v in pairs(Torso:GetChildren()) do
                if v:IsA("Sound") then v:Remove() end
            end
            RIGHTARMLERP.C0 = RIGHTARMLERP.C0:lerp(
                                  CFrame.new(0, .5, 0) *
                                      CFrame.Angles(math.rad(0), math.rad(0),
                                                    math.rad(0)), 0.3)
            LEFTARMLERP.C1 = LEFTARMLERP.C1:lerp(
                                 CFrame.new(
                                     -1.24 + .6 * math.sin(sine / 4) / 1.4,
                                     0.54, 0 - 0.8 * math.sin(sine / 4)) *
                                     CFrame.Angles(
                                         math.rad(
                                             6 + 140 * math.sin(sine / 4) / 1.2),
                                         math.rad(0),
                                         math.rad(20 + 70 * math.sin(sine / 4))),
                                 0.3)
            LEFTARMLERP.C0 = LEFTARMLERP.C0:lerp(
                                 CFrame.new(0, .5, 0) *
                                     CFrame.Angles(math.rad(0), math.rad(0),
                                                   math.rad(0)), .3)
            ROOTLERP.C0 = ROOTLERP.C0:lerp(
                              CFrame.new(0, -.2, 0) *
                                  CFrame.Angles(
                                      math.rad(-20 - 0 * math.sin(sine / 4)),
                                      math.rad(0 + 6 * math.sin(sine / 4)),
                                      math.rad(0) + Root.RotVelocity.Y / 30,
                                      math.sin(10 * math.sin(sine / 4))), 0.3)
            RIGHTLEGLERP.C1 = RIGHTLEGLERP.C1:lerp(
                                  CFrame.new(0, 0,
                                             -.2 + .5 * -math.sin(sine / 4)), .3)
            RIGHTLEGLERP.C0 = RIGHTLEGLERP.C0:lerp(
                                  CFrame.new(-0.5,
                                             1.6 + 0.1 * math.sin(sine / 4),
                                             .7 * -math.sin(sine / 4)) *
                                      CFrame.Angles(
                                          math.rad(15 + -50 * math.sin(sine / 4)),
                                          0, 0), .3)
            LEFTLEGLERP.C1 = LEFTLEGLERP.C1:lerp(
                                 CFrame.new(0, 0, -.2 + .5 * math.sin(sine / 4)),
                                 .3)
            LEFTLEGLERP.C0 = LEFTLEGLERP.C0:lerp(
                                 CFrame.new(0.5, 1.6 - 0.1 * math.sin(sine / 4),
                                            .7 * math.sin(sine / 4)) *
                                     CFrame.Angles(
                                         math.rad(15 + 50 * math.sin(sine / 4)),
                                         0, 0), .3)
        end
        game:GetService("RunService").Heartbeat:wait()
    end
end)
anims()
