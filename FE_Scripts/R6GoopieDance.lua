-- Variables and setting up the character
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

    kill = false
    return
end

-- Cleanup
fakechar.Humanoid.Died:Connect(function()
    plr.Character = char
    char:BreakJoints()
    fakechar:Destroy()

    kill = false

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

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"
script:WaitForChild("Heartbeat")

Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
Mouse = Player:GetMouse()
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]

Character = Player.Character
Humanoid = Character.Humanoid

local BODY = {}
for _, c in pairs(Character:GetDescendants()) do
    if c:IsA("BasePart") and c.Name ~= "Handle" then
        if c ~= RootPart and c ~= Torso and c ~= Head and c ~= RightArm and c ~=
            LeftArm and c ~= RightLeg and c ~= LeftLeg then
            c.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        end
        table.insert(BODY, {
            c, c.Parent, c.Material, c.Color, c.Transparency, c.Size, c.Name
        })
    elseif c:IsA("JointInstance") then
        table.insert(BODY, {c, c.Parent, nil, nil, nil, nil, nil})
    end
end

function refit()
    Character.Parent = workspace
    for e = 1, #BODY do
        if BODY[e] ~= nil then
            local STUFF = BODY[e]
            local PART = STUFF[1]
            local PARENT = STUFF[2]
            local MATERIAL = STUFF[3]
            local COLOR = STUFF[4]
            local TRANSPARENCY = STUFF[5]
            -- local SIZE = STUFF[6]
            local NAME = STUFF[7]
            if PART.ClassName == "Part" and PART ~= RootPart then
                PART.Material = MATERIAL
                PART.Transparency = TRANSPARENCY
                PART.Name = NAME
            end
            if PART.Parent ~= PARENT then
                Humanoid:remove()
                PART.Parent = PARENT
                Humanoid = IT("Humanoid", Character)
            end
        end
    end
end

Humanoid.Died:connect(function() refit() end)

Player = game:GetService("Players").LocalPlayer
PlayerGui = Player.PlayerGui
Cam = workspace.CurrentCamera
Backpack = Player.Backpack
Character = Player.Character
Humanoid = Character.Humanoid
Mouse = Player:GetMouse()
RootPart = Character["HumanoidRootPart"]
Torso = Character["Torso"]
Head = Character["Head"]
RightArm = Character["Right Arm"]
LeftArm = Character["Left Arm"]
RightLeg = Character["Right Leg"]
LeftLeg = Character["Left Leg"]
RootJoint = RootPart["RootJoint"]
Neck = Torso["Neck"]
RightShoulder = Torso["Right Shoulder"]
LeftShoulder = Torso["Left Shoulder"]
RightHip = Torso["Right Hip"]
LeftHip = Torso["Left Hip"]
local sick = Instance.new("Sound", Torso)

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

local Speed = 0.1
AnimationSpeed = .8
SmoothTime = 2

function swait(num)
    if num == 0 or num == nil then
        -- if Stagger.Value==false or Stun.Value<=100 then
        -- Player.PlayerGui.Pacemaker.Heartbeat.Event:wait()
        script.Heartbeat.Event:wait()
        -- end
    else
        for i = 0, num do
            -- Player.PlayerGui.Pacemaker.Heartbeat.Event:wait()
            script.Heartbeat.Event:wait()
            --[[if Stagger.Value==true or Stun.Value>=StunT.Value then
break
end]]
        end
    end
end
script:WaitForChild("Heartbeat")

frame = 1 / 60
tf = 0
allowframeloss = false -- if set to true will fire every frame it possibly can. This will result in multiple events happening at the same time whenever delta returns frame2 or greater.
tossremainder = false -- if set to true t will be set to 0 after Fire()-ing.
lastframe = tick()
script.Heartbeat:Fire() -- ayy lmao

game:GetService("RunService").Heartbeat:connect(
    function(s, p) -- herp derp
        tf = tf + s
        if tf >= frame then
            if allowframeloss then
                script.Heartbeat:Fire()
                lastframe = tick()
            else
                ----print("FIRED "..math.floor(t/frame).." FRAME(S)","REMAINDER "..(t - frame(math.floor(t/frame))))
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

Anim = { ---PUT YOUR CFRAME THINGY BELOW ME
    Properties = {Looping = true, Priority = Enum.AnimationPriority.Action},
    Keyframes = {
        [0] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.02, 0.076, -0.296) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.036, 0.317, -0.052) *
                            CFrame.Angles(math.rad(-13.866), math.rad(39.763),
                                          math.rad(-10.542))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.12, 0.282, -0.117) *
                            CFrame.Angles(math.rad(-10.027), math.rad(-45.55),
                                          math.rad(13.98))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.339, 0.106, 0.22) *
                            CFrame.Angles(math.rad(-29.393), math.rad(-29.851),
                                          math.rad(-1.891))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.2, 0.139, 0.052) *
                            CFrame.Angles(math.rad(-25.325), math.rad(28.705),
                                          math.rad(-9.282))
                    }
                }
            }
        },
        [0.05] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.01, 0.076, -0.296) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.298, 0.365, 0.546) *
                            CFrame.Angles(math.rad(-2.063), math.rad(32.258),
                                          math.rad(0.974))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.157, 0.357, 0.48) *
                            CFrame.Angles(math.rad(-0.917), math.rad(-39.591),
                                          math.rad(2.75))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.316, 0.095, 0.213) *
                            CFrame.Angles(math.rad(-29.679), math.rad(-30.252),
                                          math.rad(-0.458))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.204, 0.137, 0.066) *
                            CFrame.Angles(math.rad(-27.559), math.rad(29.507),
                                          math.rad(-9.397))
                    }
                }
            }
        },
        [0.1] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.005, 0.076, -0.311) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.365, 0.351, 0.703) *
                            CFrame.Angles(math.rad(1.203), math.rad(30.481),
                                          math.rad(3.037))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.243, 0.344, 0.663) *
                            CFrame.Angles(math.rad(3.094), math.rad(-37.357),
                                          math.rad(-0.286))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.288, 0.082, 0.205) *
                            CFrame.Angles(math.rad(-29.966), math.rad(-30.711),
                                          math.rad(1.261))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.203, 0.137, 0.063) *
                            CFrame.Angles(math.rad(-26.986), math.rad(29.335),
                                          math.rad(-9.339))
                    }
                }
            }
        },
        [0.15] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.02, 0.076, -0.324) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.037, 0.339, -0.094) *
                            CFrame.Angles(math.rad(-15.069), math.rad(40.795),
                                          math.rad(-10.199))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.087, 0.326, -0.097) *
                            CFrame.Angles(math.rad(-10.428), math.rad(-45.951),
                                          math.rad(12.147))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.377, 0.123, 0.228) *
                            CFrame.Angles(math.rad(-28.762), math.rad(-29.164),
                                          math.rad(-4.24))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.2, 0.139, 0.05) *
                            CFrame.Angles(math.rad(-25.038), math.rad(28.648),
                                          math.rad(-9.282))
                    }
                }
            }
        },
        [0.2] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.02, 0.076, -0.316) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.303, 0.391, 0.55) *
                            CFrame.Angles(math.rad(-3.094), math.rad(32.888),
                                          math.rad(1.49))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.193, 0.374, 0.509) *
                            CFrame.Angles(math.rad(-0.115), math.rad(-39.133),
                                          math.rad(1.203))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.316, 0.095, 0.213) *
                            CFrame.Angles(math.rad(-29.679), math.rad(-30.252),
                                          math.rad(-0.458))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.204, 0.137, 0.066) *
                            CFrame.Angles(math.rad(-27.559), math.rad(29.507),
                                          math.rad(-9.397))
                    }
                }
            }
        },
        [0.25] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.02, 0.076, -0.296) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.033, 0.348, 0.054) *
                            CFrame.Angles(math.rad(-12.319), math.rad(38.675),
                                          math.rad(-7.85))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.065, 0.314, -0.019) *
                            CFrame.Angles(math.rad(-8.766), math.rad(-44.633),
                                          math.rad(11.459))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.339, 0.106, 0.22) *
                            CFrame.Angles(math.rad(-29.393), math.rad(-29.851),
                                          math.rad(-1.891))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.2, 0.139, 0.052) *
                            CFrame.Angles(math.rad(-25.325), math.rad(28.705),
                                          math.rad(-9.282))
                    }
                }
            }
        },
        [0.3] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.02, 0.076, -0.296) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.091, 0.286, -0.129) *
                            CFrame.Angles(math.rad(-14.84), math.rad(40.508),
                                          math.rad(-12.777))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.133, 0.273, -0.138) *
                            CFrame.Angles(math.rad(-10.256), math.rad(-45.722),
                                          math.rad(14.553))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.377, 0.123, 0.228) *
                            CFrame.Angles(math.rad(-28.762), math.rad(-29.164),
                                          math.rad(-4.24))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.2, 0.139, 0.05) *
                            CFrame.Angles(math.rad(-25.038), math.rad(28.648),
                                          math.rad(-9.282))
                    }
                }
            }
        },
        [0.35] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.005, 0.076, -0.296) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.349, 0.338, 0.693) *
                            CFrame.Angles(math.rad(1.203), math.rad(30.481),
                                          math.rad(2.349))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.229, 0.33, 0.651) *
                            CFrame.Angles(math.rad(3.094), math.rad(-37.3),
                                          math.rad(0.401))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.288, 0.082, 0.205) *
                            CFrame.Angles(math.rad(-29.966), math.rad(-30.711),
                                          math.rad(1.261))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.203, 0.137, 0.063) *
                            CFrame.Angles(math.rad(-26.986), math.rad(29.335),
                                          math.rad(-9.339))
                    }
                }
            }
        },
        [0.4] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.01, 0.076, -0.296) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.063, 0.359, 0.073) *
                            CFrame.Angles(math.rad(-11.516), math.rad(38.102),
                                          math.rad(-6.761))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.097, 0.296, -0.046) *
                            CFrame.Angles(math.rad(-9.511), math.rad(-45.206),
                                          math.rad(12.892))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.339, 0.106, 0.22) *
                            CFrame.Angles(math.rad(-29.393), math.rad(-29.851),
                                          math.rad(-1.891))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.2, 0.139, 0.052) *
                            CFrame.Angles(math.rad(-25.325), math.rad(28.705),
                                          math.rad(-9.282))
                    }
                }
            }
        },
        [0.45] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.02, 0.076, -0.326) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.313, 0.401, 0.556) *
                            CFrame.Angles(math.rad(-3.151), math.rad(32.945),
                                          math.rad(1.948))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.202, 0.384, 0.517) *
                            CFrame.Angles(math.rad(-0.115), math.rad(-39.19),
                                          math.rad(0.745))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.316, 0.095, 0.213) *
                            CFrame.Angles(math.rad(-29.679), math.rad(-30.252),
                                          math.rad(-0.458))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.204, 0.137, 0.066) *
                            CFrame.Angles(math.rad(-27.559), math.rad(29.507),
                                          math.rad(-9.397))
                    }
                }
            }
        },
        [0.5] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.02, 0.076, -0.321) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.368, 0.365, 0.706) *
                            CFrame.Angles(math.rad(0.688), math.rad(30.825),
                                          math.rad(3.323))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.259, 0.349, 0.675) *
                            CFrame.Angles(math.rad(3.552), math.rad(-37.128),
                                          math.rad(-0.917))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.288, 0.082, 0.205) *
                            CFrame.Angles(math.rad(-29.966), math.rad(-30.711),
                                          math.rad(1.261))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.203, 0.137, 0.063) *
                            CFrame.Angles(math.rad(-26.986), math.rad(29.335),
                                          math.rad(-9.339))
                    }
                }
            }
        },
        [0.55] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.057, 0.076, -0.351) *
                        CFrame.Angles(math.rad(10.772), math.rad(0.802),
                                      math.rad(-0.172)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.05, 0.365, -0.108) *
                            CFrame.Angles(math.rad(-17.361), math.rad(42.284),
                                          math.rad(-10.256))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.009, 0.377, -0.026) *
                            CFrame.Angles(math.rad(-8.537), math.rad(-45.149),
                                          math.rad(8.537))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.358, 0.107, 0.224) *
                            CFrame.Angles(math.rad(-33.69), math.rad(-25.267),
                                          math.rad(-3.495))
                    },
                    ["Head"] = {
                        CFrame = CFrame.Angles(math.rad(-6.417),
                                               math.rad(4.469), math.rad(-0.344))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.185, 0.13, 0.059) *
                            CFrame.Angles(math.rad(-28.132), math.rad(25.382),
                                          math.rad(-8.48))
                    }
                }
            }
        },
        [0.6] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.137, 0.076, -0.415) *
                        CFrame.Angles(math.rad(10.772), math.rad(2.636),
                                      math.rad(-0.516)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.306, 0.586, 0.54) *
                            CFrame.Angles(math.rad(-11.574), math.rad(37.414),
                                          math.rad(4.24))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.333, 0.344, 0.621) *
                            CFrame.Angles(math.rad(7.391), math.rad(-36.039),
                                          math.rad(-3.896))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.297, 0.06, 0.222) *
                            CFrame.Angles(math.rad(-43.659), math.rad(-14.782),
                                          math.rad(-2.005))
                    },
                    ["Head"] = {
                        CFrame = CFrame.Angles(math.rad(-6.303),
                                               math.rad(12.892),
                                               math.rad(-0.974))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.144, 0.113, 0.076) *
                            CFrame.Angles(math.rad(-34.034), math.rad(16.616),
                                          math.rad(-6.704))
                    }
                }
            }
        },
        [0.65] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.258, 0.076, -0.453) *
                        CFrame.Angles(math.rad(10.829), math.rad(6.99),
                                      math.rad(-1.318)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.14, 0.461, -0.119) *
                            CFrame.Angles(math.rad(-30.138), math.rad(49.675),
                                          math.rad(-11.287))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.296, 0.338, 0.297) *
                            CFrame.Angles(math.rad(7.563), math.rad(-37.586),
                                          math.rad(-2.865))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.043, 0.01, 0.314) *
                            CFrame.Angles(math.rad(-59.358), math.rad(17.418),
                                          math.rad(4.412))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, 0, -0.003) *
                            CFrame.Angles(math.rad(-6.36), math.rad(11.918),
                                          math.rad(-0.917))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.052, 0.097, 0.113) *
                            CFrame.Angles(math.rad(-42.112), math.rad(-1.547),
                                          math.rad(-3.495))
                    }
                }
            }
        },
        [0.7] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.269, 0.076, -0.455) *
                        CFrame.Angles(math.rad(10.829), math.rad(7.85),
                                      math.rad(-1.49)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.402, 0.159, -0.4) *
                            CFrame.Angles(math.rad(-33.403), math.rad(52.082),
                                          math.rad(-24.809))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.281, 0.337, 0.231) *
                            CFrame.Angles(math.rad(7.334), math.rad(-38.102),
                                          math.rad(-2.349))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.04, 0.006, 0.342) *
                            CFrame.Angles(math.rad(-57.353), math.rad(16.673),
                                          math.rad(4.354))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.086, -0.001, -0.007) *
                            CFrame.Angles(math.rad(-6.417), math.rad(1.719),
                                          math.rad(-0.115))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.056, 0.097, 0.115) *
                            CFrame.Angles(math.rad(-42.513), math.rad(-0.802),
                                          math.rad(-3.667))
                    }
                }
            }
        },
        [0.75] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.197, 0.076, -0.448) *
                        CFrame.Angles(math.rad(10.772), math.rad(-1.089),
                                      math.rad(0.229)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.38, 0.495, 0.73) *
                            CFrame.Angles(math.rad(-3.724), math.rad(34.034),
                                          math.rad(5.558))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.423, 0.416, 0.798) *
                            CFrame.Angles(math.rad(7.678), math.rad(-34.893),
                                          math.rad(-7.735))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.382, -0.155, 0.138) *
                            CFrame.Angles(math.rad(-38.445), math.rad(28.648),
                                          math.rad(-37.529))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.098, -0.002, -0.009) *
                            CFrame.Angles(math.rad(-6.417), math.rad(-3.724),
                                          math.rad(0.286))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.081, 0.099, 0.111) *
                            CFrame.Angles(math.rad(-41.711), math.rad(4.068),
                                          math.rad(-4.584))
                    }
                }
            }
        },
        [0.8] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.113, 0.076, -0.45) *
                        CFrame.Angles(math.rad(10.772), math.rad(-4.183),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.158, 0.448, 0.161) *
                            CFrame.Angles(math.rad(-9.568), math.rad(39.534),
                                          math.rad(-2.063))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.1, 0.61, 0.098) *
                            CFrame.Angles(math.rad(-13.751), math.rad(-46.811),
                                          math.rad(1.49))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.423, -0.209, -0.065) *
                            CFrame.Angles(math.rad(-8.594), math.rad(29.679),
                                          math.rad(-71.276))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.068, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(-3.724),
                                          math.rad(0.286))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.098, 0.1, 0.108) *
                            CFrame.Angles(math.rad(-40.852), math.rad(7.219),
                                          math.rad(-5.157))
                    }
                }
            }
        },
        [0.85] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.081, 0.076, -0.448) *
                        CFrame.Angles(math.rad(10.772), math.rad(0.573),
                                      math.rad(-0.115)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.458, 0.503, 0.643) *
                            CFrame.Angles(math.rad(-1.318), math.rad(32.028),
                                          math.rad(8.079))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.233, 0.507, 0.558) *
                            CFrame.Angles(math.rad(-2.636), math.rad(-41.368),
                                          math.rad(-2.063))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.256, -0.126, -0.222) *
                            CFrame.Angles(math.rad(-51.394), math.rad(-56.952),
                                          math.rad(-143.641))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.019, -0.001, -0.007) *
                            CFrame.Angles(math.rad(-6.417), math.rad(-1.49),
                                          math.rad(0.115))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.128, 0.106, 0.101) *
                            CFrame.Angles(math.rad(-38.961), math.rad(13.178),
                                          math.rad(-6.36))
                    }
                }
            }
        },
        [0.9] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.093, 0.076, -0.448) *
                        CFrame.Angles(math.rad(10.772), math.rad(-1.031),
                                      math.rad(0.172)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.515, 0.387, 0.795) *
                            CFrame.Angles(math.rad(5.959), math.rad(28.591),
                                          math.rad(8.709))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.287, 0.537, 0.71) *
                            CFrame.Angles(math.rad(-1.948), math.rad(-40.279),
                                          math.rad(-4.24))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.27, -0.175, -0.239) *
                            CFrame.Angles(math.rad(-56.551), math.rad(-52.655),
                                          math.rad(-148.568))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.017, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(2.75),
                                          math.rad(-0.229))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.14, 0.109, 0.101) *
                            CFrame.Angles(math.rad(-38.331), math.rad(15.47),
                                          math.rad(-6.875))
                    }
                }
            }
        },
        [0.95] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.039, 0.076, -0.441) *
                        CFrame.Angles(math.rad(10.772), math.rad(-2.464),
                                      math.rad(0.458)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.476, 0.361, 0.769) *
                            CFrame.Angles(math.rad(6.073), math.rad(28.934),
                                          math.rad(7.162))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.303, 0.565, 0.708) *
                            CFrame.Angles(math.rad(-2.75), math.rad(-40.222),
                                          math.rad(-5.042))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.282, -0.218, -0.263) *
                            CFrame.Angles(math.rad(-58.556), math.rad(-49.79),
                                          math.rad(-151.547))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.017, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(4.87),
                                          math.rad(-0.344))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.153, 0.112, 0.108) *
                            CFrame.Angles(math.rad(-38.904), math.rad(18.163),
                                          math.rad(-7.563))
                    }
                }
            }
        },
        [1] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.001, 0.076, -0.434) *
                        CFrame.Angles(math.rad(10.772), math.rad(-2.578),
                                      math.rad(0.516)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.441, 0.378, 0.73) *
                            CFrame.Angles(math.rad(4.24), math.rad(29.908),
                                          math.rad(6.131))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.314, 0.553, 0.701) *
                            CFrame.Angles(math.rad(-2.12), math.rad(-39.763),
                                          math.rad(-5.329))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.28, -0.223, -0.27) *
                            CFrame.Angles(math.rad(-58.213), math.rad(-50.535),
                                          math.rad(-152.063))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.017, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(5.5),
                                          math.rad(-0.401))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.144, 0.109, 0.122) *
                            CFrame.Angles(math.rad(-41.711), math.rad(15.928),
                                          math.rad(-7.506))
                    }
                }
            }
        },
        [1.05] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.078, 0.076, -0.418) *
                        CFrame.Angles(math.rad(10.772), math.rad(-2.75),
                                      math.rad(0.516)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.324, 0.423, 0.558) *
                            CFrame.Angles(math.rad(-1.547), math.rad(33.174),
                                          math.rad(2.693))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.314, 0.536, 0.63) *
                            CFrame.Angles(math.rad(-2.005), math.rad(-39.591),
                                          math.rad(-5.099))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.268, -0.216, -0.275) *
                            CFrame.Angles(math.rad(-56.207), math.rad(-53.858),
                                          math.rad(-152.178))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.017, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(6.016),
                                          math.rad(-0.458))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.025, 0.102, 0.182) *
                            CFrame.Angles(math.rad(-53.342), math.rad(-9.167),
                                          math.rad(-4.813))
                    }
                }
            }
        },
        [1.1] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.11, 0.076, -0.412) *
                        CFrame.Angles(math.rad(10.772), math.rad(-3.151),
                                      math.rad(0.63)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.234, 0.426, 0.405) *
                            CFrame.Angles(math.rad(-4.87), math.rad(35.409),
                                          math.rad(-0.229))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.291, 0.551, 0.546) *
                            CFrame.Angles(math.rad(-3.724), math.rad(-40.451),
                                          math.rad(-4.469))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.264, -0.214, -0.275) *
                            CFrame.Angles(math.rad(-55.52), math.rad(-54.832),
                                          math.rad(-152.349))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.017, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(6.073),
                                          math.rad(-0.458))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.084, 0.143, 0.237) *
                            CFrame.Angles(math.rad(-58.957), math.rad(-33.232),
                                          math.rad(-2.063))
                    }
                }
            }
        },
        [1.15] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.13, 0.076, -0.457) *
                        CFrame.Angles(math.rad(10.829), math.rad(-6.188),
                                      math.rad(1.203)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.38, 0.109, -0.654) *
                            CFrame.Angles(math.rad(-16.387), math.rad(47.269),
                                          math.rad(-25.783))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.145, 0.457, -0.396) *
                            CFrame.Angles(math.rad(-22.746), math.rad(-52.655),
                                          math.rad(12.433))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.274, -0.236, -0.276) *
                            CFrame.Angles(math.rad(-57.181), math.rad(-52.082),
                                          math.rad(-154.24))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.017, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(-1.089),
                                          math.rad(0.057))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.171, 0.247, 0.312) *
                            CFrame.Angles(math.rad(-65.317), math.rad(-61.536),
                                          math.rad(0.344))
                    }
                }
            }
        },
        [1.2] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.095, 0.076, -0.502) *
                        CFrame.Angles(math.rad(10.829), math.rad(-7.506),
                                      math.rad(1.432)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.226, 0.251, -0.547) *
                            CFrame.Angles(math.rad(-14.782), math.rad(47.212),
                                          math.rad(-18.277))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.205, 0.434, -0.487) *
                            CFrame.Angles(math.rad(-26.299), math.rad(-55.119),
                                          math.rad(15.011))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.281, -0.254, -0.277) *
                            CFrame.Angles(math.rad(-58.213), math.rad(-50.019),
                                          math.rad(-155.329))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.017, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.36), math.rad(-8.308),
                                          math.rad(0.63))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.17, 0.253, 0.318) *
                            CFrame.Angles(math.rad(-67.265), math.rad(-63.14),
                                          math.rad(-1.318))
                    }
                }
            }
        },
        [1.25] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.088, 0.076, -0.473) *
                        CFrame.Angles(math.rad(10.772), math.rad(0.859),
                                      math.rad(-0.172)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.321, 0.589, 0.332) *
                            CFrame.Angles(math.rad(-8.995), math.rad(36.612),
                                          math.rad(4.641))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.19, 0.538, 0.422) *
                            CFrame.Angles(math.rad(-5.787), math.rad(-43.831),
                                          math.rad(-1.031))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.299, -0.292, -0.278) *
                            CFrame.Angles(math.rad(-59.931), math.rad(-45.951),
                                          math.rad(-157.105))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.017, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(0.917),
                                          math.rad(-0.057))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.021, -0.228, -0.227) *
                            CFrame.Angles(math.rad(-0.688), math.rad(54.03),
                                          math.rad(91.673))
                    }
                }
            }
        },
        [1.3] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.13, 0.076, -0.491) *
                        CFrame.Angles(math.rad(10.772), math.rad(3.151),
                                      math.rad(-0.63)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.386, 0.651, 0.432) *
                            CFrame.Angles(math.rad(-9.167), math.rad(35.81),
                                          math.rad(7.391))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.262, 0.475, 0.604) *
                            CFrame.Angles(math.rad(-0.057), math.rad(-41.024),
                                          math.rad(-3.037))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.307, -0.311, -0.279) *
                            CFrame.Angles(math.rad(-60.619), math.rad(-44.06),
                                          math.rad(-157.793))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.013, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(0.745),
                                          math.rad(-0.057))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.03, -0.288, -0.228) *
                            CFrame.Angles(math.rad(-4.756), math.rad(54.03),
                                          math.rad(96.83))
                    }
                }
            }
        },
        [1.35] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.133, 0.076, -0.529) *
                        CFrame.Angles(math.rad(10.772), math.rad(3.094),
                                      math.rad(-0.573)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.247, 0.692, 0.104) *
                            CFrame.Angles(math.rad(-16.501), math.rad(41.081),
                                          math.rad(3.896))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.12, 0.541, 0.26) *
                            CFrame.Angles(math.rad(-7.277), math.rad(-46.524),
                                          math.rad(1.318))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.321, -0.342, -0.28) *
                            CFrame.Angles(math.rad(-61.478), math.rad(-41.081),
                                          math.rad(-158.767))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(-0.229), 0)
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.038, -0.354, -0.228) *
                            CFrame.Angles(math.rad(-11.402), math.rad(53.4),
                                          math.rad(105.195))
                    }
                }
            }
        },
        [1.4] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.125, 0.076, -0.534) *
                        CFrame.Angles(math.rad(10.772), math.rad(2.177),
                                      math.rad(-0.401)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.218, 0.675, 0.042) *
                            CFrame.Angles(math.rad(-16.73), math.rad(41.826),
                                          math.rad(2.807))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.09, 0.562, 0.192) *
                            CFrame.Angles(math.rad(-9.454), math.rad(-47.785),
                                          math.rad(2.177))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.326, -0.354, -0.28) *
                            CFrame.Angles(math.rad(-61.708), math.rad(-40.05),
                                          math.rad(-159.053))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.018, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(-0.802),
                                          math.rad(0.057))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.04, -0.367, -0.228) *
                            CFrame.Angles(math.rad(-13.694), math.rad(52.941),
                                          math.rad(108.117))
                    }
                }
            }
        },
        [1.45] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.113, 0.076, -0.537) *
                        CFrame.Angles(math.rad(10.772), math.rad(0.859),
                                      math.rad(-0.172)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.345, 0.654, 0.307) *
                            CFrame.Angles(math.rad(-9.969), math.rad(37.586),
                                          math.rad(6.417))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.153, 0.605, 0.33) *
                            CFrame.Angles(math.rad(-8.709), math.rad(-46.467),
                                          math.rad(-0.688))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.331, -0.364, -0.28) *
                            CFrame.Angles(math.rad(-61.937), math.rad(-39.133),
                                          math.rad(-159.34))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.417), math.rad(-1.375),
                                          math.rad(0.115))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.045, -0.377, -0.229) *
                            CFrame.Angles(math.rad(-15.871), math.rad(52.483),
                                          math.rad(110.925))
                    }
                }
            }
        },
        [1.5] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.113, 0.123, -0.533) *
                        CFrame.Angles(math.rad(6.532), math.rad(0.859),
                                      math.rad(-0.172)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.469, 0.604, 0.457) *
                            CFrame.Angles(math.rad(-10.256), math.rad(34.664),
                                          math.rad(14.84))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.268, 0.595, 0.461) *
                            CFrame.Angles(math.rad(-11.688), math.rad(-44.118),
                                          math.rad(-10.371))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.301, -0.331, -0.278) *
                            CFrame.Angles(math.rad(-56.207), math.rad(-49.962),
                                          math.rad(-153.725))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-7.219), math.rad(-1.375),
                                          math.rad(0.115))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.055, -0.377, -0.235) *
                            CFrame.Angles(math.rad(-10.6), math.rad(52.884),
                                          math.rad(104.278))
                    }
                }
            }
        },
        [1.55] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.113, 0.086, -0.633) *
                        CFrame.Angles(math.rad(9.912), math.rad(0.859),
                                      math.rad(-0.172)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.439, 0.729, 0.409) *
                            CFrame.Angles(math.rad(-9.11), math.rad(36.841),
                                          math.rad(11.516))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.218, 0.705, 0.409) *
                            CFrame.Angles(math.rad(-9.282), math.rad(-46.581),
                                          math.rad(-5.558))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.303, -0.161, -0.259) *
                            CFrame.Angles(math.rad(31.799), math.rad(-63.942),
                                          math.rad(-66.177))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-10.657), math.rad(-1.375),
                                          math.rad(0.057))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.102, -0.382, -0.28) *
                            CFrame.Angles(math.rad(8.537), math.rad(48.644),
                                          math.rad(79.011))
                    }
                }
            }
        },
        [1.6] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.113, 0.002, -0.697) *
                        CFrame.Angles(math.rad(17.533), math.rad(0.859),
                                      math.rad(-0.172)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.212, 0.825, 0.125) *
                            CFrame.Angles(math.rad(-6.245), math.rad(42.456),
                                          math.rad(-3.38))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.002, 0.731, 0.138) *
                            CFrame.Angles(math.rad(-1.948), math.rad(-51.165),
                                          math.rad(12.834))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.323, -0.13, -0.239) *
                            CFrame.Angles(math.rad(40.966), math.rad(-57.811),
                                          math.rad(-56.264))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-11.459), math.rad(-1.375),
                                          math.rad(0.057))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.122, -0.39, -0.319) *
                            CFrame.Angles(math.rad(10.886), math.rad(46.41),
                                          math.rad(75.229))
                    }
                }
            }
        },
        [1.65] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.149, 0.002, -0.67) *
                        CFrame.Angles(math.rad(17.475), math.rad(1.432),
                                      math.rad(1.547)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.075, 0.699, -0.331) *
                            CFrame.Angles(math.rad(-5.386), math.rad(44.805),
                                          math.rad(-17.418))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.067, 0.668, -0.109) *
                            CFrame.Angles(math.rad(-4.011), math.rad(-55.004),
                                          math.rad(15.069))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.316, -0.073, -0.148) *
                            CFrame.Angles(math.rad(42.857), math.rad(-55.978),
                                          math.rad(-54.03))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-11.459), math.rad(-1.833),
                                          math.rad(-2.922))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.126, -0.398, -0.44) *
                            CFrame.Angles(math.rad(8.824), math.rad(48.243),
                                          math.rad(78.553))
                    }
                }
            }
        },
        [1.7] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.171, 0.004, -0.608) *
                        CFrame.Angles(math.rad(17.361), math.rad(2.464),
                                      math.rad(5.042)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.08, 0.695, -0.18) *
                            CFrame.Angles(math.rad(-3.552), math.rad(36.268),
                                          math.rad(-13.923))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.095, 0.594, -0.18) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-57.697),
                                          math.rad(14.267))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.308, -0.032, -0.074) *
                            CFrame.Angles(math.rad(40.05), math.rad(-55.749),
                                          math.rad(-56.78))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-11.574), math.rad(-2.177),
                                          math.rad(-7.563))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.124, -0.401, -0.525) *
                            CFrame.Angles(math.rad(2.464), math.rad(49.217),
                                          math.rad(87.376))
                    }
                }
            }
        },
        [1.75] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.204, 0.012, -0.406) *
                        CFrame.Angles(math.rad(16.673), math.rad(5.443),
                                      math.rad(14.668)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.294, 0.505, 0.093) *
                            CFrame.Angles(math.rad(1.948), math.rad(16.673),
                                          math.rad(-15.584))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.222, 0.326, -0.369) *
                            CFrame.Angles(math.rad(-2.063), math.rad(-63.598),
                                          math.rad(17.762))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.371, -0.157, 0.18) *
                            CFrame.Angles(math.rad(-44.003), math.rad(-51.222),
                                          math.rad(-157.793))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-11.918), math.rad(-3.209),
                                          math.rad(-17.704))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.159, -0.222, -0.682) *
                            CFrame.Angles(math.rad(-31.054), math.rad(37.013),
                                          math.rad(151.146))
                    }
                }
            }
        },
        [1.8] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.208, 0.035, -0.367) *
                        CFrame.Angles(math.rad(14.553), math.rad(5.787),
                                      math.rad(15.584)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.302, 0.476, 0.073) *
                            CFrame.Angles(math.rad(0.286), math.rad(15.986),
                                          math.rad(-14.152))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.216, 0.3, -0.374) *
                            CFrame.Angles(math.rad(-4.756), math.rad(-63.312),
                                          math.rad(13.121))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.263, 0.101, 0.284) *
                            CFrame.Angles(math.rad(-42.227), math.rad(-57.582),
                                          math.rad(-146.677))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-7.62), math.rad(-4.698),
                                          math.rad(-17.647))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.141, -0.159, -0.66) *
                            CFrame.Angles(math.rad(-30.481), math.rad(40.394),
                                          math.rad(150.516))
                    }
                }
            }
        },
        [1.85] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.206, 0.134, -0.348) *
                        CFrame.Angles(math.rad(5.672), math.rad(5.5),
                                      math.rad(15.069)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.43, 0.485, 0.08) *
                            CFrame.Angles(math.rad(-5.5), math.rad(17.303),
                                          math.rad(-0.573))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.133, 0.326, -0.333) *
                            CFrame.Angles(math.rad(-20.054), math.rad(-59.645),
                                          math.rad(-8.422))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.345, -0.136, 0.249) *
                            CFrame.Angles(math.rad(-31.914), math.rad(-60.332),
                                          math.rad(-152.922))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-8.709), math.rad(-4.584),
                                          math.rad(-15.47))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.169, -0.19, -0.661) *
                            CFrame.Angles(math.rad(-30.424), math.rad(40.795),
                                          math.rad(152.407))
                    }
                }
            }
        },
        [1.9] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.206, 0.174, -0.371) *
                        CFrame.Angles(math.rad(2.12), math.rad(5.558),
                                      math.rad(12.72)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.491, 0.499, 0.11) *
                            CFrame.Angles(math.rad(-8.365), math.rad(19.595),
                                          math.rad(6.933))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.052, 0.355, -0.283) *
                            CFrame.Angles(math.rad(-23.892), math.rad(-55.863),
                                          math.rad(-15.642))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.404, -0.381, 0.082) *
                            CFrame.Angles(math.rad(-20.34), math.rad(-55.978),
                                          math.rad(-156.99))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-8.652), math.rad(-5.042),
                                          math.rad(-11.001))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.251, -0.353, -0.712) *
                            CFrame.Angles(math.rad(-26.585), math.rad(41.711),
                                          math.rad(156.99))
                    }
                }
            }
        },
        [1.95] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.169, 0.147, -0.569) *
                        CFrame.Angles(math.rad(4.469), math.rad(5.386),
                                      math.rad(6.704)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.518, 0.696, 0.209) *
                            CFrame.Angles(math.rad(-8.938), math.rad(27.044),
                                          math.rad(11.574))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.16, 0.569, -0.101) *
                            CFrame.Angles(math.rad(-19.481), math.rad(-52.941),
                                          math.rad(-17.647))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.022, -0.509, -0.448) *
                            CFrame.Angles(math.rad(34.263), math.rad(-36.669),
                                          math.rad(-112.128))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-9.11), math.rad(-4.584),
                                          math.rad(-2.75))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.05, -0.458, -0.707) *
                            CFrame.Angles(math.rad(17.647), math.rad(43.029),
                                          math.rad(98.606))
                    }
                }
            }
        },
        [2] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.077, 0.07, -0.715) *
                        CFrame.Angles(math.rad(11.402), math.rad(4.584),
                                      math.rad(3.667)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.355, 0.87, 0.239) *
                            CFrame.Angles(math.rad(-5.558), math.rad(32.945),
                                          math.rad(3.38))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.181, 0.743, -0.036) *
                            CFrame.Angles(math.rad(-8.193), math.rad(-52.598),
                                          math.rad(-7.563))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.038, -0.202, -0.565) *
                            CFrame.Angles(math.rad(35.753), math.rad(-7.62),
                                          math.rad(-67.552))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-7.277), math.rad(-4.927), 0)
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.175, -0.041, -0.598) *
                            CFrame.Angles(math.rad(21.772), math.rad(28.361),
                                          math.rad(47.154))
                    }
                }
            }
        },
        [2.05] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.139, 0.011, -0.752) *
                        CFrame.Angles(math.rad(16.673), math.rad(1.547),
                                      math.rad(-2.177)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.102, 0.875, 0.217) *
                            CFrame.Angles(math.rad(-4.469), math.rad(44.118),
                                          math.rad(-4.526))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.303, 0.814, 0.02) *
                            CFrame.Angles(math.rad(1.261), math.rad(-42.915),
                                          math.rad(-1.031))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.419, 0.079, -0.507) *
                            CFrame.Angles(math.rad(39.305), math.rad(-9.798),
                                          math.rad(-31.971))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-6.704), math.rad(-5.157),
                                          math.rad(5.386))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.194, -0.145, -0.384) *
                            CFrame.Angles(math.rad(18.621), math.rad(29.45),
                                          math.rad(45.951))
                    }
                }
            }
        },
        [2.1] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.221, 0.004, -0.662) *
                        CFrame.Angles(math.rad(17.189), math.rad(0.057),
                                      math.rad(-5.042)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.013, 0.752, 0.109) *
                            CFrame.Angles(math.rad(-6.532), math.rad(48.816),
                                          math.rad(-6.875))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.406, 0.736, 0.064) *
                            CFrame.Angles(math.rad(2.636), math.rad(-36.898),
                                          math.rad(-0.745))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.205, 0.068, -0.558) *
                            CFrame.Angles(math.rad(51.795), math.rad(-15.584),
                                          math.rad(-44.175))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(1.948), math.rad(-2.177),
                                          math.rad(8.709))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.196, -0.215, -0.275) *
                            CFrame.Angles(math.rad(6.474), math.rad(40.565),
                                          math.rad(64.515))
                    }
                }
            }
        },
        [2.15] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.319, -0.001, -0.463) *
                        CFrame.Angles(math.rad(17.418), math.rad(-1.948),
                                      math.rad(-9.282)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.212, 0.401, -0.254) *
                            CFrame.Angles(math.rad(-9.74), math.rad(54.488),
                                          math.rad(-17.418))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.493, 0.553, 0.116) *
                            CFrame.Angles(math.rad(4.412), math.rad(-28.648),
                                          math.rad(2.521))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.05, -0.078, -0.486) *
                            CFrame.Angles(math.rad(77.578), math.rad(-54.775),
                                          math.rad(-52.54))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-5.157), math.rad(1.375),
                                          math.rad(12.261))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.38, -0.627, -0.243) *
                            CFrame.Angles(math.rad(-11.459), math.rad(44.863),
                                          math.rad(155.443))
                    }
                }
            }
        },
        [2.2] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.331, -0.001, -0.424) *
                        CFrame.Angles(math.rad(17.418), math.rad(-2.235),
                                      math.rad(-9.969)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.286, 0.291, -0.37) *
                            CFrame.Angles(math.rad(-10.199), math.rad(55.29),
                                          math.rad(-21.772))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.493, 0.517, 0.121) *
                            CFrame.Angles(math.rad(4.641), math.rad(-27.502),
                                          math.rad(3.552))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.548, -0.286, -0.426) *
                            CFrame.Angles(math.rad(-61.192), math.rad(-63.484),
                                          math.rad(176.471))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-9.397), math.rad(1.662),
                                          math.rad(12.892))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.289, -0.321, -0.152) *
                            CFrame.Angles(math.rad(-14.897), math.rad(43.831),
                                          math.rad(155.501))
                    }
                }
            }
        },
        [2.25] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.306, 0.07, -0.419) *
                        CFrame.Angles(math.rad(11.173), math.rad(-0.917),
                                      math.rad(-7.964)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.15, 0.412, -0.229) *
                            CFrame.Angles(math.rad(-18.163), math.rad(50.993),
                                          math.rad(-6.417))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.525, 0.481, 0.095) *
                            CFrame.Angles(math.rad(-0.401), math.rad(-30.596),
                                          math.rad(-6.073))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.783, -0.207, -0.39) *
                            CFrame.Angles(math.rad(-70.818), math.rad(-36.841),
                                          math.rad(170.283))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-17.246), math.rad(-0.172),
                                          math.rad(10.886))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.168, -0.174, -0.059) *
                            CFrame.Angles(math.rad(-18.277), math.rad(42.628),
                                          math.rad(149.771))
                    }
                }
            }
        },
        [2.3] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.277, 0.12, -0.442) *
                        CFrame.Angles(math.rad(6.875), math.rad(0.115),
                                      math.rad(-5.844)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.01, 0.502, -0.105) *
                            CFrame.Angles(math.rad(-22.002), math.rad(47.04),
                                          math.rad(3.61))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.537, 0.469, 0.074) *
                            CFrame.Angles(math.rad(-4.584), math.rad(-33.232),
                                          math.rad(-13.465))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.765, -0.328, -0.387) *
                            CFrame.Angles(math.rad(-68.125), math.rad(-44.462),
                                          math.rad(166.502))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-10.542), math.rad(0.344),
                                          math.rad(8.824))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.208, -0.24, -0.169) *
                            CFrame.Angles(math.rad(-4.87), math.rad(53.285),
                                          math.rad(149.542))
                    }
                }
            }
        },
        [2.35] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.185, 0.111, -0.607) *
                        CFrame.Angles(math.rad(7.735), math.rad(1.948),
                                      math.rad(-1.318)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.2, 0.738, 0.114) *
                            CFrame.Angles(math.rad(-17.189), math.rad(42.8),
                                          math.rad(7.162))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.468, 0.621, 0.054) *
                            CFrame.Angles(math.rad(-6.646), math.rad(-40.623),
                                          math.rad(-15.986))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.234, -0.082, -0.582) *
                            CFrame.Angles(math.rad(66.979), math.rad(-23.892),
                                          math.rad(-68.698))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-9.74), math.rad(-0.859),
                                          math.rad(4.526))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.162, -0.732, -0.132) *
                            CFrame.Angles(math.rad(-15.986), math.rad(40.966),
                                          math.rad(120.951))
                    }
                }
            }
        },
        [2.4] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.117, 0.052, -0.729) *
                        CFrame.Angles(math.rad(12.949), math.rad(2.75),
                                      math.rad(0.229)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.184, 0.877, 0.187) *
                            CFrame.Angles(math.rad(-8.938), math.rad(41.597),
                                          math.rad(0.057))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.328, 0.767, 0.031) *
                            CFrame.Angles(math.rad(-2.521), math.rad(-45.378),
                                          math.rad(-7.792))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.195, -0.042, -0.574) *
                            CFrame.Angles(math.rad(42.284), math.rad(-8.537),
                                          math.rad(-47.097))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-8.766), math.rad(-1.146),
                                          math.rad(2.865))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.16, -0.171, -0.371) *
                            CFrame.Angles(math.rad(4.641), math.rad(37.3),
                                          math.rad(54.145))
                    }
                }
            }
        },
        [2.45] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.054, 0.025, -0.763) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.262, 0.89, 0.307) *
                            CFrame.Angles(math.rad(-0.229), math.rad(35.18),
                                          math.rad(-1.432))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.181, 0.808, 0.031) *
                            CFrame.Angles(math.rad(-0.974), math.rad(-49.217),
                                          math.rad(0.344))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.378, 0.061, -0.345) *
                            CFrame.Angles(math.rad(34.148), math.rad(-7.334),
                                          math.rad(-33.976))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.175, -0.092, -0.604) *
                            CFrame.Angles(math.rad(24.58), math.rad(28.19),
                                          math.rad(42.8))
                    }
                }
            }
        },
        [2.5] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.145, 0.033, -0.7) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.321, 0.802, 0.342) *
                            CFrame.Angles(math.rad(2.922), math.rad(31.685),
                                          math.rad(-1.031))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.21, 0.735, 0.179) *
                            CFrame.Angles(math.rad(0.745), math.rad(-47.097),
                                          math.rad(0.688))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.042, 0.034, -0.09) *
                            CFrame.Angles(math.rad(49.332), math.rad(-11.516),
                                          math.rad(-51.623))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.139, -0.112, -0.693) *
                            CFrame.Angles(math.rad(26.986), math.rad(40.795),
                                          math.rad(50.821))
                    }
                }
            }
        },
        [2.55] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.241, 0.046, -0.53) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.333, 0.606, 0.326) *
                            CFrame.Angles(math.rad(6.016), math.rad(28.304),
                                          math.rad(-3.552))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.243, 0.543, 0.363) *
                            CFrame.Angles(math.rad(4.412), math.rad(-42.8),
                                          math.rad(2.807))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.257, 0.034, 0.504) *
                            CFrame.Angles(math.rad(80.386), math.rad(-45.951),
                                          math.rad(-49.217))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.162, -0.348, -0.763) *
                            CFrame.Angles(math.rad(-44.519), math.rad(41.196),
                                          math.rad(147.479))
                    }
                }
            }
        },
        [2.6] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.168, 0.045, -0.457) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.262, 0.557, 0.279) *
                            CFrame.Angles(math.rad(3.782), math.rad(29.851),
                                          math.rad(-6.532))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.253, 0.459, 0.342) *
                            CFrame.Angles(math.rad(6.36), math.rad(-40.852),
                                          math.rad(3.724))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.525, -0.439, 0.338) *
                            CFrame.Angles(math.rad(-61.65), math.rad(-44.347),
                                          math.rad(174.236))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.303, -0.393, -0.718) *
                            CFrame.Angles(math.rad(-38.388), math.rad(22.689),
                                          math.rad(154.183))
                    }
                }
            }
        },
        [2.65] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.107, 0.045, -0.388) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.056, 0.497, 0.153) *
                            CFrame.Angles(math.rad(-3.323), math.rad(35.867),
                                          math.rad(-14.267))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.325, 0.333, 0.301) *
                            CFrame.Angles(math.rad(12.605), math.rad(-36.154),
                                          math.rad(2.75))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.706, -0.501, -0.681) *
                            CFrame.Angles(math.rad(-40.852), math.rad(-4.412),
                                          math.rad(-169.481))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.526, -0.414, -0.35) *
                            CFrame.Angles(math.rad(-19.251), math.rad(7.105),
                                          math.rad(158.48))
                    }
                }
            }
        },
        [2.7] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.169, 0.043, -0.396) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.018, 0.496, 0.127) *
                            CFrame.Angles(math.rad(-4.87), math.rad(37.414),
                                          math.rad(-15.584))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.339, 0.337, 0.265) *
                            CFrame.Angles(math.rad(13.063), math.rad(-35.867),
                                          math.rad(2.177))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-1.064, -0.51, -0.855) *
                            CFrame.Angles(math.rad(-37.128), math.rad(-4.011),
                                          math.rad(176.528))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.568, -0.49, -0.15) *
                            CFrame.Angles(math.rad(-26.012), math.rad(7.907),
                                          math.rad(162.376))
                    }
                }
            }
        },
        [2.75] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.226, 0.038, -0.464) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.019, 0.57, 0.125) *
                            CFrame.Angles(math.rad(-6.532), math.rad(39.591),
                                          math.rad(-14.439))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.358, 0.42, 0.194) *
                            CFrame.Angles(math.rad(11.459), math.rad(-37.013),
                                          math.rad(0.229))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-1.359, -0.509, -0.741) *
                            CFrame.Angles(math.rad(-51.337), math.rad(-13.407),
                                          math.rad(160.944))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.558, -0.511, 0.196) *
                            CFrame.Angles(math.rad(-37.643), math.rad(12.319),
                                          math.rad(163.579))
                    }
                }
            }
        },
        [2.8] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.234, 0.035, -0.523) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.04, 0.641, 0.139) *
                            CFrame.Angles(math.rad(-6.99), math.rad(40.565),
                                          math.rad(-12.605))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.363, 0.491, 0.163) *
                            CFrame.Angles(math.rad(9.912), math.rad(-38.216),
                                          math.rad(-1.089))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-1.139, -0.495, -0.5) *
                            CFrame.Angles(math.rad(-67.838), math.rad(-31.398),
                                          math.rad(165.069))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.499, -0.412, 0.298) *
                            CFrame.Angles(math.rad(-43.258), math.rad(21.944),
                                          math.rad(158.423))
                    }
                }
            }
        },
        [2.85] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.205, 0.026, -0.684) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.089, 0.825, 0.178) *
                            CFrame.Angles(math.rad(-6.99), math.rad(42.112),
                                          math.rad(-8.021))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.338, 0.684, 0.102) *
                            CFrame.Angles(math.rad(5.787), math.rad(-41.998),
                                          math.rad(-3.38))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.158, -0.097, -0.497) *
                            CFrame.Angles(math.rad(63.255), math.rad(-31.685),
                                          math.rad(-48.988))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.238, -0.25, 0.111) *
                            CFrame.Angles(math.rad(21.028), math.rad(46.811),
                                          math.rad(70.417))
                    }
                }
            }
        },
        [2.9] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.131, 0.023, -0.757) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.133, 0.905, 0.211) *
                            CFrame.Angles(math.rad(-5.5), math.rad(41.196),
                                          math.rad(-5.271))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.276, 0.785, 0.047) *
                            CFrame.Angles(math.rad(2.406), math.rad(-45.436),
                                          math.rad(-2.865))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.426, 0.023, -0.516) *
                            CFrame.Angles(math.rad(40.852), math.rad(-12.261),
                                          math.rad(-35.294))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.236, -0.104, -0.282) *
                            CFrame.Angles(math.rad(23.606), math.rad(29.049),
                                          math.rad(45.206))
                    }
                }
            }
        },
        [2.95] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.055, 0.024, -0.772) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.252, 0.901, 0.286) *
                            CFrame.Angles(math.rad(-0.688), math.rad(35.695),
                                          math.rad(-1.547))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.144, 0.821, -0.063) *
                            CFrame.Angles(math.rad(-2.636), math.rad(-50.993),
                                          math.rad(1.547))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.356, 0.101, -0.44) *
                            CFrame.Angles(math.rad(35.122), math.rad(-7.678),
                                          math.rad(-33.403))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.174, -0.056, -0.405) *
                            CFrame.Angles(math.rad(22.575), math.rad(25.439),
                                          math.rad(42.342))
                    }
                }
            }
        },
        [3] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.124, 0.029, -0.734) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.297, 0.846, 0.309) *
                            CFrame.Angles(math.rad(1.49), math.rad(33.232),
                                          math.rad(-1.031))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.1, 0.776, -0.106) *
                            CFrame.Angles(math.rad(-3.782), math.rad(-52.139),
                                          math.rad(4.297))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.31, 0.252, -0.302) *
                            CFrame.Angles(math.rad(42.628), math.rad(-11.688),
                                          math.rad(-31.112))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.15, -0.017, -0.23) *
                            CFrame.Angles(math.rad(24.58), math.rad(30.882),
                                          math.rad(45.722))
                    }
                }
            }
        },
        [3.05] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.138, 0.031, -0.656) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.301, 0.761, 0.299) *
                            CFrame.Angles(math.rad(1.948), math.rad(32.258),
                                          math.rad(-2.12))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.091, 0.694, -0.13) *
                            CFrame.Angles(math.rad(-3.667), math.rad(-51.222),
                                          math.rad(6.131))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.087, 0.184, -0.081) *
                            CFrame.Angles(math.rad(64.286), math.rad(-23.835),
                                          math.rad(-37.128))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.129, -0.181, -0.054) *
                            CFrame.Angles(math.rad(11.287), math.rad(53.572),
                                          math.rad(76.031))
                    }
                }
            }
        },
        [3.1] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.1, 0.031, -0.635) *
                        CFrame.Angles(math.rad(15.756), math.rad(3.151),
                                      math.rad(0.802)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.272, 0.731, 0.278) *
                            CFrame.Angles(math.rad(0.802), math.rad(33.06),
                                          math.rad(-3.438))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.115, 0.678, -0.114) *
                            CFrame.Angles(math.rad(-2.807), math.rad(-49.962),
                                          math.rad(5.443))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.079, -0.213, -0.026) *
                            CFrame.Angles(math.rad(77.808), math.rad(-40.164),
                                          math.rad(-45.894))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.002, -0.008) *
                            CFrame.Angles(math.rad(-4.469), math.rad(-1.031),
                                          math.rad(2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.333, -0.805, -0.045) *
                            CFrame.Angles(math.rad(-36.039), math.rad(47.441),
                                          math.rad(145.932))
                    }
                }
            }
        },
        [3.15] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.037, 0.043, -0.632) *
                        CFrame.Angles(math.rad(16.558), math.rad(3.037),
                                      math.rad(0.229)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.147, 0.681, 0.215) *
                            CFrame.Angles(math.rad(-1.432), math.rad(36.44),
                                          math.rad(-9.626))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.19, 0.679, -0.047) *
                            CFrame.Angles(math.rad(2.292), math.rad(-45.894),
                                          math.rad(4.87))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.156, -0.714, 0.007) *
                            CFrame.Angles(math.rad(24.293), math.rad(-81.303),
                                          math.rad(-102.33))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-4.985), math.rad(0.115),
                                          math.rad(2.75))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.475, -1.005, -0.041) *
                            CFrame.Angles(math.rad(-46.066), math.rad(17.361),
                                          math.rad(162.892))
                    }
                }
            }
        },
        [3.2] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.122, 0.074, -0.649) *
                        CFrame.Angles(math.rad(18.507), math.rad(2.807),
                                      math.rad(-0.974)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.025, 0.636, 0.174) *
                            CFrame.Angles(math.rad(0.229), math.rad(39.018),
                                          math.rad(-17.819))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.208, 0.686, -0.02) *
                            CFrame.Angles(math.rad(8.136), math.rad(-41.826),
                                          math.rad(9.454))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.29, -0.832, -0.016) *
                            CFrame.Angles(math.rad(-46.983), math.rad(-76.318),
                                          math.rad(-176.07))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-6.36), math.rad(2.865),
                                          math.rad(3.953))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.516, -1.05, -0.044) *
                            CFrame.Angles(math.rad(-44.92), math.rad(12.777),
                                          math.rad(166.1))
                    }
                }
            }
        },
        [3.25] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.263, 0.168, -0.72) *
                        CFrame.Angles(math.rad(22.746), math.rad(1.719),
                                      math.rad(-3.552)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.188, 0.511, 0.094) *
                            CFrame.Angles(math.rad(7.162), math.rad(42.685),
                                          math.rad(-36.612))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.195, 0.717, 0) *
                            CFrame.Angles(math.rad(17.361), math.rad(-32.372),
                                          math.rad(20.111))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.333, -0.912, -0.097) *
                            CFrame.Angles(math.rad(-53.342), math.rad(-71.849),
                                          math.rad(170.57))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-10.943), math.rad(8.766),
                                          math.rad(6.933))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.545, -1.076, -0.065) *
                            CFrame.Angles(math.rad(-43.086), math.rad(8.938),
                                          math.rad(168.793))
                    }
                }
            }
        },
        [3.3] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.291, 0.216, -0.773) *
                        CFrame.Angles(math.rad(23.606), math.rad(1.089),
                                      math.rad(-3.953)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.225, 0.506, 0.091) *
                            CFrame.Angles(math.rad(10.199), math.rad(42.8),
                                          math.rad(-41.253))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.165, 0.757, -0.003) *
                            CFrame.Angles(math.rad(18.908), math.rad(-29.966),
                                          math.rad(23.549))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.21, -0.861, -0.137) *
                            CFrame.Angles(math.rad(-33.518), math.rad(-76.203),
                                          math.rad(-171.486))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-13.636), math.rad(9.74),
                                          math.rad(7.735))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.548, -1.071, -0.087) *
                            CFrame.Angles(math.rad(-41.998), math.rad(8.251),
                                          math.rad(169.08))
                    }
                }
            }
        },
        [3.35] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.234, 0.263, -0.912) *
                        CFrame.Angles(math.rad(23.663), math.rad(-1.089),
                                      math.rad(3.094)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.165, 0.548, 0.214) *
                            CFrame.Angles(math.rad(13.808), math.rad(35.065),
                                          math.rad(-42.915))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.041, 0.86, 0.194) *
                            CFrame.Angles(math.rad(21.429), math.rad(-31.112),
                                          math.rad(28.992))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.113, -0.341, -0.134) *
                            CFrame.Angles(math.rad(45.837), math.rad(-69.156),
                                          math.rad(-81.876))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-17.934), math.rad(0.172),
                                          math.rad(6.131))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.056, -0.816, -0.116) *
                            CFrame.Angles(math.rad(-6.303), math.rad(4.068),
                                          math.rad(141.807))
                    }
                }
            }
        },
        [3.4] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.112, 0.269, -0.981) *
                        CFrame.Angles(math.rad(23.549), math.rad(-1.948),
                                      math.rad(9.225)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.066, 0.571, 0.321) *
                            CFrame.Angles(math.rad(15.069), math.rad(27.044),
                                          math.rad(-41.425))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.223, 0.923, 0.355) *
                            CFrame.Angles(math.rad(22.746), math.rad(-34.549),
                                          math.rad(31.799))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.083, 0.222, -0.027) *
                            CFrame.Angles(math.rad(46.581), math.rad(-64.229),
                                          math.rad(-58.843))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-19.824), math.rad(-8.594),
                                          math.rad(4.125))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.038, -0.628, -0.02) *
                            CFrame.Angles(math.rad(11.345), math.rad(-14.954),
                                          math.rad(126.967))
                    }
                }
            }
        },
        [3.45] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.301, 0.292, -1.067) *
                        CFrame.Angles(math.rad(21.944), math.rad(-2.12),
                                      math.rad(19.079)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.266, 0.643, 0.523) *
                            CFrame.Angles(math.rad(18.105), math.rad(8.193),
                                          math.rad(-31.914))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.597, 1.062, 0.488) *
                            CFrame.Angles(math.rad(23.778), math.rad(-50.363),
                                          math.rad(37.586))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.199, 0.683, 0.198) *
                            CFrame.Angles(math.rad(43.946), math.rad(-63.14),
                                          math.rad(-54.087))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-23.147), math.rad(-23.835),
                                          math.rad(-0.229))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.323, -0.753, 0.195) *
                            CFrame.Angles(math.rad(-53.801), math.rad(-19.251),
                                          math.rad(33.289))
                    }
                }
            }
        },
        [3.5] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.449, 0.298, -1.079) *
                        CFrame.Angles(math.rad(21.429), math.rad(-2.063),
                                      math.rad(20.684)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.43, 0.651, 0.589) *
                            CFrame.Angles(math.rad(20.626), math.rad(1.948),
                                          math.rad(-26.585))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.68, 1.084, 0.439) *
                            CFrame.Angles(math.rad(24.351), math.rad(-57.181),
                                          math.rad(41.368))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.272, 0.806, 0.291) *
                            CFrame.Angles(math.rad(30.08), math.rad(-67.036),
                                          math.rad(-68.182))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-23.892), math.rad(-26.413),
                                          math.rad(-1.089))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.09, -0.412, 0.196) *
                            CFrame.Angles(math.rad(-44.118), math.rad(12.376),
                                          math.rad(-7.334))
                    }
                }
            }
        },
        [3.55] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.636, 0.292, -0.786) *
                        CFrame.Angles(math.rad(22.231), math.rad(8.308),
                                      math.rad(18.392)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.602, 0.697, 0.565) *
                            CFrame.Angles(math.rad(13.006), math.rad(0.63),
                                          math.rad(-25.955))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.459, 0.565, 0.725) *
                            CFrame.Angles(math.rad(33.232), math.rad(-53.629),
                                          math.rad(38.216))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.34, 0.873, 0.417) *
                            CFrame.Angles(math.rad(-46.238), math.rad(-55.921),
                                          math.rad(-144.5))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-21.199), math.rad(-15.298),
                                          math.rad(14.496))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.168, -0.264, 0.208) *
                            CFrame.Angles(math.rad(-41.597), math.rad(13.063),
                                          math.rad(-8.709))
                    }
                }
            }
        },
        [3.6] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.724, 0.29, -0.596) *
                        CFrame.Angles(math.rad(23.033), math.rad(15.47),
                                      math.rad(16.616)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.607, 0.715, 0.522) *
                            CFrame.Angles(math.rad(6.073), math.rad(2.464),
                                          math.rad(-29.565))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.401, 0.136, 0.591) *
                            CFrame.Angles(math.rad(39.821), math.rad(-49.79),
                                          math.rad(44.805))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.303, 0.872, 0.446) *
                            CFrame.Angles(math.rad(-56.551), math.rad(-37.185),
                                          math.rad(-156.016))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-21.199), math.rad(-7.391),
                                          math.rad(24.694))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.205, -0.249, 0.22) *
                            CFrame.Angles(math.rad(-43.201), math.rad(11.918),
                                          math.rad(-7.162))
                    }
                }
            }
        },
        [3.65] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.877, 0.307, -0.505) *
                        CFrame.Angles(math.rad(21.601), math.rad(17.704),
                                      math.rad(16.043)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.563, 0.611, 0.49) *
                            CFrame.Angles(math.rad(5.386), math.rad(1.776),
                                          math.rad(-30.424))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.493, -0.102, 0.25) *
                            CFrame.Angles(math.rad(38.617), math.rad(-52.827),
                                          math.rad(55.462))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.21, 0.863, 0.356) *
                            CFrame.Angles(math.rad(-49.504), math.rad(-21.944),
                                          math.rad(-156.475))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-21.715), math.rad(-4.698),
                                          math.rad(29.45))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.255, -0.247, 0.246) *
                            CFrame.Angles(math.rad(-46.868), math.rad(16.272),
                                          math.rad(-9.969))
                    }
                }
            }
        },
        [3.7] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.954, 0.337, -0.507) *
                        CFrame.Angles(math.rad(17.991), math.rad(15.928),
                                      math.rad(16.673)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.473, 0.493, 0.455) *
                            CFrame.Angles(math.rad(7.506), math.rad(1.547),
                                          math.rad(-28.992))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.513, -0.041, 0.243) *
                            CFrame.Angles(math.rad(31.455), math.rad(-57.869),
                                          math.rad(50.306))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.101, 0.783, 0.164) *
                            CFrame.Angles(math.rad(-40.394), math.rad(-12.605),
                                          math.rad(-156.819))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-22.116), math.rad(-6.417),
                                          math.rad(29.221))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.293, -0.256, 0.262) *
                            CFrame.Angles(math.rad(-48.644), math.rad(22.231),
                                          math.rad(-13.923))
                    }
                }
            }
        },
        [3.75] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.847, 0.296, -0.653) *
                        CFrame.Angles(math.rad(16.788), math.rad(14.725),
                                      math.rad(13.694)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.598, 0.786, 0.435) *
                            CFrame.Angles(math.rad(3.667), math.rad(8.48),
                                          math.rad(-17.361))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.37, 0.234, 0.592) *
                            CFrame.Angles(math.rad(27.731), math.rad(-55.119),
                                          math.rad(33.06))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.073, 0.566, -0.086) *
                            CFrame.Angles(math.rad(-23.377), math.rad(-0.229),
                                          math.rad(-160.944))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-23.663), math.rad(-9.11),
                                          math.rad(28.762))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.375, -0.268, 0.293) *
                            CFrame.Angles(math.rad(-49.504), math.rad(39.706),
                                          math.rad(-24.637))
                    }
                }
            }
        },
        [3.8] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.54, 0.232, -0.78) *
                        CFrame.Angles(math.rad(18.449), math.rad(14.095),
                                      math.rad(6.933)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.513, 1.061, 0.433) *
                            CFrame.Angles(math.rad(-5.558), math.rad(23.319),
                                          math.rad(-12.834))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.122, 0.331, 0.811) *
                            CFrame.Angles(math.rad(31.054), math.rad(-41.425),
                                          math.rad(23.147))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.111, 0.461, -0.073) *
                            CFrame.Angles(math.rad(-20.97), math.rad(-0.401),
                                          math.rad(-159.454))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-26.356), math.rad(-2.464),
                                          math.rad(28.19))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.368, -0.299, 0.321) *
                            CFrame.Angles(math.rad(-55.863), math.rad(44.118),
                                          math.rad(-21.944))
                    }
                }
            }
        },
        [3.85] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.077, 0.18, -0.964) *
                        CFrame.Angles(math.rad(21.371), math.rad(9.912),
                                      math.rad(-6.474)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.049, 1.125, 0.25) *
                            CFrame.Angles(math.rad(-19.824), math.rad(51.853),
                                          math.rad(-12.892))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.373, 0.479, 0.859) *
                            CFrame.Angles(math.rad(33.461), math.rad(-17.876),
                                          math.rad(12.892))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.516, -0.165, -0.051) *
                            CFrame.Angles(math.rad(-12.261), math.rad(-18.507),
                                          math.rad(-168.507))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-31.971), math.rad(18.048),
                                          math.rad(24.924))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.33, -0.732, 0.034) *
                            CFrame.Angles(math.rad(17.762), math.rad(-45.894),
                                          math.rad(139.573))
                    }
                }
            }
        },
        [3.9] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.005, 0.188, -1.002) *
                        CFrame.Angles(math.rad(21.658), math.rad(4.927),
                                      math.rad(-9.912)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.093, 0.989, 0.188) *
                            CFrame.Angles(math.rad(-18.163), math.rad(57.181),
                                          math.rad(-15.355))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.461, 0.693, 0.799) *
                            CFrame.Angles(math.rad(28.075), math.rad(-14.152),
                                          math.rad(12.49))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.361, -0.389, -0.076) *
                            CFrame.Angles(math.rad(-0.115), math.rad(-25.21),
                                          math.rad(-151.605))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-26.184), math.rad(15.699),
                                          math.rad(20.569))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.275, -0.701, -0.132) *
                            CFrame.Angles(math.rad(9.74), math.rad(-12.433),
                                          math.rad(133.843))
                    }
                }
            }
        },
        [3.95] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.483, 0.238, -1.038) *
                        CFrame.Angles(math.rad(21.371), math.rad(-1.833),
                                      math.rad(-12.089)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.135, 1.013, 0.495) *
                            CFrame.Angles(math.rad(3.782), math.rad(47.269),
                                          math.rad(-8.48))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.08, 1.007, 0.481) *
                            CFrame.Angles(math.rad(11.516), math.rad(-33.002),
                                          math.rad(32.143))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.176, -0.357, -0.007) *
                            CFrame.Angles(math.rad(12.548), math.rad(-23.663),
                                          math.rad(-120.894))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-10.772), math.rad(3.094),
                                          math.rad(14.897))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.084, -0.198, -0.166) *
                            CFrame.Angles(math.rad(-7.506), math.rad(23.319),
                                          math.rad(106.054))
                    }
                }
            }
        },
        [4] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.681, 0.271, -0.964) *
                        CFrame.Angles(math.rad(21.371), math.rad(-1.833),
                                      math.rad(-12.089)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.229, 0.891, 0.6) *
                            CFrame.Angles(math.rad(12.089), math.rad(41.024),
                                          math.rad(-9.454))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.028, 0.851, 0.424) *
                            CFrame.Angles(math.rad(10.313), math.rad(-37.07),
                                          math.rad(40.164))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.18, -0.324, 0.045) *
                            CFrame.Angles(math.rad(11.23), math.rad(-25.783),
                                          math.rad(-118.831))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-10.371), math.rad(0.115),
                                          math.rad(13.522))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.046, -0.21, -0.117) *
                            CFrame.Angles(math.rad(-12.662), math.rad(34.893),
                                          math.rad(109.951))
                    }
                }
            }
        },
        [4.05] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.645, 0.283, -0.59) *
                        CFrame.Angles(math.rad(21.371), math.rad(-1.375),
                                      math.rad(-11.115)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.244, 0.479, 0.721) *
                            CFrame.Angles(math.rad(17.017), math.rad(35.753),
                                          math.rad(-15.928))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.113, 0.466, 0.472) *
                            CFrame.Angles(math.rad(9.053), math.rad(-32.143),
                                          math.rad(40.795))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.187, -0.232, 0.134) *
                            CFrame.Angles(math.rad(5.901), math.rad(-33.06),
                                          math.rad(-115.852))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-10.141), math.rad(-2.349),
                                          math.rad(10.313))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.002, -0.19, 0.244) *
                            CFrame.Angles(math.rad(-23.663), math.rad(52.827),
                                          math.rad(118.373))
                    }
                }
            }
        },
        [4.1] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.488, 0.274, -0.422) *
                        CFrame.Angles(math.rad(21.429), math.rad(-0.516),
                                      math.rad(-9.11)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.194, 0.334, 0.726) *
                            CFrame.Angles(math.rad(14.381), math.rad(35.065),
                                          math.rad(-20.569))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.121, 0.3, 0.496) *
                            CFrame.Angles(math.rad(11.459), math.rad(-29.164),
                                          math.rad(38.789))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.191, -0.155, 0.17) *
                            CFrame.Angles(math.rad(0.917), math.rad(-36.784),
                                          math.rad(-114.305))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-10.141), math.rad(-2.636),
                                          math.rad(9.11))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.016, -0.146, 0.417) *
                            CFrame.Angles(math.rad(-27.674), math.rad(58.614),
                                          math.rad(121.352))
                    }
                }
            }
        },
        [4.15] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.361, 0.261, -0.341) *
                        CFrame.Angles(math.rad(21.429), math.rad(-0.573),
                                      math.rad(-6.589)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.111, 0.214, 0.664) *
                            CFrame.Angles(math.rad(12.605), math.rad(33.976),
                                          math.rad(-26.471))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.108, 0.25, 0.491) *
                            CFrame.Angles(math.rad(12.261), math.rad(-29.966),
                                          math.rad(37.07))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.21, -0.069, 0.132) *
                            CFrame.Angles(math.rad(-13.121), math.rad(-39.477),
                                          math.rad(-116.941))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-10.084), math.rad(-3.151),
                                          math.rad(8.652))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.061, 0.021, 0.371) *
                            CFrame.Angles(math.rad(-23.892), math.rad(62.109),
                                          math.rad(116.368))
                    }
                }
            }
        },
        [4.2] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.341, 0.259, -0.341) *
                        CFrame.Angles(math.rad(21.486), math.rad(-2.063),
                                      math.rad(-6.188)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.048, 0.136, 0.606) *
                            CFrame.Angles(math.rad(14.209), math.rad(33.403),
                                          math.rad(-29.737))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.09, 0.289, 0.443) *
                            CFrame.Angles(math.rad(9.969), math.rad(-31.856),
                                          math.rad(37.873))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.379, -0.339, -0.038) *
                            CFrame.Angles(math.rad(-15.814), math.rad(-37.471),
                                          math.rad(-133.327))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-10.027), math.rad(-3.667),
                                          math.rad(8.594))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.076, 0.062, 0.089) *
                            CFrame.Angles(math.rad(-12.605), math.rad(51.91),
                                          math.rad(108.919))
                    }
                }
            }
        },
        [4.25] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.413, 0.26, -0.533) *
                        CFrame.Angles(math.rad(21.486), math.rad(-4.354),
                                      math.rad(-5.672)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.29, 0.308, 0.817) *
                            CFrame.Angles(math.rad(19.079), math.rad(30.825),
                                          math.rad(-18.22))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.029, 0.524, 0.323) *
                            CFrame.Angles(math.rad(5.271), math.rad(-39.821),
                                          math.rad(39.534))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.653, -0.587, -0.383) *
                            CFrame.Angles(math.rad(-17.704), math.rad(-31.054),
                                          math.rad(-149.427))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-9.855), math.rad(-4.87),
                                          math.rad(8.594))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.125, -0.45, -0.354) *
                            CFrame.Angles(math.rad(11.574), math.rad(-3.953),
                                          math.rad(144.729))
                    }
                }
            }
        },
        [4.3] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.39, 0.25, -0.715) *
                        CFrame.Angles(math.rad(21.486), math.rad(-2.75),
                                      math.rad(-6.303)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.398, 0.561, 0.957) *
                            CFrame.Angles(math.rad(16.215), math.rad(32.888),
                                          math.rad(-9.912))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.03, 0.707, 0.318) *
                            CFrame.Angles(math.rad(7.047), math.rad(-41.425),
                                          math.rad(36.383))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.637, -0.518, -0.445) *
                            CFrame.Angles(math.rad(-18.335), math.rad(-30.138),
                                          math.rad(-144.328))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-9.798), math.rad(-5.443),
                                          math.rad(8.709))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.381, -0.283, -0.154) *
                            CFrame.Angles(math.rad(21.314), math.rad(-26.585),
                                          math.rad(151.146))
                    }
                }
            }
        },
        [4.35] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.244, 0.2, -1.06) *
                        CFrame.Angles(math.rad(21.486), math.rad(4.354),
                                      math.rad(-9.053)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.228, 1.198, 0.859) *
                            CFrame.Angles(math.rad(-1.089), math.rad(47.785),
                                          math.rad(-2.005))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.079, 0.947, 0.427) *
                            CFrame.Angles(math.rad(14.61), math.rad(-38.675),
                                          math.rad(26.184))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.404, -0.102, -0.42) *
                            CFrame.Angles(math.rad(4.297), math.rad(-38.503),
                                          math.rad(-95.741))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-9.626), math.rad(-6.303),
                                          math.rad(9.11))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.185, 0.073, 0.161) *
                            CFrame.Angles(math.rad(44.118), math.rad(-24.866),
                                          math.rad(154.183))
                    }
                }
            }
        },
        [4.4] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.145, 0.179, -1.138) *
                        CFrame.Angles(math.rad(21.543), math.rad(5.959),
                                      math.rad(-9.683)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.103, 1.327, 0.718) *
                            CFrame.Angles(math.rad(-7.964), math.rad(55.29),
                                          math.rad(-2.063))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.121, 0.995, 0.482) *
                            CFrame.Angles(math.rad(16.673), math.rad(-36.268),
                                          math.rad(21.83))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.395, -0.041, -0.412) *
                            CFrame.Angles(math.rad(17.074), math.rad(-35.18),
                                          math.rad(-78.438))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-9.626), math.rad(-6.474),
                                          math.rad(9.397))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.254, 0.021, 0.185) *
                            CFrame.Angles(math.rad(48.587), math.rad(-17.59),
                                          math.rad(162.949))
                    }
                }
            }
        },
        [4.45] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.129, 0.163, -1.16) *
                        CFrame.Angles(math.rad(21.601), math.rad(-7.047),
                                      math.rad(-4.584)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.201, 0.941, 0.915) *
                            CFrame.Angles(math.rad(4.297), math.rad(48.071),
                                          math.rad(-5.672))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.089, 1.293, 0.209) *
                            CFrame.Angles(math.rad(7.563), math.rad(-41.769),
                                          math.rad(26.872))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.525, -0.264, -0.428) *
                            CFrame.Angles(math.rad(14.61), math.rad(-30.08),
                                          math.rad(-81.074))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-11.287), math.rad(8.594),
                                          math.rad(13.407))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.776, -0.934, -0.319) *
                            CFrame.Angles(math.rad(-43.086), math.rad(46.925),
                                          math.rad(-160.371))
                    }
                }
            }
        },
        [4.5] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.193, 0.163, -1.172) *
                        CFrame.Angles(math.rad(21.887), math.rad(-11.516),
                                      math.rad(-2.75)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.213, 0.792, 0.921) *
                            CFrame.Angles(math.rad(9.053), math.rad(45.149),
                                          math.rad(-8.251))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.186, 1.351, 0.064) *
                            CFrame.Angles(math.rad(4.412), math.rad(-45.034),
                                          math.rad(30.653))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.578, -0.659, -0.496) *
                            CFrame.Angles(math.rad(12.834), math.rad(-29.45),
                                          math.rad(-100.497))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-12.204), math.rad(13.751),
                                          math.rad(15.642))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.405, -0.187, -0.351) *
                            CFrame.Angles(math.rad(-71.047), math.rad(52.827),
                                          math.rad(165.528))
                    }
                }
            }
        },
        [4.55] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.076, 0.167, -1.174) *
                        CFrame.Angles(math.rad(21.601), math.rad(-6.818),
                                      math.rad(-4.698)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.2, 0.963, 0.894) *
                            CFrame.Angles(math.rad(4.87), math.rad(46.811),
                                          math.rad(-5.901))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.155, 1.27, 0.164) *
                            CFrame.Angles(math.rad(7.85), math.rad(-44.92),
                                          math.rad(31.054))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.647, -0.799, -0.546) *
                            CFrame.Angles(math.rad(5.558), math.rad(-34.893),
                                          math.rad(-112.529))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.03, -0.001, -0.008) *
                            CFrame.Angles(math.rad(-11.803), math.rad(9.282),
                                          math.rad(16.387))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.685, -0.482, -0.381) *
                            CFrame.Angles(math.rad(-68.812), math.rad(32.601),
                                          math.rad(178.362))
                    }
                }
            }
        },
        [4.6] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.13, 0.163, -1.173) *
                        CFrame.Angles(math.rad(21.601), math.rad(-6.818),
                                      math.rad(-4.698)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.157, 0.962, 0.853) *
                            CFrame.Angles(math.rad(3.323), math.rad(48.358),
                                          math.rad(-7.277))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.131, 1.284, 0.182) *
                            CFrame.Angles(math.rad(7.735), math.rad(-43.659),
                                          math.rad(29.221))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.679, -0.91, -0.557) *
                            CFrame.Angles(math.rad(5.157), math.rad(-33.747),
                                          math.rad(-119.061))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.118, -0.016, -0.015) *
                            CFrame.Angles(math.rad(-11.803), math.rad(9.282),
                                          math.rad(16.387))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.707, -0.513, -0.448) *
                            CFrame.Angles(math.rad(-68.182), math.rad(32.258),
                                          math.rad(-179.851))
                    }
                }
            }
        },
        [4.65] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.005, 0.16, -1.116) *
                        CFrame.Angles(math.rad(21.486), math.rad(-3.38),
                                      math.rad(-6.016)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.176, 1.022, 0.823) *
                            CFrame.Angles(math.rad(0.974), math.rad(47.441),
                                          math.rad(-5.615))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.076, 1.166, 0.248) *
                            CFrame.Angles(math.rad(8.881), math.rad(-44.576),
                                          math.rad(29.221))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.714, -0.926, -0.55) *
                            CFrame.Angles(math.rad(-0.286), math.rad(-35.466),
                                          math.rad(-124.16))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.072, -0.01, -0.015) *
                            CFrame.Angles(math.rad(-11.459), math.rad(5.615),
                                          math.rad(17.074))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.734, -0.557, -0.385) *
                            CFrame.Angles(math.rad(-66.979), math.rad(36.784),
                                          math.rad(-177.961))
                    }
                }
            }
        },
        [4.7] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.077, 0.16, -1.159) *
                        CFrame.Angles(math.rad(21.658), math.rad(-1.833),
                                      math.rad(-2.063)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.224, 1.084, 0.81) *
                            CFrame.Angles(math.rad(3.839), math.rad(41.597),
                                          math.rad(-8.824))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.187, 1.159, 0.211) *
                            CFrame.Angles(math.rad(11.058), math.rad(-52.483),
                                          math.rad(32.659))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.696, -0.829, -0.536) *
                            CFrame.Angles(math.rad(-5.099), math.rad(-37.471),
                                          math.rad(-122.498))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.1, -0.01, -0.018) *
                            CFrame.Angles(math.rad(-10.829), math.rad(3.782),
                                          math.rad(7.219))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.72, -0.585, -0.357) *
                            CFrame.Angles(math.rad(-66.578), math.rad(43.602),
                                          math.rad(-177.273))
                    }
                }
            }
        },
        [4.75] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.097, 0.155, -1.256) *
                        CFrame.Angles(math.rad(21.658), math.rad(-1.833),
                                      math.rad(-2.063)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.212, 1.177, 0.807) *
                            CFrame.Angles(math.rad(3.667), math.rad(42.399),
                                          math.rad(-7.448))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.293, 1.189, 0.142) *
                            CFrame.Angles(math.rad(14.095), math.rad(-55.061),
                                          math.rad(38.732))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.638, -0.744, -0.401) *
                            CFrame.Angles(math.rad(-3.839), math.rad(-37.987),
                                          math.rad(-117.915))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.092, -0.038, -0.066) *
                            CFrame.Angles(math.rad(-10.829), math.rad(3.782),
                                          math.rad(7.219))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.384, -0.307, -0.351) *
                            CFrame.Angles(math.rad(-43.717), math.rad(71.333),
                                          math.rad(150.631))
                    }
                }
            }
        },
        [4.8] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.098, 0.166, -1.106) *
                        CFrame.Angles(math.rad(21.658), math.rad(-1.833),
                                      math.rad(-2.063)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.209, 1.029, 0.765) *
                            CFrame.Angles(math.rad(4.068), math.rad(40.508),
                                          math.rad(-10.772))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.173, 1.099, 0.205) *
                            CFrame.Angles(math.rad(10.256), math.rad(-53.056),
                                          math.rad(33.805))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.527, -0.305, -0.307) *
                            CFrame.Angles(math.rad(17.361), math.rad(-27.788),
                                          math.rad(-76.433))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.083, -0.046, -0.064) *
                            CFrame.Angles(math.rad(-9.912), math.rad(3.38),
                                          math.rad(5.959))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.223, -0.055, -0.361) *
                            CFrame.Angles(math.rad(37.414), math.rad(60.619),
                                          math.rad(62.567))
                    }
                }
            }
        },
        [4.85] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.288, 0.162, -0.888) *
                        CFrame.Angles(math.rad(25.439), math.rad(2.235),
                                      math.rad(3.151)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.182, 0.827, 0.628) *
                            CFrame.Angles(math.rad(8.652), math.rad(28.476),
                                          math.rad(-25.955))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.22, 0.739, 0.186) *
                            CFrame.Angles(math.rad(16.329), math.rad(-57.983),
                                          math.rad(44.863))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.254, -0.15, -0.327) *
                            CFrame.Angles(math.rad(-22.976), math.rad(-48.071),
                                          math.rad(-124.676))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.036, -0.054, -0.057) *
                            CFrame.Angles(math.rad(-4.698), math.rad(1.146),
                                          math.rad(-0.344))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.498, 0.11, -0.236) *
                            CFrame.Angles(math.rad(14.897), math.rad(22.116),
                                          math.rad(47.842))
                    }
                }
            }
        },
        [4.9] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.356, 0.157, -0.835) *
                        CFrame.Angles(math.rad(26.643), math.rad(3.896),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.164, 0.766, 0.579) *
                            CFrame.Angles(math.rad(9.11), math.rad(24.866),
                                          math.rad(-30.711))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.253, 0.599, 0.138) *
                            CFrame.Angles(math.rad(19.595), math.rad(-59.874),
                                          math.rad(50.879))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.238, -0.109, -0.337) *
                            CFrame.Angles(math.rad(-12.949), math.rad(-51.222),
                                          math.rad(-113.56))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.015, -0.055, -0.053) *
                            CFrame.Angles(math.rad(-1.891), math.rad(-0.115),
                                          math.rad(-3.151))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.229, 0.012, -0.192) *
                            CFrame.Angles(math.rad(32.888), math.rad(32.372),
                                          math.rad(51.051))
                    }
                }
            }
        },
        [4.95] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.317, 0.128, -0.68) *
                        CFrame.Angles(math.rad(24.58), math.rad(4.297),
                                      math.rad(4.756)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.315, 0.704, 0.58) *
                            CFrame.Angles(math.rad(4.641), math.rad(27.674),
                                          math.rad(-23.491))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.194, 0.468, 0.11) *
                            CFrame.Angles(math.rad(11.803), math.rad(-58.785),
                                          math.rad(42.571))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.308, -0.07, -0.42) *
                            CFrame.Angles(math.rad(16.272), math.rad(-40.909),
                                          math.rad(-80.329))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(1.547), math.rad(-0.859),
                                          math.rad(-4.297))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.096, -0.277, -0.102) *
                            CFrame.Angles(math.rad(39.305), math.rad(67.609),
                                          math.rad(76.662))
                    }
                }
            }
        },
        [5] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.271, 0.099, -0.585) *
                        CFrame.Angles(math.rad(22.345), math.rad(4.354),
                                      math.rad(4.756)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.449, 0.666, 0.593) *
                            CFrame.Angles(math.rad(0.057), math.rad(30.195),
                                          math.rad(-15.527))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.161, 0.411, 0.094) *
                            CFrame.Angles(math.rad(5.214), math.rad(-57.697),
                                          math.rad(34.32))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.333, -0.073, -0.513) *
                            CFrame.Angles(math.rad(24.465), math.rad(-34.492),
                                          math.rad(-68.411))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(2.578), math.rad(-0.974),
                                          math.rad(-4.24))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.273, -0.402, -0.124) *
                            CFrame.Angles(math.rad(-2.005), math.rad(69.557),
                                          math.rad(120.149))
                    }
                }
            }
        },
        [5.05] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.153, 0.041, -0.391) *
                        CFrame.Angles(math.rad(16.387), math.rad(4.183),
                                      math.rad(4.813)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.429, 0.46, 0.565) *
                            CFrame.Angles(math.rad(-8.48), math.rad(33.117),
                                          math.rad(-7.391))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.177, 0.258, 0.028) *
                            CFrame.Angles(math.rad(-5.615), math.rad(-53.457),
                                          math.rad(20.569))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.271, -0.094, -0.646) *
                            CFrame.Angles(math.rad(3.266), math.rad(-45.264),
                                          math.rad(-96.314))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(3.782), math.rad(-1.031),
                                          math.rad(-4.125))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.243, -0.293, -0.155) *
                            CFrame.Angles(math.rad(37.93), math.rad(51.566),
                                          math.rad(62.109))
                    }
                }
            }
        },
        [5.1] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.092, 0.023, -0.304) *
                        CFrame.Angles(math.rad(13.121), math.rad(4.068),
                                      math.rad(4.813)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.208, 0.324, 0.541) *
                            CFrame.Angles(math.rad(-8.938), math.rad(32.945),
                                          math.rad(-10.542))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.218, 0.193, 0.047) *
                            CFrame.Angles(math.rad(-7.162), math.rad(-51.337),
                                          math.rad(15.756))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.299, -0.173, -0.637) *
                            CFrame.Angles(math.rad(32.773), math.rad(-41.941),
                                          math.rad(-60.963))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(4.068), math.rad(-1.089),
                                          math.rad(-4.068))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.195, -0.495, -0.12) *
                            CFrame.Angles(math.rad(32.601), math.rad(58.843),
                                          math.rad(80.73))
                    }
                }
            }
        },
        [5.15] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.006, 0.035, -0.173) *
                        CFrame.Angles(math.rad(7.105), math.rad(3.896),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.135, 0.131, 0.491) *
                            CFrame.Angles(math.rad(-9.568), math.rad(31.627),
                                          math.rad(-14.381))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.249, 0.112, 0.097) *
                            CFrame.Angles(math.rad(-9.626), math.rad(-48.071),
                                          math.rad(6.36))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.454, -0.378, -0.513) *
                            CFrame.Angles(math.rad(30.653), math.rad(-8.48),
                                          math.rad(-39.878))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(4.297), math.rad(-1.089),
                                          math.rad(-4.011))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.271, -0.57, -0.083) *
                            CFrame.Angles(math.rad(20.397), math.rad(63.255),
                                          math.rad(110.008))
                    }
                }
            }
        },
        [5.2] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.034, 0.06, -0.137) *
                        CFrame.Angles(math.rad(4.641), math.rad(3.839),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.119, 0.116, 0.487) *
                            CFrame.Angles(math.rad(-11.402), math.rad(30.711),
                                          math.rad(-10.485))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.258, 0.088, 0.075) *
                            CFrame.Angles(math.rad(-11.688), math.rad(-46.811),
                                          math.rad(3.209))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.484, -0.388, -0.364) *
                            CFrame.Angles(math.rad(22.804), math.rad(-2.349),
                                          math.rad(-42.342))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(4.297), math.rad(-1.089),
                                          math.rad(-4.011))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.175, -0.221, -0.126) *
                            CFrame.Angles(math.rad(65.317), math.rad(46.18),
                                          math.rad(77.98))
                    }
                }
            }
        },
        [5.25] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.055, 0.106, -0.11) *
                        CFrame.Angles(math.rad(0.401), math.rad(3.896),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.019, 0.131, 0.496) *
                            CFrame.Angles(math.rad(-14.267), math.rad(28.648),
                                          math.rad(-1.146))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.224, 0.084, 0.075) *
                            CFrame.Angles(math.rad(-16.215), math.rad(-44.748),
                                          math.rad(-4.526))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.378, -0.059, -0.165) *
                            CFrame.Angles(math.rad(10.084), math.rad(9.167),
                                          math.rad(-53.858))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-4.584), math.rad(-0.344),
                                          math.rad(-4.584))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.593, 0.017, 0.483) *
                            CFrame.Angles(math.rad(122.556), math.rad(4.526),
                                          math.rad(55.119))
                    }
                }
            }
        },
        [5.3] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.056, 0.132, -0.108) *
                        CFrame.Angles(math.rad(-1.891), math.rad(3.896),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.045, 0.14, 0.501) *
                            CFrame.Angles(math.rad(-15.699), math.rad(27.445),
                                          math.rad(3.953))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.186, 0.091, 0.089) *
                            CFrame.Angles(math.rad(-18.85), math.rad(-43.602),
                                          math.rad(-9.339))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.125, -0.13, -0.285) *
                            CFrame.Angles(math.rad(17.303), math.rad(12.147),
                                          math.rad(-129.947))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-12.433), math.rad(0.401),
                                          math.rad(-5.042))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.602, -0.341, 0.605) *
                            CFrame.Angles(math.rad(150.23), math.rad(-6.646),
                                          math.rad(64.114))
                    }
                }
            }
        },
        [5.35] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.042, 0.182, -0.302) *
                        CFrame.Angles(math.rad(-6.303), math.rad(3.896),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.463, 0.26, 0.616) *
                            CFrame.Angles(math.rad(-19.309), math.rad(25.382),
                                          math.rad(24.293))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.194, 0.234, 0.352) *
                            CFrame.Angles(math.rad(-26.986), math.rad(-41.425),
                                          math.rad(-32.086))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.242, 0.25, -0.21) *
                            CFrame.Angles(math.rad(16.616), math.rad(8.308),
                                          math.rad(-155.157))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-24.408), math.rad(1.604),
                                          math.rad(-5.5))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.624, -0.547, 0.559) *
                            CFrame.Angles(math.rad(158.824), math.rad(-11.23),
                                          math.rad(65.661))
                    }
                }
            }
        },
        [5.4] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.036, 0.192, -0.49) *
                        CFrame.Angles(math.rad(-7.162), math.rad(3.896),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.694, 0.351, 0.672) *
                            CFrame.Angles(math.rad(-21.085), math.rad(25.038),
                                          math.rad(33.805))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.394, 0.349, 0.472) *
                            CFrame.Angles(math.rad(-31.856), math.rad(-41.196),
                                          math.rad(-42.857))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.328, 0.076, -0.366) *
                            CFrame.Angles(math.rad(16.272), math.rad(4.813),
                                          math.rad(-158.709))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-26.929), math.rad(1.891),
                                          math.rad(-5.558))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.702, -0.531, 0.409) *
                            CFrame.Angles(math.rad(154.641), math.rad(-15.986),
                                          math.rad(61.364))
                    }
                }
            }
        },
        [5.45] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.076, -0.021, -0.895) *
                        CFrame.Angles(math.rad(28.018), math.rad(3.896),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.169, 0.868, 0.708) *
                            CFrame.Angles(math.rad(11.459), math.rad(26.528),
                                          math.rad(-23.95))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.185, 0.818, 0.477) *
                            CFrame.Angles(math.rad(21.83), math.rad(-50.764),
                                          math.rad(29.966))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.115, -0.253, -0.948) *
                            CFrame.Angles(math.rad(6.589), math.rad(-33.289),
                                          math.rad(-93.106))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(0.172), math.rad(-0.745),
                                          math.rad(-4.297))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.786, -0.642, 0.304) *
                            CFrame.Angles(math.rad(148.912), math.rad(-11.402),
                                          math.rad(49.332))
                    }
                }
            }
        },
        [5.5] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.076, -0.007, -0.984) *
                        CFrame.Angles(math.rad(33.289), math.rad(3.896),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.069, 0.882, 0.722) *
                            CFrame.Angles(math.rad(16.157), math.rad(22.861),
                                          math.rad(-33.002))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.317, 0.819, 0.451) *
                            CFrame.Angles(math.rad(29.737), math.rad(-46.811),
                                          math.rad(42.685))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.114, -0.227, -0.943) *
                            CFrame.Angles(math.rad(11.402), math.rad(-29.049),
                                          math.rad(-85.944))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-0.63), math.rad(-0.745),
                                          math.rad(-4.354))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.793, -0.702, 0.309) *
                            CFrame.Angles(math.rad(147.995), math.rad(-6.073),
                                          math.rad(42.628))
                    }
                }
            }
        },
        [5.55] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.076, 0, -1.023) *
                        CFrame.Angles(math.rad(35.523), math.rad(3.896),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.082, 0.912, 0.755) *
                            CFrame.Angles(math.rad(17.762), math.rad(20.626),
                                          math.rad(-34.435))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.326, 0.852, 0.452) *
                            CFrame.Angles(math.rad(32.315), math.rad(-46.524),
                                          math.rad(45.665))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.052, -0.118, -0.94) *
                            CFrame.Angles(math.rad(14.267), math.rad(-26.299),
                                          math.rad(-81.016))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-5.443), math.rad(-0.458),
                                          math.rad(-4.641))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.776, -0.702, 0.304) *
                            CFrame.Angles(math.rad(146.792), math.rad(0.802),
                                          math.rad(31.856))
                    }
                }
            }
        },
        [5.6] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.076, -0.005, -0.975) *
                        CFrame.Angles(math.rad(34.492), math.rad(3.896),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.17, 0.912, 0.772) *
                            CFrame.Angles(math.rad(16.73), math.rad(21.142),
                                          math.rad(-30.653))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.226, 0.873, 0.483) *
                            CFrame.Angles(math.rad(29.966), math.rad(-48.759),
                                          math.rad(40.451))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.047, -0.104, -0.755) *
                            CFrame.Angles(math.rad(14.037), math.rad(-30.424),
                                          math.rad(-79.813))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-8.537), math.rad(-0.286),
                                          math.rad(-4.87))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.632, -0.487, 0.269) *
                            CFrame.Angles(math.rad(140.776), math.rad(10.027),
                                          math.rad(34.836))
                    }
                }
            }
        },
        [5.65] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.075, -0.022, -0.718) *
                        CFrame.Angles(math.rad(29.565), math.rad(3.953),
                                      math.rad(4.927)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.463, 0.774, 0.787) *
                            CFrame.Angles(math.rad(11.631), math.rad(23.319),
                                          math.rad(-18.277))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.174, 0.786, 0.586) *
                            CFrame.Angles(math.rad(15.527), math.rad(-52.655),
                                          math.rad(17.59))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.021, -0.056, -0.133) *
                            CFrame.Angles(math.rad(7.162), math.rad(-40.451),
                                          math.rad(-83.022))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-13.35), math.rad(0.286),
                                          math.rad(-5.099))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.096, -0.277, -0.578) *
                            CFrame.Angles(math.rad(40.508), math.rad(-5.558),
                                          math.rad(115.967))
                    }
                }
            }
        },
        [5.7] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.076, -0.021, -0.594) *
                        CFrame.Angles(math.rad(28.018), math.rad(3.896),
                                      math.rad(4.87)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.541, 0.669, 0.787) *
                            CFrame.Angles(math.rad(10.141), math.rad(23.377),
                                          math.rad(-15.642))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.315, 0.697, 0.604) *
                            CFrame.Angles(math.rad(10.313), math.rad(-52.082),
                                          math.rad(10.657))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.048, -0.025, -0.036) *
                            CFrame.Angles(math.rad(1.604), math.rad(-37.357),
                                          math.rad(-90.184))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-14.152), math.rad(0.573),
                                          math.rad(-5.099))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.025, -0.146, -0.267) *
                            CFrame.Angles(math.rad(10.6), math.rad(-19.309),
                                          math.rad(87.319))
                    }
                }
            }
        },
        [5.75] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.221, -0.009, -0.476) *
                        CFrame.Angles(math.rad(27.617), math.rad(-2.693),
                                      math.rad(2.177)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.56, 0.386, 0.852) *
                            CFrame.Angles(math.rad(14.324), math.rad(26.299),
                                          math.rad(-14.095))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.493, 0.771, 0.551) *
                            CFrame.Angles(math.rad(3.094), math.rad(-47.384),
                                          math.rad(7.448))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.383, -0.154, -0.234) *
                            CFrame.Angles(math.rad(-2.406), math.rad(-5.901),
                                          math.rad(-148.912))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-13.636), math.rad(2.578),
                                          math.rad(2.693))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.321, 0.13, -0.084) *
                            CFrame.Angles(math.rad(43.086), math.rad(-34.377),
                                          math.rad(135.963))
                    }
                }
            }
        },
        [5.8] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.298, -0.004, -0.466) *
                        CFrame.Angles(math.rad(27.502), math.rad(-5.5),
                                      math.rad(-0.917)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.544, 0.319, 0.899) *
                            CFrame.Angles(math.rad(15.241), math.rad(30.195),
                                          math.rad(-11.803))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.608, 0.828, 0.535) *
                            CFrame.Angles(math.rad(1.547), math.rad(-42.743),
                                          math.rad(6.245))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.427, -0.211, -0.297) *
                            CFrame.Angles(math.rad(3.953), math.rad(-2.75),
                                          math.rad(-164.84))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-13.579), math.rad(3.839),
                                          math.rad(8.193))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.205, 0.395, 0.063) *
                            CFrame.Angles(math.rad(50.649), math.rad(-27.846),
                                          math.rad(138.77))
                    }
                }
            }
        },
        [5.85] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.362, -0.019, -0.796) *
                        CFrame.Angles(math.rad(27.044), math.rad(-5.901),
                                      math.rad(-7.047)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.616, 0.637, 1.127) *
                            CFrame.Angles(math.rad(8.193), math.rad(41.138),
                                          math.rad(6.589))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.767, 1.112, 0.543) *
                            CFrame.Angles(math.rad(1.375), math.rad(-37.357),
                                          math.rad(-1.604))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.131, -0.559, -0.355) *
                            CFrame.Angles(math.rad(17.475), math.rad(-18.621),
                                          math.rad(-82.506))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-13.923), math.rad(5.099),
                                          math.rad(13.35))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.183, 0.362, 0.092) *
                            CFrame.Angles(math.rad(37.471), math.rad(-39.19),
                                          math.rad(112.586))
                    }
                }
            }
        },
        [5.9] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.448, -0.025, -0.911) *
                        CFrame.Angles(math.rad(26.986), math.rad(-5.787),
                                      math.rad(-8.079)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.57, 0.777, 1.129) *
                            CFrame.Angles(math.rad(1.776), math.rad(46.811),
                                          math.rad(11.516))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.861, 1.174, 0.567) *
                            CFrame.Angles(math.rad(2.636), math.rad(-33.805),
                                          math.rad(-6.245))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.335, -0.077, -0.32) *
                            CFrame.Angles(math.rad(20.397), math.rad(-19.595),
                                          math.rad(-39.935))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-13.923), math.rad(5.214),
                                          math.rad(13.694))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.194, 0.318, 0.081) *
                            CFrame.Angles(math.rad(31.455), math.rad(-41.31),
                                          math.rad(104.565))
                    }
                }
            }
        },
        [5.95] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.68, -0.011, -0.523) *
                        CFrame.Angles(math.rad(26.986), math.rad(-5.787),
                                      math.rad(-8.079)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.437, 0.473, 1.001) *
                            CFrame.Angles(math.rad(0.516), math.rad(47.613),
                                          math.rad(-1.948))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.291, 0.65, 0.689) *
                            CFrame.Angles(math.rad(11.803), math.rad(-21.944),
                                          math.rad(-11.86))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.43, -0.187, -0.387) *
                            CFrame.Angles(math.rad(22.116), math.rad(-21.543),
                                          math.rad(-40.164))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.05, -0.038) *
                            CFrame.Angles(math.rad(-12.548), math.rad(2.693),
                                          math.rad(12.433))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.188, 0.325, 0.12) *
                            CFrame.Angles(math.rad(40.852), math.rad(-43.43),
                                          math.rad(114.878))
                    }
                }
            }
        },
        [6] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.66, 0.006, -0.303) *
                        CFrame.Angles(math.rad(26.413), math.rad(-5.214),
                                      math.rad(-7.85)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.36, 0.258, 0.895) *
                            CFrame.Angles(math.rad(2.807), math.rad(44.462),
                                          math.rad(-10.714))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.248, 0.489, 0.637) *
                            CFrame.Angles(math.rad(11.173), math.rad(-22.689),
                                          math.rad(-7.334))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.447, -0.219, -0.443) *
                            CFrame.Angles(math.rad(23.778), math.rad(-23.491),
                                          math.rad(-40.394))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.007, -0.045, -0.023) *
                            CFrame.Angles(math.rad(-11.287), math.rad(0.115),
                                          math.rad(11.115))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.171, 0.348, 0.162) *
                            CFrame.Angles(math.rad(52.54), math.rad(-42.857),
                                          math.rad(127.369))
                    }
                }
            }
        },
        [6.05] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.534, 0.066, -0.036) *
                        CFrame.Angles(math.rad(23.147), math.rad(-2.005),
                                      math.rad(-6.188)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.164, -0.029, 0.676) *
                            CFrame.Angles(math.rad(2.406), math.rad(39.19),
                                          math.rad(-22.861))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.036, 0.231, 0.518) *
                            CFrame.Angles(math.rad(8.594), math.rad(-26.7),
                                          math.rad(-0.802))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.415, -0.207, -0.557) *
                            CFrame.Angles(math.rad(33.69), math.rad(-34.721),
                                          math.rad(-39.362))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.009, -0.033, 0.01) *
                            CFrame.Angles(math.rad(-8.824), math.rad(-5.901),
                                          math.rad(7.964))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.018, 0.439, 0.268) *
                            CFrame.Angles(math.rad(81.131), math.rad(-17.475),
                                          math.rad(160.657))
                    }
                }
            }
        },
        [6.1] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.451, 0.1, 0.029) *
                        CFrame.Angles(math.rad(21.257), math.rad(-0.172),
                                      math.rad(-5.157)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.101, -0.096, 0.622) *
                            CFrame.Angles(math.rad(1.604), math.rad(36.841),
                                          math.rad(-25.382))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.896, 0.145, 0.444) *
                            CFrame.Angles(math.rad(6.875), math.rad(-28.877),
                                          math.rad(2.12))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.371, -0.182, -0.593) *
                            CFrame.Angles(math.rad(40.508), math.rad(-43.487),
                                          math.rad(-37.987))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.01, -0.028, 0.025) *
                            CFrame.Angles(math.rad(-7.85), math.rad(-8.537),
                                          math.rad(6.36))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.116, 0.45, 0.292) *
                            CFrame.Angles(math.rad(85.371), math.rad(4.526),
                                          math.rad(171.945))
                    }
                }
            }
        },
        [6.15] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.303, 0.148, 0.068) *
                        CFrame.Angles(math.rad(19.251), math.rad(1.833),
                                      math.rad(-3.953)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.212, -0.054, 0.696) *
                            CFrame.Angles(math.rad(2.349), math.rad(33.633),
                                          math.rad(-20.684))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.634, 0.069, 0.29) *
                            CFrame.Angles(math.rad(3.61), math.rad(-31.856),
                                          math.rad(9.397))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.193, -0.381, -0.591) *
                            CFrame.Angles(math.rad(49.618), math.rad(-65.432),
                                          math.rad(-50.306))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.011, -0.023, 0.039) *
                            CFrame.Angles(math.rad(-7.162), math.rad(-11.058),
                                          math.rad(3.495))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.267, 0.424, 0.26) *
                            CFrame.Angles(math.rad(77.521), math.rad(26.929),
                                          math.rad(-172.174))
                    }
                }
            }
        },
        [6.2] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.251, 0.155, 0.066) *
                        CFrame.Angles(math.rad(19.595), math.rad(1.891),
                                      math.rad(-3.896)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.216, -0.059, 0.697) *
                            CFrame.Angles(math.rad(4.125), math.rad(32.659),
                                          math.rad(-21.658))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.49, 0.044, 0.197) *
                            CFrame.Angles(math.rad(2.75), math.rad(-32.601),
                                          math.rad(15.814))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.186, -0.547, -0.567) *
                            CFrame.Angles(math.rad(29.908), math.rad(-78.151),
                                          math.rad(-79.928))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.011, -0.025, 0.035) *
                            CFrame.Angles(math.rad(-7.277), math.rad(-10.141),
                                          math.rad(2.406))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.297, 0.43, 0.235) *
                            CFrame.Angles(math.rad(71.849), math.rad(29.049),
                                          math.rad(-166.96))
                    }
                }
            }
        },
        [6.25] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.17, 0.148, 0.045) *
                        CFrame.Angles(math.rad(21.83), math.rad(1.891),
                                      math.rad(-3.896)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.052, -0.131, 0.573) *
                            CFrame.Angles(math.rad(7.735), math.rad(30.882),
                                          math.rad(-32.429))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.377, 0.078, 0.116) *
                            CFrame.Angles(math.rad(2.636), math.rad(-34.034),
                                          math.rad(23.377))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.333, -0.611, -0.554) *
                            CFrame.Angles(math.rad(-69.786), math.rad(-66.921),
                                          math.rad(174.007))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.009, -0.033, 0.01) *
                            CFrame.Angles(math.rad(-7.907), math.rad(-4.526),
                                          math.rad(0.974))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.327, 0.484, 0.19) *
                            CFrame.Angles(math.rad(62.682), math.rad(26.872),
                                          math.rad(-161.803))
                    }
                }
            }
        },
        [6.3] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.134, 0.139, 0.022) *
                        CFrame.Angles(math.rad(23.319), math.rad(1.833),
                                      math.rad(-3.896)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.061, -0.096, 0.567) *
                            CFrame.Angles(math.rad(9.282), math.rad(30.08),
                                          math.rad(-34.034))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.362, 0.116, 0.103) *
                            CFrame.Angles(math.rad(2.922), math.rad(-34.721),
                                          math.rad(25.84))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.384, -0.587, -0.548) *
                            CFrame.Angles(math.rad(-73.568), math.rad(-58.9),
                                          math.rad(167.762))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.008, -0.039, -0.007) *
                            CFrame.Angles(math.rad(-8.537), math.rad(-0.802),
                                          math.rad(0.516))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.336, 0.518, 0.171) *
                            CFrame.Angles(math.rad(59.187), math.rad(24.866),
                                          math.rad(-161.001))
                    }
                }
            }
        },
        [6.35] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.052, 0.118, -0.06) *
                        CFrame.Angles(math.rad(26.127), math.rad(1.776),
                                      math.rad(-3.896)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.083, -0.027, 0.534) *
                            CFrame.Angles(math.rad(11.688), math.rad(28.648),
                                          math.rad(-36.555))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.321, 0.188, 0.07) *
                            CFrame.Angles(math.rad(3.151), math.rad(-36.669),
                                          math.rad(30.653))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.432, -0.571, -0.509) *
                            CFrame.Angles(math.rad(-73.682), math.rad(-53.629),
                                          math.rad(160.6))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.05, -0.038) *
                            CFrame.Angles(math.rad(-11.058), math.rad(6.245),
                                          math.rad(-0.344))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.347, 0.58, 0.143) *
                            CFrame.Angles(math.rad(54.202), math.rad(21.314),
                                          math.rad(-160.944))
                    }
                }
            }
        },
        [6.4] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0, 0.111, -0.123) *
                        CFrame.Angles(math.rad(27.044), math.rad(1.776),
                                      math.rad(-3.896)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.211, 0.078, 0.585) *
                            CFrame.Angles(math.rad(12.49), math.rad(28.132),
                                          math.rad(-32.028))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.295, 0.214, 0.051) *
                            CFrame.Angles(math.rad(2.693), math.rad(-38.102),
                                          math.rad(32.716))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.442, -0.598, -0.471) *
                            CFrame.Angles(math.rad(-72.536), math.rad(-54.717),
                                          math.rad(157.048))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.053, -0.048) *
                            CFrame.Angles(math.rad(-13.063), math.rad(8.594),
                                          math.rad(-0.745))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.35, 0.599, 0.135) *
                            CFrame.Angles(math.rad(52.827), math.rad(20.225),
                                          math.rad(-161.23))
                    }
                }
            }
        },
        [6.45] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.137, 0.103, -0.317) *
                        CFrame.Angles(math.rad(25.898), math.rad(1.891),
                                      math.rad(-6.532)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.631, 0.455, 0.682) *
                            CFrame.Angles(math.rad(7.334), math.rad(33.461),
                                          math.rad(-7.678))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.385, 0.371, 0.135) *
                            CFrame.Angles(math.rad(-0.917), math.rad(-39.419),
                                          math.rad(26.929))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.051, -0.66, -0.283) *
                            CFrame.Angles(math.rad(31.283), math.rad(-74.427),
                                          math.rad(-104.049))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-21.658), math.rad(8.995),
                                          math.rad(-2.005))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.287, 0.439, 0.047) *
                            CFrame.Angles(math.rad(52.025), math.rad(20.34),
                                          math.rad(-160.371))
                    }
                }
            }
        },
        [6.5] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.176, 0.098, -0.432) *
                        CFrame.Angles(math.rad(24.465), math.rad(2.292),
                                      math.rad(-9.225)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.665, 0.626, 0.451) *
                            CFrame.Angles(math.rad(-4.698), math.rad(42.112),
                                          math.rad(2.349))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.544, 0.544, 0.255) *
                            CFrame.Angles(math.rad(-2.406), math.rad(-38.102),
                                          math.rad(17.876))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.342, -0.438, -0.21) *
                            CFrame.Angles(math.rad(41.024), math.rad(-33.06),
                                          math.rad(-83.308))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-25.955), math.rad(8.136),
                                          math.rad(-2.349))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.182, 0.27, -0.012) *
                            CFrame.Angles(math.rad(56.379), math.rad(21.543),
                                          math.rad(-162.548))
                    }
                }
            }
        },
        [6.55] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.15, 0.379, -0.54) *
                        CFrame.Angles(math.rad(29.278), math.rad(2.406),
                                      math.rad(-9.225)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.422, 0.784, 0.3) *
                            CFrame.Angles(math.rad(7.964), math.rad(45.264),
                                          math.rad(-24.924))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.454, 0.591, 0.301) *
                            CFrame.Angles(math.rad(13.636), math.rad(-35.466),
                                          math.rad(37.987))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.343, -0.093, 0.226) *
                            CFrame.Angles(math.rad(17.59), math.rad(41.368),
                                          math.rad(-74.37))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-20.283), math.rad(5.558),
                                          math.rad(8.995))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.466, -0.354, -0.031) *
                            CFrame.Angles(math.rad(46.696), math.rad(37.07),
                                          math.rad(100.898))
                    }
                }
            }
        },
        [6.6] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.138, 0.466, -0.69) *
                        CFrame.Angles(math.rad(32.2), math.rad(2.292),
                                      math.rad(-9.225)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.298, 0.897, 0.358) *
                            CFrame.Angles(math.rad(15.756), math.rad(42.17),
                                          math.rad(-35.065))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.398, 0.71, 0.361) *
                            CFrame.Angles(math.rad(19.652), math.rad(-33.289),
                                          math.rad(44.519))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.283, -0.08, 0.299) *
                            CFrame.Angles(math.rad(31.513), math.rad(47.326),
                                          math.rad(-93.335))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(-0.006, -0.055, -0.052) *
                            CFrame.Angles(math.rad(-18.22), math.rad(5.042),
                                          math.rad(13.006))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.019, 0.148, -0.159) *
                            CFrame.Angles(math.rad(31.685), math.rad(44.863),
                                          math.rad(65.718))
                    }
                }
            }
        },
        [6.65] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.08, 0.337, -0.622) *
                        CFrame.Angles(math.rad(29.45), math.rad(2.177),
                                      math.rad(-9.225)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.335, 0.832, 0.346) *
                            CFrame.Angles(math.rad(8.766), math.rad(46.009),
                                          math.rad(-25.382))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.435, 0.694, 0.348) *
                            CFrame.Angles(math.rad(14.381), math.rad(-34.721),
                                          math.rad(34.836))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.359, -0.327, 0.104) *
                            CFrame.Angles(math.rad(40.164), math.rad(48.873),
                                          math.rad(-130.978))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.082, -0.064, -0.085) *
                            CFrame.Angles(math.rad(-17.819), math.rad(2.005),
                                          math.rad(13.293))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.094, -0.211, -0.201) *
                            CFrame.Angles(math.rad(17.59), math.rad(58.843),
                                          math.rad(89.668))
                    }
                }
            }
        },
        [6.7] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.044, 0.255, -0.306) *
                        CFrame.Angles(math.rad(22.632), math.rad(2.292),
                                      math.rad(-9.225)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.204, 0.375, 0.105) *
                            CFrame.Angles(math.rad(-5.443), math.rad(47.326),
                                          math.rad(-21.887))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.152, 0.187, 0.016) *
                            CFrame.Angles(math.rad(6.646), math.rad(-32.315),
                                          math.rad(38.503))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.343, -0.562, 0.02) *
                            CFrame.Angles(math.rad(37.013), math.rad(44.06),
                                          math.rad(-143.182))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.082, -0.064, -0.085) *
                            CFrame.Angles(math.rad(-17.361), math.rad(-1.146),
                                          math.rad(13.522))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.179, -0.305, -0.249) *
                            CFrame.Angles(math.rad(-7.277), math.rad(61.306),
                                          math.rad(120.207))
                    }
                }
            }
        },
        [6.75] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.025, 0.288, -0.386) *
                        CFrame.Angles(math.rad(15.699), math.rad(3.667),
                                      math.rad(-8.938)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.305, 0.509, 0.204) *
                            CFrame.Angles(math.rad(-12.834), math.rad(45.951),
                                          math.rad(-4.354))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.208, 0.31, 0.076) *
                            CFrame.Angles(math.rad(-0.057), math.rad(-34.435),
                                          math.rad(24.694))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.199, -0.351, -0.028) *
                            CFrame.Angles(math.rad(31.341), math.rad(42.972),
                                          math.rad(-97.288))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.082, -0.064, -0.085) *
                            CFrame.Angles(math.rad(-28.075), math.rad(-2.464),
                                          math.rad(12.147))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.373, -0.071, -0.664) *
                            CFrame.Angles(math.rad(52.025), math.rad(51.108),
                                          math.rad(42.8))
                    }
                }
            }
        },
        [6.8] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.048, 0.283, -0.611) *
                        CFrame.Angles(math.rad(15.126), math.rad(4.068),
                                      math.rad(-8.824)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.414, 0.763, 0.319) *
                            CFrame.Angles(math.rad(-14.381), math.rad(47.842),
                                          math.rad(5.042))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.541, 0.664, 0.333) *
                            CFrame.Angles(math.rad(-1.776), math.rad(-36.841),
                                          math.rad(7.506))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.106, -0.173, -0.055) *
                            CFrame.Angles(math.rad(30.768), math.rad(41.597),
                                          math.rad(-84.339))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.082, -0.064, -0.085) *
                            CFrame.Angles(math.rad(-31.856), math.rad(-2.75),
                                          math.rad(11.688))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.444, 0.044, -0.797) *
                            CFrame.Angles(math.rad(51.051), math.rad(34.549),
                                          math.rad(29.049))
                    }
                }
            }
        },
        [6.85] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.048, 0.238, -1.17) *
                        CFrame.Angles(math.rad(15.126), math.rad(4.068),
                                      math.rad(-8.824)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.19, 1.282, 0.21) *
                            CFrame.Angles(math.rad(-16.157), math.rad(58.728),
                                          math.rad(7.62))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.536, 1.225, 0.427) *
                            CFrame.Angles(math.rad(-5.271), math.rad(-46.41),
                                          math.rad(-2.349))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.058, 0.059, 0.021) *
                            CFrame.Angles(math.rad(30.367), math.rad(45.722),
                                          math.rad(-84.798))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.082, -0.065, -0.085) *
                            CFrame.Angles(math.rad(-3.094), math.rad(0.859),
                                          math.rad(14.954))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.476, 0.182, -0.802) *
                            CFrame.Angles(math.rad(42.685), math.rad(27.158),
                                          math.rad(28.419))
                    }
                }
            }
        },
        [6.9] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.088, 0.249, -1.032) *
                        CFrame.Angles(math.rad(15.126), math.rad(4.068),
                                      math.rad(-8.824)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.223, 1.146, 0.289) *
                            CFrame.Angles(math.rad(-11.115), math.rad(53.686),
                                          math.rad(4.297))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.528, 1.086, 0.409) *
                            CFrame.Angles(math.rad(-4.698), math.rad(-44.576),
                                          math.rad(0.802))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.041, 0.151, 0.065) *
                            CFrame.Angles(math.rad(30.539), math.rad(44.92),
                                          math.rad(-86.116))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.081, -0.062, -0.076) *
                            CFrame.Angles(math.rad(-3.552), math.rad(0.344),
                                          math.rad(13.923))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.476, 0.222, -0.79) *
                            CFrame.Angles(math.rad(41.368), math.rad(26.872),
                                          math.rad(29.507))
                    }
                }
            }
        },
        [6.95] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.099, 0.238, -0.567) *
                        CFrame.Angles(math.rad(15.126), math.rad(4.068),
                                      math.rad(-8.824)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.17, 0.661, 0.277) *
                            CFrame.Angles(math.rad(-6.761), math.rad(46.524),
                                          math.rad(-5.558))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.365, 0.569, 0.218) *
                            CFrame.Angles(math.rad(-3.094), math.rad(-38.445),
                                          math.rad(13.407))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.018, 0.29, 0.166) *
                            CFrame.Angles(math.rad(30.882), math.rad(41.597),
                                          math.rad(-91.215))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.076, -0.05, -0.028) *
                            CFrame.Angles(math.rad(-5.959), math.rad(-2.063),
                                          math.rad(8.824))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.452, 0.275, -0.729) *
                            CFrame.Angles(math.rad(40.966), math.rad(29.221),
                                          math.rad(34.148))
                    }
                }
            }
        },
        [0.017] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.048, 0.197, -0.438) *
                        CFrame.Angles(math.rad(15.126), math.rad(4.068),
                                      math.rad(-8.824)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.057, 0.497, 0.19) *
                            CFrame.Angles(math.rad(-8.193), math.rad(46.524),
                                          math.rad(-10.141))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.438, 0.29, -0.673) *
                            CFrame.Angles(math.rad(38.732), math.rad(29.393),
                                          math.rad(37.815))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.073, -0.045, -0.007) *
                            CFrame.Angles(math.rad(-7.105), math.rad(-3.037),
                                          math.rad(6.417))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.232, 0.391, 0.1) *
                            CFrame.Angles(math.rad(-2.807), math.rad(-36.555),
                                          math.rad(18.449))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.011, 0.331, 0.219) *
                            CFrame.Angles(math.rad(30.825), math.rad(40.565),
                                          math.rad(-93.106))
                    }
                }
            }
        },
        [0.067] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.024, 0.196, -0.3) *
                        CFrame.Angles(math.rad(13.579), math.rad(1.662),
                                      math.rad(-8.079)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.059, 0.259, 0.181) *
                            CFrame.Angles(math.rad(-4.011), math.rad(43.258),
                                          math.rad(-15.413))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.031, -0.059, -0.553) *
                            CFrame.Angles(math.rad(17.876), math.rad(3.037),
                                          math.rad(68.583))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-5.157), math.rad(-0.688),
                                          math.rad(6.474))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.002, 0.187, -0.101) *
                            CFrame.Angles(math.rad(-7.277), math.rad(-37.471),
                                          math.rad(26.986))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.004, 0.236, 0.295) *
                            CFrame.Angles(math.rad(6.36), math.rad(44.404),
                                          math.rad(-66.52))
                    }
                }
            }
        },
        [0.117] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.031, 0.244, -0.261) *
                        CFrame.Angles(math.rad(9.969), math.rad(-2.75),
                                      math.rad(-6.818)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.037, 0.114, 0.31) *
                            CFrame.Angles(math.rad(3.094), math.rad(38.56),
                                          math.rad(-12.319))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.131, 0.083, -0.153) *
                            CFrame.Angles(math.rad(-21.715), math.rad(-8.48),
                                          math.rad(23.606))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-0.745), math.rad(4.526),
                                          math.rad(8.079))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.009, 0.178, -0.145) *
                            CFrame.Angles(math.rad(-17.418), math.rad(-40.623),
                                          math.rad(23.835))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.337, -0.065, 0.235) *
                            CFrame.Angles(math.rad(-24.637), math.rad(23.09),
                                          math.rad(-35.695))
                    }
                }
            }
        },
        [0.167] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.017, 0.342, -0.283) *
                        CFrame.Angles(math.rad(1.146), math.rad(-3.953),
                                      math.rad(-6.704)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.071, 0.094, 0.433) *
                            CFrame.Angles(math.rad(-1.031), math.rad(37.185),
                                          math.rad(3.782))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.008, 0.083, 0.182) *
                            CFrame.Angles(math.rad(-28.648), math.rad(-8.537),
                                          math.rad(19.824))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-0.344), math.rad(6.99),
                                          math.rad(8.594))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.216, 0.327, -0.073) *
                            CFrame.Angles(math.rad(-29.794), math.rad(-38.102),
                                          math.rad(3.094))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.687, -0.103, 0.18) *
                            CFrame.Angles(math.rad(-21.486), math.rad(6.646),
                                          math.rad(-42.342))
                    }
                }
            }
        },
        [0.217] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.026, 0.373, -0.386) *
                        CFrame.Angles(math.rad(-2.521), math.rad(-1.891),
                                      math.rad(-6.99)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.252, 0.219, 0.547) *
                            CFrame.Angles(math.rad(-10.084), math.rad(37.815),
                                          math.rad(17.934))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.105, 0.164, 0.285) *
                            CFrame.Angles(math.rad(-14.267), math.rad(-18.449),
                                          math.rad(37.701))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-4.641), math.rad(5.901),
                                          math.rad(8.193))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.55, 0.462, 0.09) *
                            CFrame.Angles(math.rad(-30.94), math.rad(-34.95),
                                          math.rad(-14.61))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.525, -0.159, 0.14) *
                            CFrame.Angles(math.rad(-22.517), math.rad(4.641),
                                          math.rad(-53.113))
                    }
                }
            }
        },
        [0.267] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.395, -0.675) *
                        CFrame.Angles(math.rad(-6.073), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.509, 0.523, 0.649) *
                            CFrame.Angles(math.rad(-26.184), math.rad(39.018),
                                          math.rad(36.841))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.071, 0.101, 0.192) *
                            CFrame.Angles(math.rad(17.361), math.rad(4.24),
                                          math.rad(72.078))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-10.714), math.rad(2.75),
                                          math.rad(7.219))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.969, 0.562, 0.274) *
                            CFrame.Angles(math.rad(-31.856), math.rad(-32.028),
                                          math.rad(-35.581))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.234, -0.132, -0.174) *
                            CFrame.Angles(math.rad(-20.34), math.rad(-8.079),
                                          math.rad(-72.823))
                    }
                }
            }
        },
        [0.317] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.071, 0.361, -0.799) *
                        CFrame.Angles(math.rad(-3.094), math.rad(2.578),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.516, 0.697, 0.651) *
                            CFrame.Angles(math.rad(-26.299), math.rad(41.826),
                                          math.rad(35.294))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.096, 0.115, -0.006) *
                            CFrame.Angles(math.rad(31.054), math.rad(26.299),
                                          math.rad(61.536))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-10.485), math.rad(0.974),
                                          math.rad(7.219))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.03, 0.695, 0.303) *
                            CFrame.Angles(math.rad(-32.258), math.rad(-35.008),
                                          math.rad(-37.013))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.252, -0.19, -0.378) *
                            CFrame.Angles(math.rad(-12.605), math.rad(-26.929),
                                          math.rad(-87.204))
                    }
                }
            }
        },
        [0.367] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.201, -0.932) *
                        CFrame.Angles(math.rad(11.115), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.222, 0.965, 0.605) *
                            CFrame.Angles(math.rad(-9.568), math.rad(48.415),
                                          math.rad(8.881))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.059, -0.099, -0.512) *
                            CFrame.Angles(math.rad(50.363), math.rad(52.311),
                                          math.rad(45.493))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-6.474), math.rad(-0.859),
                                          math.rad(7.735))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.816, 1.032, 0.307) *
                            CFrame.Angles(math.rad(-22.403), math.rad(-47.154),
                                          math.rad(-21.601))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.214, 0.05, -0.628) *
                            CFrame.Angles(math.rad(24.007), math.rad(-50.879),
                                          math.rad(-70.703))
                    }
                }
            }
        },
        [0.417] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.078, 0.142, -0.892) *
                        CFrame.Angles(math.rad(16.501), math.rad(2.005),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.122, 0.935, 0.596) *
                            CFrame.Angles(math.rad(-2.12), math.rad(47.555),
                                          math.rad(-2.464))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.087, -0.208, -0.571) *
                            CFrame.Angles(math.rad(56.723), math.rad(53.572),
                                          math.rad(48.415))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(0.917), math.rad(-0.057),
                                          math.rad(8.193))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.724, 1.035, 0.324) *
                            CFrame.Angles(math.rad(-14.381), math.rad(-48.472),
                                          math.rad(-12.032))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.13, -0.065, -0.611) *
                            CFrame.Angles(math.rad(19.423), math.rad(-57.181),
                                          math.rad(-83.251))
                    }
                }
            }
        },
        [0.467] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.12, -0.447) *
                        CFrame.Angles(math.rad(18.507), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.054, 0.471, 0.489) *
                            CFrame.Angles(math.rad(0.401), math.rad(42.743),
                                          math.rad(-14.668))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.123, -0.45, -0.64) *
                            CFrame.Angles(math.rad(70.073), math.rad(64.916),
                                          math.rad(60.218))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(15.126), math.rad(1.833),
                                          math.rad(8.308))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.719, 0.61, 0.285) *
                            CFrame.Angles(math.rad(-7.448), math.rad(-40.623),
                                          math.rad(-0.688))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.147, -0.364, -0.548) *
                            CFrame.Angles(math.rad(-23.95), math.rad(-63.656),
                                          math.rad(-144.156))
                    }
                }
            }
        },
        [0.517] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.12, -0.267) *
                        CFrame.Angles(math.rad(18.507), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.123, 0.192, 0.319) *
                            CFrame.Angles(math.rad(0.745), math.rad(41.482),
                                          math.rad(-25.21))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.012, -0.496, -0.657) *
                            CFrame.Angles(math.rad(66.234), math.rad(75.401),
                                          math.rad(69.099))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(11.975), math.rad(1.432),
                                          math.rad(8.308))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.603, 0.407, 0.18) *
                            CFrame.Angles(math.rad(-6.073), math.rad(-38.503),
                                          math.rad(6.99))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.295, -0.491, -0.51) *
                            CFrame.Angles(math.rad(-37.701), math.rad(-61.478),
                                          math.rad(-166.215))
                    }
                }
            }
        },
        [0.567] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.201, -0.208) *
                        CFrame.Angles(math.rad(11.115), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.136, 0.153, 0.285) *
                            CFrame.Angles(math.rad(-6.188), math.rad(41.253),
                                          math.rad(-15.183))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.173, -0.508, -0.682) *
                            CFrame.Angles(math.rad(-11.459), math.rad(82.792),
                                          math.rad(149.427))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(0.172), math.rad(-0.057),
                                          math.rad(8.021))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.563, 0.303, 0.094) *
                            CFrame.Angles(math.rad(-13.808), math.rad(-35.867),
                                          math.rad(0.401))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.449, -0.611, -0.466) *
                            CFrame.Angles(math.rad(-46.352), math.rad(-60.218),
                                          math.rad(177.674))
                    }
                }
            }
        },
        [0.617] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.201, -0.262) *
                        CFrame.Angles(math.rad(11.115), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.028, 0.249, 0.37) *
                            CFrame.Angles(math.rad(-6.474), math.rad(41.539),
                                          math.rad(-10.084))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.108, -0.495, -0.669) *
                            CFrame.Angles(math.rad(28.018), math.rad(82.219),
                                          math.rad(108.576))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-2.636), math.rad(-0.401),
                                          math.rad(7.907))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.674, 0.372, 0.154) *
                            CFrame.Angles(math.rad(-14.725), math.rad(-36.154),
                                          math.rad(-4.412))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.399, -0.565, -0.484) *
                            CFrame.Angles(math.rad(-44.118), math.rad(-59.702),
                                          math.rad(-177.216))
                    }
                }
            }
        },
        [0.667] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.201, -0.57) *
                        CFrame.Angles(math.rad(11.115), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.22, 0.608, 0.577) *
                            CFrame.Angles(math.rad(-7.964), math.rad(43.889),
                                          math.rad(3.782))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.09, -0.363, -0.612) *
                            CFrame.Angles(math.rad(60.161), math.rad(64.057),
                                          math.rad(63.541))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-5.615), math.rad(-0.745),
                                          math.rad(7.792))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.968, 0.669, 0.312) *
                            CFrame.Angles(math.rad(-20.111), math.rad(-38.961),
                                          math.rad(-20.225))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.11, -0.3, -0.565) *
                            CFrame.Angles(math.rad(-25.267), math.rad(-61.306),
                                          math.rad(-138.427))
                    }
                }
            }
        },
        [0.717] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.201, -0.745) *
                        CFrame.Angles(math.rad(11.115), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.252, 0.781, 0.614) *
                            CFrame.Angles(math.rad(-8.824), math.rad(45.722),
                                          math.rad(7.448))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.067, -0.2, -0.56) *
                            CFrame.Angles(math.rad(54.889), math.rad(57.697),
                                          math.rad(53.4))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-6.245), math.rad(-0.859),
                                          math.rad(7.792))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.034, 0.827, 0.334) *
                            CFrame.Angles(math.rad(-24.122), math.rad(-41.368),
                                          math.rad(-26.299))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.052, -0.137, -0.599) *
                            CFrame.Angles(math.rad(-0.516), math.rad(-60.905),
                                          math.rad(-103.018))
                    }
                }
            }
        },
        [0.767] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.201, -0.932) *
                        CFrame.Angles(math.rad(11.115), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.222, 0.965, 0.605) *
                            CFrame.Angles(math.rad(-9.568), math.rad(48.415),
                                          math.rad(8.881))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.059, -0.099, -0.512) *
                            CFrame.Angles(math.rad(50.363), math.rad(52.311),
                                          math.rad(45.493))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-6.474), math.rad(-0.859),
                                          math.rad(7.735))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.06, 1.004, 0.315) *
                            CFrame.Angles(math.rad(-29.966), math.rad(-44.805),
                                          math.rad(-32.2))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.214, 0.05, -0.628) *
                            CFrame.Angles(math.rad(24.007), math.rad(-50.879),
                                          math.rad(-70.703))
                    }
                }
            }
        },
        [0.817] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.16, -0.887) *
                        CFrame.Angles(math.rad(14.782), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.158, 0.93, 0.601) *
                            CFrame.Angles(math.rad(-4.412), math.rad(47.67),
                                          math.rad(1.031))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.052, -0.088, -0.515) *
                            CFrame.Angles(math.rad(50.821), math.rad(53.572),
                                          math.rad(45.722))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-0.859), math.rad(-0.172),
                                          math.rad(8.021))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.994, 1.009, 0.331) *
                            CFrame.Angles(math.rad(-24.293), math.rad(-46.295),
                                          math.rad(-25.611))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.169, 0.012, -0.626) *
                            CFrame.Angles(math.rad(19.022), math.rad(-54.202),
                                          math.rad(-77.177))
                    }
                }
            }
        },
        [0.867] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.12, -0.447) *
                        CFrame.Angles(math.rad(18.507), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.054, 0.471, 0.489) *
                            CFrame.Angles(math.rad(0.401), math.rad(42.743),
                                          math.rad(-14.668))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.112, -0.264, -0.598) *
                            CFrame.Angles(math.rad(56.494), math.rad(60.734),
                                          math.rad(59.473))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(15.126), math.rad(1.833),
                                          math.rad(8.308))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.89, 0.629, 0.304) *
                            CFrame.Angles(math.rad(-11.345), math.rad(-39.992),
                                          math.rad(-7.62))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.107, -0.214, -0.596) *
                            CFrame.Angles(math.rad(-20.741), math.rad(-61.822),
                                          math.rad(-131.952))
                    }
                }
            }
        },
        [0.917] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.12, -0.267) *
                        CFrame.Angles(math.rad(18.507), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.123, 0.192, 0.319) *
                            CFrame.Angles(math.rad(0.745), math.rad(41.482),
                                          math.rad(-25.21))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.092, -0.365, -0.636) *
                            CFrame.Angles(math.rad(58.671), math.rad(67.895),
                                          math.rad(67.724))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(11.23), math.rad(1.547),
                                          math.rad(8.308))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.76, 0.441, 0.206) *
                            CFrame.Angles(math.rad(-9.11), math.rad(-37.93),
                                          math.rad(0.745))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.268, -0.349, -0.559) *
                            CFrame.Angles(math.rad(-35.409), math.rad(-60.562),
                                          math.rad(-158.308))
                    }
                }
            }
        },
        [0.967] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.077, 0.201, -0.208) *
                        CFrame.Angles(math.rad(11.115), math.rad(2.063),
                                      math.rad(-7.105)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.136, 0.153, 0.285) *
                            CFrame.Angles(math.rad(-6.188), math.rad(41.253),
                                          math.rad(-15.183))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.173, -0.508, -0.682) *
                            CFrame.Angles(math.rad(-11.459), math.rad(82.792),
                                          math.rad(149.427))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(0.172), math.rad(-0.057),
                                          math.rad(8.021))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.674, 0.318, 0.104) *
                            CFrame.Angles(math.rad(-15.871), math.rad(-34.721),
                                          math.rad(-3.552))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.449, -0.611, -0.466) *
                            CFrame.Angles(math.rad(-46.352), math.rad(-60.218),
                                          math.rad(177.674))
                    }
                }
            }
        },
        [1.017] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.183, 0.19, -0.259) *
                        CFrame.Angles(math.rad(11.058), math.rad(2.521),
                                      math.rad(-7.277)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.116, 0.227, 0.297) *
                            CFrame.Angles(math.rad(-10.829), math.rad(43.659),
                                          math.rad(-12.204))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.723, -0.701, -0.698) *
                            CFrame.Angles(math.rad(-55.863), math.rad(42.227),
                                          math.rad(-160.027))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(0.229), math.rad(-1.089),
                                          math.rad(8.136))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.871, 0.358, 0.213) *
                            CFrame.Angles(math.rad(-13.293), math.rad(-32.83),
                                          math.rad(-11.803))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.46, -0.694, -0.379) *
                            CFrame.Angles(math.rad(-43.487), math.rad(-58.384),
                                          math.rad(176.471))
                    }
                }
            }
        },
        [1.067] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.476, 0.13, -0.519) *
                        CFrame.Angles(math.rad(11.23), math.rad(4.985),
                                      math.rad(-7.735)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.072, 0.535, 0.289) *
                            CFrame.Angles(math.rad(-28.476), math.rad(53.17),
                                          math.rad(-0.516))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.422, -0.692, -0.31) *
                            CFrame.Angles(math.rad(-40.394), math.rad(73.51),
                                          math.rad(-162.72))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(0.516), math.rad(-3.552),
                                          math.rad(8.709))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.327, 0.299, 0.423) *
                            CFrame.Angles(math.rad(-4.526), math.rad(-27.559),
                                          math.rad(-33.117))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.482, -0.689, -0.044) *
                            CFrame.Angles(math.rad(-20.512), math.rad(-52.655),
                                          math.rad(178.763))
                    }
                }
            }
        },
        [1.117] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.466, 0.102, -0.649) *
                        CFrame.Angles(math.rad(11.287), math.rad(6.073),
                                      math.rad(-7.907)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.022, 0.748, 0.394) *
                            CFrame.Angles(math.rad(-31.971), math.rad(54.832),
                                          math.rad(8.422))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.449, -0.66, -0.071) *
                            CFrame.Angles(math.rad(-35.638), math.rad(73.167),
                                          math.rad(-170.741))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(0.63), math.rad(-4.526),
                                          math.rad(8.938))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.436, 0.299, 0.459) *
                            CFrame.Angles(math.rad(-5.042), math.rad(-26.7),
                                          math.rad(-39.591))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.487, -0.651, 0.101) *
                            CFrame.Angles(math.rad(-10.313), math.rad(-51.738),
                                          math.rad(-178.133))
                    }
                }
            }
        },
        [1.167] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.385, 0.122, -1.007) *
                        CFrame.Angles(math.rad(8.652), math.rad(5.959),
                                      math.rad(-6.303)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.175, 1.147, 0.598) *
                            CFrame.Angles(math.rad(-31.226), math.rad(54.717),
                                          math.rad(21.142))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.472, -0.614, 0.103) *
                            CFrame.Angles(math.rad(-22.403), math.rad(72.995),
                                          math.rad(174.523))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(2.865), math.rad(-3.552),
                                          math.rad(7.964))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.645, 0.411, 0.503) *
                            CFrame.Angles(math.rad(-17.074), math.rad(-25.898),
                                          math.rad(-57.64))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.482, -0.599, 0.223) *
                            CFrame.Angles(math.rad(-0.286), math.rad(-51.165),
                                          math.rad(-170.398))
                    }
                }
            }
        },
        [1.217] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.204, 0.186, -1.107) *
                        CFrame.Angles(math.rad(3.323), math.rad(4.125),
                                      math.rad(-2.406)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.467, 1.131, 0.713) *
                            CFrame.Angles(math.rad(-23.892), math.rad(44.232),
                                          math.rad(27.387))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.477, -0.607, 0.082) *
                            CFrame.Angles(math.rad(-19.194), math.rad(73.912),
                                          math.rad(176.013))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(7.277), math.rad(-0.745),
                                          math.rad(5.042))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.596, 0.545, 0.47) *
                            CFrame.Angles(math.rad(-37.414), math.rad(-26.814),
                                          math.rad(-66.52))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.469, -0.578, 0.239) *
                            CFrame.Angles(math.rad(1.604), math.rad(-52.712),
                                          math.rad(-170.283))
                    }
                }
            }
        },
        [1.267] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.2, 0.312, -0.936) *
                        CFrame.Angles(math.rad(-3.896), math.rad(-1.49),
                                      math.rad(6.474)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-1.085, 0.317, 0.866) *
                            CFrame.Angles(math.rad(5.386), math.rad(21.371),
                                          math.rad(36.497))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.459, -0.551, 0.044) *
                            CFrame.Angles(math.rad(-12.032), math.rad(75.974),
                                          math.rad(179.107))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(14.037), math.rad(4.068),
                                          math.rad(-2.979))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.059, 0.714, 0.264) *
                            CFrame.Angles(math.rad(-63.713), math.rad(-34.377),
                                          math.rad(-60.905))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.429, -0.529, 0.302) *
                            CFrame.Angles(math.rad(6.245), math.rad(-63.942),
                                          math.rad(-170.684))
                    }
                }
            }
        },
        [1.317] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.318, 0.343, -0.825) *
                        CFrame.Angles(math.rad(-1.432), math.rad(-3.323),
                                      math.rad(9.568)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-1.134, 0.145, 0.767) *
                            CFrame.Angles(math.rad(14.439), math.rad(17.131),
                                          math.rad(30.768))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.437, -0.498, 0.058) *
                            CFrame.Angles(math.rad(-9.282), math.rad(76.719),
                                          math.rad(179.508))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(12.032), math.rad(5.042),
                                          math.rad(-6.016))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.802, 0.742, 0.113) *
                            CFrame.Angles(math.rad(-69.385), math.rad(-41.826),
                                          math.rad(-54.145))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.41, -0.504, 0.345) *
                            CFrame.Angles(math.rad(9.339), math.rad(-72.135),
                                          math.rad(-170.226))
                    }
                }
            }
        },
        [1.367] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.393, 0.359, -0.591) *
                        CFrame.Angles(math.rad(10.886), math.rad(-3.839),
                                      math.rad(13.006)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-1.066, 0.157, 0.601) *
                            CFrame.Angles(math.rad(22.746), math.rad(10.199),
                                          math.rad(7.907))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.392, -0.398, 0.122) *
                            CFrame.Angles(math.rad(-7.277), math.rad(77.636),
                                          math.rad(-179.565))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(1.031), math.rad(6.761),
                                          math.rad(-9.167))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.485, 0.714, -0.01) *
                            CFrame.Angles(math.rad(-63.255), math.rad(-61.077),
                                          math.rad(-36.211))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.386, -0.449, 0.431) *
                            CFrame.Angles(math.rad(45.665), math.rad(-87.548),
                                          math.rad(-138.197))
                    }
                }
            }
        },
        [1.417] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.356, 0.361, -0.441) *
                        CFrame.Angles(math.rad(16.444), math.rad(-3.38),
                                      math.rad(13.579)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.898, 0.14, 0.518) *
                            CFrame.Angles(math.rad(22.746), math.rad(8.48),
                                          math.rad(-6.589))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.375, -0.367, 0.16) *
                            CFrame.Angles(math.rad(-8.422), math.rad(77.75),
                                          math.rad(-178.476))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-4.068), math.rad(7.277),
                                          math.rad(-9.683))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.402, 0.628, -0.014) *
                            CFrame.Angles(math.rad(-46.123), math.rad(-65.89),
                                          math.rad(-17.074))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.376, -0.415, 0.461) *
                            CFrame.Angles(math.rad(159.397), math.rad(-86.287),
                                          math.rad(-25.669))
                    }
                }
            }
        },
        [1.467] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.118, 0.387, -0.23) *
                        CFrame.Angles(math.rad(15.183), math.rad(-2.235),
                                      math.rad(10.141)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.299, 0.006, 0.343) *
                            CFrame.Angles(math.rad(13.522), math.rad(15.699),
                                          math.rad(-26.299))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.369, -0.364, 0.192) *
                            CFrame.Angles(math.rad(-14.381), math.rad(77.521),
                                          math.rad(-173.606))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-3.953), math.rad(6.36),
                                          math.rad(-7.391))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.419, 0.474, 0.112) *
                            CFrame.Angles(math.rad(-19.423), math.rad(-55.004),
                                          math.rad(-0.057))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.335, -0.322, 0.488) *
                            CFrame.Angles(math.rad(155.272), math.rad(-83.996),
                                          math.rad(-29.737))
                    }
                }
            }
        },
        [1.517] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.041, 0.441, -0.199) *
                        CFrame.Angles(math.rad(7.506), math.rad(0.573),
                                      math.rad(2.349)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.117, 0.111, 0.318) *
                            CFrame.Angles(math.rad(1.49), math.rad(26.413),
                                          math.rad(-17.533))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.375, -0.373, 0.208) *
                            CFrame.Angles(math.rad(-18.564), math.rad(77.12),
                                          math.rad(-170.913))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(1.089), math.rad(4.125),
                                          math.rad(-1.432))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.361, 0.298, 0.167) *
                            CFrame.Angles(math.rad(-5.672), math.rad(-41.081),
                                          math.rad(2.922))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.299, -0.265, 0.516) *
                            CFrame.Angles(math.rad(141.521), math.rad(-83.079),
                                          math.rad(-42.227))
                    }
                }
            }
        },
        [1.567] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.312, 0.508, -0.726) *
                        CFrame.Angles(math.rad(-2.807), math.rad(6.36),
                                      math.rad(-8.308)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.604, 0.694, 0.769) *
                            CFrame.Angles(math.rad(-21.371), math.rad(39.477),
                                          math.rad(31.685))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.393, -0.384, 0.279) *
                            CFrame.Angles(math.rad(-28.132), math.rad(75.516),
                                          math.rad(-167.476))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(8.652), math.rad(1.891),
                                          math.rad(13.98))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.864, 0.302, 0.548) *
                            CFrame.Angles(math.rad(13.407), math.rad(-25.783),
                                          math.rad(-21.028))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.208, -0.144, 0.598) *
                            CFrame.Angles(math.rad(116.654), math.rad(-79.813),
                                          math.rad(-62.796))
                    }
                }
            }
        },
        [1.617] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.309, 0.507, -1.065) *
                        CFrame.Angles(math.rad(-2.979), math.rad(3.61),
                                      math.rad(-8.48)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.591, 0.88, 0.869) *
                            CFrame.Angles(math.rad(-10.199), math.rad(40.451),
                                          math.rad(29.966))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.393, -0.372, 0.364) *
                            CFrame.Angles(math.rad(-33.232), math.rad(74.083),
                                          math.rad(-168.45))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(7.964), math.rad(1.833),
                                          math.rad(19.538))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.994, 0.654, 0.65) *
                            CFrame.Angles(math.rad(11.402), math.rad(-25.21),
                                          math.rad(-24.523))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.158, -0.087, 0.644) *
                            CFrame.Angles(math.rad(107.659), math.rad(-77.865),
                                          math.rad(-68.984))
                    }
                }
            }
        },
        [1.667] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.131, 0.482, -1.176) *
                        CFrame.Angles(math.rad(-0.802), math.rad(1.49),
                                      math.rad(-12.147)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.507, 0.918, 0.837) *
                            CFrame.Angles(math.rad(-4.354), math.rad(43.545),
                                          math.rad(27.731))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.417, -0.394, 0.394) *
                            CFrame.Angles(math.rad(-42.743), math.rad(72.766),
                                          math.rad(-162.72))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(3.782), math.rad(0.859),
                                          math.rad(25.439))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.814, 1.088, 0.437) *
                            CFrame.Angles(math.rad(0.917), math.rad(-27.215),
                                          math.rad(-13.808))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.063, 0.003, 0.728) *
                            CFrame.Angles(math.rad(95.512), math.rad(-74.886),
                                          math.rad(-75.86))
                    }
                }
            }
        },
        [1.717] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.014, 0.433, -1.087) *
                        CFrame.Angles(math.rad(3.552), math.rad(2.636),
                                      math.rad(-19.824)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.352, 1.022, 0.628) *
                            CFrame.Angles(math.rad(-21.314), math.rad(53.686),
                                          math.rad(33.805))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.426, -0.404, 0.407) *
                            CFrame.Angles(math.rad(-47.269), math.rad(72.078),
                                          math.rad(-159.626))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(0.917), math.rad(0.172),
                                          math.rad(26.757))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.754, 1.051, 0.322) *
                            CFrame.Angles(math.rad(2.521), math.rad(-22.575),
                                          math.rad(-2.693))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.023, 0.033, 0.762) *
                            CFrame.Angles(math.rad(92.074), math.rad(-74.37),
                                          math.rad(-77.349))
                    }
                }
            }
        },
        [1.767] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.285, 0.305, -0.865) *
                        CFrame.Angles(math.rad(14.954), math.rad(1.833),
                                      math.rad(-31.169)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0, 0.969, 0.162) *
                            CFrame.Angles(math.rad(-31.971), math.rad(67.494),
                                          math.rad(24.122))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.428, -0.42, 0.422) *
                            CFrame.Angles(math.rad(-55.29), math.rad(70.818),
                                          math.rad(-152.636))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-5.271), math.rad(-1.432),
                                          math.rad(28.361))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.539, 0.783, 0.17) *
                            CFrame.Angles(math.rad(7.334), math.rad(-16.387),
                                          math.rad(23.377))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.025, 0.052, 0.799) *
                            CFrame.Angles(math.rad(91.673), math.rad(-76.089),
                                          math.rad(-76.604))
                    }
                }
            }
        },
        [1.817] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.378, 0.264, -0.775) *
                        CFrame.Angles(math.rad(19.652), math.rad(-1.146),
                                      math.rad(-30.825)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.043, 0.853, 0.195) *
                            CFrame.Angles(math.rad(-8.136), math.rad(66.635),
                                          math.rad(1.203))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.422, -0.421, 0.433) *
                            CFrame.Angles(math.rad(-57.754), math.rad(70.417),
                                          math.rad(-147.766))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-8.021), math.rad(-1.948),
                                          math.rad(29.45))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.363, 0.615, 0.095) *
                            CFrame.Angles(math.rad(8.193), math.rad(-19.022),
                                          math.rad(37.93))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.041, 0.043, 0.811) *
                            CFrame.Angles(math.rad(97.861), math.rad(-79.011),
                                          math.rad(-72.021))
                    }
                }
            }
        },
        [1.867] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.446, 0.247, -0.582) *
                        CFrame.Angles(math.rad(23.892), math.rad(-6.646),
                                      math.rad(-27.387)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.058, 0.531, 0.299) *
                            CFrame.Angles(math.rad(19.137), math.rad(56.837),
                                          math.rad(-24.064))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.414, -0.414, 0.457) *
                            CFrame.Angles(math.rad(-58.671), math.rad(70.359),
                                          math.rad(-141.005))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-11.975), math.rad(-2.464),
                                          math.rad(30.94))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.153, 0.143, -0.073) *
                            CFrame.Angles(math.rad(7.162), math.rad(-23.778),
                                          math.rad(61.822))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.068, 0.024, 0.833) *
                            CFrame.Angles(math.rad(120.665), math.rad(-83.766),
                                          math.rad(-52.769))
                    }
                }
            }
        },
        [1.917] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.355, 0.237, -0.45) *
                        CFrame.Angles(math.rad(24.637), math.rad(-4.297),
                                      math.rad(-20.168)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.019, 0.422, 0.335) *
                            CFrame.Angles(math.rad(14.61), math.rad(50.077),
                                          math.rad(-25.153))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.405, -0.362, 0.453) *
                            CFrame.Angles(math.rad(-58.785), math.rad(70.245),
                                          math.rad(-143.927))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-13.063), math.rad(-2.464),
                                          math.rad(23.778))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.165, 0.183, -0.043) *
                            CFrame.Angles(math.rad(8.136), math.rad(-28.361),
                                          math.rad(53.572))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.038, -0.053, 0.78) *
                            CFrame.Angles(math.rad(127.712), math.rad(-85.313),
                                          math.rad(-43.487))
                    }
                }
            }
        },
        [1.967] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.117, 0.234, -0.286) *
                        CFrame.Angles(math.rad(24.408), math.rad(4.297),
                                      math.rad(-3.38)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.134, 0.306, 0.314) *
                            CFrame.Angles(math.rad(1.833), math.rad(38.102),
                                          math.rad(-33.117))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.452, -0.949, 0.17) *
                            CFrame.Angles(math.rad(-101.414), math.rad(79.297),
                                          math.rad(-92.876))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-13.866), math.rad(-1.662),
                                          math.rad(3.209))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.235, 0.242, 0.143) *
                            CFrame.Angles(math.rad(16.272), math.rad(-38.159),
                                          math.rad(33.69))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.056, -0.272, 0.559) *
                            CFrame.Angles(math.rad(160.485), math.rad(-88.006),
                                          math.rad(-1.49))
                    }
                }
            }
        },
        [2.017] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.144, 0.275, -0.28) *
                        CFrame.Angles(math.rad(20.569), math.rad(6.704),
                                      math.rad(-3.209)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.193, 0.398, 0.337) *
                            CFrame.Angles(math.rad(-4.469), math.rad(39.305),
                                          math.rad(-24.981))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.397, -0.865, 0.687) *
                            CFrame.Angles(math.rad(-101.127), math.rad(82.85),
                                          math.rad(-131.952))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-13.121), math.rad(-1.662),
                                          math.rad(3.266))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.288, 0.221, 0.172) *
                            CFrame.Angles(math.rad(14.496), math.rad(-39.076),
                                          math.rad(25.898))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.058, -0.072, 0.44) *
                            CFrame.Angles(math.rad(62.911), math.rad(-81.245),
                                          math.rad(-87.376))
                    }
                }
            }
        },
        [2.067] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.174, 0.451, -0.475) *
                        CFrame.Angles(math.rad(4.584), math.rad(9.397),
                                      math.rad(-2.12)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.511, 0.679, 0.428) *
                            CFrame.Angles(math.rad(-24.408), math.rad(39.649),
                                          math.rad(10.313))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.312, 0.01, 0.477) *
                            CFrame.Angles(math.rad(-105.424), math.rad(74.313),
                                          math.rad(165.986))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-9.053), math.rad(-1.604),
                                          math.rad(3.495))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.572, 0.352, 0.321) *
                            CFrame.Angles(math.rad(-2.177), math.rad(-41.998),
                                          math.rad(-9.225))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.102, -0.122, 0.25) *
                            CFrame.Angles(math.rad(-51.509), math.rad(-55.863),
                                          math.rad(-109.206))
                    }
                }
            }
        },
        [2.117] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.166, 0.505, -0.847) *
                        CFrame.Angles(math.rad(-0.573), math.rad(9.454),
                                      math.rad(-2.005)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.641, 0.991, 0.412) *
                            CFrame.Angles(math.rad(-34.091), math.rad(43.201),
                                          math.rad(25.267))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.344, -0.204, 0.356) *
                            CFrame.Angles(math.rad(-97.288), math.rad(72.193),
                                          math.rad(168.335))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-6.818), math.rad(-1.547),
                                          math.rad(3.782))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.693, 0.662, 0.386) *
                            CFrame.Angles(math.rad(-11.631), math.rad(-45.149),
                                          math.rad(-23.491))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.117, -0.153, -0.058) *
                            CFrame.Angles(math.rad(-54.488), math.rad(-55.061),
                                          math.rad(-103.476))
                    }
                }
            }
        },
        [2.167] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.163, 0.343, -1.065) *
                        CFrame.Angles(math.rad(4.354), math.rad(9.511),
                                      math.rad(-2.292)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.356, 1.243, 0.258) *
                            CFrame.Angles(math.rad(-33.518), math.rad(52.769),
                                          math.rad(18.335))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.432, -0.775, -0.226) *
                            CFrame.Angles(math.rad(-67.437), math.rad(68.583),
                                          math.rad(170.913))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-4.354), math.rad(-1.49),
                                          math.rad(4.87))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.533, 0.945, 0.329) *
                            CFrame.Angles(math.rad(-12.834), math.rad(-52.082),
                                          math.rad(-20.856))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.225, -0.795, -0.241) *
                            CFrame.Angles(math.rad(-32.143), math.rad(-54.316),
                                          math.rad(-118.029))
                    }
                }
            }
        },
        [2.217] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.172, 0.098, -0.96) *
                        CFrame.Angles(math.rad(16.673), math.rad(9.626),
                                      math.rad(-2.636)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.124, 1.167, 0.305) *
                            CFrame.Angles(math.rad(-16.272), math.rad(52.884),
                                          math.rad(-2.979))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.506, -1.128, -0.749) *
                            CFrame.Angles(math.rad(-51.051), math.rad(75.516),
                                          math.rad(-156.532))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-4.698), math.rad(-1.203),
                                          math.rad(5.844))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.361, 0.87, 0.386) *
                            CFrame.Angles(math.rad(2.75), math.rad(-52.426),
                                          math.rad(-3.782))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.187, -0.956, -0.258) *
                            CFrame.Angles(math.rad(-15.928), math.rad(-55.061),
                                          math.rad(-125.936))
                    }
                }
            }
        },
        [2.267] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.099, -0.009, -0.377) *
                        CFrame.Angles(math.rad(21.199), math.rad(2.75),
                                      math.rad(-2.578)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.016, 0.339, 0.364) *
                            CFrame.Angles(math.rad(-2.177), math.rad(40.852),
                                          math.rad(-23.033))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.279, -0.53, -0.733) *
                            CFrame.Angles(math.rad(-54.603), math.rad(72.25),
                                          math.rad(-131.207))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-6.761), math.rad(0.802),
                                          math.rad(8.594))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.39, 0.472, 0.237) *
                            CFrame.Angles(math.rad(2.005), math.rad(-44.519),
                                          math.rad(8.824))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.071, -0.524, -0.645) *
                            CFrame.Angles(math.rad(88.98), math.rad(-75.573),
                                          math.rad(-95.512))
                    }
                }
            }
        },
        [2.317] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.02, 0.039, -0.142) *
                        CFrame.Angles(math.rad(16.788), math.rad(-4.24),
                                      math.rad(-2.693)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.349, -0.097, 0.123) *
                            CFrame.Angles(math.rad(2.979), math.rad(37.758),
                                          math.rad(-32.372))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.225, -0.46, -0.771) *
                            CFrame.Angles(math.rad(-55.119), math.rad(72.422),
                                          math.rad(-124.504))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-7.85), math.rad(2.005),
                                          math.rad(10.027))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.307, 0.334, 0.043) *
                            CFrame.Angles(math.rad(-10.428), math.rad(-43.602),
                                          math.rad(10.371))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.072, -0.357, -0.326) *
                            CFrame.Angles(math.rad(104.049), math.rad(-81.704),
                                          math.rad(-72.708))
                    }
                }
            }
        },
        [2.367] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.085, 0.116, -0.078) *
                        CFrame.Angles(math.rad(10.199), math.rad(-4.24),
                                      math.rad(-2.693)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.427, -0.057, 0.112) *
                            CFrame.Angles(math.rad(-3.667), math.rad(38.904),
                                          math.rad(-24.924))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.201, -0.167, 0.381) *
                            CFrame.Angles(math.rad(-64.057), math.rad(70.531),
                                          math.rad(177.732))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-9.397), math.rad(3.896),
                                          math.rad(12.204))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.397, 0.278, 0.063) *
                            CFrame.Angles(math.rad(-15.642), math.rad(-39.992),
                                          math.rad(-1.891))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.283, 0.417, 0.652) *
                            CFrame.Angles(math.rad(-2.292), math.rad(-72.594),
                                          math.rad(-108.862))
                    }
                }
            }
        },
        [2.417] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.069, 0.098, -0.149) *
                        CFrame.Angles(math.rad(11.058), math.rad(-4.24),
                                      math.rad(-2.693)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.46, -0.068, 0.108) *
                            CFrame.Angles(math.rad(-2.406), math.rad(39.362),
                                          math.rad(-27.502))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.112, 0.006, 0.4) *
                            CFrame.Angles(math.rad(-58.957), math.rad(66.234),
                                          math.rad(136.135))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-9.969), math.rad(4.584),
                                          math.rad(13.006))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.452, 0.361, 0.102) *
                            CFrame.Angles(math.rad(-15.986), math.rad(-41.024),
                                          math.rad(-4.125))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.214, 0.3, 0.461) *
                            CFrame.Angles(math.rad(-18.793), math.rad(-64.114),
                                          math.rad(-106.57))
                    }
                }
            }
        },
        [2.467] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.033, 0.015, -0.603) *
                        CFrame.Angles(math.rad(14.152), math.rad(-4.24),
                                      math.rad(-2.693)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.093, 0.407, 0.478) *
                            CFrame.Angles(math.rad(-0.573), math.rad(42.915),
                                          math.rad(-11.688))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.112, -0.124, 0.168) *
                            CFrame.Angles(math.rad(-60.103), math.rad(66.119),
                                          math.rad(133.671))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-10.772), math.rad(5.615),
                                          math.rad(14.095))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.54, 0.833, 0.169) *
                            CFrame.Angles(math.rad(-20.225), math.rad(-48.644),
                                          math.rad(-13.98))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.02, -0.111, -0.024) *
                            CFrame.Angles(math.rad(-35.18), math.rad(-55.863),
                                          math.rad(-104.106))
                    }
                }
            }
        },
        [2.517] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.031, -0.022, -0.845) *
                        CFrame.Angles(math.rad(15.355), math.rad(-4.24),
                                      math.rad(-2.636)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.069, 0.66, 0.566) *
                            CFrame.Angles(0, math.rad(46.066), math.rad(-7.85))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.169, -0.312, 0.053) *
                            CFrame.Angles(math.rad(-76.031), math.rad(69.156),
                                          math.rad(167.189))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-11.001), math.rad(5.901),
                                          math.rad(14.439))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.427, 1.063, 0.084) *
                            CFrame.Angles(math.rad(-22.804), math.rad(-55.233),
                                          math.rad(-15.011))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.09, -0.48, -0.105) *
                            CFrame.Angles(math.rad(-19.423), math.rad(-57.811),
                                          math.rad(-110.008))
                    }
                }
            }
        },
        [2.567] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.046, -0.056, -0.905) *
                        CFrame.Angles(math.rad(18.507), math.rad(-5.271),
                                      math.rad(-4.985)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.062, 0.696, 0.638) *
                            CFrame.Angles(math.rad(5.157), math.rad(46.41),
                                          math.rad(-7.964))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.296, -0.369, -0.228) *
                            CFrame.Angles(math.rad(-57.009), math.rad(69.901),
                                          math.rad(-164.496))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-11.23), math.rad(6.303),
                                          math.rad(14.782))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.223, 1.104, -0.018) *
                            CFrame.Angles(math.rad(-14.324), math.rad(-58.27),
                                          math.rad(1.719))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.176, -1.027, -0.121) *
                            CFrame.Angles(math.rad(20.455), math.rad(-70.187),
                                          math.rad(-126.853))
                    }
                }
            }
        },
        [2.617] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.144, -0.052, -0.78) *
                        CFrame.Angles(math.rad(19.824), math.rad(-7.162),
                                      math.rad(-9.167)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.026, 0.536, 0.702) *
                            CFrame.Angles(math.rad(9.11), math.rad(45.55),
                                          math.rad(-5.099))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.297, -0.235, -0.34) *
                            CFrame.Angles(math.rad(-34.95), math.rad(77.349),
                                          math.rad(-147.651))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-11.23), math.rad(6.417),
                                          math.rad(14.84))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.208, 0.97, -0.036) *
                            CFrame.Angles(math.rad(-9.683), math.rad(-52.884),
                                          math.rad(14.439))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.308, -0.742, -0.327) *
                            CFrame.Angles(math.rad(-51.222), math.rad(-84.569),
                                          math.rad(106.971))
                    }
                }
            }
        },
        [2.667] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.174, -0.046, -0.484) *
                        CFrame.Angles(math.rad(20.225), math.rad(-7.964),
                                      math.rad(-12.147)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.097, 0.283, 0.56) *
                            CFrame.Angles(math.rad(6.131), math.rad(45.894),
                                          math.rad(-5.329))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.327, -0.046, -0.28) *
                            CFrame.Angles(math.rad(-33.862), math.rad(79.011),
                                          math.rad(-141.922))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-11.287), math.rad(6.417),
                                          math.rad(14.897))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.308, 0.683, -0.011) *
                            CFrame.Angles(math.rad(-9.912), math.rad(-43.659),
                                          math.rad(19.309))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.458, -0.114, -0.091) *
                            CFrame.Angles(math.rad(-37.07), math.rad(-68.526),
                                          math.rad(125.306))
                    }
                }
            }
        },
        [2.717] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.134, -0.045, -0.374) *
                        CFrame.Angles(math.rad(20.168), math.rad(-7.105),
                                      math.rad(-12.548)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.07, 0.218, 0.412) *
                            CFrame.Angles(math.rad(0.401), math.rad(46.581),
                                          math.rad(-7.047))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.363, 0.034, -0.126) *
                            CFrame.Angles(math.rad(-41.196), math.rad(73.281),
                                          math.rad(-161.46))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-11.287), math.rad(6.417),
                                          math.rad(14.897))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.357, 0.577, 0.014) *
                            CFrame.Angles(math.rad(-8.938), math.rad(-39.878),
                                          math.rad(18.392))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.392, -0.096, 0.012) *
                            CFrame.Angles(math.rad(-40.107), math.rad(-69.958),
                                          math.rad(144.786))
                    }
                }
            }
        },
        [2.767] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.091, -0.047, -0.276) *
                        CFrame.Angles(math.rad(20.168), math.rad(-4.584),
                                      math.rad(-13.063)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.066, 0.144, 0.077) *
                            CFrame.Angles(math.rad(-11.287), math.rad(46.639),
                                          math.rad(-12.662))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.388, -0.081, -0.072) *
                            CFrame.Angles(math.rad(-79.125), math.rad(68.698),
                                          math.rad(-178.018))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-11.287), math.rad(6.417),
                                          math.rad(14.897))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.415, 0.454, 0.055) *
                            CFrame.Angles(math.rad(-5.5), math.rad(-35.351),
                                          math.rad(16.73))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.071, 0.235, 0.535) *
                            CFrame.Angles(math.rad(-23.95), math.rad(-70.76),
                                          math.rad(-138.312))
                    }
                }
            }
        },
        [2.817] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.114, 0.027, -0.276) *
                        CFrame.Angles(math.rad(20.397), math.rad(-2.521),
                                      math.rad(-8.995)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.031, 0.185, 0.102) *
                            CFrame.Angles(math.rad(-11.058), math.rad(43.144),
                                          math.rad(-15.871))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.369, -0.139, -0.064) *
                            CFrame.Angles(math.rad(-87.491), math.rad(70.015),
                                          math.rad(173.893))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-11.287), math.rad(6.417),
                                          math.rad(14.897))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.354, 0.418, 0.083) *
                            CFrame.Angles(math.rad(-2.177), math.rad(-38.847),
                                          math.rad(18.621))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.123, 0.186, 0.366) *
                            CFrame.Angles(math.rad(-9.11), math.rad(-67.323),
                                          math.rad(-101.643))
                    }
                }
            }
        },
        [2.867] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.192, 0.251, -0.442) *
                        CFrame.Angles(math.rad(23.319), math.rad(1.547),
                                      math.rad(4.584)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.554, 0.556, 0.305) *
                            CFrame.Angles(math.rad(-2.521), math.rad(32.315),
                                          math.rad(-19.022))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.317, -0.172, -0.215) *
                            CFrame.Angles(math.rad(-63.885), math.rad(76.719),
                                          math.rad(126.165))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-11.287), math.rad(6.417),
                                          math.rad(14.897))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.302, 0.611, 0.195) *
                            CFrame.Angles(math.rad(0.974), math.rad(-43.831),
                                          math.rad(19.882))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.318, -0.03, -0.272) *
                            CFrame.Angles(math.rad(-13.407), math.rad(-48.014),
                                          math.rad(-60.103))
                    }
                }
            }
        },
        [2.917] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.263, 0.264, -0.751) *
                        CFrame.Angles(math.rad(28.132), math.rad(2.75),
                                      math.rad(7.563)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.651, 0.963, 0.254) *
                            CFrame.Angles(math.rad(0.458), math.rad(33.805),
                                          math.rad(-19.137))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.333, -0.104, -0.562) *
                            CFrame.Angles(math.rad(9.969), math.rad(62.109),
                                          math.rad(44.977))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-11.287), math.rad(6.417),
                                          math.rad(14.897))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.439, 1.037, 0.124) *
                            CFrame.Angles(math.rad(-8.824), math.rad(-34.721),
                                          math.rad(13.407))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.442, -0.092, -0.554) *
                            CFrame.Angles(math.rad(-11.345), math.rad(-35.753),
                                          math.rad(-51.28))
                    }
                }
            }
        },
        [2.967] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.305, 0.309, -0.899) *
                        CFrame.Angles(math.rad(27.158), math.rad(3.667),
                                      math.rad(8.251)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.652, 1.136, 0.162) *
                            CFrame.Angles(math.rad(-1.833), math.rad(35.982),
                                          math.rad(-17.017))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.37, -0.066, -0.738) *
                            CFrame.Angles(math.rad(3.266), math.rad(36.784),
                                          math.rad(50.764))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-8.881), math.rad(5.844),
                                          math.rad(13.235))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.46, 1.167, 0.019) *
                            CFrame.Angles(math.rad(-14.381), math.rad(-28.247),
                                          math.rad(11.23))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.531, -0.087, -0.671) *
                            CFrame.Angles(math.rad(-9.339), math.rad(-25.669),
                                          math.rad(-55.405))
                    }
                }
            }
        },
        [3.017] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.306, 0.407, -0.855) *
                        CFrame.Angles(math.rad(18.335), math.rad(3.724),
                                      math.rad(8.251)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.788, 1.058, 0.132) *
                            CFrame.Angles(math.rad(-10.714), math.rad(34.435),
                                          math.rad(-5.558))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.366, -0.024, -0.728) *
                            CFrame.Angles(math.rad(-2.636), math.rad(31.57),
                                          math.rad(66.005))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-2.979), math.rad(4.068),
                                          math.rad(9.511))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.546, 1.03, 0.053) *
                            CFrame.Angles(math.rad(-16.215), math.rad(-22.918),
                                          math.rad(4.526))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.547, -0.024, -0.659) *
                            CFrame.Angles(math.rad(-6.245), math.rad(-21.887),
                                          math.rad(-64.916))
                    }
                }
            }
        },
        [3.067] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.303, 0.664, -0.779) *
                        CFrame.Angles(math.rad(-4.24), math.rad(3.495),
                                      math.rad(8.308)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.826, 0.738, 0.044) *
                            CFrame.Angles(math.rad(-25.726), math.rad(25.497),
                                          math.rad(12.605))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.299, 0.147, -0.688) *
                            CFrame.Angles(math.rad(-4.068), math.rad(23.262),
                                          math.rad(101.929))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(11.918), math.rad(-1.432),
                                          math.rad(1.948))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.5, 0.654, 0.079) *
                            CFrame.Angles(math.rad(-17.303), math.rad(-13.636),
                                          math.rad(-7.907))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.487, 0.21, -0.579) *
                            CFrame.Angles(math.rad(8.308), math.rad(-21.601),
                                          math.rad(-93.106))
                    }
                }
            }
        },
        [3.117] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.302, 0.755, -0.744) *
                        CFrame.Angles(math.rad(-12.376), math.rad(3.438),
                                      math.rad(8.308)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.609, 0.618, -0.039) *
                            CFrame.Angles(math.rad(-28.762), math.rad(21.601),
                                          math.rad(11.574))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.223, 0.215, -0.656) *
                            CFrame.Angles(math.rad(-3.151), math.rad(22.517),
                                          math.rad(115.222))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(17.59), math.rad(-3.037),
                                          math.rad(0.859))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.508, 0.509, 0.076) *
                            CFrame.Angles(math.rad(-17.475), math.rad(-10.141),
                                          math.rad(-14.496))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.398, 0.306, -0.51) *
                            CFrame.Angles(math.rad(12.49), math.rad(-26.929),
                                          math.rad(-105.367))
                    }
                }
            }
        },
        [3.167] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.357, 0.82, -0.616) *
                        CFrame.Angles(math.rad(-20.455), math.rad(3.38),
                                      math.rad(8.251)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.271, 0.488, -0.13) *
                            CFrame.Angles(math.rad(-29.794), math.rad(17.819),
                                          math.rad(9.11))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.066, 0.282, -0.592) *
                            CFrame.Angles(math.rad(-3.667), math.rad(23.778),
                                          math.rad(132.009))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(23.377), math.rad(-3.724),
                                          math.rad(1.261))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.609, 0.215, 0.057) *
                            CFrame.Angles(math.rad(-18.277), math.rad(-2.693),
                                          math.rad(-25.955))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.205, 0.402, -0.371) *
                            CFrame.Angles(math.rad(10.084), math.rad(-38.503),
                                          math.rad(-123.014))
                    }
                }
            }
        },
        [3.217] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.408, 0.821, -0.54) *
                        CFrame.Angles(math.rad(-22.46), math.rad(3.438),
                                      math.rad(8.251)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.219, 0.404, -0.118) *
                            CFrame.Angles(math.rad(-29.335), math.rad(16.902),
                                          math.rad(11.115))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.008, 0.298, -0.563) *
                            CFrame.Angles(math.rad(-5.099), math.rad(24.866),
                                          math.rad(139.229))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(24.58), math.rad(-3.839),
                                          math.rad(1.49))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.599, 0.089, 0.048) *
                            CFrame.Angles(math.rad(-18.392), math.rad(0.917),
                                          math.rad(-28.705))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.11, 0.421, -0.306) *
                            CFrame.Angles(math.rad(4.469), math.rad(-44.06),
                                          math.rad(-132.411))
                    }
                }
            }
        },
        [3.267] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.498, 0.8, -0.419) *
                        CFrame.Angles(math.rad(-23.95), math.rad(3.438),
                                      math.rad(8.308)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.42, 0.23, 0.014) *
                            CFrame.Angles(math.rad(-28.018), math.rad(16.272),
                                          math.rad(23.205))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.138, 0.307, -0.516) *
                            CFrame.Angles(math.rad(-11.058), math.rad(26.643),
                                          math.rad(155.443))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(25.153), math.rad(-3.896),
                                          math.rad(1.662))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.454, -0.018, 0.048) *
                            CFrame.Angles(math.rad(-17.991), math.rad(5.73),
                                          math.rad(-27.387))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.049, 0.409, -0.195) *
                            CFrame.Angles(math.rad(-16.96), math.rad(-51.452),
                                          math.rad(-158.824))
                    }
                }
            }
        },
        [3.317] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.514, 0.794, -0.399) *
                        CFrame.Angles(math.rad(-24.064), math.rad(3.438),
                                      math.rad(8.308)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.456, 0.199, 0.04) *
                            CFrame.Angles(math.rad(-27.674), math.rad(16.387),
                                          math.rad(25.21))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.189, 0.3, -0.5) *
                            CFrame.Angles(math.rad(-15.47), math.rad(26.528),
                                          math.rad(164.84))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(25.153), math.rad(-3.896),
                                          math.rad(1.662))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.404, -0.019, 0.051) *
                            CFrame.Angles(math.rad(-17.876), math.rad(6.417),
                                          math.rad(-26.07))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.102, 0.38, -0.153) *
                            CFrame.Angles(math.rad(-30.825), math.rad(-51.108),
                                          math.rad(-174.924))
                    }
                }
            }
        },
        [3.367] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.443, 0.789, -0.475) *
                        CFrame.Angles(math.rad(-23.09), math.rad(3.438),
                                      math.rad(8.251)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.6, 0.244, 0.084) *
                            CFrame.Angles(math.rad(-29.794), math.rad(17.475),
                                          math.rad(28.247))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.261, 0.25, -0.488) *
                            CFrame.Angles(math.rad(-26.356), math.rad(23.262),
                                          math.rad(-177.273))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(25.153), math.rad(-3.896),
                                          math.rad(1.662))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.656, -0.045, 0.039) *
                            CFrame.Angles(math.rad(-17.418), math.rad(5.329),
                                          math.rad(-32.773))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.154, 0.296, -0.111) *
                            CFrame.Angles(math.rad(-49.618), math.rad(-41.998),
                                          math.rad(160.6))
                    }
                }
            }
        },
        [3.417] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.372, 0.771, -0.539) *
                        CFrame.Angles(math.rad(-21.085), math.rad(3.38),
                                      math.rad(8.251)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.675, 0.314, 0.099) *
                            CFrame.Angles(math.rad(-31.513), math.rad(19.309),
                                          math.rad(28.018))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.281, 0.208, -0.482) *
                            CFrame.Angles(math.rad(-31.57), math.rad(20.455),
                                          math.rad(-170.627))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(25.153), math.rad(-3.896),
                                          math.rad(1.662))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.812, -0.012, 0.033) *
                            CFrame.Angles(math.rad(-17.131), math.rad(3.667),
                                          math.rad(-35.18))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.162, 0.243, -0.105) *
                            CFrame.Angles(math.rad(-52.655), math.rad(-36.211),
                                          math.rad(153.954))
                    }
                }
            }
        },
        [3.467] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.22, 0.665, -0.624) *
                        CFrame.Angles(math.rad(-10.943), math.rad(3.438),
                                      math.rad(8.308)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.64, 0.528, 0.091) *
                            CFrame.Angles(math.rad(-30.653), math.rad(27.846),
                                          math.rad(16.73))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.296, 0.091, -0.441) *
                            CFrame.Angles(math.rad(-38.847), math.rad(15.47),
                                          math.rad(-163.121))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(25.153), math.rad(-3.896),
                                          math.rad(1.662))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.951, 0.254, 0.04) *
                            CFrame.Angles(math.rad(-16.043), math.rad(-2.578),
                                          math.rad(-28.648))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.163, 0.089, -0.101) *
                            CFrame.Angles(math.rad(-51.795), math.rad(-28.419),
                                          math.rad(147.651))
                    }
                }
            }
        },
        [3.517] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.163, 0.474, -0.638) *
                        CFrame.Angles(math.rad(0.229), math.rad(3.61),
                                      math.rad(8.308)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.517, 0.638, 0.088) *
                            CFrame.Angles(math.rad(-24.924), math.rad(34.32),
                                          math.rad(4.24))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.297, 0.013, -0.396) *
                            CFrame.Angles(math.rad(-40.966), math.rad(14.324),
                                          math.rad(-161.861))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(25.153), math.rad(-3.896),
                                          math.rad(1.662))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.895, 0.485, 0.039) *
                            CFrame.Angles(math.rad(-15.126), math.rad(-6.589),
                                          math.rad(-18.793))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.163, -0.029, -0.091) *
                            CFrame.Angles(math.rad(-49.79), math.rad(-27.33),
                                          math.rad(146.906))
                    }
                }
            }
        },
        [3.567] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.109, -0.003, -0.97) *
                        CFrame.Angles(math.rad(18.908), math.rad(3.438),
                                      math.rad(8.308)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.31, 1, 0.101) *
                            CFrame.Angles(math.rad(-15.069), math.rad(47.555),
                                          math.rad(-7.391))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.228, -0.355, -0.195) *
                            CFrame.Angles(math.rad(-39.821), math.rad(15.298),
                                          math.rad(-161.001))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(25.153), math.rad(-3.896),
                                          math.rad(1.662))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.819, 0.981, -0.06) *
                            CFrame.Angles(math.rad(-18.564), math.rad(-13.579),
                                          math.rad(-14.037))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.124, -0.435, 0.037) *
                            CFrame.Angles(math.rad(-51.222), math.rad(-36.669),
                                          math.rad(142.094))
                    }
                }
            }
        },
        [3.617] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.102, -0.058, -1.314) *
                        CFrame.Angles(math.rad(18.105), math.rad(2.406),
                                      math.rad(7.62)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.089, 1.25, -0.009) *
                            CFrame.Angles(math.rad(-15.355), math.rad(60.963),
                                          math.rad(-6.532))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.165, -0.661, -0.093) *
                            CFrame.Angles(math.rad(-32.83), math.rad(16.788),
                                          math.rad(-158.881))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(25.153), math.rad(-3.896),
                                          math.rad(1.662))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.732, 1.268, -0.268) *
                            CFrame.Angles(math.rad(-28.992), math.rad(-21.314),
                                          math.rad(-20.225))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.101, -0.69, 0.188) *
                            CFrame.Angles(math.rad(-63.827), math.rad(-50.764),
                                          math.rad(122.728))
                    }
                }
            }
        },
        [3.667] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.099, -0.063, -0.981) *
                        CFrame.Angles(math.rad(13.006), math.rad(-0.229),
                                      math.rad(3.037)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.574, 0.933, 0.181) *
                            CFrame.Angles(math.rad(-33.461), math.rad(45.894),
                                          math.rad(22.976))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.432, -0.694, -0.209) *
                            CFrame.Angles(math.rad(9.11), math.rad(27.33),
                                          math.rad(-159.97))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(22.002), math.rad(-4.985),
                                          math.rad(-0.802))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.077, 0.831, -0.302) *
                            CFrame.Angles(math.rad(-28.762), math.rad(-5.099),
                                          math.rad(-25.783))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.473, -0.824, 0.282) *
                            CFrame.Angles(math.rad(-10.371), math.rad(-78.954),
                                          math.rad(133.098))
                    }
                }
            }
        },
        [3.717] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.098, -0.044, -0.691) *
                        CFrame.Angles(math.rad(10.084), math.rad(-1.547),
                                      math.rad(0.286)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.617, 0.599, 0.24) *
                            CFrame.Angles(math.rad(-28.247), math.rad(37.643),
                                          math.rad(23.72))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.645, -0.847, -0.045) *
                            CFrame.Angles(math.rad(-12.261), math.rad(71.219),
                                          math.rad(-111.841))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.043, 0.002) *
                            CFrame.Angles(math.rad(14.897), math.rad(-6.875),
                                          math.rad(-6.417))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.057, 0.566, -0.292) *
                            CFrame.Angles(math.rad(-26.07), math.rad(1.948),
                                          math.rad(-22.231))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.577, -0.825, 0.296) *
                            CFrame.Angles(math.rad(55.978), math.rad(-77.464),
                                          math.rad(-172.346))
                    }
                }
            }
        },
        [3.767] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.084, -0.022, -0.25) *
                        CFrame.Angles(math.rad(6.818), math.rad(-4.183),
                                      math.rad(-2.578)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.052, 0.118, -0.015) *
                            CFrame.Angles(math.rad(-14.381), math.rad(32.315),
                                          math.rad(2.636))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.621, -0.745, 0.039) *
                            CFrame.Angles(math.rad(-49.446), math.rad(60.676),
                                          math.rad(-18.793))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(3.724), math.rad(-8.308),
                                          math.rad(-15.011))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.685, 0.269, -0.214) *
                            CFrame.Angles(math.rad(-24.694), math.rad(8.193),
                                          math.rad(-7.964))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.471, -0.786, 0.39) *
                            CFrame.Angles(math.rad(-87.032), math.rad(-53.342),
                                          math.rad(-11.173))
                    }
                }
            }
        },
        [3.817] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.042, -0.027, -0.193) *
                        CFrame.Angles(math.rad(6.818), math.rad(-5.73),
                                      math.rad(-2.12)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.055, 0.078, -0.058) *
                            CFrame.Angles(math.rad(-11.918), math.rad(30.596),
                                          math.rad(-2.292))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.653, -0.403, 0.097) *
                            CFrame.Angles(math.rad(14.209), math.rad(81.532),
                                          math.rad(-68.297))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(3.782), math.rad(-7.334),
                                          math.rad(-10.829))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.564, 0.257, -0.17) *
                            CFrame.Angles(math.rad(-24.637), math.rad(7.85),
                                          math.rad(-4.354))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.512, -0.442, 0.376) *
                            CFrame.Angles(math.rad(-80.615), math.rad(-81.417),
                                          math.rad(-21.83))
                    }
                }
            }
        },
        [3.867] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.096, -0.039, -0.197) *
                        CFrame.Angles(math.rad(7.162), math.rad(-8.709),
                                      math.rad(0.172)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.028, 0.057, 0.032) *
                            CFrame.Angles(math.rad(-9.225), math.rad(21.944),
                                          math.rad(-2.979))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.658, -0.248, 0.139) *
                            CFrame.Angles(math.rad(73.74), math.rad(78.667),
                                          math.rad(-127.77))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(4.584), math.rad(-1.375),
                                          math.rad(13.923))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.391, 0.331, -0.043) *
                            CFrame.Angles(math.rad(-21.486), math.rad(5.214),
                                          math.rad(-0.859))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.476, -0.174, 0.42) *
                            CFrame.Angles(math.rad(125.592), math.rad(-62.682),
                                          math.rad(-174.408))
                    }
                }
            }
        },
        [3.917] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.15, -0.045, -0.222) *
                        CFrame.Angles(math.rad(7.448), math.rad(-9.912),
                                      math.rad(1.49)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.083, 0.043, 0.077) *
                            CFrame.Angles(math.rad(-8.251), math.rad(16.157),
                                          math.rad(-3.38))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.673, -0.294, 0.108) *
                            CFrame.Angles(math.rad(22.059), math.rad(76.604),
                                          math.rad(-83.365))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(3.953), math.rad(2.005),
                                          math.rad(28.075))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.304, 0.379, 0.025) *
                            CFrame.Angles(math.rad(-19.595), math.rad(4.125),
                                          math.rad(0.859))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.496, -0.202, 0.315) *
                            CFrame.Angles(math.rad(119.118), math.rad(-71.505),
                                          math.rad(-178.304))
                    }
                }
            }
        },
        [3.967] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.2, -0.052, -0.315) *
                        CFrame.Angles(math.rad(7.85), math.rad(-11.058),
                                      math.rad(2.865)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.39, 0.025, 0.148) *
                            CFrame.Angles(math.rad(-8.136), math.rad(5.386),
                                          math.rad(2.75))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.658, -0.493, 0.079) *
                            CFrame.Angles(math.rad(-45.665), math.rad(57.41),
                                          math.rad(-37.987))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(1.948), math.rad(5.099),
                                          math.rad(42.857))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.278, 0.488, 0.087) *
                            CFrame.Angles(math.rad(-17.361), math.rad(3.209),
                                          math.rad(0.516))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.517, -0.28, 0.168) *
                            CFrame.Angles(math.rad(81.761), math.rad(-83.766),
                                          math.rad(153.324))
                    }
                }
            }
        },
        [4.017] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.097, 0.013, -0.378) *
                        CFrame.Angles(math.rad(7.85), math.rad(-9.11),
                                      math.rad(2.693)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.652, 0.123, 0.169) *
                            CFrame.Angles(math.rad(-8.251), math.rad(5.214),
                                          math.rad(9.454))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.64, -0.587, 0.1) *
                            CFrame.Angles(math.rad(-61.249), math.rad(53.056),
                                          math.rad(-32.601))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-4.469), math.rad(1.146),
                                          math.rad(34.492))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.314, 0.538, 0.089) *
                            CFrame.Angles(math.rad(-17.647), math.rad(1.948),
                                          math.rad(0.917))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.513, -0.393, 0.15) *
                            CFrame.Angles(math.rad(-56.093), math.rad(-78.323),
                                          math.rad(19.939))
                    }
                }
            }
        },
        [4.067] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.303, 0.198, -0.542) *
                        CFrame.Angles(math.rad(7.678), math.rad(-0.859),
                                      math.rad(1.49)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.311, 0.475, 0.202) *
                            CFrame.Angles(math.rad(-4.985), math.rad(9.053),
                                          math.rad(-4.813))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.625, -0.736, 0.122) *
                            CFrame.Angles(math.rad(-76.948), math.rad(55.634),
                                          math.rad(-31.226))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-24.809), math.rad(-2.235),
                                          math.rad(-0.974))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.427, 0.588, 0.119) *
                            CFrame.Angles(math.rad(-18.163), math.rad(-1.719),
                                          math.rad(2.005))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.484, -0.551, 0.177) *
                            CFrame.Angles(math.rad(-79.125), math.rad(-62.624),
                                          math.rad(11.746))
                    }
                }
            }
        },
        [4.117] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.402, 0.198, -0.644) *
                        CFrame.Angles(math.rad(7.678), math.rad(1.662),
                                      math.rad(0.573)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.443, 0.622, 0.237) *
                            CFrame.Angles(math.rad(-4.985), math.rad(8.594),
                                          math.rad(0.229))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.618, -0.799, 0.12) *
                            CFrame.Angles(math.rad(-80.443), math.rad(59.416),
                                          math.rad(-32.258))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-24.866), math.rad(-0.172),
                                          math.rad(-9.912))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.612, 0.635, 0.128) *
                            CFrame.Angles(math.rad(-17.762), math.rad(-0.974),
                                          math.rad(-3.552))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.479, -0.596, 0.195) *
                            CFrame.Angles(math.rad(-85.829), math.rad(-62.051),
                                          math.rad(13.579))
                    }
                }
            }
        },
        [4.167] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.492, 0.197, -0.869) *
                        CFrame.Angles(math.rad(7.792), math.rad(3.953),
                                      math.rad(-1.318)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.804, 0.795, 0.416) *
                            CFrame.Angles(math.rad(-0.401), math.rad(5.042),
                                          math.rad(12.72))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.594, -0.888, 0.105) *
                            CFrame.Angles(math.rad(-79.928), math.rad(68.411),
                                          math.rad(-38.274))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-24.351), math.rad(2.12),
                                          math.rad(-18.048))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.937, 0.763, 0.194) *
                            CFrame.Angles(math.rad(-15.699), math.rad(1.375),
                                          math.rad(-13.006))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.483, -0.635, 0.201) *
                            CFrame.Angles(math.rad(-89.381), math.rad(-69.385),
                                          math.rad(24.122))
                    }
                }
            }
        },
        [4.217] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.503, 0.196, -0.985) *
                        CFrame.Angles(math.rad(7.85), math.rad(4.183),
                                      math.rad(-1.948)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.961, 0.83, 0.511) *
                            CFrame.Angles(math.rad(3.209), math.rad(2.979),
                                          math.rad(18.105))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.575, -0.902, 0.094) *
                            CFrame.Angles(math.rad(-73.339), math.rad(73.51),
                                          math.rad(-46.295))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.072, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-23.892), math.rad(2.693),
                                          math.rad(-19.022))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.037, 0.846, 0.224) *
                            CFrame.Angles(math.rad(-14.954), math.rad(1.833),
                                          math.rad(-16.157))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.487, -0.615, 0.178) *
                            CFrame.Angles(math.rad(-69.901), math.rad(-77.808),
                                          math.rad(48.243))
                    }
                }
            }
        },
        [4.267] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.446, 0.209, -1.211) *
                        CFrame.Angles(math.rad(8.308), math.rad(4.011),
                                      math.rad(-2.063)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.918, 1.075, 0.543) *
                            CFrame.Angles(math.rad(2.865), math.rad(3.61),
                                          math.rad(17.074))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.506, -0.768, 0.053) *
                            CFrame.Angles(math.rad(18.449), math.rad(76.089),
                                          math.rad(-138.255))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.07, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-22.059), math.rad(3.209),
                                          math.rad(-18.105))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.03, 1.078, 0.278) *
                            CFrame.Angles(math.rad(-13.579), math.rad(-2.12),
                                          math.rad(-17.189))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.026, -0.386, 0.057) *
                            CFrame.Angles(math.rad(48.243), math.rad(43.602),
                                          math.rad(-167.418))
                    }
                }
            }
        },
        [4.317] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.305, 0.247, -1.307) *
                        CFrame.Angles(math.rad(9.282), math.rad(3.61),
                                      math.rad(-1.604)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.566, 1.33, 0.394) *
                            CFrame.Angles(math.rad(-6.016), math.rad(13.694),
                                          math.rad(6.875))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.367, -0.491, 0.004) *
                            CFrame.Angles(math.rad(54.431), math.rad(42.743),
                                          math.rad(-173.148))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.064, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-20.626), math.rad(2.979),
                                          math.rad(-15.355))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.899, 1.208, 0.428) *
                            CFrame.Angles(math.rad(-6.245), math.rad(-5.5),
                                          math.rad(-12.662))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.133, -0.471, 0.114) *
                            CFrame.Angles(math.rad(20.397), math.rad(70.359),
                                          math.rad(-130.176))
                    }
                }
            }
        },
        [4.367] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.027, 0.335, -1.405) *
                        CFrame.Angles(math.rad(12.949), math.rad(2.349),
                                      math.rad(-0.229)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.182, 1.309, 0.166) *
                            CFrame.Angles(math.rad(-3.667), math.rad(40.966),
                                          math.rad(-22.059))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.206, -0.162, 0.073) *
                            CFrame.Angles(math.rad(60.963), math.rad(-57.296),
                                          math.rad(158.595))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.047, -0.042, 0.002) *
                            CFrame.Angles(math.rad(-17.303), math.rad(2.349),
                                          math.rad(-7.62))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.608, 1.227, 0.757) *
                            CFrame.Angles(math.rad(12.433), math.rad(-4.584),
                                          math.rad(1.261))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.193, -0.395, 0.088) *
                            CFrame.Angles(math.rad(-12.319), math.rad(64.973),
                                          math.rad(-78.151))
                    }
                }
            }
        },
        [4.417] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.13, 0.359, -1.263) *
                        CFrame.Angles(math.rad(15.699), math.rad(1.776),
                                      math.rad(0.458)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.059, 1.184, 0.195) *
                            CFrame.Angles(math.rad(-5.099), math.rad(40.508),
                                          math.rad(-23.09))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.303, -0.085, 0.092) *
                            CFrame.Angles(math.rad(27.101), math.rad(-75.401),
                                          math.rad(113.446))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.039, -0.041, 0.002) *
                            CFrame.Angles(math.rad(-15.871), math.rad(2.12),
                                          math.rad(-3.896))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.596, 1.057, 0.829) *
                            CFrame.Angles(math.rad(17.189), math.rad(-6.646),
                                          math.rad(4.87))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.208, -0.289, 0.059) *
                            CFrame.Angles(math.rad(-8.824), math.rad(60.791),
                                          math.rad(-73.281))
                    }
                }
            }
        },
        [4.467] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.197, 0.329, -0.589) *
                        CFrame.Angles(math.rad(23.262), math.rad(1.146),
                                      math.rad(1.203)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.281, 0.59, 0.219) *
                            CFrame.Angles(math.rad(-10.943), math.rad(26.986),
                                          math.rad(-27.731))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.367, 0.137, 0.076) *
                            CFrame.Angles(math.rad(4.412), math.rad(-72.422),
                                          math.rad(75.115))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-14.439), math.rad(2.177),
                                          math.rad(-0.115))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.282, 0.397, 0.609) *
                            CFrame.Angles(math.rad(18.564), math.rad(-14.324),
                                          math.rad(27.903))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.218, -0.023, 0.027) *
                            CFrame.Angles(math.rad(-3.037), math.rad(57.468),
                                          math.rad(-68.583))
                    }
                }
            }
        },
        [4.517] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.113, 0.219, -0.355) *
                        CFrame.Angles(math.rad(27.788), math.rad(1.146),
                                      math.rad(1.261)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.228, 0.285, 0.197) *
                            CFrame.Angles(math.rad(-9.167), math.rad(22.059),
                                          math.rad(-37.013))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.341, 0.213, 0.147) *
                            CFrame.Angles(math.rad(31.513), math.rad(-67.609),
                                          math.rad(93.908))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-17.303), math.rad(2.292),
                                          math.rad(-0.172))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.01, 0.012, 0.35) *
                            CFrame.Angles(math.rad(15.699), math.rad(-17.647),
                                          math.rad(45.55))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.174, 0.1, 0.113) *
                            CFrame.Angles(math.rad(0.917), math.rad(51.566),
                                          math.rad(-65.661))
                    }
                }
            }
        },
        [4.567] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.157, -0.016, -0.206) *
                        CFrame.Angles(math.rad(33.232), math.rad(1.146),
                                      math.rad(1.203)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.284, 0.155, 0.176) *
                            CFrame.Angles(math.rad(-5.386), math.rad(14.152),
                                          math.rad(-38.789))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.157, 0.08, 0.134) *
                            CFrame.Angles(math.rad(-5.443), math.rad(-26.929),
                                          math.rad(37.758))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-25.439), math.rad(2.464),
                                          math.rad(-0.286))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.11, -0.009, 0.252) *
                            CFrame.Angles(math.rad(9.511), math.rad(-28.018),
                                          math.rad(44.748))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.007, 0.303, 0.285) *
                            CFrame.Angles(math.rad(29.164), math.rad(24.179),
                                          math.rad(-59.759))
                    }
                }
            }
        },
        [4.617] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.198, 0, -0.197) *
                        CFrame.Angles(math.rad(31.57), math.rad(2.063),
                                      math.rad(0.917)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.328, 0.209, 0.163) *
                            CFrame.Angles(math.rad(-6.589), math.rad(14.381),
                                          math.rad(-34.721))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.174, 0.008, 0.126) *
                            CFrame.Angles(math.rad(-10.027), math.rad(-29.393),
                                          math.rad(37.643))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-24.351), math.rad(1.146),
                                          math.rad(-0.516))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.105, -0.032, 0.245) *
                            CFrame.Angles(math.rad(8.881), math.rad(-28.591),
                                          math.rad(43.029))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.187, -0.041, -0.035) *
                            CFrame.Angles(math.rad(30.138), math.rad(26.814),
                                          math.rad(-91.158))
                    }
                }
            }
        },
        [4.667] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.291, 0.098, -0.181) *
                        CFrame.Angles(math.rad(22.059), math.rad(7.277),
                                      math.rad(-0.573)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.517, 0.391, 0.072) *
                            CFrame.Angles(math.rad(-17.59), math.rad(17.361),
                                          math.rad(-15.011))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.258, -0.349, 0.095) *
                            CFrame.Angles(math.rad(-37.758), math.rad(-46.639),
                                          math.rad(33.862))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-18.105), math.rad(-6.646),
                                          math.rad(-1.49))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.198, -0.062, 0.279) *
                            CFrame.Angles(math.rad(7.448), math.rad(-27.559),
                                          math.rad(26.7))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.101, -0.51, 0.049) *
                            CFrame.Angles(math.rad(12.892), math.rad(45.951),
                                          math.rad(-122.097))
                    }
                }
            }
        },
        [4.717] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.332, 0.157, -0.205) *
                        CFrame.Angles(math.rad(16.673), math.rad(10.371),
                                      math.rad(-0.974)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.629, 0.45, 0.003) *
                            CFrame.Angles(math.rad(-25.21), math.rad(18.392),
                                          math.rad(-4.068))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.294, -0.509, 0.059) *
                            CFrame.Angles(math.rad(-52.598), math.rad(-56.666),
                                          math.rad(30.08))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-14.553), math.rad(-11.058),
                                          math.rad(-1.604))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.279, -0.074, 0.312) *
                            CFrame.Angles(math.rad(7.047), math.rad(-26.585),
                                          math.rad(16.558))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.262, -0.368, 0.256) *
                            CFrame.Angles(math.rad(8.48), math.rad(59.301),
                                          math.rad(-121.352))
                    }
                }
            }
        },
        [4.767] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.371, 0.222, -0.358) *
                        CFrame.Angles(math.rad(10.772), math.rad(13.636),
                                      math.rad(-1.146)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.721, 0.569, -0.118) *
                            CFrame.Angles(math.rad(-35.008), math.rad(21.142),
                                          math.rad(7.964))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.322, -0.633, 0.002) *
                            CFrame.Angles(math.rad(-72.708), math.rad(-70.989),
                                          math.rad(23.434))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-10.657), math.rad(-15.756),
                                          math.rad(-1.49))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.533, -0.001, 0.44) *
                            CFrame.Angles(math.rad(6.303), math.rad(-26.07),
                                          math.rad(-0.802))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.284, -0.073, 0.204) *
                            CFrame.Angles(math.rad(14.381), math.rad(66.463),
                                          math.rad(-126.108))
                    }
                }
            }
        },
        [4.817] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.263, 0.19, -0.588) *
                        CFrame.Angles(math.rad(10.714), math.rad(10.542),
                                      math.rad(-0.458)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.625, 0.74, -0.152) *
                            CFrame.Angles(math.rad(-34.549), math.rad(27.101),
                                          math.rad(8.766))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.316, -0.583, 0.02) *
                            CFrame.Angles(math.rad(-79.928), math.rad(-77.292),
                                          math.rad(21.601))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-10.6), math.rad(-12.319),
                                          math.rad(-1.776))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.775, 0.268, 0.579) *
                            CFrame.Angles(math.rad(2.406), math.rad(-27.617),
                                          math.rad(-13.063))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.283, -0.093, 0.187) *
                            CFrame.Angles(math.rad(14.553), math.rad(63.885),
                                          math.rad(-133.098))
                    }
                }
            }
        },
        [4.867] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.082, 0.073, -1.063) *
                        CFrame.Angles(math.rad(13.063), math.rad(-1.318),
                                      math.rad(1.662)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.049, 0.955, -0.018) *
                            CFrame.Angles(math.rad(-16.902), math.rad(44.347),
                                          math.rad(-5.672))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.274, -0.366, 0.001) *
                            CFrame.Angles(math.rad(64.286), math.rad(-73.682),
                                          math.rad(-170.512))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-10.313), math.rad(2.005),
                                          math.rad(-2.292))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.677, 1.049, 0.409) *
                            CFrame.Angles(math.rad(-12.433), math.rad(-36.383),
                                          math.rad(-19.882))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.277, -0.084, 0.149) *
                            CFrame.Angles(math.rad(3.839), math.rad(55.806),
                                          math.rad(-139.515))
                    }
                }
            }
        },
        [4.917] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.057, 0.006, -1.048) *
                        CFrame.Angles(math.rad(19.309), math.rad(-4.125),
                                      math.rad(-3.037)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.031, 0.908, 0.123) *
                            CFrame.Angles(math.rad(-7.334), math.rad(41.883),
                                          math.rad(-11.058))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.317, -0.334, 0.029) *
                            CFrame.Angles(math.rad(49.733), math.rad(-53.572),
                                          math.rad(-158.194))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-10.485), math.rad(4.813),
                                          math.rad(3.667))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.381, 1.143, 0.295) *
                            CFrame.Angles(math.rad(-5.558), math.rad(-34.435),
                                          math.rad(1.375))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.459, -0.321, 0.342) *
                            CFrame.Angles(math.rad(-2.406), math.rad(47.842),
                                          math.rad(-162.892))
                    }
                }
            }
        },
        [4.967] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.078, -0.045, -0.832) *
                        CFrame.Angles(math.rad(24.122), math.rad(-5.615),
                                      math.rad(-7.85)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.133, 0.734, 0.298) *
                            CFrame.Angles(math.rad(-1.203), math.rad(30.539),
                                          math.rad(-10.714))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.16, -0.219, -0.105) *
                            CFrame.Angles(math.rad(36.669), math.rad(-45.034),
                                          math.rad(-163.866))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-10.657), math.rad(4.927),
                                          math.rad(9.397))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.367, 0.956, 0.287) *
                            CFrame.Angles(math.rad(-3.724), math.rad(-29.622),
                                          math.rad(14.324))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.501, -0.312, 0.419) *
                            CFrame.Angles(math.rad(-15.183), math.rad(43.258),
                                          math.rad(-168.965))
                    }
                }
            }
        },
        [5.017] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.118, -0.046, -0.672) *
                        CFrame.Angles(math.rad(24.122), math.rad(-5.615),
                                      math.rad(-7.85)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.237, 0.591, 0.325) *
                            CFrame.Angles(math.rad(-0.458), math.rad(25.669),
                                          math.rad(-10.428))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.145, -0.2, -0.085) *
                            CFrame.Angles(math.rad(34.549), math.rad(-43.602),
                                          math.rad(-163.121))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-10.657), math.rad(4.927),
                                          math.rad(9.397))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.43, 0.812, 0.295) *
                            CFrame.Angles(math.rad(-5.157), math.rad(-28.476),
                                          math.rad(14.782))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.475, -0.27, 0.423) *
                            CFrame.Angles(math.rad(-18.678), math.rad(43.487),
                                          math.rad(-168.278))
                    }
                }
            }
        },
        [5.067] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.155, -0.052, -0.37) *
                        CFrame.Angles(math.rad(24.122), math.rad(-5.615),
                                      math.rad(-7.85)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.265, 0.282, 0.306) *
                            CFrame.Angles(math.rad(0.688), math.rad(20.512),
                                          math.rad(-14.897))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.115, -0.148, -0.041) *
                            CFrame.Angles(math.rad(32.83), math.rad(-42.112),
                                          math.rad(-162.09))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-10.657), math.rad(4.927),
                                          math.rad(9.397))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.419, 0.484, 0.276) *
                            CFrame.Angles(math.rad(-6.188), math.rad(-25.669),
                                          math.rad(20.283))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.39, -0.195, 0.383) *
                            CFrame.Angles(math.rad(-22.059), math.rad(45.436),
                                          math.rad(-164.21))
                    }
                }
            }
        },
        [5.117] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.16, -0.057, -0.27) *
                        CFrame.Angles(math.rad(24.122), math.rad(-5.615),
                                      math.rad(-7.85)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.228, 0.165, 0.286) *
                            CFrame.Angles(math.rad(0.859), math.rad(19.481),
                                          math.rad(-17.704))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.099, -0.113, -0.024) *
                            CFrame.Angles(math.rad(32.888), math.rad(-41.883),
                                          math.rad(-161.803))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-10.657), math.rad(4.927),
                                          math.rad(9.397))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.368, 0.348, 0.256) *
                            CFrame.Angles(math.rad(-6.303), math.rad(-24.752),
                                          math.rad(23.778))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.348, -0.171, 0.351) *
                            CFrame.Angles(math.rad(-22.575), math.rad(46.41),
                                          math.rad(-161.746))
                    }
                }
            }
        },
        [5.167] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.153, -0.078, -0.274) *
                        CFrame.Angles(math.rad(24.694), math.rad(-6.131),
                                      math.rad(-9.11)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.259, 0.171, 0.338) *
                            CFrame.Angles(math.rad(1.833), math.rad(19.481),
                                          math.rad(-16.043))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.463, -0.116, 0.254) *
                            CFrame.Angles(math.rad(27.044), math.rad(-39.878),
                                          math.rad(-142.781))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-11.402), math.rad(5.329),
                                          math.rad(11.115))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.368, 0.347, 0.246) *
                            CFrame.Angles(math.rad(-6.245), math.rad(-23.549),
                                          math.rad(25.153))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.498, -0.279, 0.324) *
                            CFrame.Angles(math.rad(-13.694), math.rad(44.232),
                                          math.rad(-169.252))
                    }
                }
            }
        },
        [5.217] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.125, -0.098, -0.368) *
                        CFrame.Angles(math.rad(25.898), math.rad(-7.277),
                                      math.rad(-11.918)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.36, 0.267, 0.487) *
                            CFrame.Angles(math.rad(4.068), math.rad(20.111),
                                          math.rad(-10.6))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.652, -0.681, 0.306) *
                            CFrame.Angles(math.rad(1.891), math.rad(-39.649),
                                          math.rad(-160.142))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-13.293), math.rad(6.016),
                                          math.rad(15.011))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.404, 0.461, 0.239) *
                            CFrame.Angles(math.rad(-5.5), math.rad(-21.257),
                                          math.rad(26.07))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.568, -0.591, 0.127) *
                            CFrame.Angles(math.rad(-8.193), math.rad(36.383),
                                          math.rad(-159.97))
                    }
                }
            }
        },
        [5.267] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.016, -0.129, -0.517) *
                        CFrame.Angles(math.rad(28.247), math.rad(-9.11),
                                      math.rad(-15.814)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.608, 0.367, 0.826) *
                            CFrame.Angles(math.rad(6.532), math.rad(20.225),
                                          math.rad(1.203))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.165, -0.664, -0.22) *
                            CFrame.Angles(math.rad(-4.87), math.rad(-9.454),
                                          math.rad(96.543))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-17.991), math.rad(6.532),
                                          math.rad(20.798))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.457, 0.635, 0.228) *
                            CFrame.Angles(math.rad(-2.75), math.rad(-14.782),
                                          math.rad(26.929))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0, 0.093, 0.024) *
                            CFrame.Angles(math.rad(27.903), math.rad(-21.543),
                                          math.rad(-72.135))
                    }
                }
            }
        },
        [5.317] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.112, -0.141, -0.525) *
                        CFrame.Angles(math.rad(29.45), math.rad(-4.354),
                                      math.rad(-12.49)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.675, 0.542, 0.837) *
                            CFrame.Angles(math.rad(-1.375), math.rad(19.538),
                                          math.rad(2.12))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.397, -0.43, -0.262) *
                            CFrame.Angles(math.rad(17.704), math.rad(-8.824),
                                          math.rad(82.563))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-18.793), math.rad(2.464),
                                          math.rad(14.324))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.574, 0.583, 0.341) *
                            CFrame.Angles(math.rad(4.698), math.rad(-11.803),
                                          math.rad(20.168))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.11, 0.232, 0.353) *
                            CFrame.Angles(math.rad(45.149), math.rad(-14.553),
                                          math.rad(-55.233))
                    }
                }
            }
        },
        [5.367] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.188, -0.124, -0.54) *
                        CFrame.Angles(math.rad(30.08), math.rad(10.886),
                                      math.rad(-1.031)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.462, 0.922, 0.537) *
                            CFrame.Angles(math.rad(-19.423), math.rad(21.199),
                                          math.rad(-14.324))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.103, 0.152, 0.608) *
                            CFrame.Angles(math.rad(57.754), math.rad(-46.238),
                                          math.rad(19.538))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.283), math.rad(-8.537),
                                          math.rad(-4.584))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.701, 0.16, 0.596) *
                            CFrame.Angles(math.rad(26.643), math.rad(-13.694),
                                          math.rad(9.568))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.825, 0.163, 0.58) *
                            CFrame.Angles(math.rad(53.17), math.rad(-3.151),
                                          math.rad(-58.327))
                    }
                }
            }
        },
        [5.417] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.158, -0.109, -0.524) *
                        CFrame.Angles(math.rad(29.794), math.rad(12.147),
                                      math.rad(1.261)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.426, 0.903, 0.516) *
                            CFrame.Angles(math.rad(-18.85), math.rad(18.908),
                                          math.rad(-18.908))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.116, 0.151, 0.653) *
                            CFrame.Angles(math.rad(60.103), math.rad(-49.102),
                                          math.rad(19.022))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.283), math.rad(-8.537),
                                          math.rad(-4.584))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.664, 0.125, 0.615) *
                            CFrame.Angles(math.rad(27.445), math.rad(-16.444),
                                          math.rad(9.969))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.79, 0.193, 0.608) *
                            CFrame.Angles(math.rad(54.316), math.rad(-2.292),
                                          math.rad(-55.577))
                    }
                }
            }
        },
        [5.467] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.038, -0.083, -0.425) *
                        CFrame.Angles(math.rad(29.278), math.rad(13.522),
                                      math.rad(3.782)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.446, 0.808, 0.523) *
                            CFrame.Angles(math.rad(-17.074), math.rad(12.319),
                                          math.rad(-23.835))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.126, 0.142, 0.702) *
                            CFrame.Angles(math.rad(63.942), math.rad(-52.598),
                                          math.rad(19.251))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.283), math.rad(-8.537),
                                          math.rad(-4.584))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.541, 0.053, 0.577) *
                            CFrame.Angles(math.rad(25.783), math.rad(-21.658),
                                          math.rad(14.037))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.668, 0.26, 0.66) *
                            CFrame.Angles(math.rad(57.238), math.rad(-0.172),
                                          math.rad(-47.269))
                    }
                }
            }
        },
        [5.517] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.035, -0.074, -0.369) *
                        CFrame.Angles(math.rad(29.049), math.rad(13.808),
                                      math.rad(4.24)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.472, 0.751, 0.537) *
                            CFrame.Angles(math.rad(-15.871), math.rad(9.053),
                                          math.rad(-25.038))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.129, 0.132, 0.713) *
                            CFrame.Angles(math.rad(65.718), math.rad(-53.743),
                                          math.rad(19.71))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.283), math.rad(-8.537),
                                          math.rad(-4.584))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.467, 0.016, 0.532) *
                            CFrame.Angles(math.rad(24.236), math.rad(-23.892),
                                          math.rad(16.96))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.588, 0.289, 0.686) *
                            CFrame.Angles(math.rad(58.499), math.rad(0.802),
                                          math.rad(-42.399))
                    }
                }
            }
        },
        [5.567] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.169, -0.066, -0.309) *
                        CFrame.Angles(math.rad(28.877), math.rad(13.923),
                                      math.rad(4.469)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.518, 0.682, 0.559) *
                            CFrame.Angles(math.rad(-13.35), math.rad(4.125),
                                          math.rad(-25.611))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.096, 0.166, 0.65) *
                            CFrame.Angles(math.rad(69.385), math.rad(-57.296),
                                          math.rad(26.814))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.283), math.rad(-8.537),
                                          math.rad(-4.584))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.351, -0.027, 0.457) *
                            CFrame.Angles(math.rad(21.085), math.rad(-27.215),
                                          math.rad(21.543))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.477, 0.319, 0.722) *
                            CFrame.Angles(math.rad(59.702), math.rad(1.776),
                                          math.rad(-36.039))
                    }
                }
            }
        },
        [5.617] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.201, -0.078, -0.434) *
                        CFrame.Angles(math.rad(28.992), math.rad(12.605),
                                      math.rad(3.839)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.567, 0.795, 0.57) *
                            CFrame.Angles(math.rad(-10.657), math.rad(2.922),
                                          math.rad(-21.085))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.01, 0.336, 0.445) *
                            CFrame.Angles(math.rad(70.015), math.rad(-59.129),
                                          math.rad(43.659))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.283), math.rad(-7.678),
                                          math.rad(-4.068))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.436, 0.154, 0.556) *
                            CFrame.Angles(math.rad(18.277), math.rad(-28.591),
                                          math.rad(15.642))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.561, 0.311, 0.629) *
                            CFrame.Angles(math.rad(62.166), math.rad(5.443),
                                          math.rad(-45.665))
                    }
                }
            }
        },
        [5.667] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.184, -0.133, -0.988) *
                        CFrame.Angles(math.rad(29.507), math.rad(6.761),
                                      math.rad(0.974)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.479, 1.143, 0.718) *
                            CFrame.Angles(math.rad(-0.63), math.rad(0.573),
                                          math.rad(-12.204))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.194, 0.42, -0.09) *
                            CFrame.Angles(math.rad(60.619), math.rad(-48.701),
                                          math.rad(77.865))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.455), math.rad(-3.323),
                                          math.rad(-1.49))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.352, 0.837, 0.612) *
                            CFrame.Angles(math.rad(9.912), math.rad(-35.008),
                                          math.rad(7.678))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.727, 0.231, 0.122) *
                            CFrame.Angles(math.rad(71.677), math.rad(5.615),
                                          math.rad(-85.886))
                    }
                }
            }
        },
        [5.717] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.174, -0.147, -1.117) *
                        CFrame.Angles(math.rad(29.966), math.rad(5.386),
                                      math.rad(0.344)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.382, 1.193, 0.775) *
                            CFrame.Angles(math.rad(1.948), math.rad(-0.688),
                                          math.rad(-13.178))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.317, 0.189, -0.35) *
                            CFrame.Angles(math.rad(49.905), math.rad(-39.19),
                                          math.rad(94.252))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.569), math.rad(-1.318),
                                          math.rad(-0.344))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.2, 0.975, 0.542) *
                            CFrame.Angles(math.rad(9.454), math.rad(-37.815),
                                          math.rad(11.23))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.738, -0.194, -0.123) *
                            CFrame.Angles(math.rad(59.015), math.rad(-13.293),
                                          math.rad(-107.258))
                    }
                }
            }
        },
        [5.767] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.17, -0.186, -1.138) *
                        CFrame.Angles(math.rad(34.206), math.rad(5.329),
                                      math.rad(0.344)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.254, 1.19, 0.777) *
                            CFrame.Angles(math.rad(2.005), math.rad(-0.974),
                                          math.rad(-19.996))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.057, -0.886, -0.388) *
                            CFrame.Angles(math.rad(14.267), math.rad(-30.539),
                                          math.rad(145.245))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.168), math.rad(-0.573),
                                          math.rad(0.115))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.077, 0.954, 0.546) *
                            CFrame.Angles(math.rad(14.324), math.rad(-35.867),
                                          math.rad(19.538))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.217, -0.969, 0.18) *
                            CFrame.Angles(math.rad(-11.86), math.rad(5.787),
                                          math.rad(-165.126))
                    }
                }
            }
        },
        [5.817] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.167, -0.211, -1.149) *
                        CFrame.Angles(math.rad(37.357), math.rad(5.386),
                                      math.rad(0.344)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.171, 1.177, 0.776) *
                            CFrame.Angles(math.rad(1.948), math.rad(-0.974),
                                          math.rad(-24.866))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.526, -0.933, 0.165) *
                            CFrame.Angles(math.rad(6.875), math.rad(-45.436),
                                          math.rad(-178.133))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-19.079), math.rad(-0.859),
                                          math.rad(0.057))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.004, 0.924, 0.553) *
                            CFrame.Angles(math.rad(17.418), math.rad(-33.919),
                                          math.rad(25.096))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.503, -0.719, 0.244) *
                            CFrame.Angles(math.rad(-8.824), math.rad(32.773),
                                          math.rad(-173.835))
                    }
                }
            }
        },
        [5.867] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.157, -0.234, -1.125) *
                        CFrame.Angles(math.rad(40.966), math.rad(5.386),
                                      math.rad(0.344)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.125, 1.137, 0.769) *
                            CFrame.Angles(math.rad(1.662), math.rad(-0.573),
                                          math.rad(-29.851))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.441, -0.34, 0.289) *
                            CFrame.Angles(math.rad(14.381), math.rad(-49.561),
                                          math.rad(-163.751))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-15.47), math.rad(-1.833),
                                          math.rad(-0.057))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.032, 0.863, 0.569) *
                            CFrame.Angles(math.rad(20.111), math.rad(-30.653),
                                          math.rad(30.539))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.184, -0.185, -0.144) *
                            CFrame.Angles(math.rad(6.646), math.rad(55.52),
                                          math.rad(-156.417))
                    }
                }
            }
        },
        [5.917] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.148, -0.225, -1.039) *
                        CFrame.Angles(math.rad(40.623), math.rad(5.042),
                                      math.rad(0.458)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.225, 1.093, 0.763) *
                            CFrame.Angles(math.rad(1.49), math.rad(-0.115),
                                          math.rad(-28.075))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.287, -0.262, 0.211) *
                            CFrame.Angles(math.rad(14.095), math.rad(-51.108),
                                          math.rad(-171.486))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-13.35), math.rad(-2.406),
                                          math.rad(-0.057))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.05, 0.822, 0.575) *
                            CFrame.Angles(math.rad(18.965), math.rad(-29.737),
                                          math.rad(29.221))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.187, -0.277, -0.141) *
                            CFrame.Angles(math.rad(10.027), math.rad(56.035),
                                          math.rad(-161.058))
                    }
                }
            }
        },
        [5.967] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.121, -0.177, -0.682) *
                        CFrame.Angles(math.rad(36.44), math.rad(3.724),
                                      math.rad(0.859)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.538, 0.82, 0.753) *
                            CFrame.Angles(math.rad(1.203), math.rad(0.344),
                                          math.rad(-21.944))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.032, -0.252, -0.072) *
                            CFrame.Angles(math.rad(10.6), math.rad(-56.093),
                                          math.rad(160.027))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.282), math.rad(-3.495),
                                          math.rad(-0.115))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.299, 0.606, 0.536) *
                            CFrame.Angles(math.rad(13.522), math.rad(-28.419),
                                          math.rad(24.236))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.204, -0.463, -0.129) *
                            CFrame.Angles(math.rad(10.6), math.rad(56.264),
                                          math.rad(-160.715))
                    }
                }
            }
        },
        [6.017] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.107, -0.13, -0.481) *
                        CFrame.Angles(math.rad(31.914), math.rad(2.979),
                                      math.rad(1.089)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.649, 0.614, 0.749) *
                            CFrame.Angles(math.rad(1.146), math.rad(0.458),
                                          math.rad(-17.991))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.033, -0.407, -0.069) *
                            CFrame.Angles(math.rad(10.485), math.rad(-55.691),
                                          math.rad(160.657))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-7.678), math.rad(-3.953),
                                          math.rad(-0.115))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.39, 0.453, 0.489) *
                            CFrame.Angles(math.rad(9.511), math.rad(-28.476),
                                          math.rad(20.225))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.21, -0.542, -0.117) *
                            CFrame.Angles(math.rad(10.256), math.rad(56.264),
                                          math.rad(-159.855))
                    }
                }
            }
        },
        [6.067] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.088, 0.043, -0.226) *
                        CFrame.Angles(math.rad(15.642), math.rad(2.005),
                                      math.rad(1.261)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.86, 0.241, 0.74) *
                            CFrame.Angles(math.rad(0.401), math.rad(0.573),
                                          math.rad(2.063))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.034, -0.681, -0.045) *
                            CFrame.Angles(math.rad(9.225), math.rad(-54.374),
                                          math.rad(162.09))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-6.188), math.rad(-4.354),
                                          math.rad(-0.057))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.558, 0.202, 0.427) *
                            CFrame.Angles(math.rad(-2.979), math.rad(-28.075),
                                          math.rad(-1.089))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.217, -0.658, -0.068) *
                            CFrame.Angles(math.rad(9.798), math.rad(56.264),
                                          math.rad(-158.595))
                    }
                }
            }
        },
        [6.117] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.084, 0.164, -0.27) *
                        CFrame.Angles(math.rad(4.412), math.rad(2.005),
                                      math.rad(1.261)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-1.063, 0.068, 0.733) *
                            CFrame.Angles(math.rad(-0.286), math.rad(0.344),
                                          math.rad(21.887))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.031, -0.769, -0.015) *
                            CFrame.Angles(math.rad(8.48), math.rad(-53.858),
                                          math.rad(162.319))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-13.579), math.rad(-4.125),
                                          math.rad(-0.286))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.743, 0.117, 0.452) *
                            CFrame.Angles(math.rad(-11.173), math.rad(-25.611),
                                          math.rad(-21.601))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.22, -0.689, -0.017) *
                            CFrame.Angles(math.rad(11.516), math.rad(56.895),
                                          math.rad(-158.079))
                    }
                }
            }
        },
        [6.167] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.082, 0.076, -0.574) *
                        CFrame.Angles(math.rad(10.428), math.rad(2.005),
                                      math.rad(1.261)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-1.189, 0.398, 0.744) *
                            CFrame.Angles(math.rad(0.344), math.rad(0.63),
                                          math.rad(21.772))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.298, -0.981, 0.273) *
                            CFrame.Angles(math.rad(-2.521), math.rad(-41.482),
                                          math.rad(175.841))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.97), math.rad(-3.896),
                                          math.rad(-0.458))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.871, 0.436, 0.534) *
                            CFrame.Angles(math.rad(-10.485), math.rad(-29.221),
                                          math.rad(-23.319))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.548, -1.104, 0.36) *
                            CFrame.Angles(math.rad(4.756), math.rad(43.258),
                                          math.rad(-175.841))
                    }
                }
            }
        },
        [6.217] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.081, -0.075, -0.686) *
                        CFrame.Angles(math.rad(23.892), math.rad(2.005),
                                      math.rad(1.261)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.892, 0.738, 0.767) *
                            CFrame.Angles(math.rad(1.719), math.rad(0.63),
                                          math.rad(0.917))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.41, -1.298, 0.185) *
                            CFrame.Angles(math.rad(-18.564), math.rad(-8.766),
                                          math.rad(172.689))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.97), math.rad(-3.896),
                                          math.rad(-0.458))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.578, 0.685, 0.539) *
                            CFrame.Angles(math.rad(0.917), math.rad(-32.2),
                                          math.rad(-0.516))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.573, -1.42, 0.3) *
                            CFrame.Angles(math.rad(-19.137), math.rad(5.844),
                                          math.rad(-170.971))
                    }
                }
            }
        },
        [6.267] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.08, -0.125, -0.651) *
                        CFrame.Angles(math.rad(29.221), math.rad(2.005),
                                      math.rad(1.261)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.751, 0.748, 0.768) *
                            CFrame.Angles(math.rad(2.005), math.rad(0.516),
                                          math.rad(-8.881))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.113, -0.679, -0.07) *
                            CFrame.Angles(math.rad(27.33), math.rad(36.268),
                                          math.rad(105.424))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.97), math.rad(-3.896),
                                          math.rad(-0.458))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.456, 0.659, 0.529) *
                            CFrame.Angles(math.rad(6.073), math.rad(-30.882),
                                          math.rad(10.485))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.042, -0.677, 0.302) *
                            CFrame.Angles(math.rad(48.759), math.rad(-47.67),
                                          math.rad(-82.162))
                    }
                }
            }
        },
        [6.317] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.078, -0.134, -0.598) *
                        CFrame.Angles(math.rad(30.768), math.rad(2.005),
                                      math.rad(1.261)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.709, 0.705, 0.765) *
                            CFrame.Angles(math.rad(1.891), math.rad(0.516),
                                          math.rad(-12.605))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.082, -0.789, -0.082) *
                            CFrame.Angles(math.rad(25.038), math.rad(40.68),
                                          math.rad(116.081))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.97), math.rad(-3.896),
                                          math.rad(-0.458))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.427, 0.605, 0.518) *
                            CFrame.Angles(math.rad(7.506), math.rad(-29.908),
                                          math.rad(14.381))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.046, -0.551, 0.493) *
                            CFrame.Angles(math.rad(105.252), math.rad(-35.695),
                                          math.rad(-51.394))
                    }
                }
            }
        },
        [6.367] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.069, -0.133, -0.479) *
                        CFrame.Angles(math.rad(32.086), math.rad(2.005),
                                      math.rad(1.261)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.642, 0.587, 0.758) *
                            CFrame.Angles(math.rad(1.547), math.rad(0.802),
                                          math.rad(-18.507))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.192, -0.561, -0.044) *
                            CFrame.Angles(math.rad(70.703), math.rad(66.463),
                                          math.rad(105.768))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.97), math.rad(-3.896),
                                          math.rad(-0.458))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.393, 0.474, 0.485) *
                            CFrame.Angles(math.rad(9.11), math.rad(-28.132),
                                          math.rad(20.225))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.448, -0.528, 0.711) *
                            CFrame.Angles(math.rad(172.346), math.rad(20.913),
                                          math.rad(-19.137))
                    }
                }
            }
        },
        [6.417] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.06, -0.125, -0.435) *
                        CFrame.Angles(math.rad(32.315), math.rad(2.005),
                                      math.rad(1.261)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.615, 0.54, 0.756) *
                            CFrame.Angles(math.rad(1.318), math.rad(1.031),
                                          math.rad(-20.569))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(0.018, -0.388, 0.694) *
                            CFrame.Angles(math.rad(166.502), math.rad(20.626),
                                          math.rad(16.387))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.97), math.rad(-3.896),
                                          math.rad(-0.458))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.382, 0.423, 0.47) *
                            CFrame.Angles(math.rad(9.626), math.rad(-27.387),
                                          math.rad(22.173))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.448, -0.437, 0.75) *
                            CFrame.Angles(math.rad(173.205), math.rad(11.345),
                                          math.rad(-1.031))
                    }
                }
            }
        },
        [6.467] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.002, -0.105, -0.439) *
                        CFrame.Angles(math.rad(32.315), math.rad(2.349),
                                      math.rad(1.089)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.58, 0.569, 0.752) *
                            CFrame.Angles(math.rad(-0.458), math.rad(3.38),
                                          math.rad(-21.543))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.005, -0.429, 0.788) *
                            CFrame.Angles(math.rad(179.45), math.rad(15.355),
                                          math.rad(3.38))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.97), math.rad(-4.297),
                                          math.rad(-0.401))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.408, 0.412, 0.486) *
                            CFrame.Angles(math.rad(11.688), math.rad(-24.981),
                                          math.rad(22.231))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.416, -0.322, 0.788) *
                            CFrame.Angles(math.rad(179.164), math.rad(6.474),
                                          math.rad(8.365))
                    }
                }
            }
        },
        [6.517] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.085, -0.094, -0.489) *
                        CFrame.Angles(math.rad(32.372), math.rad(3.266),
                                      math.rad(0.516)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.543, 0.671, 0.736) *
                            CFrame.Angles(math.rad(-3.61), math.rad(7.678),
                                          math.rad(-20.684))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.037, -0.419, 0.825) *
                            CFrame.Angles(math.rad(-178.247), math.rad(16.157),
                                          math.rad(1.547))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-21.028), math.rad(-5.214),
                                          math.rad(-0.229))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.474, 0.424, 0.529) *
                            CFrame.Angles(math.rad(14.897), math.rad(-21.199),
                                          math.rad(20.054))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.375, -0.265, 0.801) *
                            CFrame.Angles(math.rad(-179.508), math.rad(6.704),
                                          math.rad(8.365))
                    }
                }
            }
        },
        [6.567] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.255, -0.08, -0.602) *
                        CFrame.Angles(math.rad(32.487), math.rad(5.959),
                                      math.rad(-1.203)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.403, 0.87, 0.657) *
                            CFrame.Angles(math.rad(-11.23), math.rad(19.366),
                                          math.rad(-19.939))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.107, -0.348, 0.883) *
                            CFrame.Angles(math.rad(-175.612), math.rad(15.928),
                                          math.rad(2.005))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-21.028), math.rad(-7.219),
                                          math.rad(0.172))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.622, 0.377, 0.599) *
                            CFrame.Angles(math.rad(23.205), math.rad(-11.975),
                                          math.rad(15.871))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.253, -0.144, 0.833) *
                            CFrame.Angles(math.rad(-177.961), math.rad(5.844),
                                          math.rad(5.672))
                    }
                }
            }
        },
        [6.617] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.276, -0.077, -0.625) *
                        CFrame.Angles(math.rad(32.601), math.rad(7.391),
                                      math.rad(-2.177)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.349, 0.924, 0.614) *
                            CFrame.Angles(math.rad(-13.808), math.rad(23.319),
                                          math.rad(-19.882))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.154, -0.288, 0.897) *
                            CFrame.Angles(math.rad(-174.351), math.rad(15.584),
                                          math.rad(2.75))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-21.028), math.rad(-7.563),
                                          math.rad(0.286))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.661, 0.329, 0.605) *
                            CFrame.Angles(math.rad(25.955), math.rad(-9.397),
                                          math.rad(15.126))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.186, -0.077, 0.853) *
                            CFrame.Angles(math.rad(-177.159), math.rad(5.214),
                                          math.rad(3.953))
                    }
                }
            }
        },
        [6.667] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.094, -0.077, -0.629) *
                        CFrame.Angles(math.rad(32.773), math.rad(9.225),
                                      math.rad(-3.323)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.374, 0.987, 0.603) *
                            CFrame.Angles(math.rad(-12.49), math.rad(19.939),
                                          math.rad(-18.564))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.277, -0.126, 0.886) *
                            CFrame.Angles(math.rad(-170.856), math.rad(15.642),
                                          math.rad(2.75))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-21.085), math.rad(-4.24),
                                          math.rad(-0.401))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.601, 0.331, 0.6) *
                            CFrame.Angles(math.rad(24.064), math.rad(-12.949),
                                          math.rad(17.017))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.062, 0.077, 0.9) *
                            CFrame.Angles(math.rad(-174.466), math.rad(4.297),
                                          math.rad(1.604))
                    }
                }
            }
        },
        [6.717] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.051, -0.077, -0.609) *
                        CFrame.Angles(math.rad(32.544), math.rad(6.99),
                                      math.rad(-1.891)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.5, 0.901, 0.693) *
                            CFrame.Angles(math.rad(-5.672), math.rad(9.626),
                                          math.rad(-18.163))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.347, -0.031, 0.87) *
                            CFrame.Angles(math.rad(-169.023), math.rad(15.814),
                                          math.rad(2.235))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-21.028), math.rad(-1.089),
                                          math.rad(-1.031))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.477, 0.434, 0.572) *
                            CFrame.Angles(math.rad(17.762), math.rad(-20.512),
                                          math.rad(19.767))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(-0.007, 0.16, 0.923) *
                            CFrame.Angles(math.rad(-172.804), math.rad(4.068),
                                          math.rad(0.974))
                    }
                }
            }
        },
        [6.767] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.259, -0.077, -0.502) *
                        CFrame.Angles(math.rad(32.315), math.rad(-2.865),
                                      math.rad(4.354)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.651, 0.304, 0.773) *
                            CFrame.Angles(math.rad(13.465), math.rad(-10.714),
                                          math.rad(-24.694))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.479, 0.169, 0.839) *
                            CFrame.Angles(math.rad(-166.33), math.rad(16.043),
                                          math.rad(1.318))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.798), math.rad(4.469),
                                          math.rad(-2.177))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.145, 0.566, 0.33) *
                            CFrame.Angles(math.rad(0.917), math.rad(-41.081),
                                          math.rad(29.106))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.09, 0.328, 0.956) *
                            CFrame.Angles(math.rad(-170.226), math.rad(3.724),
                                          math.rad(0.286))
                    }
                }
            }
        },
        [6.817] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.291, -0.077, -0.43) *
                        CFrame.Angles(math.rad(32.429), math.rad(-5.099),
                                      math.rad(5.787)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.541, 0.039, 0.741) *
                            CFrame.Angles(math.rad(16.96), math.rad(-13.235),
                                          math.rad(-31.513))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.535, 0.268, 0.833) *
                            CFrame.Angles(math.rad(-165.929), math.rad(16.043),
                                          math.rad(1.375))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-20.569), math.rad(5.386),
                                          math.rad(-2.406))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.083, 0.492, 0.257) *
                            CFrame.Angles(math.rad(-2.636), math.rad(-44.404),
                                          math.rad(32.601))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.249, 0.408, 0.97) *
                            CFrame.Angles(math.rad(-169.653), math.rad(4.756),
                                          math.rad(-6.188))
                    }
                }
            }
        },
        [6.867] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.291, -0.077, -0.293) *
                        CFrame.Angles(math.rad(32.429), math.rad(-5.099),
                                      math.rad(5.787)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.204, -0.375, 0.7) *
                            CFrame.Angles(math.rad(16.329), math.rad(-12.433),
                                          math.rad(-47.613))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.615, 0.458, 0.841) *
                            CFrame.Angles(math.rad(-170.57), math.rad(15.699),
                                          math.rad(2.521))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-17.533), math.rad(4.469),
                                          math.rad(-2.578))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.053, 0.283, 0.218) *
                            CFrame.Angles(math.rad(-3.037), math.rad(-42.571),
                                          math.rad(37.529))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.531, 0.564, 0.975) *
                            CFrame.Angles(math.rad(-174.351), math.rad(6.532),
                                          math.rad(-18.621))
                    }
                }
            }
        },
        [6.917] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.291, -0.077, -0.268) *
                        CFrame.Angles(math.rad(32.429), math.rad(-5.099),
                                      math.rad(5.787)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.203, -0.374, 0.701) *
                            CFrame.Angles(math.rad(16.215), math.rad(-12.319),
                                          math.rad(-47.441))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.641, 0.544, 0.844) *
                            CFrame.Angles(math.rad(-175.382), math.rad(15.413),
                                          math.rad(3.209))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-14.897), math.rad(3.552),
                                          math.rad(-2.75))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.039, 0.235, 0.206) *
                            CFrame.Angles(math.rad(-3.094), math.rad(-42.227),
                                          math.rad(38.847))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.581, 0.65, 0.955) *
                            CFrame.Angles(math.rad(-179.851), math.rad(6.646),
                                          math.rad(-20.569))
                    }
                }
            }
        },
        [6.967] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.209, 0.021, -0.256) *
                        CFrame.Angles(math.rad(22.288), math.rad(-2.349),
                                      math.rad(1.318)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.675, 0.106, 0.768) *
                            CFrame.Angles(math.rad(11.402), math.rad(-3.953),
                                          math.rad(-13.407))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.67, 0.667, 0.833) *
                            CFrame.Angles(math.rad(173.835), math.rad(15.126),
                                          math.rad(4.125))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-10.313), math.rad(1.375),
                                          math.rad(-2.75))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.336, 0.34, 0.328) *
                            CFrame.Angles(math.rad(-6.589), math.rad(-33.976),
                                          math.rad(15.584))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.49, 0.786, 0.872) *
                            CFrame.Angles(math.rad(167.533), math.rad(5.615),
                                          math.rad(-14.725))
                    }
                }
            }
        },
        [7.017] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.167, 0.051, -0.343) *
                        CFrame.Angles(math.rad(18.85), math.rad(-0.172),
                                      math.rad(-0.458)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.876, 0.284, 0.793) *
                            CFrame.Angles(math.rad(7.162), math.rad(-0.344),
                                          math.rad(-0.057))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.675, 0.693, 0.818) *
                            CFrame.Angles(math.rad(169.653), math.rad(15.241),
                                          math.rad(4.125))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.568), math.rad(0.401),
                                          math.rad(-2.521))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.518, 0.403, 0.404) *
                            CFrame.Angles(math.rad(-5.271), math.rad(-30.424),
                                          math.rad(5.042))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.258, 0.805, 0.824) *
                            CFrame.Angles(math.rad(162.605), math.rad(3.38),
                                          math.rad(-2.349))
                    }
                }
            }
        },
        [7.067] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.145, -0.021, -0.795) *
                        CFrame.Angles(math.rad(18.85), math.rad(1.031),
                                      math.rad(-0.917)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-1.074, 0.667, 0.831) *
                            CFrame.Angles(math.rad(6.36), math.rad(-0.057),
                                          math.rad(13.579))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.673, 0.701, 0.789) *
                            CFrame.Angles(math.rad(164.84), math.rad(15.527),
                                          math.rad(4.068))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.568), math.rad(-0.917),
                                          math.rad(-1.891))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.634, 0.802, 0.471) *
                            CFrame.Angles(math.rad(-7.506), math.rad(-34.435),
                                          math.rad(-8.365))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.254, 0.804, 0.802) *
                            CFrame.Angles(math.rad(158.423), math.rad(3.61),
                                          math.rad(-1.833))
                    }
                }
            }
        },
        [7.117] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.103, -0.043, -1.004) *
                        CFrame.Angles(math.rad(18.85), math.rad(1.833),
                                      math.rad(-1.146)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.989, 0.898, 0.831) *
                            CFrame.Angles(math.rad(3.667), math.rad(1.833),
                                          math.rad(14.439))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.668, 0.696, 0.778) *
                            CFrame.Angles(math.rad(163.866), math.rad(15.527),
                                          math.rad(4.183))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.626), math.rad(-1.375),
                                          math.rad(-1.432))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.588, 0.969, 0.46) *
                            CFrame.Angles(math.rad(-7.047), math.rad(-36.268),
                                          math.rad(-10.6))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.249, 0.792, 0.8) *
                            CFrame.Angles(math.rad(158.022), math.rad(3.61),
                                          math.rad(-1.49))
                    }
                }
            }
        },
        [7.167] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.139, -0.024, -1.063) *
                        CFrame.Angles(math.rad(18.908), math.rad(5.73),
                                      math.rad(-2.464)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.639, 1.229, 0.498) *
                            CFrame.Angles(math.rad(-21.371), math.rad(23.778),
                                          math.rad(11.459))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.657, 0.666, 0.771) *
                            CFrame.Angles(math.rad(165.642), math.rad(15.527),
                                          math.rad(4.068))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.626), math.rad(-2.235),
                                          math.rad(-0.401))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.821, 0.737, 0.682) *
                            CFrame.Angles(math.rad(12.834), math.rad(-19.824),
                                          math.rad(-12.376))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.235, 0.749, 0.813) *
                            CFrame.Angles(math.rad(160.027), math.rad(3.552),
                                          math.rad(-0.458))
                    }
                }
            }
        },
        [7.217] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.219, -0.007, -0.989) *
                        CFrame.Angles(math.rad(18.965), math.rad(7.105),
                                      math.rad(-2.979)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.643, 1.198, 0.443) *
                            CFrame.Angles(math.rad(-27.96), math.rad(28.361),
                                          math.rad(12.605))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.648, 0.636, 0.785) *
                            CFrame.Angles(math.rad(170.455), math.rad(15.241),
                                          math.rad(4.125))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.683), math.rad(-2.807),
                                          math.rad(0.115))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.943, 0.532, 0.717) *
                            CFrame.Angles(math.rad(19.939), math.rad(-14.553),
                                          math.rad(-13.235))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.227, 0.715, 0.835) *
                            CFrame.Angles(math.rad(163.751), math.rad(3.552),
                                          math.rad(0.172))
                    }
                }
            }
        },
        [7.267] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.37, 0.025, -0.738) *
                        CFrame.Angles(math.rad(19.022), math.rad(8.48),
                                      math.rad(-3.438)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.723, 0.999, 0.481) *
                            CFrame.Angles(math.rad(-33.862), math.rad(28.018),
                                          math.rad(12.204))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.633, 0.543, 0.826) *
                            CFrame.Angles(math.rad(-175.153), math.rad(15.241),
                                          math.rad(3.839))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.683), math.rad(-4.354),
                                          math.rad(1.146))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(1.021, 0.176, 0.638) *
                            CFrame.Angles(math.rad(27.788), math.rad(-10.027),
                                          math.rad(-10.886))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.205, 0.625, 0.892) *
                            CFrame.Angles(math.rad(174.523), math.rad(3.782),
                                          math.rad(1.375))
                    }
                }
            }
        },
        [7.317] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.395, 0.036, -0.607) *
                        CFrame.Angles(math.rad(19.079), math.rad(9.053),
                                      math.rad(-3.667)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.733, 0.898, 0.512) *
                            CFrame.Angles(math.rad(-34.034), math.rad(26.184),
                                          math.rad(10.313))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.628, 0.492, 0.839) *
                            CFrame.Angles(math.rad(-168.22), math.rad(15.527),
                                          math.rad(3.438))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.683), math.rad(-5.558),
                                          math.rad(1.547))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.972, 0.064, 0.577) *
                            CFrame.Angles(math.rad(28.591), math.rad(-9.855),
                                          math.rad(-7.563))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.192, 0.575, 0.919) *
                            CFrame.Angles(math.rad(-179.966), math.rad(4.125),
                                          math.rad(1.833))
                    }
                }
            }
        },
        [7.367] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.37, 0.047, -0.427) *
                        CFrame.Angles(math.rad(19.194), math.rad(11.058),
                                      math.rad(-4.354)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.711, 0.781, 0.528) *
                            CFrame.Angles(math.rad(-34.893), math.rad(24.408),
                                          math.rad(7.277))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.617, 0.414, 0.839) *
                            CFrame.Angles(math.rad(-159.855), math.rad(16.043),
                                          math.rad(2.578))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.626), math.rad(-8.537),
                                          math.rad(2.177))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.827, -0.099, 0.469) *
                            CFrame.Angles(math.rad(29.45), math.rad(-10.027),
                                          math.rad(-0.573))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.165, 0.48, 0.955) *
                            CFrame.Angles(math.rad(-171.486), math.rad(4.87),
                                          math.rad(2.349))
                    }
                }
            }
        },
        [7.417] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.353, 0.049, -0.375) *
                        CFrame.Angles(math.rad(19.251), math.rad(12.089),
                                      math.rad(-4.698)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.698, 0.756, 0.522) *
                            CFrame.Angles(math.rad(-35.867), math.rad(24.293),
                                          math.rad(6.589))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.611, 0.388, 0.832) *
                            CFrame.Angles(math.rad(-157.907), math.rad(16.157),
                                          math.rad(2.235))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.626), math.rad(-9.912),
                                          math.rad(2.349))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.759, -0.16, 0.425) *
                            CFrame.Angles(math.rad(30.08), math.rad(-9.912),
                                          math.rad(2.292))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.152, 0.441, 0.966) *
                            CFrame.Angles(math.rad(-168.736), math.rad(5.099),
                                          math.rad(2.464))
                    }
                }
            }
        },
        [7.467] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.314, 0.05, -0.338) *
                        CFrame.Angles(math.rad(19.366), math.rad(13.178),
                                      math.rad(-5.099)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.696, 0.747, 0.515) *
                            CFrame.Angles(math.rad(-36.497), math.rad(24.064),
                                          math.rad(6.36))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.599, 0.352, 0.816) *
                            CFrame.Angles(math.rad(-156.417), math.rad(16.215),
                                          math.rad(1.948))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.626), math.rad(-11.345),
                                          math.rad(2.521))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.693, -0.205, 0.389) *
                            CFrame.Angles(math.rad(30.195), math.rad(-10.084),
                                          math.rad(4.927))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.13, 0.385, 0.974) *
                            CFrame.Angles(math.rad(-166.673), math.rad(5.5),
                                          math.rad(2.807))
                    }
                }
            }
        },
        [7.517] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.281, 0.041, -0.424) *
                        CFrame.Angles(math.rad(19.309), math.rad(12.376),
                                      math.rad(-4.813)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.742, 0.811, 0.513) *
                            CFrame.Angles(math.rad(-34.779), math.rad(23.835),
                                          math.rad(8.652))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.593, 0.348, 0.806) *
                            CFrame.Angles(math.rad(-157.678), math.rad(16.157),
                                          math.rad(2.005))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.683), math.rad(-10.199),
                                          math.rad(2.292))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.804, -0.101, 0.466) *
                            CFrame.Angles(math.rad(28.419), math.rad(-10.829),
                                          math.rad(0.057))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.123, 0.374, 0.972) *
                            CFrame.Angles(math.rad(-167.819), math.rad(5.672),
                                          math.rad(3.151))
                    }
                }
            }
        },
        [7.567] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.117, -0.017, -0.961) *
                        CFrame.Angles(math.rad(18.85), math.rad(2.865),
                                      math.rad(-1.49)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-0.854, 1.029, 0.686) *
                            CFrame.Angles(math.rad(-11.631), math.rad(13.923),
                                          math.rad(13.006))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.582, 0.385, 0.771) *
                            CFrame.Angles(math.rad(-167.132), math.rad(15.756),
                                          math.rad(2.636))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.912), math.rad(-3.209),
                                          math.rad(1.203))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.774, 0.791, 0.606) *
                            CFrame.Angles(math.rad(6.016), math.rad(-24.122),
                                          math.rad(-11.287))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.117, 0.385, 0.949) *
                            CFrame.Angles(math.rad(-174.523), math.rad(5.558),
                                          math.rad(4.183))
                    }
                }
            }
        },
        [7.617] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.005, -0.048, -1.151) *
                        CFrame.Angles(math.rad(18.85), math.rad(-3.495),
                                      math.rad(0.688)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-1.003, 0.852, 0.914) *
                            CFrame.Angles(math.rad(9.74), math.rad(-0.516),
                                          math.rad(14.668))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.579, 0.415, 0.747) *
                            CFrame.Angles(math.rad(-173.549), math.rad(15.527),
                                          math.rad(3.037))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.912), math.rad(1.203),
                                          math.rad(0.516))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(0.299, 1.234, 0.19) *
                            CFrame.Angles(math.rad(-13.923), math.rad(-46.066),
                                          math.rad(-5.959))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.119, 0.403, 0.931) *
                            CFrame.Angles(math.rad(-178.992), math.rad(5.271),
                                          math.rad(4.641))
                    }
                }
            }
        },
        [7.667] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.181, -0.076, -1.204) *
                        CFrame.Angles(math.rad(19.079), math.rad(-8.824),
                                      math.rad(2.521)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-1.239, 0.447, 0.95) *
                            CFrame.Angles(math.rad(31.627), math.rad(-12.548),
                                          math.rad(20.168))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.577, 0.46, 0.704) *
                            CFrame.Angles(math.rad(176.07), math.rad(15.47),
                                          math.rad(3.38))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.912), math.rad(8.193),
                                          math.rad(-0.63))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.084, 1.227, -0.185) *
                            CFrame.Angles(math.rad(-23.319), math.rad(-68.01),
                                          math.rad(5.157))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.124, 0.438, 0.891) *
                            CFrame.Angles(math.rad(172.288), math.rad(4.641),
                                          math.rad(5.157))
                    }
                }
            }
        },
        [7.717] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.253, -0.081, -1.207) *
                        CFrame.Angles(math.rad(19.079), math.rad(-9.225),
                                      math.rad(2.636)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-1.272, 0.367, 0.928) *
                            CFrame.Angles(math.rad(36.154), math.rad(-14.553),
                                          math.rad(21.142))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.577, 0.466, 0.696) *
                            CFrame.Angles(math.rad(174.408), math.rad(15.47),
                                          math.rad(3.438))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.855), math.rad(9.339),
                                          math.rad(-0.802))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.143, 1.183, -0.216) *
                            CFrame.Angles(math.rad(-22.231), math.rad(-71.276),
                                          math.rad(9.683))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.125, 0.452, 0.873) *
                            CFrame.Angles(math.rad(168.621), math.rad(4.297),
                                          math.rad(5.214))
                    }
                }
            }
        },
        [7.767] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.351, -0.087, -1.215) *
                        CFrame.Angles(math.rad(18.621), math.rad(-9.454),
                                      math.rad(2.177)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-1.317, 0.247, 0.896) *
                            CFrame.Angles(math.rad(42.227), math.rad(-15.871),
                                          math.rad(23.606))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.581, 0.451, 0.713) *
                            CFrame.Angles(math.rad(178.362), math.rad(15.699),
                                          math.rad(2.807))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.855), math.rad(6.016),
                                          math.rad(-0.286))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.203, 1.12, -0.244) *
                            CFrame.Angles(math.rad(-19.538), math.rad(-74.427),
                                          math.rad(16.501))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.127, 0.468, 0.846) *
                            CFrame.Angles(math.rad(163.579), math.rad(3.896),
                                          math.rad(5.042))
                    }
                }
            }
        },
        [7.817] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(0.365, -0.085, -1.236) *
                        CFrame.Angles(math.rad(18.335), math.rad(-9.568),
                                      math.rad(1.547)),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(-1.335, 0.213, 0.901) *
                            CFrame.Angles(math.rad(44.118), math.rad(-15.584),
                                          math.rad(25.096))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.584, 0.434, 0.729) *
                            CFrame.Angles(math.rad(-177.732), math.rad(15.871),
                                          math.rad(2.177))
                    },
                    ["Head"] = {
                        CFrame = CFrame.new(0.03, -0.041, 0.001) *
                            CFrame.Angles(math.rad(-9.798), math.rad(2.807),
                                          math.rad(0.172))
                    },
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.244, 1.106, -0.265) *
                            CFrame.Angles(math.rad(-14.496), math.rad(-75.115),
                                          math.rad(22.861))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.127, 0.472, 0.838) *
                            CFrame.Angles(math.rad(162.032), math.rad(3.782),
                                          math.rad(4.985))
                    }
                }
            }
        },
        [8.017] = {
            ["HumanoidRootPart"] = {
                ["Torso"] = {
                    CFrame = CFrame.new(-0.02, 0.076, -0.296) *
                        CFrame.Angles(math.rad(10.772), 0, 0),
                    ["Left Leg"] = {
                        CFrame = CFrame.new(0.036, 0.317, -0.052) *
                            CFrame.Angles(math.rad(-13.866), math.rad(39.763),
                                          math.rad(-10.542))
                    },
                    ["Right Arm"] = {
                        CFrame = CFrame.new(-0.2, 0.139, 0.052) *
                            CFrame.Angles(math.rad(-25.325), math.rad(28.705),
                                          math.rad(-9.282))
                    },
                    ["Head"] = {CFrame = CFrame.Angles(math.rad(-6.417), 0, 0)},
                    ["Right Leg"] = {
                        CFrame = CFrame.new(-0.12, 0.282, -0.117) *
                            CFrame.Angles(math.rad(-10.027), math.rad(-45.55),
                                          math.rad(13.98))
                    },
                    ["Left Arm"] = {
                        CFrame = CFrame.new(0.339, 0.106, 0.22) *
                            CFrame.Angles(math.rad(-29.393), math.rad(-29.851),
                                          math.rad(-1.891))
                    }
                }
            }
        }
    }
}
local number = 0

LastTimeSetTotal = 0
local savec0 = {}

GetAnimCF = function(limb, Time)

    local GA = nil
    coroutine.resume(coroutine.create(function()

        if limb == "Torso" then
            GA = Anim.Keyframes[Time]["HumanoidRootPart"]["Torso"].CFrame
        else
            GA = Anim.Keyframes[Time]["HumanoidRootPart"]["Torso"]["" .. limb]
                     .CFrame

        end
    end))
    return GA
end

local model = nil
if owner ~= nil then
    model = owner.Character
else
    model = game:GetService("Players").localPlayer.Character
end
function GatherAllInstances(Parent)
    local Instances = {}
    local function GatherInstances(Parent)
        for i, v in pairs(Parent:GetChildren()) do
            GatherInstances(v)
            table.insert(Instances, v)
        end
    end
    GatherInstances(Parent)
    return Instances
end

for i, v in pairs(GatherAllInstances(model)) do
    if v:IsA("BasePart") then
        for i, v2 in pairs(GatherAllInstances(model)) do
            if v2:IsA("Motor6D") and v2.Part1.Name == v.Name then

                local saveCF = v2.C0
                table.insert(savec0, {v2.Name, saveCF})

            end
        end
    end
end

RunAnim = function(Time)

    local speed = Time - LastTimeSetTotal

    speed = speed * AnimationSpeed
    LastTimeSetTotal = Time

    local doing = true

    coroutine.resume(coroutine.create(function()
        for i, v in pairs(GatherAllInstances(model)) do
            if v:IsA("BasePart") then
                for i, v2 in pairs(GatherAllInstances(model)) do
                    if v2:IsA("Motor6D") and v2.Part1.Name == v.Name then

                        local GotAnim = GetAnimCF(v.Name, Time)
                        local saveCF = nil
                        for i, v3 in pairs(savec0) do
                            if v2.name == v3[1] then
                                saveCF = v3[2]
                            end
                        end

                        if GotAnim ~= nil and saveCF ~= nil then

                            coroutine.resume(
                                coroutine.create(
                                    function()
                                        while doing == true do
                                            swait()
                                            v2.C0 =
                                                v2.C0:lerp(saveCF * GotAnim,
                                                           SmoothTime * speed)
                                        end

                                    end))

                        end

                    end

                end
            end
        end

    end))
    wait(speed)
    doing = false
end
while true do
    RunAnim(0)
    RunAnim(0.1)
    RunAnim(0.2)
    RunAnim(0.3)
    RunAnim(0.4)
    RunAnim(0.5)
    RunAnim(0.6)
    RunAnim(0.7)
    RunAnim(0.8)
    RunAnim(0.9)
    RunAnim(1)
    -----------
    RunAnim(1.1)
    RunAnim(1.15)
    RunAnim(1.2)
    RunAnim(1.3)
    RunAnim(1.35)
    RunAnim(1.4)
    RunAnim(1.45)
    RunAnim(1.5)
    RunAnim(1.6)
    RunAnim(1.7)
    RunAnim(1.8)
    RunAnim(1.9)
    RunAnim(2)
    -----------

    RunAnim(2.1)
    RunAnim(2.2)
    RunAnim(2.3)
    RunAnim(2.4)
    RunAnim(2.5)
    RunAnim(2.6)
    RunAnim(2.7)
    RunAnim(2.8)
    RunAnim(2.9)
    RunAnim(3)
    -----------

    RunAnim(3.1)
    RunAnim(3.2)
    RunAnim(3.3)
    RunAnim(3.35)
    RunAnim(3.4)
    RunAnim(3.5)
    RunAnim(3.6)
    RunAnim(3.7)
    RunAnim(3.8)
    RunAnim(3.9)
    RunAnim(4)
    -----------

    RunAnim(4.1)
    RunAnim(4.2)
    RunAnim(4.3)
    RunAnim(4.4)
    RunAnim(4.5)
    RunAnim(4.6)
    RunAnim(4.7)
    RunAnim(4.8)
    RunAnim(4.9)
    RunAnim(5)
    -----------

    RunAnim(5.1)
    RunAnim(5.2)
    RunAnim(5.3)
    RunAnim(5.4)
    RunAnim(5.5)
    RunAnim(5.6)
    RunAnim(5.7)
    RunAnim(5.8)
    RunAnim(5.9)
    RunAnim(6)
    -----------

    RunAnim(6.1)
    RunAnim(6.2)
    RunAnim(6.3)
    RunAnim(6.4)
    RunAnim(6.5)
    -----------

    RunAnim(6.6)
    RunAnim(6.7)
    RunAnim(6.8)
    RunAnim(6.9)
    RunAnim(7)
    -----------
    LastTimeSetTotal = .1
    Humanoid.MaxHealth = "inf"
    Humanoid.Health = "inf"
    sick.SoundId = "rbxassetid://2108865698"
    sick.Looped = true
    sick.Pitch = 1.1
    sick.Volume = 10
    sick:Resume()
    sick.Parent = Torso
    refit()
end
