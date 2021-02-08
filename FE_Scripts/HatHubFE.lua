local http_request = http_request;
if syn then
    http_request = syn.request
elseif SENTINEL_V2 then
    function http_request(tb)
        return {
            StatusCode = 200,
            Body = request(tb.Url, tb.Method, (tb.Body or ''))
        }
    end
end

if (not http_request) then
    return game:GetService('Players').LocalPlayer:Kick(
               'Unable to find proper request function')
end

-- // define hash function

local hash;
do
    local MOD = 2 ^ 32
    local MODM = MOD - 1
    local bxor = bit32.bxor;
    local band = bit32.band;
    local bnot = bit32.bnot;
    local rshift1 = bit32.rshift;
    local rshift = bit32.rshift;
    local lshift = bit32.lshift;
    local rrotate = bit32.rrotate;

    local str_gsub = string.gsub;
    local str_fmt = string.format;
    local str_byte = string.byte;
    local str_char = string.char;
    local str_rep = string.rep;

    local k = {
        0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1,
        0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
        0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786,
        0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
        0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147,
        0x06ca6351, 0x14292967, 0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
        0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b,
        0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
        0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a,
        0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
        0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
    }
    local function str2hexa(s)
        return (str_gsub(s, ".",
                         function(c) return str_fmt("%02x", str_byte(c)) end))
    end
    local function num2s(l, n)
        local s = ""
        for i = 1, n do
            local rem = l % 256
            s = str_char(rem) .. s
            l = (l - rem) / 256
        end
        return s
    end
    local function s232num(s, i)
        local n = 0
        for i = i, i + 3 do n = n * 256 + str_byte(s, i) end
        return n
    end
    local function preproc(msg, len)
        local extra = 64 - ((len + 9) % 64)
        len = num2s(8 * len, 8)
        msg = msg .. "\128" .. str_rep("\0", extra) .. len
        assert(#msg % 64 == 0)
        return msg
    end
    local function initH256(H)
        H[1] = 0x6a09e667
        H[2] = 0xbb67ae85
        H[3] = 0x3c6ef372
        H[4] = 0xa54ff53a
        H[5] = 0x510e527f
        H[6] = 0x9b05688c
        H[7] = 0x1f83d9ab
        H[8] = 0x5be0cd19
        return H
    end
    local function digestblock(msg, i, H)
        local w = {}
        for j = 1, 16 do w[j] = s232num(msg, i + (j - 1) * 4) end
        for j = 17, 64 do
            local v = w[j - 15]
            local s0 = bxor(rrotate(v, 7), rrotate(v, 18), rshift(v, 3))
            v = w[j - 2]
            w[j] = w[j - 16] + s0 + w[j - 7] +
                       bxor(rrotate(v, 17), rrotate(v, 19), rshift(v, 10))
        end
        local a, b, c, d, e, f, g, h = H[1], H[2], H[3], H[4], H[5], H[6], H[7],
                                       H[8]
        for i = 1, 64 do
            local s0 = bxor(rrotate(a, 2), rrotate(a, 13), rrotate(a, 22))
            local maj = bxor(band(a, b), band(a, c), band(b, c))
            local t2 = s0 + maj
            local s1 = bxor(rrotate(e, 6), rrotate(e, 11), rrotate(e, 25))
            local ch = bxor(band(e, f), band(bnot(e), g))
            local t1 = h + s1 + ch + k[i] + w[i]
            h, g, f, e, d, c, b, a = g, f, e, d + t1, c, b, a, t1 + t2
        end
        H[1] = band(H[1] + a)
        H[2] = band(H[2] + b)
        H[3] = band(H[3] + c)
        H[4] = band(H[4] + d)
        H[5] = band(H[5] + e)
        H[6] = band(H[6] + f)
        H[7] = band(H[7] + g)
        H[8] = band(H[8] + h)
    end
    function hash(msg, t)
        msg = preproc(msg, #msg)
        local H = initH256({})
        for i = 1, #msg, 64 do digestblock(msg, i, H) end
        return str2hexa(num2s(H[1], 4) .. num2s(H[2], 4) .. num2s(H[3], 4) ..
                            num2s(H[4], 4) .. num2s(H[5], 4) .. num2s(H[6], 4) ..
                            num2s(H[7], 4) .. num2s(H[8], 4))
    end
end

print(
    "all loggers removed by Retro#3554 subscribe to Retrow on youtube ples thx")

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Credits = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local Updates = Instance.new("Frame")
local TextLabel_5 = Instance.new("TextLabel")
local TextLabel_6 = Instance.new("TextLabel")
local TextLabel_7 = Instance.new("TextLabel")
local TextLabel_8 = Instance.new("TextLabel")
local TextLabel_9 = Instance.new("TextLabel")
local Scripts = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local Hand = Instance.new("TextButton")
local SexDoll = Instance.new("TextButton")
local Naruto = Instance.new("TextButton")
local StrongStand = Instance.new("TextButton")
local NPC = Instance.new("TextButton")
local PP = Instance.new("TextButton")
local Plane = Instance.new("TextButton")
local Bike = Instance.new("TextButton")
local _911Plane = Instance.new("TextButton")
local _911 = Instance.new("TextButton")
local Car = Instance.new("TextButton")
local Shidashian = Instance.new("TextButton")
local Hoverboard = Instance.new("TextButton")
local Trashcan = Instance.new("TextButton")
local Fairy = Instance.new("TextButton")
local NoobDance = Instance.new("TextButton")
local Knight = Instance.new("TextButton")
local credits = Instance.new("TextButton")
local scripts = Instance.new("TextButton")
local updates = Instance.new("TextButton")
local Welcome = Instance.new("TextLabel")
local Hub = Instance.new("Frame")
local TextLabel_10 = Instance.new("TextLabel")
local TextLabel_11 = Instance.new("TextLabel")

-- Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

loadstring(game:HttpGet("https://pastebin.com/raw/tUUGAeaH", true))()

spoof(game.Players.LocalPlayer, "MaximumSimulationRadius", 1000)
spoof(game.Players.LocalPlayer, "SimulationRadius", 1000)
sethiddenproperty(game.Players.LocalPlayer, "MaximumSimulationRadius", math.huge)
sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",
                  1.0000000331814e+32)

local NetworkAccess = coroutine.create(function()
    settings().Physics.AllowSleep = false
    game:GetService("RunService").RenderStepped:Wait()
end)
spawn(function()
    while true do
        game:GetService("Players").LocalPlayer.ReplicationFocus = workspace
        game:GetService("RunService").Heartbeat:wait()
    end
end)

Main.Name = "Main"
Main.Parent = ScreenGui
Main.AnchorPoint = Vector2.new(1, 1)
Main.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Main.BorderColor3 = Color3.fromRGB(255, 163, 26)
Main.Position = UDim2.new(1, 0, 1, 0)
Main.Size = UDim2.new(0, 325, 0, 223)

Credits.Name = "Credits"
Credits.Parent = Main
Credits.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0.31099999, 0, 0.157000005, 0)
Credits.Size = UDim2.new(0, 216, 0, 181)
Credits.Visible = false

TextLabel.Parent = Credits
TextLabel.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 155, 0, 31)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "soda jerk#0650"
TextLabel.TextColor3 = Color3.fromRGB(255, 163, 26)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextLabel_2.Parent = Credits
TextLabel_2.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextLabel_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.171270713, 0)
TextLabel_2.Size = UDim2.new(0, 216, 0, 31)
TextLabel_2.Font = Enum.Font.SourceSansBold
TextLabel_2.Text = "*UI and scripts"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 163, 26)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

TextLabel_3.Parent = Credits
TextLabel_3.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextLabel_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(-0.00925925933, 0, 0.364640892, 0)
TextLabel_3.Size = UDim2.new(0, 202, 0, 31)
TextLabel_3.Font = Enum.Font.SourceSansBold
TextLabel_3.Text = "LeitungBambus#1933"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 163, 26)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

TextLabel_4.Parent = Credits
TextLabel_4.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextLabel_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(-0.00925925933, 0, 0.53591162, 0)
TextLabel_4.Size = UDim2.new(0, 157, 0, 31)
TextLabel_4.Font = Enum.Font.SourceSansBold
TextLabel_4.Text = "*Scripts"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 163, 26)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14.000
TextLabel_4.TextWrapped = true

Updates.Name = "Updates"
Updates.Parent = Main
Updates.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Updates.BorderSizePixel = 0
Updates.Position = UDim2.new(0.31099999, 0, 0.157000005, 0)
Updates.Size = UDim2.new(0, 216, 0, 181)

TextLabel_5.Parent = Updates
TextLabel_5.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextLabel_5.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(-0.115740731, 0, 0, 0)
TextLabel_5.Size = UDim2.new(0, 155, 0, 31)
TextLabel_5.Font = Enum.Font.SourceSansBold
TextLabel_5.Text = "8/26/2020"
TextLabel_5.TextColor3 = Color3.fromRGB(255, 163, 26)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14.000
TextLabel_5.TextWrapped = true

TextLabel_6.Parent = Updates
TextLabel_6.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextLabel_6.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel_6.BorderSizePixel = 0
TextLabel_6.Position = UDim2.new(-0.00087723881, 0, 0.171270713, 0)
TextLabel_6.Size = UDim2.new(0, 131, 0, 31)
TextLabel_6.Font = Enum.Font.SourceSansBold
TextLabel_6.Text = "*4 NEW Scripts"
TextLabel_6.TextColor3 = Color3.fromRGB(255, 163, 26)
TextLabel_6.TextScaled = true
TextLabel_6.TextSize = 14.000
TextLabel_6.TextWrapped = true

TextLabel_7.Parent = Updates
TextLabel_7.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextLabel_7.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel_7.BorderSizePixel = 0
TextLabel_7.Position = UDim2.new(-0.0740740746, 0, 0.828729272, 0)
TextLabel_7.Size = UDim2.new(0, 223, 0, 31)
TextLabel_7.Font = Enum.Font.SourceSansBold
TextLabel_7.Text = "*LeftAlt to open/close UI"
TextLabel_7.TextColor3 = Color3.fromRGB(255, 163, 26)
TextLabel_7.TextScaled = true
TextLabel_7.TextSize = 14.000
TextLabel_7.TextWrapped = true

TextLabel_8.Parent = Updates
TextLabel_8.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextLabel_8.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel_8.BorderSizePixel = 0
TextLabel_8.Position = UDim2.new(0.0593080893, 0, 0.502762437, 0)
TextLabel_8.Size = UDim2.new(0, 190, 0, 32)
TextLabel_8.Font = Enum.Font.SourceSansBold
TextLabel_8.Text = "*Removed Bakon stand"
TextLabel_8.TextColor3 = Color3.fromRGB(255, 163, 26)
TextLabel_8.TextScaled = true
TextLabel_8.TextSize = 14.000
TextLabel_8.TextWrapped = true

TextLabel_9.Parent = Updates
TextLabel_9.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextLabel_9.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel_9.BorderSizePixel = 0
TextLabel_9.Position = UDim2.new(0.00375253335, 0, 0.331491709, 0)
TextLabel_9.Size = UDim2.new(0, 207, 0, 31)
TextLabel_9.Font = Enum.Font.SourceSansBold
TextLabel_9.Text = "*Updated Hand and Bike"
TextLabel_9.TextColor3 = Color3.fromRGB(255, 163, 26)
TextLabel_9.TextScaled = true
TextLabel_9.TextSize = 14.000
TextLabel_9.TextWrapped = true

Scripts.Name = "Scripts"
Scripts.Parent = Main
Scripts.Active = true
Scripts.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Scripts.BorderColor3 = Color3.fromRGB(27, 27, 27)
Scripts.BorderSizePixel = 0
Scripts.Position = UDim2.new(0.31076926, 0, 0.156950712, 0)
Scripts.Size = UDim2.new(0, 216, 0, 181)
Scripts.Visible = false
Scripts.CanvasSize = UDim2.new(0, 0, 3, 0)
Scripts.ScrollBarThickness = 5

UIGridLayout.Parent = Scripts
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 100, 0, 32)

Hand.Name = "Hand"
Hand.Parent = Scripts
Hand.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
Hand.BorderColor3 = Color3.fromRGB(27, 42, 53)
Hand.BorderSizePixel = 0
Hand.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
Hand.Size = UDim2.new(0, 85, 0, 32)
Hand.Font = Enum.Font.SourceSansItalic
Hand.Text = "Hand"
Hand.TextColor3 = Color3.fromRGB(0, 0, 0)
Hand.TextSize = 30.000
Hand.TextWrapped = true
Hand.MouseButton1Down:connect(function()

    local unanchoredparts = {}
    local movers = {}
    local tog = true
    local move = false
    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character
    local mov = {};
    local mov2 = {};

    local Hats = {
        palm = Character:WaitForChild("Nagamaki"),
        point1 = Character:WaitForChild("Robloxclassicred"),
        point2 = Character:WaitForChild("Pal Hair"),
        middle1 = Character:WaitForChild("Pink Hair"),
        middle2 = Character:WaitForChild("Hat1"),
        ring1 = Character:WaitForChild("Kate Hair"),
        ring2 = Character:WaitForChild("LavanderHair"),
        pinki1 = Character:WaitForChild("Bedhead"),
        pinki2 = Character:WaitForChild("BlockheadBaseballCap"),
        thumb = Character:WaitForChild("MessyHair")
    }

    for i, v in next, Hats do
        v.Handle.AccessoryWeld:Remove()
        for _, mesh in next, v:GetDescendants() do
            if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                mesh:Remove()
            end
        end
    end

    function ftp(str)
        local pt = {};
        if str ~= 'me' and str ~= 'random' then
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Name:lower():find(str:lower()) then
                    table.insert(pt, v);
                end
            end
        elseif str == 'me' then
            table.insert(pt, plr);
        elseif str == 'random' then
            table.insert(pt, game.Players:GetPlayers()[math.random(1,
                                                                   #game.Players:GetPlayers())]);
        end
        return pt;
    end

    local function align(i, v)
        local att0 = Instance.new("Attachment", i)
        att0.Position = Vector3.new(0, 0, 0)
        local att1 = Instance.new("Attachment", v)
        att1.Position = Vector3.new(0, 0, 0)
        local AP = Instance.new("AlignPosition", i)
        AP.Attachment0 = att0
        AP.Attachment1 = att1
        AP.RigidityEnabled = false
        AP.ReactionForceEnabled = false
        AP.ApplyAtCenterOfMass = true
        AP.MaxForce = 9999999
        AP.MaxVelocity = math.huge
        AP.Responsiveness = 65
        local AO = Instance.new("AlignOrientation", i)
        AO.Attachment0 = att0
        AO.Attachment1 = att1
        AO.ReactionTorqueEnabled = false
        AO.PrimaryAxisOnly = false
        AO.MaxTorque = 9999999
        AO.MaxAngularVelocity = math.huge
        AO.Responsiveness = 50
    end

    align(Hats.palm.Handle, Character["HumanoidRootPart"])
    align(Hats.point1.Handle, Character["HumanoidRootPart"])
    align(Hats.point2.Handle, Character["HumanoidRootPart"])
    align(Hats.middle1.Handle, Character["HumanoidRootPart"])
    align(Hats.middle2.Handle, Character["HumanoidRootPart"])
    align(Hats.ring1.Handle, Character["HumanoidRootPart"])
    align(Hats.ring2.Handle, Character["HumanoidRootPart"])
    align(Hats.pinki1.Handle, Character["HumanoidRootPart"])
    align(Hats.pinki2.Handle, Character["HumanoidRootPart"])
    align(Hats.thumb.Handle, Character["HumanoidRootPart"])

    Hats.palm.Handle.Attachment.Rotation = Vector3.new(50, 0, 0)
    Hats.point1.Handle.Attachment.Rotation = Vector3.new(-20, 0, 0)
    Hats.point2.Handle.Attachment.Rotation = Vector3.new(5, 0, 0)
    Hats.middle1.Handle.Attachment.Rotation = Vector3.new(-20, 0, 0)
    Hats.middle2.Handle.Attachment.Rotation = Vector3.new(5, 0, 0)
    Hats.ring1.Handle.Attachment.Rotation = Vector3.new(-20, 0, 0)
    Hats.ring2.Handle.Attachment.Rotation = Vector3.new(5, 0, 0)
    Hats.pinki1.Handle.Attachment.Rotation = Vector3.new(-20, 0, 0)
    Hats.pinki2.Handle.Attachment.Rotation = Vector3.new(5, 0, 0)
    Hats.thumb.Handle.Attachment.Rotation = Vector3.new(0, 30, 0)

    Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name =
        "Attachment1"
    Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name =
        "Attachment2"
    Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name =
        "Attachment3"
    Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name =
        "Attachment4"
    Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name =
        "Attachment5"
    Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name =
        "Attachment6"
    Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name =
        "Attachment7"
    Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name =
        "Attachment8"
    Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name =
        "Attachment9"
    Character:WaitForChild("HumanoidRootPart"):FindFirstChild("Attachment").Name =
        "Attachment10"

    Character:WaitForChild("HumanoidRootPart").Attachment1.Position =
        Vector3.new(0, 5, 5)
    Character:WaitForChild("HumanoidRootPart").Attachment2.Position =
        Vector3.new(-2, 6.2, 3.12)
    Character:WaitForChild("HumanoidRootPart").Attachment3.Position =
        Vector3.new(-2, 6.4, 1.4)
    Character:WaitForChild("HumanoidRootPart").Attachment4.Position =
        Vector3.new(-0.6, 6.2, 3.12)
    Character:WaitForChild("HumanoidRootPart").Attachment5.Position =
        Vector3.new(-0.6, 6.4, 1.4)
    Character:WaitForChild("HumanoidRootPart").Attachment6.Position =
        Vector3.new(0.7, 6.2, 3.12)
    Character:WaitForChild("HumanoidRootPart").Attachment7.Position =
        Vector3.new(0.7, 6.4, 1.4)
    Character:WaitForChild("HumanoidRootPart").Attachment8.Position =
        Vector3.new(2, 6.2, 3.12)
    Character:WaitForChild("HumanoidRootPart").Attachment9.Position =
        Vector3.new(2, 6.4, 1.4)
    Character:WaitForChild("HumanoidRootPart").Attachment10.Position =
        Vector3.new(3, 4.5, 4.7)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "z" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(-5, 3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-7, 4, 1)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-7, 3.5, 2)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-5.7, 4, 1)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-5.7, 3.5, 2)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(-4.4, 5.5, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(-4.4, 6.8, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(-3, 4, 1)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(-3, 3.5, 2)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(-2.1, 2.6, 0)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(-270, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(-270, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(-270, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, -40)

                    toggle = true
                else
                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(-5, 3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-7, 4, 1)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-7, 3.5, 2)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-5.7, 4, 1)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-5.7, 3.5, 2)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(-4.4, 5.2, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(-5.06, 7, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(-2.9, 5.3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(-2.6, 7, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(-3.23, 2, 1)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(-270, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(-270, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -20)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -20)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 10)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 10)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 200, 0)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "q" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 5, 5)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-2, 6.2, 3.12)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-2, 6.4, 1.4)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.6, 6.2, 3.12)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-0.6, 6.4, 1.4)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0.7, 6.2, 3.12)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0.7, 6.4, 1.4)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2, 6.2, 3.12)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(2, 6.4, 1.4)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(3, 4.5, 4.7)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(50, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(-20, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(5, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(-20, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(5, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(-20, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation = Vector3.new(5, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(-20, 0, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(5, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 30, 0)

                    toggle = true
                else
                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 3.6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-2, 4.6, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-2, 4.1, -2)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.7, 4.6, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-0.7, 4.1, -2)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0.6, 4.6, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0.6, 4.1, -2)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(2, 6.4, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(3.3, 2.6, 0)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(-270, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(-270, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(-270, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "x" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 4, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(2, 4, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(1, 4, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-2, 7.5, -0.38)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-2, 6.3, -0.15)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0, 7.5, -1.03)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0, 6.1, -0.38)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2, 4.5, -2)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(2, 5, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(2, 3, -1)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(-80, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(-80, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(-65, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(-65, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)

                    toggle = true
                else
                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 4, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(6, 4, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(5, 4, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-2, 7.5, -0.38)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-2, 6.3, -0.15)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0, 7.5, -1.03)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0, 6.1, -0.38)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2, 4.5, -2)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(2, 5, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(2, 3, -1)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(-80, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(-80, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(-65, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(-65, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "e" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -20, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-3.5, 7, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-3, 5, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-3, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-1, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(3.5, 7, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(3, 5, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(3, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(1, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(0, -20, 0)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.thumb.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)

                    toggle = true
                else
                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -20, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-5.5, 7, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-5, 5, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-5, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-3, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(5.5, 7, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(5, 5, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(5, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(3, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(0, -20, 0)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.thumb.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "c" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 5, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-1.05, 8, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-0.64, 9.1, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(0.1, 7, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(0.77, 8.6, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(1.5, 7, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(1.9, 8, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2.7, 6.4, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(3.22, 7.5, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(2.6, 3.4, 3)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 20)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 20)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 20)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 23)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 23)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 22)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 22)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 25)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 25)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, -10)

                    toggle = true
                else
                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 5, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-2.05, 7, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-2.19, 8.4, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.65, 7, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-0.7, 8.5, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0.65, 7, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0.7, 8.5, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2.1, 7, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(2.22, 8.4, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(3, 4.4, 3)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -5)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -5)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -2)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -2)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 2)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 2)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 5)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 5)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, -30)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "v" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -2, -7)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(0, -1.4, -1.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(0, -1.4, -3.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.5, 0, -5)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-1, -1, -5)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(-0.5, 0, -7)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(-1, -1, -7)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(-0.5, 0, -9)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(-1, -1, -9)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(1, -1, -8.6)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(90, 90, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 90)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 90)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 50, 40)

                    toggle = true
                else
                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -2, -3)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(0, -1.4, -1.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(0, -1.4, -3.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.5, 0, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-1, -1, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(-0.5, 0, -3)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(-1, -1, -3)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(-0.5, 0, -5)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(-1, -1, -5)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(1, -1, -4.6)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(90, 90, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 90)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 90)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 50, 40)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "f" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(-0.424, -1.207, -1.814)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(1.477, 1.894, -1.814)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-2.291, 1.394, -1.814)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-3.299, 1.677, -1.814)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-1.197, -0.244, -0.921)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(-0.72, -0.377, 0.165)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(-1.546, -1.488, -0.921)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(-1.068, -1.616, 0.165)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(-1.931, -2.86, -0.921)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(-1.612, -2.95, 0.165)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(0, 180, -74.33)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(74.33, -90, 180)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(15.67, 90, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(15.67, 90, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 15.67)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(15.67, 90, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 15.67)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(15.67, 90, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 15.67)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(15.67, 90, 0)

                    toggle = true
                else

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-1.3, 7, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(1.3, 7, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(0, 3.3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-1, 3.3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(1, 3.3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(-3, 3.3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(3, 3.3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(0, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(0, -15, 0)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "r" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-1.7, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(1.7, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(1.8, 2.76, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(3.33, 2.05, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(-1.8, 2.76, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(-3.33, 2.05, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(0, 3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(0, 3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(0, -15, 0)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(15, 90, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(35, 90, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(-15, 90, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(-35, 90, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.thumb.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)

                    toggle = true
                else

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-1.7, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(1.7, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(1.8, 3.23, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(3.33, 3.94, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(-1.8, 3.23, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(-3.33, 3.94, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(0, 3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(0, 3, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(0, -15, 0)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(-15, 90, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(-35, 90, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(15, 90, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(35, 90, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.thumb.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "g" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(0, 5, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(0, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-1.8, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-1, 4.5, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(1, 4.5, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0, 8, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(0, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(0, 3.6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(0, 8, 0)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 180)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 180)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)

                    toggle = true
                else

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(0, 5, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(0, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-1.8, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-1, 7, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(1, 7, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0, 8, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(0, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(0, 3.6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(0, 8, 0)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 180)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 180)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "y" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 7, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-2, 5.5, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(2, 4, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.6, 5.5, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-0.6, 5, -0.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0.7, 5.5, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0.7, 5, -0.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2, 5.5, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(-2, 5, -0.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(3, 6.7, 0.5)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(180, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(180, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(180, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(90, 30, 0)

                    toggle = true
                else

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 4, 5)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-2, 5, 4)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(2, 5, 2)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.6, 5, 4)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-0.6, 4.5, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0.7, 5, 4)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0.7, 4.5, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2, 5, 4)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(-2, 4.5, 3)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(3, 3.5, 4.7)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(180, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(-180, 0, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 30, 0)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "t" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 0.5, -5)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-2, -0.5, -6)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-2, -1.5, -5.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.5, -0.5, -6)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-0.5, -1.5, -5.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0.8, -0.5, -6)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0.791, -1.5, -5.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2, -0.5, -6)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(2, -1.5, -5.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(2.684, -0.704, -4.323)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(-57.51, -47.54, -138.88)

                    toggle = true
                else

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-2, -0.5, -4)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-2, -1.5, -3.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.5, -0.5, -4)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-0.5, -1.5, -3.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0.8, -0.5, -4)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0.791, -1.5, -3.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2, -0.5, -4)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(2, -1.5, -3.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(2.684, -0.704, -2.323)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(-57.51, -47.54, -138.88)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "b" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 7, 1)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(0.5, 9, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(1, 6.35, -0.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(0.5, 6.35, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(1, 9, -0.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0.5, 5, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(1, 5, -0.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(0.5, 7.7, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(1, 7.7, -0.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(-1, 10, 1)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(180, 180, 90)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 90)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 90)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 90)
                    Hats.ring2.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 90)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)

                    toggle = true
                else

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 7, 1)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(0.5, 9, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(1, 6.35, -0.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(0.5, 6.35, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(1, 9, -0.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0.5, 5, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(1, 5, -0.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(0.5, 7.7, -1)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(1, 7.7, -0.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(-1, 4, 1)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(180, 180, 90)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 90)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 90)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 90)
                    Hats.ring2.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(90, 180, 90)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "h" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(3, 5, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(0.996, 6.25, -2.165)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(0.996, 7.103, -3.894)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(2.352, 6.25, -2.165)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(2.354, 7.103, -3.894)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(3.687, 6.25, -2.165)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(3.685, 7.103, -3.894)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(4.998, 6.25, -2.165)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(5.001, 7.103, -3.894)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(0.322, 4.332, -0.369)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(-60, 0, -180)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(30, 0, -180)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(22.06, 0, 180)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(30, 0, 180)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(22.06, 0, 180)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(30, 0, 180)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(22.06, 0, 180)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(30, 0, 180)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(22.06, 0, 180)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(-2.46, 18.96, 155.99)

                    toggle = true
                else

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-0, 5.028, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-1.498, 4.53, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-1.99, 8.028, -0)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(1.981, 5.045, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(-0.011, 8.011, -0)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(-1.496, 6.533, -0)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(1.491, 8.499, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(1.49, 6.527, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(0.335, 6.536, -0)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(180, 180, 90)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(-89.76, 0, -180)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(-89.76, -0.03, -179.97)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(89.84, 180, 180)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(-89.82, 180, -180)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "j" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(-0, 4, -0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-2.078, 6.135, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-2.212, 7.623, -0)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.806, 5, -1.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-0.807, 4, -2)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0.666, 5, -1.5)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0.667, 4, -2)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2.046, 6.078, -0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(2.189, 7.566, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(3, 3.429, -0.278)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(-84.49, -90, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(-84.48, -90, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 90)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 90)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(84.48, -90, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(84.48, -90, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(13.42, -74.41, 149.27)

                    toggle = true
                else
                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, 4, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-2.003, 6.416, -0.098)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-2.003, 8.404, -0.242)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.376, 6.204, -0.423)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-0.376, 8.013, -1.255)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(0.891, 5.872, -0.56)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0.891, 7.315, -1.926)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(1.993, 4.997, -1.325)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(1.993, 4.497, -2.07)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(1.993, 3.001, -0.992)

                    Hats.palm.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(-85.87, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(-85.87, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(-65.3, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(-65.3, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(-46.55, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(-46.55, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 180)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, -180)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "u" then
                if toggle == false then

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(-0.025, -1.098, -1.443)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-0.025, -1.098, -3.377)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-0.025, -1.098, -5.304)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(-0.025, -1.098, -7.241)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(-0.025, -1.098, -9.129)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(-0.025, -1.098, -11.015)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(-0.025, -1.098, -12.95)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(-0.025, -1.098, -14.875)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(0, -1.381, -0.295)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(0, 180, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.ring2.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)

                    toggle = true
                else

                    Character:WaitForChild("HumanoidRootPart").Attachment1
                        .Position = Vector3.new(0, -15, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment2
                        .Position = Vector3.new(0.945, 8.181, -0)
                    Character:WaitForChild("HumanoidRootPart").Attachment3
                        .Position = Vector3.new(-0.41, 7.539, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment4
                        .Position = Vector3.new(-1.261, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment5
                        .Position = Vector3.new(1.261, 6, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment6
                        .Position = Vector3.new(-0.8, 4, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment7
                        .Position = Vector3.new(0.8, 4, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment8
                        .Position = Vector3.new(2.14, 3.53, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment9
                        .Position = Vector3.new(-2.14, 3.53, 0)
                    Character:WaitForChild("HumanoidRootPart").Attachment10
                        .Position = Vector3.new(-1.231, 8.362, 0)

                    Hats.palm.Handle.Attachment.Rotation =
                        Vector3.new(0, 180, 0)
                    Hats.point1.Handle.Attachment.Rotation =
                        Vector3.new(-45, 90, 0)
                    Hats.point2.Handle.Attachment.Rotation =
                        Vector3.new(45, 90, 0)
                    Hats.middle1.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.middle2.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.ring1.Handle.Attachment.Rotation =
                        Vector3.new(-15, 90, 0)
                    Hats.ring2.Handle.Attachment.Rotation =
                        Vector3.new(15, 90, 0)
                    Hats.pinki1.Handle.Attachment.Rotation =
                        Vector3.new(25, 90, 0)
                    Hats.pinki2.Handle.Attachment.Rotation =
                        Vector3.new(-25, 90, 0)
                    Hats.thumb.Handle.Attachment.Rotation =
                        Vector3.new(45, 90, 0)

                    toggle = false
                end
            end
        end)
end)

SexDoll.Name = "SexDoll"
SexDoll.Parent = Scripts
SexDoll.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
SexDoll.BorderColor3 = Color3.fromRGB(27, 42, 53)
SexDoll.BorderSizePixel = 0
SexDoll.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
SexDoll.Size = UDim2.new(0, 85, 0, 32)
SexDoll.Font = Enum.Font.SourceSansItalic
SexDoll.Text = "Sex Doll"
SexDoll.TextColor3 = Color3.fromRGB(0, 0, 0)
SexDoll.TextSize = 30.000
SexDoll.TextWrapped = true
SexDoll.MouseButton1Down:connect(function()
    for i, v in pairs(
                    game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if v:IsA("Accessory") then print(v) end
    end

    local unanchoredparts = {}
    local movers = {}
    local tog = true
    local move = false
    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character
    local mov = {};
    local mov2 = {};

    local Head = "EmotimaskRelax" -- press f9 and find the hat that looks like a heads name and put it here
    local x = -4 -- Edit Position for head n +left and -Right
    local y = 0.2 -- Edit Position for head up and down
    local z = 0 -- Edit Position for head x3

    local Hats = {
        rightarm = Character:WaitForChild("Hat1"),
        leftarm = Character:WaitForChild("Pal Hair"),
        rightleg = Character:WaitForChild("LavanderHair"),
        leftleg = Character:WaitForChild("Pink Hair"),
        torso1 = Character:WaitForChild("LongHairHeadBand Black"),
        but1 = Character:WaitForChild("InternationalFedora"),
        but2 = Character:WaitForChild("MeshPartAccessory"),
        bob1 = Character:WaitForChild("MarsPet"),
        bob2 = Character:WaitForChild("Uranus")

    }

    for i, v in next, Hats do
        v.Handle.AccessoryWeld:Remove()
        for _, mesh in next, v:GetDescendants() do
            if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                mesh:Remove()
            end
        end
    end
    local Network = coroutine.create(function()
        while true do
            game:GetService("RunService").Heartbeat:Wait()
            settings().Physics.AllowSleep = false
            sethiddenproperty(game.Players.LocalPlayer,
                              "MaximumSimulationRadius", math.huge)
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",
                              math.huge)
        end
    end)
    coroutine.resume(Network)

    function ftp(str)
        local pt = {};
        if str ~= 'me' and str ~= 'random' then
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Name:lower():find(str:lower()) then
                    table.insert(pt, v);
                end
            end
        elseif str == 'me' then
            table.insert(pt, plr);
        elseif str == 'random' then
            table.insert(pt, game.Players:GetPlayers()[math.random(1,
                                                                   #game.Players:GetPlayers())]);
        end
        return pt;
    end

    local function align(i, v)
        local att0 = Instance.new("Attachment", i)
        att0.Position = Vector3.new(0, 0, 0)
        local att1 = Instance.new("Attachment", v)
        att1.Position = Vector3.new(0, 0, 0)
        local AP = Instance.new("AlignPosition", i)
        AP.Attachment0 = att0
        AP.Attachment1 = att1
        AP.RigidityEnabled = false
        AP.ReactionForceEnabled = false
        AP.ApplyAtCenterOfMass = true
        AP.MaxForce = 9999999
        AP.MaxVelocity = math.huge
        AP.Responsiveness = 65
        local AO = Instance.new("AlignOrientation", i)
        AO.Attachment0 = att0
        AO.Attachment1 = att1
        AO.ReactionTorqueEnabled = true
        AO.PrimaryAxisOnly = false
        AO.MaxTorque = 9999999
        AO.MaxAngularVelocity = math.huge
        AO.Responsiveness = 50
    end
    align(Hats.torso1.Handle, Character["Torso"])
    align(Hats.rightarm.Handle, Character["Torso"])
    align(Hats.leftarm.Handle, Character["Torso"])
    align(Hats.rightleg.Handle, Character["Torso"])
    align(Hats.leftleg.Handle, Character["Torso"])
    align(Hats.but1.Handle, Character["Torso"])
    align(Hats.but2.Handle, Character["Torso"])
    align(Hats.bob1.Handle, Character["Torso"])
    align(Hats.bob2.Handle, Character["Torso"])
    Hats.torso1.Handle.Attachment.Rotation = Vector3.new(180, 90, 0)
    Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90, 0, 10)
    Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(90, 0, -20)
    Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90, 0, 5)
    Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90, 0, -5)
    Hats.but1.Handle.Attachment.Rotation = Vector3.new(0, 0, -5)
    Hats.but2.Handle.Attachment.Rotation = Vector3.new(0, 0, 5)
    Hats.bob1.Handle.Attachment.Rotation = Vector3.new(15, 0, 0)
    Hats.bob2.Handle.Attachment.Rotation = Vector3.new(15, 0, 0)

    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment1"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment2"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment3"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment4"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment5"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment6"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment7"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment8"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment9"

    Character:WaitForChild("Torso").Attachment1.Position =
        Vector3.new(-4, -0.1, 0)
    Character:WaitForChild("Torso").Attachment2.Position =
        Vector3.new(-5.5, 0.2, 0)
    Character:WaitForChild("Torso").Attachment3.Position =
        Vector3.new(-2.3, 0.2, 0)
    Character:WaitForChild("Torso").Attachment4.Position =
        Vector3.new(-4.6, -2, 0)
    Character:WaitForChild("Torso").Attachment5.Position =
        Vector3.new(-3.4, -2, 0)
    Character:WaitForChild("Torso").Attachment6.Position =
        Vector3.new(-4.5, -1, 0.5)
    Character:WaitForChild("Torso").Attachment7.Position =
        Vector3.new(-3.5, -1, 0.5)
    Character:WaitForChild("Torso").Attachment8.Position =
        Vector3.new(-3.4, 0.4, -0.5)
    Character:WaitForChild("Torso").Attachment9.Position =
        Vector3.new(-4.6, 0.4, -0.5)

    Character:WaitForChild(Head).Handle.AccessoryWeld:Remove()
    local alignpos = Instance.new("AlignPosition", Character)
    local alignorien = Instance.new("AlignOrientation", Character)
    local att1 = Instance.new("Attachment", Character:WaitForChild(Head).Handle)
    local att2 = Instance.new("Attachment", Character:WaitForChild("Head"))
    alignpos.Attachment0 = att1
    alignpos.Attachment1 = att2
    alignpos.RigidityEnabled = false
    alignpos.ReactionForceEnabled = false
    alignpos.ApplyAtCenterOfMass = true
    alignpos.MaxForce = 99999999
    alignpos.MaxVelocity = math.huge
    alignpos.Responsiveness = 65
    alignorien.Attachment0 = att1
    alignorien.Attachment1 = att2
    alignorien.ReactionTorqueEnabled = true
    alignorien.PrimaryAxisOnly = false
    alignorien.MaxTorque = 99999999
    alignorien.MaxAngularVelocity = math.huge
    alignorien.Responsiveness = 50
    att2.Position = Vector3.new(x, y, z)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "z" then
                if toggle == false then

                    Character.Humanoid.WalkSpeed = 16

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    Character.Humanoid.HipHeight = 0
                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(0, 4, 0)
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(1, 2, 0)
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(-1, 2, 0)
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(-1.7, 5.4, 0)
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(1.7, 5.4, 0)
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(0.55, 4.8, 0.5)
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(-0.55, 4.8, 0.5)
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(0.55, 3.7, -0.5)
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(-0.55, 3.7, -0.5)

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(180, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -20)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 20)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 120)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -120)
                    Hats.but1.Handle.Attachment.Rotation =
                        Vector3.new(-10, 0, -5)
                    Hats.but2.Handle.Attachment.Rotation =
                        Vector3.new(-10, 0, 5)
                    Hats.bob1.Handle.Attachment.Rotation =
                        Vector3.new(-20, 0, 0)
                    Hats.bob2.Handle.Attachment.Rotation =
                        Vector3.new(-20, 0, 0)

                    att2.Position = Vector3.new(0, 1.2, -0.7)
                    att2.Rotation = Vector3.new(55, 0, 180)
                    toggle = true
                else
                    Character.Humanoid.HipHeight = 0
                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(0, 2.5, 1)
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(-1.3, 3.8, 1)
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(1.3, 3.8, 1)
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(-1, 1.5, 0.5)
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(1, 1.5, 0.5)
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(-0.6, 1.6, 1.5)
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(0.6, 1.6, 1.5)
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(0.55, 3.1, 0.5)
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(-0.5, 3.1, 0.5)

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(180, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 145)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -145)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(0, -25, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(0, 25, 0)
                    Hats.but1.Handle.Attachment.Rotation = Vector3.new(0, 0, -5)
                    Hats.but2.Handle.Attachment.Rotation = Vector3.new(0, 0, 5)
                    Hats.bob1.Handle.Attachment.Rotation = Vector3.new(15, 0, 0)
                    Hats.bob2.Handle.Attachment.Rotation = Vector3.new(15, 0, 0)

                    att2.Position = Vector3.new(0, 2.8, 1)
                    att2.Rotation = Vector3.new(0, 0, 0)
                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "q" then
                if toggle == false then

                    Character.Humanoid.WalkSpeed = 16

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    Character.Humanoid.HipHeight = 0
                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(0, -0.2, -1.7)
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(-1.2, 0.7, -1)
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(1.2, 0.7, -1)
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(-0.6, -2, -1.7)
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(0.6, -2, -1.7)
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(-0.5, -1, -2.2)
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(0.5, -1, -2.2)
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(-0.6, 0.3, -1.2)
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(0.6, 0.3, -1.2)

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(180, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(30, 10, 60)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(30, -10, -60)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 5)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -5)
                    Hats.but1.Handle.Attachment.Rotation = Vector3.new(0, 0, -5)
                    Hats.but2.Handle.Attachment.Rotation = Vector3.new(0, 0, 5)
                    Hats.bob1.Handle.Attachment.Rotation =
                        Vector3.new(15, 180, 0)
                    Hats.bob2.Handle.Attachment.Rotation =
                        Vector3.new(15, 180, 0)

                    att2.Position = Vector3.new(0, 0.1, -1.7)
                    att2.Rotation = Vector3.new(0, 180, 0)
                    toggle = true
                else
                    Character.Humanoid.HipHeight = 0
                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(-4, -0.1, 0)
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(-5.5, 0.2, 0)
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(-2.3, 0.2, 0)
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(-4.6, -2, 0)
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(-3.4, -2, 0)
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(-4.5, -1, 0.5)
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(-3.5, -1, 0.5)
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(-3.4, 0.4, -0.5)
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(-4.6, 0.4, -0.5)

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(180, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 10)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -20)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 5)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, -5)
                    Hats.but1.Handle.Attachment.Rotation = Vector3.new(0, 0, -5)
                    Hats.but2.Handle.Attachment.Rotation = Vector3.new(0, 0, 5)
                    Hats.bob1.Handle.Attachment.Rotation = Vector3.new(15, 0, 0)
                    Hats.bob2.Handle.Attachment.Rotation = Vector3.new(15, 0, 0)

                    att2.Position = Vector3.new(x, y, z)
                    att2.Rotation = Vector3.new(0, 0, 0)
                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "x" then
                if toggle == false then

                    Character.Humanoid.WalkSpeed = 16

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    Character.Humanoid.HipHeight = 0
                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(0, -1.2, -2.4)
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(-1.15, -2, -3.45)
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(1.15, -2, -3.45)
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(-1.2, -2, -1)
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(1.2, -2, -1)
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(-0.54, -1, -1.4)
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(0.54, -1, -1.4)
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(-0.54, -1.9, -3.0)
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(0.54, -1.9, -3.0)

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 90)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(70, -30, 0)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(70, 30, 0)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(-60, 60, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(60, 120, 0)
                    Hats.but1.Handle.Attachment.Rotation =
                        Vector3.new(-17, 0, 0)
                    Hats.but2.Handle.Attachment.Rotation =
                        Vector3.new(-17, 0, 0)
                    Hats.bob1.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.bob2.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)

                    att2.Position = Vector3.new(0, -2.3, -4.1)
                    att2.Rotation = Vector3.new(-30, 0, 0)
                    toggle = true
                else
                    Character.Humanoid.HipHeight = 0
                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(0, -1.2, -2)
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(-1.15, -2, -3.45)
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(1.15, -2, -3.45)
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(-1.2, -2, -1)
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(1.2, -2, -1)
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(-0.54, -1, -1)
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(0.54, -1, -1)
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(-0.54, -1.9, -2.6)
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(0.54, -1.9, -2.6)

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 90)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(50, -30, 0)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(50, 30, 0)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(-60, 90, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(60, 90, 0)
                    Hats.but1.Handle.Attachment.Rotation =
                        Vector3.new(-17, 0, 0)
                    Hats.but2.Handle.Attachment.Rotation =
                        Vector3.new(-17, 0, 0)
                    Hats.bob1.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.bob2.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)

                    att2.Position = Vector3.new(0, -2.3, -3.7)
                    att2.Rotation = Vector3.new(-30, 0, 0)
                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "e" then
                if toggle == false then

                    Character.Humanoid.WalkSpeed = 16

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    Character.Humanoid.HipHeight = 0
                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(-0, 0.4, -1.5) -- torso/black hair
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(-1.163, -0.843, -1.071) -- rightarm/Hat1
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(1.163, -0.843, -1.071) -- leftarm/palhair
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(-1.122, 1.454, -0.72) -- rightleg/lavenderhair
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(1.122, 1.454, -0.72) -- leftleg/pink hair
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(-0.495, 1.479, -1.64) -- but1/fedora
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(0.495, 1.479, -1.64) -- but2/mesh
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(-0.53, -0.2, -1) -- bob1/mars
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(0.53, -0.2, -1) -- bob2/uranus

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0) -- torso/black hair
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(30, -143.49, 20.32) -- rightarm/Hat1
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(30, 143.49, -20.32) -- leftarm/palhair
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(27.81, 141.21, 159.03) -- rightleg/lavenderhair
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(27.81, -141.21, -159.03) -- leftleg/pink hair
                    Hats.but1.Handle.Attachment.Rotation =
                        Vector3.new(-15.84, -8.32, 2.29) -- but1/fedora
                    Hats.but2.Handle.Attachment.Rotation =
                        Vector3.new(-15.84, 8.32, -2.29) -- but2/mesh
                    Hats.bob1.Handle.Attachment.Rotation = Vector3.new(0, 0, 0) -- bob1/mars
                    Hats.bob2.Handle.Attachment.Rotation = Vector3.new(0, 0, 0) -- bob2/uranus

                    att2.Position = Vector3.new(-0.155, -2.76, -1)
                    att2.Rotation = Vector3.new(0, 180, 180)
                    toggle = true
                else
                    Character.Humanoid.HipHeight = 0
                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(-0, 0.4, -1.5) -- torso/black hair
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(-1.163, -0.843, -1.071) -- rightarm/Hat1
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(1.163, -0.843, -1.071) -- leftarm/palhair
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(-1.122, 1.454, -0.72) -- rightleg/lavenderhair
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(1.122, 1.454, -0.72) -- leftleg/pink hair
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(-0.495, 1.479, -1.64) -- but1/fedora
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(0.495, 1.479, -1.64) -- but2/mesh
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(-0.53, -0.2, -1) -- bob1/mars
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(0.53, -0.2, -1) -- bob2/uranus

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0) -- torso/black hair
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(30, -143.49, 20.32) -- rightarm/Hat1
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(30, 143.49, -20.32) -- leftarm/palhair
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(27.81, 141.21, 159.03) -- rightleg/lavenderhair
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(27.81, -141.21, -159.03) -- leftleg/pink hair
                    Hats.but1.Handle.Attachment.Rotation =
                        Vector3.new(-15.84, -8.32, 2.29) -- but1/fedora
                    Hats.but2.Handle.Attachment.Rotation =
                        Vector3.new(-15.84, 8.32, -2.29) -- but2/mesh
                    Hats.bob1.Handle.Attachment.Rotation = Vector3.new(0, 0, 0) -- bob1/mars
                    Hats.bob2.Handle.Attachment.Rotation = Vector3.new(0, 0, 0) -- bob2/uranus

                    att2.Position = Vector3.new(-0.155, -2.76, -1.509)
                    att2.Rotation = Vector3.new(0, 180, 180)
                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "c" then
                if toggle == false then

                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(-0, 0.209, 1.709) -- torso/black hair
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(1.45, 0.386, 1.24) -- rightarm/Hat1
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(-1.45, 0.386, 1.24) -- leftarm/palhair
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(0.636, -1.95, 1.499) -- rightleg/lavenderhair
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(-0.636, -1.95, 1.499) -- leftleg/pink hair
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(0.528, -1.214, 0.419) -- but1/fedora
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(-0.528, -1.214, 0.419) -- but2/mesh
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(-0.535, 0.253, -0.607) -- bob1/mars
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(0.496, 0.254, -0.604) -- bob2/uranus

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(90, 101.38, 90) -- torso/black hair
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(-30.06, 0, 0) -- rightarm/Hat1
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(-30.06, 0, 0) -- leftarm/palhair
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(-109.58, 0, 0) -- rightleg/lavenderhair
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(-109.58, 0, 0) -- leftleg/pink hair
                    Hats.but1.Handle.Attachment.Rotation =
                        Vector3.new(11.3, 0, 0) -- but1/fedora
                    Hats.but2.Handle.Attachment.Rotation =
                        Vector3.new(11.3, 0, 0) -- but2/mesh
                    Hats.bob1.Handle.Attachment.Rotation = Vector3.new(20, 0, 0) -- bob1/mars
                    Hats.bob2.Handle.Attachment.Rotation = Vector3.new(20, 0, 0) -- bob2/uranus

                    att2.Position = Vector3.new(0, 0.5, 1.2)
                    att2.Rotation = Vector3.new(-19.35, 0, 0)
                    toggle = true
                else
                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(-0, 0.192, 1.795) -- torso/black hair
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(1.45, 0.386, 1.24) -- rightarm/Hat1
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(-1.45, 0.386, 1.24) -- leftarm/palhair
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(0.605, -1.977, 1.7) -- rightleg/lavenderhair
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(-0.605, -1.977, 1.7) -- leftleg/pink hair
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(0.528, -1.214, 0.419) -- but1/fedora
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(-0.528, -1.214, 0.419) -- but2/mesh
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(-0.535, 0.253, -0.607) -- bob1/mars
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(0.496, 0.254, -0.604) -- bob2/uranus

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(90, 78.62, 90) -- torso/black hair
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(-30.06, 0, 0) -- rightarm/Hat1
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(-30.06, 0, 0) -- leftarm/palhair
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(-85.58, 0, 0) -- rightleg/lavenderhair
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(-85.58, 0, 0) -- leftleg/pink hair
                    Hats.but1.Handle.Attachment.Rotation =
                        Vector3.new(11.3, 0, 0) -- but1/fedora
                    Hats.but2.Handle.Attachment.Rotation =
                        Vector3.new(11.3, 0, 0) -- but2/mesh
                    Hats.bob1.Handle.Attachment.Rotation = Vector3.new(20, 0, 0) -- bob1/mars
                    Hats.bob2.Handle.Attachment.Rotation = Vector3.new(20, 0, 0) -- bob2/uranus

                    att2.Position = Vector3.new(0, 0.5, 1.885)
                    att2.Rotation = Vector3.new(-19.35, 0, 0)
                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "r" then
                if toggle == false then

                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(0, 0.496, -1.49) -- torso/black hair
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(-1.355, 1.199, -0.838) -- rightarm/Hat1
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(1.355, 1.199, -0.838) -- leftarm/palhair
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(-1.021, -0.814, -0.517) -- rightleg/lavenderhair
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(1.021, -0.814, -0.517) -- leftleg/pink hair
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(-0.551, -1.054, -1.65) -- but1/fedora
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(0.551, -1.054, -1.65) -- but2/mesh
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(-0.509, 1.1, -0.95) -- bob1/mars
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(0.509, 1.1, -0.95) -- bob2/uranus

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(90, 101.38, 90) -- torso/black hair
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(21.09, 0, 0) -- rightarm/Hat1
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(21.09, 0, 0) -- leftarm/palhair
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(13.18, 34.16, 8.79) -- rightleg/lavenderhair
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(13.18, -34.16, -8.79) -- leftleg/pink hair
                    Hats.but1.Handle.Attachment.Rotation =
                        Vector3.new(14.28, 0, 0) -- but1/fedora
                    Hats.but2.Handle.Attachment.Rotation =
                        Vector3.new(14.28, 0, 0) -- but2/mesh
                    Hats.bob1.Handle.Attachment.Rotation =
                        Vector3.new(-15, 0, 0) -- bob1/mars
                    Hats.bob2.Handle.Attachment.Rotation =
                        Vector3.new(-15, 0, 0) -- bob2/uranus

                    att2.Position = Vector3.new(0, 0.7, -1.988)
                    att2.Rotation = Vector3.new(-8.98, 180, 0)
                    toggle = true
                else
                    Character:WaitForChild("Torso").Attachment1.Position =
                        Vector3.new(0, 0.696, -1.553) -- torso/black hair
                    Character:WaitForChild("Torso").Attachment2.Position =
                        Vector3.new(-1.355, 1.199, -0.838) -- rightarm/Hat1
                    Character:WaitForChild("Torso").Attachment3.Position =
                        Vector3.new(1.355, 1.199, -0.838) -- leftarm/palhair
                    Character:WaitForChild("Torso").Attachment4.Position =
                        Vector3.new(-1.021, -0.814, -0.517) -- rightleg/lavenderhair
                    Character:WaitForChild("Torso").Attachment5.Position =
                        Vector3.new(1.021, -0.814, -0.517) -- leftleg/pink hair
                    Character:WaitForChild("Torso").Attachment6.Position =
                        Vector3.new(-0.523, -0.689, -1.743) -- but1/fedora
                    Character:WaitForChild("Torso").Attachment7.Position =
                        Vector3.new(0.523, -0.689, -1.743) -- but2/mesh
                    Character:WaitForChild("Torso").Attachment8.Position =
                        Vector3.new(-0.509, 1.315, -1.045) -- bob1/mars
                    Character:WaitForChild("Torso").Attachment9.Position =
                        Vector3.new(0.509, 1.315, -1.045) -- bob2/uranus

                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(90, 101.38, 90) -- torso/black hair
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(2.27, 0, 0) -- rightarm/Hat1
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(2.27, 0, 0) -- leftarm/palhair
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(4.87, 36.91, 8.59) -- rightleg/lavenderhair
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(4.87, -36.91, -8.59) -- leftleg/pink hair
                    Hats.but1.Handle.Attachment.Rotation =
                        Vector3.new(14.28, 0, 0) -- but1/fedora
                    Hats.but2.Handle.Attachment.Rotation =
                        Vector3.new(14.28, 0, 0) -- but2/mesh
                    Hats.bob1.Handle.Attachment.Rotation =
                        Vector3.new(-15, 0, 0) -- bob1/mars
                    Hats.bob2.Handle.Attachment.Rotation =
                        Vector3.new(-15, 0, 0) -- bob2/uranus

                    att2.Position = Vector3.new(0, 1, -1.988)
                    att2.Rotation = Vector3.new(-1.58, 180, 0)
                    toggle = false
                end
            end
        end)
end)

Naruto.Name = "Naruto"
Naruto.Parent = Scripts
Naruto.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
Naruto.BorderColor3 = Color3.fromRGB(27, 42, 53)
Naruto.BorderSizePixel = 0
Naruto.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
Naruto.Size = UDim2.new(0, 85, 0, 32)
Naruto.Font = Enum.Font.SourceSansItalic
Naruto.Text = "Naruto"
Naruto.TextColor3 = Color3.fromRGB(0, 0, 0)
Naruto.TextSize = 30.000
Naruto.TextWrapped = true
Naruto.MouseButton1Down:connect(function()
    game.Players.LocalPlayer.Character.Head.Transparency = 1
    game.Players.LocalPlayer.Character.Head.face:Remove()
    game.Players.LocalPlayer.Character.Torso.Transparency = 1
    game.Players.LocalPlayer.Character['Right Arm'].Transparency = 1
    game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
    game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
    game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1

    Local = game:GetService('Players').LocalPlayer
    Char = Local.Character
    touched, tpdback = false, false
    Local.CharacterAdded:connect(function(char)
        if script.Disabled ~= true then
            wait(.00001)
            loc = Char.HumanoidRootPart.Position
            Char:MoveTo(box.Position + Vector3.new(0, .5, 0))
        end
    end)
    box = Instance.new('Part', workspace)
    box.Anchored = true
    box.Transparency = 1
    box.CanCollide = true
    box.Size = Vector3.new(10, 1, 10)
    box.Position = Vector3.new(0, 10000, 0)
    box.Touched:connect(function(part)
        if (part.Parent.Name == Local.Name) then
            if touched == false then
                touched = true
                function apply()
                    if script.Disabled ~= true then
                        no = Char.HumanoidRootPart:Clone()
                        wait(.0001)
                        Char.HumanoidRootPart:Destroy()
                        no.Parent = Char
                        Char:MoveTo(loc)
                        touched = false
                    end
                end
                if Char then apply() end
            end
        end
    end)
    repeat wait() until Char
    loc = Char.HumanoidRootPart.Position
    Char:MoveTo(box.Position + Vector3.new(0, .5, 0))

    wait(0.5)
    local LocalPlayer = game.Players.LocalPlayer;
    local Character = LocalPlayer.Character;
    local Mouse = LocalPlayer:GetMouse()
    Character["LavanderHair"].Name = "Brick1";
    Character["Pal Hair"].Name = "Brick2"
    Character["LongHairHeadBand Black"].Name = "Brick3";
    Character["Hat1"].Name = "Brick4"
    Character["Kate Hair"].Name = "Brick5";
    Character["Meshes/LimitBreakingHairGoldAccessory"].Name = "Brick6"
    local Head = Character["Head"];
    local Torso = Character["Torso"]
    local RArm = Character["Right Arm"];
    local LArm = Character["Left Arm"]
    local RLeg = Character["Right Leg"];
    local LLeg = Character["Left Leg"]
    local Hat1 = Character["Brick1"];
    local Hat2 = Character["Brick2"]
    local Hat3 = Character["Brick3"];
    local Hat4 = Character["Brick4"]
    local Hat5 = Character["Brick5"];
    local Hat6 = Character["Brick6"]

    Hat1.Handle.Mesh:Destroy()
    Hat2.Handle.Mesh:Destroy()
    Hat3.Handle.Mesh:Destroy()
    Hat4.Handle.Mesh:Destroy()
    Hat5.Handle.Mesh:Destroy()

    -- LostDevelopers Alignment Function
    function Align(Part1, Part0, Position, Angle)
        local AlignPos = Instance.new("AlignPosition", Part1);
        AlignPos.Parent.CanCollide = false;
        AlignPos.ApplyAtCenterOfMass = true;
        AlignPos.MaxForce = 67752;
        AlignPos.MaxVelocity = math.huge / 9e110;
        AlignPos.ReactionForceEnabled = false;
        AlignPos.Responsiveness = 200;
        AlignPos.RigidityEnabled = false;
        local AlignOri = Instance.new("AlignOrientation", Part1);
        AlignOri.MaxAngularVelocity = math.huge / 9e110;
        AlignOri.MaxTorque = 67752;
        AlignOri.PrimaryAxisOnly = false;
        AlignOri.ReactionTorqueEnabled = false;
        AlignOri.Responsiveness = 200;
        AlignOri.RigidityEnabled = false;
        local AttachmentA = Instance.new("Attachment", Part1);
        local AttachmentB = Instance.new("Attachment", Part0);
        AttachmentB.Orientation = Angle
        AttachmentB.Position = Position
        AlignPos.Attachment0 = AttachmentA;
        AlignPos.Attachment1 = AttachmentB;
        AlignOri.Attachment0 = AttachmentA;
        AlignOri.Attachment1 = AttachmentB;
    end
    Character.Humanoid.HipHeight = 0
    function Weld(Part) Part.Handle.AccessoryWeld:Destroy() end
    function Mesh(Part) Part.Handle.SpecialMesh:Destroy() end
    Weld(Hat1);
    Weld(Hat2);
    Weld(Hat3)
    Weld(Hat4);
    Weld(Hat5);
    Weld(Hat6)
    --[[ Alignment and Measurements ]] --
    Align(Hat1.Handle, RLeg, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat2.Handle, LLeg, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat3.Handle, Torso, Vector3.new(0, -0.2, 0), Vector3.new(0, 90, 0))
    Align(Hat4.Handle, LArm, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat5.Handle, RArm, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat6.Handle, Head, Vector3.new(0, 0.5, 0), Vector3.new(0, 0, 0))

    wait(0.5)
    loadstring(game:HttpGet(('https://pastebin.com/raw/qShnBjCY'), true))()
end)

StrongStand.Name = "Strong Stand"
StrongStand.Parent = Scripts
StrongStand.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
StrongStand.BorderColor3 = Color3.fromRGB(27, 42, 53)
StrongStand.BorderSizePixel = 0
StrongStand.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
StrongStand.Size = UDim2.new(0, 85, 0, 32)
StrongStand.Font = Enum.Font.SourceSansItalic
StrongStand.Text = "Strong Stand"
StrongStand.TextColor3 = Color3.fromRGB(0, 0, 0)
StrongStand.TextSize = 22.000
StrongStand.TextWrapped = true
StrongStand.MouseButton1Down:connect(function()
    local m = Instance.new("Message")

    m.Parent = game.Workspace

    m.Text = "Script made by LeitungBambus#1933"

    wait(4)

    m:remove()

    wait(0)

    local unanchoredparts = {}
    local movers = {}
    local tog = true
    local move = false
    local toggle2 = true
    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character
    local mov = {};
    local mov2 = {};
    local head = Character:WaitForChild("VibeCheck")
    local Hats = {
        torso1 = Character:WaitForChild("No Speak Monkey"),
        torso2 = Character:WaitForChild("Kate Hair"),
        rightarm = Character:WaitForChild("Hat1"),
        leftarm = Character:WaitForChild("Pal Hair"),
        rightleg = Character:WaitForChild("LavanderHair"),
        leftleg = Character:WaitForChild("Pink Hair"),
        rightabs = Character:WaitForChild("InternationalFedora"),
        leftabs = Character:WaitForChild("MarsPet"),
        bottomabs = Character:WaitForChild("MeshPartAccessory")
    }
    head.Handle.AccessoryWeld:Remove()
    for i, v in next, Hats do
        v.Handle.AccessoryWeld:Remove()
        for _, mesh in next, v:GetDescendants() do
            if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                mesh:Remove()
            end
        end
    end

    function ftp(str)
        local pt = {};
        if str ~= 'me' and str ~= 'random' then
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Name:lower():find(str:lower()) then
                    table.insert(pt, v);
                end
            end
        elseif str == 'me' then
            table.insert(pt, plr);
        elseif str == 'random' then
            table.insert(pt, game.Players:GetPlayers()[math.random(1,
                                                                   #game.Players:GetPlayers())]);
        end
        return pt;
    end

    local function align(i, v)
        local att0 = Instance.new("Attachment", i)
        att0.Position = Vector3.new(0, 0, 0)
        local att1 = Instance.new("Attachment", v)
        att1.Position = Vector3.new(0, 0, 0)
        local AP = Instance.new("AlignPosition", i)
        AP.Attachment0 = att0
        AP.Attachment1 = att1
        AP.RigidityEnabled = false
        AP.ReactionForceEnabled = false
        AP.ApplyAtCenterOfMass = true
        AP.MaxForce = 9999999
        AP.MaxVelocity = math.huge
        AP.Responsiveness = 65
        local AO = Instance.new("AlignOrientation", i)
        AO.Attachment0 = att0
        AO.Attachment1 = att1
        AO.ReactionTorqueEnabled = true
        AO.PrimaryAxisOnly = false
        AO.MaxTorque = 9999999
        AO.MaxAngularVelocity = math.huge
        AO.Responsiveness = 50
    end

    align(head.Handle, Character["Torso"])
    align(Hats.torso1.Handle, Character["Torso"])
    align(Hats.torso2.Handle, Character["Torso"])
    align(Hats.rightarm.Handle, Character["Torso"])
    align(Hats.leftarm.Handle, Character["Torso"])
    align(Hats.rightleg.Handle, Character["Torso"])
    align(Hats.leftleg.Handle, Character["Torso"])
    align(Hats.rightabs.Handle, Character["Torso"])
    align(Hats.leftabs.Handle, Character["Torso"])
    align(Hats.bottomabs.Handle, Character["Torso"])

    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
    Hats.torso1.Handle.Attachment.Rotation = Vector3.new(0, 90, 0)
    Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0, 90, 0)
    Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(75, 180, -150)
    Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(-64.91, 37.86, -24.33)
    Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(120, 0, 0)
    Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(75, 360, 180)
    Hats.rightabs.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
    Hats.leftabs.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
    Hats.bottomabs.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)

    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "headattachment"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "torso1attachment"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "torso2attachment"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "rightarmattachment"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "leftarmattachment"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "rightlegattachment"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "leftlegattachment"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "rightabsattachment"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "leftabsattachment"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "bottomabsattachment"

    Character:WaitForChild("Torso").headattachment.Position =
        Vector3.new(2, 3.4, 2.9)
    Character:WaitForChild("Torso").torso1attachment.Position =
        Vector3.new(2, 2.4, 2.9)
    Character:WaitForChild("Torso").torso2attachment.Position =
        Vector3.new(2, 1.4, 2.9)
    Character:WaitForChild("Torso").rightarmattachment.Position =
        Vector3.new(3, 1.984, 2.323)
    Character:WaitForChild("Torso").leftarmattachment.Position =
        Vector3.new(0.674, 1.968, 2.645)
    Character:WaitForChild("Torso").rightlegattachment.Position =
        Vector3.new(2.5, 0.145, 3.041)
    Character:WaitForChild("Torso").leftlegattachment.Position =
        Vector3.new(1.5, 0.2, 2.5)
    Character:WaitForChild("Torso").rightabsattachment.Position =
        Vector3.new(2.5, 2.5, 2.4)
    Character:WaitForChild("Torso").leftabsattachment.Position =
        Vector3.new(1.4, 2.5, 2.4)
    Character:WaitForChild("Torso").bottomabsattachment.Position =
        Vector3.new(2, 1.4, 2.4)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "f" then
                if toggle == false then

                    Character.Humanoid.HipHeight = 0

                    wait(0.1)

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(75, 180, -150)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(-64.91, 37.86, -24.33)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(120, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(75, 360, 180)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(2, 3.4, 2.9)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(2, 2.4, 2.9)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(2, 1.4, 2.9)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(3, 1.984, 2.323)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(0.674, 1.968, 2.645)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(2.5, 0.145, 3.041)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(1.5, 0.2, 2.5)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(2.5, 2.5, 2.4)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(1.4, 2.5, 2.4)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(2, 1.4, 2.4)

                    toggle = true

                else

                    Character.Humanoid.HipHeight = 0

                    wait(0.1)

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(75, 180, -150)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(-64.91, 37.86, -24.33)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(120, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(75, 360, 180)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(2, 3.4, 2.9)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(2, 2.4, 2.9)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(2, 1.4, 2.9)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(3, 1.984, 2.323)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(0.674, 1.968, 2.645)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(2.5, 0.145, 3.041)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(1.5, 0.2, 2.5)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(2.5, 2.5, 2.4)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(1.4, 2.5, 2.4)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(2, 1.4, 2.4)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "g" then
                if toggle == false then

                    Character.Humanoid.HipHeight = 0

                    wait(0.1)

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    head.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(90, 90, 90)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(90, 90, 90)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(-28.88, 36.19, -98.5)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(28.88, 36.19, -98.5)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(2, -1.422, -5.922)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(2, -1.422, -4.922)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(2, -1.422, -3.922)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(3.5, -1.922, -4.922)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(0.5, -1.922, -4.922)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(2.693, -2.022, -2.774)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(1.307, -2.022, -2.774)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(2.5, -1.922, -5.022)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(1.4, -1.922, -5.022)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(2, -1.922, -3.922)

                    toggle = true
                else

                    Character.Humanoid.HipHeight = 0

                    wait(0.1)

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    head.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(90, 90, 90)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(90, 90, 90)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(-28.88, 17.19, -98.5)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(28.88, 17.19, -98.5)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(-90, 0, 0)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(2, -1.922, -5.922)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(2, -1.922, -4.922)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(2, -1.922, -3.922)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(3.5, -1.922, -4.922)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(0.5, -1.922, -4.922)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(2.693, -2.422, -2.774)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(1.307, -2.422, -2.774)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(2.5, -2.422, -5.022)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(1.4, -2.422, -5.022)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(2, -2.422, -3.922)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "v" then
                if toggle == false then

                    Character.Humanoid.HipHeight = 5

                    wait(0.1)

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    head.Handle.Attachment.Rotation = Vector3.new(-30, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(-1, -90, 90)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(-1, 90, -90)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(-75, -90, 180)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(75, -90, 180)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, -3.758, -0.022)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(-0, -4.672, 0.028)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(-0, -5.672, 0.028)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.327, -3.672, 0.028)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.327, -3.672, 0.028)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.693, -7.12, 0.028)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.693, -7.12, 0.028)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, -4.572, -0.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, -4.572, -0.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -5.672, -0.472)

                    toggle = true
                else

                    Character.Humanoid.HipHeight = 4

                    wait(0.1)

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    head.Handle.Attachment.Rotation = Vector3.new(30, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(-1, -90, 90)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(-1, 90, -90)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(-75, -90, 180)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(75, -90, 180)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, -2.758, -0.022)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(-0, -3.672, 0.028)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(-0, -4.672, 0.028)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.327, -4, 0.028)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.327, -4, 0.028)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.693, -6.12, 0.028)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.693, -6.12, 0.028)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, -3.572, -0.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, -3.572, -0.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -4.672, -0.472)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "e" then
                if toggle == false then

                    Character.Humanoid.HipHeight = 0

                    wait(0.1)

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(0.34, 0.5, -5.344)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-1.653, 0.5, -3.234)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(0, 1.5, -3)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(0, 0.5, -3)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(0, -0.5, -3)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(1.59, 0.5, -3.253)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(-0.446, 0.5, -5.326)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(0.5, -2, -3)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(-0.5, -2, -3)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(0.5, 0.428, -3.472)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(-0.6, 0.428, -3.472)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(-0, -0.672, -3.472)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(12.95, -149.13, -172.37)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(15, 150, 180)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(90, 0, 0)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    wait(0.09)

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(75, 180, -150)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(-64.91, 37.86, -24.33)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(120, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(75, 360, 180)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(2, 3.4, 2.9)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(2, 2.4, 2.9)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(2, 1.4, 2.9)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(3, 1.984, 2.323)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(0.674, 1.968, 2.645)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(2.5, 0.145, 3.041)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(1.5, 0.2, 2.5)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(2.5, 2.5, 2.4)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(1.4, 2.5, 2.4)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(2, 1.4, 2.4)

                else

                    Character.Humanoid.HipHeight = 0

                    wait(0.1)

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(0, 90, 0)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(75, 180, -150)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(-64.91, 37.86, -24.33)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(120, 0, 0)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(75, 360, 180)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(0, 0, 0)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(2, 3.4, 2.9)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(2, 2.4, 2.9)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(2, 1.4, 2.9)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(3, 1.984, 2.323)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(0.674, 1.968, 2.645)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(2.5, 0.145, 3.041)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(1.5, 0.2, 2.5)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(2.5, 2.5, 2.4)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(1.4, 2.5, 2.4)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(2, 1.4, 2.4)

                    toggle = false
                end
            end
        end)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "r" then
                if toggle == false then

                    Character.Humanoid.HipHeight = 0

                    wait(0.1)

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    head.Handle.Attachment.Rotation = Vector3.new(-75, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(90, -75, 90)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(90, -75, 90)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(-25.66, 146.31, -163.9)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(-25.66, -146.31, -163.9)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(28.88, 162.81, 171.5)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(28.88, -162.81, 171.5)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(90, -75, 90)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(90, -75, 90)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(90, -75, 90)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(2, -2.447, -2.112)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(2, -2.706, -3.077)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(2, -2.965, -4.043)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(3, -2.656, -2.457)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(1, -2.656, -2.457)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(2.745, -3.073, -5.297)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(1.255, -3.073, -5.297)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(2.5, -2.197, -3.11)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(1.4, -2.197, -3.11)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(2, -2.482, -4.173)

                    toggle = true
                else

                    Character.Humanoid.HipHeight = 0

                    wait(0.1)

                    Character.Humanoid.Sit = false

                    Character.Torso.Anchored = false

                    head.Handle.Attachment.Rotation = Vector3.new(-15, 0, 0)
                    Hats.torso1.Handle.Attachment.Rotation =
                        Vector3.new(90, -15, 90)
                    Hats.torso2.Handle.Attachment.Rotation =
                        Vector3.new(90, -15, 90)
                    Hats.rightarm.Handle.Attachment.Rotation =
                        Vector3.new(25.66, 146.31, 163.9)
                    Hats.leftarm.Handle.Attachment.Rotation =
                        Vector3.new(25.66, -146.31, 163.9)
                    Hats.rightleg.Handle.Attachment.Rotation =
                        Vector3.new(28.88, 162.81, 171.5)
                    Hats.leftleg.Handle.Attachment.Rotation =
                        Vector3.new(28.88, -162.81, 171.5)
                    Hats.rightabs.Handle.Attachment.Rotation =
                        Vector3.new(90, -15, 90)
                    Hats.leftabs.Handle.Attachment.Rotation =
                        Vector3.new(90, -15, 90)
                    Hats.bottomabs.Handle.Attachment.Rotation =
                        Vector3.new(90, -15, 90)

                    Character:WaitForChild("Torso").headattachment.Position =
                        Vector3.new(2, -0.455, -4.019)
                    Character:WaitForChild("Torso").torso1attachment.Position =
                        Vector3.new(2, -1.421, -4.277)
                    Character:WaitForChild("Torso").torso2attachment.Position =
                        Vector3.new(2, -2.387, -4.536)
                    Character:WaitForChild("Torso").rightarmattachment.Position =
                        Vector3.new(3, -0.859, -4.01)
                    Character:WaitForChild("Torso").leftarmattachment.Position =
                        Vector3.new(1, -0.859, -4.01)
                    Character:WaitForChild("Torso").rightlegattachment.Position =
                        Vector3.new(2.745, -3.073, -5.297)
                    Character:WaitForChild("Torso").leftlegattachment.Position =
                        Vector3.new(1.255, -3.073, -5.297)
                    Character:WaitForChild("Torso").rightabsattachment.Position =
                        Vector3.new(2.5, -1.195, -4.735)
                    Character:WaitForChild("Torso").leftabsattachment.Position =
                        Vector3.new(1.4, -1.195, -4.735)
                    Character:WaitForChild("Torso").bottomabsattachment.Position =
                        Vector3.new(2, -2.258, -5.019)

                    toggle = false
                end
            end
        end)
end)

NPC.Name = "NPC"
NPC.Parent = Scripts
NPC.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
NPC.BorderColor3 = Color3.fromRGB(27, 42, 53)
NPC.BorderSizePixel = 0
NPC.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
NPC.Size = UDim2.new(0, 85, 0, 32)
NPC.Font = Enum.Font.SourceSansItalic
NPC.Text = "NPC"
NPC.TextColor3 = Color3.fromRGB(0, 0, 0)
NPC.TextSize = 30.000
NPC.TextWrapped = true
NPC.MouseButton1Down:connect(function()
    local NPCSpawnerGUI = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local Frame_2 = Instance.new("Frame")
    local ScrollingFrame = Instance.new("ScrollingFrame")
    local Animations = Instance.new("TextButton")
    local WanderingNPC = Instance.new("TextButton")
    local ClearNPCS = Instance.new("TextButton")
    local SpawnNPC = Instance.new("TextButton")
    local FollowingNPC = Instance.new("TextButton")
    local Reset = Instance.new("TextButton")
    local ControlNPC = Instance.new("TextButton")
    local AnimationPlayer = Instance.new("TextButton")
    local SpawnEasyControlNPC = Instance.new("TextButton")
    local FollowPlayer = Instance.new("TextButton")
    local NA = Instance.new("TextButton")
    local TextButton = Instance.new("TextButton")
    local Frame2 = Instance.new("Frame")
    local TextLabel_2 = Instance.new("TextLabel")
    local Frame_3 = Instance.new("Frame")
    local TextButton_2 = Instance.new("TextButton")
    local PlayAnimation = Instance.new("TextButton")
    local TextBox = Instance.new("TextBox")
    local Frame3 = Instance.new("Frame")
    local TextLabel_3 = Instance.new("TextLabel")
    local Frame_4 = Instance.new("Frame")
    local TextButton_3 = Instance.new("TextButton")
    local Follow = Instance.new("TextButton")
    local TextBox_2 = Instance.new("TextBox")

    -- Properties:

    NPCSpawnerGUI.Name = "NPC Spawner GUI"
    NPCSpawnerGUI.Parent = game.CoreGui
    NPCSpawnerGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = NPCSpawnerGUI
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.378868729, 0, 0.0934182554, 0)
    Frame.Size = UDim2.new(0, 461, 0, 41)

    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Size = UDim2.new(0, 461, 0, 41)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = "NPC Spawner GUI  by LeitungBambus#1933"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 25.000

    Frame_2.Parent = Frame
    Frame_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_2.BorderSizePixel = 0
    Frame_2.Position = UDim2.new(-0.00074082613, 0, 0.985345125, 0)
    Frame_2.Size = UDim2.new(0, 461, 0, 348)

    ScrollingFrame.Parent = Frame_2
    ScrollingFrame.Active = true
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.Position = UDim2.new(0.0694143176, 0, 0.068965517, 0)
    ScrollingFrame.Size = UDim2.new(0, 396, 0, 299)
    ScrollingFrame.CanvasPosition = Vector2.new(0, 247)

    Animations.Name = "Animations"
    Animations.Parent = ScrollingFrame
    Animations.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    Animations.BorderSizePixel = 0
    Animations.Position = UDim2.new(0.0552113205, 0, 0.381024003, 0)
    Animations.Size = UDim2.new(0, 353, 0, 47)
    Animations.Font = Enum.Font.SourceSans
    Animations.Text = "Animations (Only use when NPC is spawned)"
    Animations.TextColor3 = Color3.fromRGB(255, 255, 255)
    Animations.TextSize = 20.000

    WanderingNPC.Name = "Wandering NPC"
    WanderingNPC.Parent = ScrollingFrame
    WanderingNPC.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    WanderingNPC.BorderSizePixel = 0
    WanderingNPC.Position = UDim2.new(0.0549036972, 0, 0.201913536, 0)
    WanderingNPC.Size = UDim2.new(0, 353, 0, 47)
    WanderingNPC.Font = Enum.Font.SourceSans
    WanderingNPC.Text = "Spawn Wandering NPC"
    WanderingNPC.TextColor3 = Color3.fromRGB(255, 255, 255)
    WanderingNPC.TextSize = 30.000

    ClearNPCS.Name = "Clear NPCS"
    ClearNPCS.Parent = ScrollingFrame
    ClearNPCS.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    ClearNPCS.BorderSizePixel = 0
    ClearNPCS.Position = UDim2.new(0.0552113205, 0, 0.469505757, 0)
    ClearNPCS.Size = UDim2.new(0, 353, 0, 47)
    ClearNPCS.Font = Enum.Font.SourceSans
    ClearNPCS.Text = "Clear NPCS"
    ClearNPCS.TextColor3 = Color3.fromRGB(255, 255, 255)
    ClearNPCS.TextSize = 30.000

    SpawnNPC.Name = "Spawn NPC"
    SpawnNPC.Parent = ScrollingFrame
    SpawnNPC.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    SpawnNPC.BorderSizePixel = 0
    SpawnNPC.Position = UDim2.new(0.0549037084, 0, 0.0230516102, 0)
    SpawnNPC.Size = UDim2.new(0, 353, 0, 47)
    SpawnNPC.Font = Enum.Font.SourceSans
    SpawnNPC.Text = "Spawn NPC"
    SpawnNPC.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpawnNPC.TextSize = 30.000

    FollowingNPC.Name = "Following NPC"
    FollowingNPC.Parent = ScrollingFrame
    FollowingNPC.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    FollowingNPC.BorderSizePixel = 0
    FollowingNPC.Position = UDim2.new(0.0549036972, 0, 0.292430639, 0)
    FollowingNPC.Size = UDim2.new(0, 353, 0, 47)
    FollowingNPC.Font = Enum.Font.SourceSans
    FollowingNPC.Text = "Spawn Following NPC"
    FollowingNPC.TextColor3 = Color3.fromRGB(255, 255, 255)
    FollowingNPC.TextSize = 30.000

    Reset.Name = "Reset"
    Reset.Parent = ScrollingFrame
    Reset.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    Reset.BorderSizePixel = 0
    Reset.Position = UDim2.new(0.0552113205, 0, 0.645385385, 0)
    Reset.Size = UDim2.new(0, 353, 0, 47)
    Reset.Font = Enum.Font.SourceSans
    Reset.Text = "Reset"
    Reset.TextColor3 = Color3.fromRGB(255, 255, 255)
    Reset.TextSize = 30.000

    ControlNPC.Name = "Control NPC"
    ControlNPC.Parent = ScrollingFrame
    ControlNPC.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    ControlNPC.BorderSizePixel = 0
    ControlNPC.Position = UDim2.new(0.0552113205, 0, 0.556304991, 0)
    ControlNPC.Size = UDim2.new(0, 353, 0, 47)
    ControlNPC.Font = Enum.Font.SourceSans
    ControlNPC.Text = "Control"
    ControlNPC.TextColor3 = Color3.fromRGB(255, 255, 255)
    ControlNPC.TextSize = 30.000

    AnimationPlayer.Name = "Animation Player"
    AnimationPlayer.Parent = ScrollingFrame
    AnimationPlayer.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    AnimationPlayer.BorderSizePixel = 0
    AnimationPlayer.Position = UDim2.new(0.0552113168, 0, 0.734465897, 0)
    AnimationPlayer.Size = UDim2.new(0, 353, 0, 47)
    AnimationPlayer.Font = Enum.Font.SourceSans
    AnimationPlayer.Text = "NPC Animation Player"
    AnimationPlayer.TextColor3 = Color3.fromRGB(255, 255, 255)
    AnimationPlayer.TextSize = 30.000

    SpawnEasyControlNPC.Name = "Spawn Easy Control NPC"
    SpawnEasyControlNPC.Parent = ScrollingFrame
    SpawnEasyControlNPC.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    SpawnEasyControlNPC.BorderSizePixel = 0
    SpawnEasyControlNPC.Position = UDim2.new(0.0549037047, 0, 0.110695295, 0)
    SpawnEasyControlNPC.Size = UDim2.new(0, 353, 0, 47)
    SpawnEasyControlNPC.Font = Enum.Font.SourceSans
    SpawnEasyControlNPC.Text = "Spawn Easy-Control NPC"
    SpawnEasyControlNPC.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpawnEasyControlNPC.TextSize = 30.000

    FollowPlayer.Name = "Follow Player"
    FollowPlayer.Parent = ScrollingFrame
    FollowPlayer.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    FollowPlayer.BorderSizePixel = 0
    FollowPlayer.Position = UDim2.new(0.0552113131, 0, 0.82210952, 0)
    FollowPlayer.Size = UDim2.new(0, 353, 0, 47)
    FollowPlayer.Font = Enum.Font.SourceSans
    FollowPlayer.Text = "Follow Player"
    FollowPlayer.TextColor3 = Color3.fromRGB(255, 255, 255)
    FollowPlayer.TextSize = 30.000

    NA.Name = "N/A"
    NA.Parent = ScrollingFrame
    NA.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    NA.BorderSizePixel = 0
    NA.Position = UDim2.new(0.0552113131, 0, 0.909753203, 0)
    NA.Size = UDim2.new(0, 353, 0, 47)
    NA.Font = Enum.Font.SourceSans
    NA.Text = "N/A"
    NA.TextColor3 = Color3.fromRGB(255, 255, 255)
    NA.TextSize = 30.000

    TextButton.Parent = Frame
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 1.000
    TextButton.BorderSizePixel = 0
    TextButton.Position = UDim2.new(0.911062896, 0, 0, 0)
    TextButton.Size = UDim2.new(0, 40, 0, 40)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = "-"
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.TextSize = 30.000

    Frame2.Name = "Frame2"
    Frame2.Parent = NPCSpawnerGUI
    Frame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame2.BorderSizePixel = 0
    Frame2.Position = UDim2.new(0.0181430206, 0, 0.142250523, 0)
    Frame2.Size = UDim2.new(0, 461, 0, 41)
    Frame2.Visible = false

    TextLabel_2.Parent = Frame2
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_2.BorderSizePixel = 0
    TextLabel_2.Size = UDim2.new(0, 461, 0, 41)
    TextLabel_2.Font = Enum.Font.SourceSans
    TextLabel_2.Text =
        "NPC Animation Player GUI by LeitungBambus#1933 player by Null."
    TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.TextSize = 17.000

    Frame_3.Parent = Frame2
    Frame_3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_3.BorderSizePixel = 0
    Frame_3.Position = UDim2.new(-0.000740829099, 0, 0.985345602, 0)
    Frame_3.Size = UDim2.new(0, 461, 0, 197)

    TextButton_2.Parent = Frame2
    TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_2.BackgroundTransparency = 1.000
    TextButton_2.BorderSizePixel = 0
    TextButton_2.Position = UDim2.new(0.911062896, 0, 0, 0)
    TextButton_2.Size = UDim2.new(0, 40, 0, 40)
    TextButton_2.Font = Enum.Font.SourceSans
    TextButton_2.Text = "X"
    TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_2.TextSize = 30.000

    PlayAnimation.Name = "Play Animation"
    PlayAnimation.Parent = Frame2
    PlayAnimation.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    PlayAnimation.BorderSizePixel = 0
    PlayAnimation.Position = UDim2.new(0.113779634, 0, 1.82887304, 0)
    PlayAnimation.Size = UDim2.new(0, 353, 0, 47)
    PlayAnimation.Font = Enum.Font.SourceSans
    PlayAnimation.Text = "Play Animation"
    PlayAnimation.TextColor3 = Color3.fromRGB(255, 255, 255)
    PlayAnimation.TextSize = 30.000

    TextBox.Parent = Frame2
    TextBox.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    TextBox.BorderSizePixel = 0
    TextBox.Position = UDim2.new(0.114967465, 0, 3.78048778, 0)
    TextBox.Size = UDim2.new(0, 353, 0, 47)
    TextBox.Font = Enum.Font.SourceSans
    TextBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    TextBox.PlaceholderText = "Animation ID"
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextSize = 20.000

    Frame3.Name = "Frame3"
    Frame3.Parent = NPCSpawnerGUI
    Frame3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame3.BorderSizePixel = 0
    Frame3.Position = UDim2.new(0.00853789784, 0, 0.435244143, 0)
    Frame3.Size = UDim2.new(0, 461, 0, 41)
    Frame3.Visible = false

    TextLabel_3.Parent = Frame3
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel_3.BorderSizePixel = 0
    TextLabel_3.Size = UDim2.new(0, 461, 0, 41)
    TextLabel_3.Font = Enum.Font.SourceSans
    TextLabel_3.Text = "NPC follow GUI by LeitungBambus#1933"
    TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.TextSize = 25.000

    Frame_4.Parent = Frame3
    Frame_4.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Frame_4.BorderSizePixel = 0
    Frame_4.Position = UDim2.new(-0.000740829099, 0, 0.985345602, 0)
    Frame_4.Size = UDim2.new(0, 461, 0, 197)

    TextButton_3.Parent = Frame3
    TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_3.BackgroundTransparency = 1.000
    TextButton_3.BorderSizePixel = 0
    TextButton_3.Position = UDim2.new(0.911062896, 0, 0, 0)
    TextButton_3.Size = UDim2.new(0, 40, 0, 40)
    TextButton_3.Font = Enum.Font.SourceSans
    TextButton_3.Text = "X"
    TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton_3.TextSize = 30.000

    Follow.Name = "Follow"
    Follow.Parent = Frame3
    Follow.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    Follow.BorderSizePixel = 0
    Follow.Position = UDim2.new(0.113779634, 0, 1.82887304, 0)
    Follow.Size = UDim2.new(0, 353, 0, 47)
    Follow.Font = Enum.Font.SourceSans
    Follow.Text = "Follow"
    Follow.TextColor3 = Color3.fromRGB(255, 255, 255)
    Follow.TextSize = 30.000

    TextBox_2.Parent = Frame3
    TextBox_2.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    TextBox_2.BorderSizePixel = 0
    TextBox_2.Position = UDim2.new(0.114967465, 0, 3.78048778, 0)
    TextBox_2.Size = UDim2.new(0, 353, 0, 47)
    TextBox_2.Font = Enum.Font.SourceSans
    TextBox_2.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    TextBox_2.PlaceholderText = "Player"
    TextBox_2.Text = ""
    TextBox_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox_2.TextSize = 20.000

    -- Scripts:

    local function VCDJA_fake_script() -- Frame.LocalScript 
        local script = Instance.new('LocalScript', Frame)

        local dragger = {};
        local resizer = {};

        do
            local mouse = game:GetService("Players").LocalPlayer:GetMouse();
            local inputService = game:GetService('UserInputService');
            local heartbeat = game:GetService("RunService").Heartbeat;
            -- // credits to Ririchi / Inori for this cute drag function :)
            function dragger.new(frame)
                local s, event = pcall(function()
                    return frame.MouseEnter
                end)

                if s then
                    frame.Active = true;

                    event:connect(function()
                        local input = frame.InputBegan:connect(
                                          function(key)
                                if key.UserInputType ==
                                    Enum.UserInputType.MouseButton1 then
                                    local objectPosition =
                                        Vector2.new(
                                            mouse.X - frame.AbsolutePosition.X,
                                            mouse.Y - frame.AbsolutePosition.Y);
                                    while heartbeat:wait() and
                                        inputService:IsMouseButtonPressed(
                                            Enum.UserInputType.MouseButton1) do
                                        frame:TweenPosition(
                                            UDim2.new(0, mouse.X -
                                                          objectPosition.X +
                                                          (frame.Size.X.Offset *
                                                              frame.AnchorPoint
                                                                  .X), 0,
                                                      mouse.Y - objectPosition.Y +
                                                          (frame.Size.Y.Offset *
                                                              frame.AnchorPoint
                                                                  .Y)), 'Out',
                                            'Quad', 0.1, true);
                                    end
                                end
                            end)

                        local leave;
                        leave = frame.MouseLeave:connect(
                                    function()
                                input:disconnect();
                                leave:disconnect();
                            end)
                    end)
                end
            end

            function resizer.new(p, s)
                p:GetPropertyChangedSignal('AbsoluteSize'):connect(
                    function()
                        s.Size = UDim2.new(s.Size.X.Scale, s.Size.X.Offset,
                                           s.Size.Y.Scale, p.AbsoluteSize.Y);
                    end)
            end
        end
        script.Parent.Active = true
        script.Parent.Draggable = true
    end
    coroutine.wrap(VCDJA_fake_script)()
    local function JCBQ_fake_script() -- Animations.LocalScript 
        local script = Instance.new('LocalScript', Animations)

        script.Parent.MouseButton1Down:Connect(
            function()
                local oof = game.Players.LocalPlayer.Character.Name
                local Energize = Instance.new("ScreenGui") -- The actual GUI
                local SideFrame = Instance.new("Frame") -- Visible when GUI is closed
                local OpenGUI = Instance.new("TextButton") -- Part of SideFrame
                local SideFrameTitle = Instance.new("TextLabel") -- Part of SideFrame
                local MainFrame = Instance.new("Frame") -- All of the stuff on the main frame
                local GuiBottomFrame = Instance.new("Frame") -- Part of Active Frame
                local Credits = Instance.new("TextLabel") -- Credits to illremember, hello there
                local ScrollingFrame = Instance.new("ScrollingFrame") -- The scrolling frame of animations
                local CheckR = Instance.new("TextLabel") -- Check if R15 or R6
                local ScrollingFrameR15 = Instance.new("ScrollingFrame") -- The scrolling frame of R15 animations

                local CrazySlash = Instance.new("TextButton") -- COMPLETE
                local Open = Instance.new("TextButton") -- COMPLETE
                local R15Spinner = Instance.new("TextButton") -- COMPLETE
                local ArmsOut = Instance.new("TextButton") -- COMPLETE
                local FloatSlash = Instance.new("TextButton") -- COMPLETE
                local WeirdZombie = Instance.new("TextButton") -- COMPLETE
                local DownSlash = Instance.new("TextButton") -- COMPLETE
                local Pull = Instance.new("TextButton") -- COMPLETE
                local CircleArm = Instance.new("TextButton") -- COMPLETE
                local Bend = Instance.new("TextButton") -- COMPLETE
                local RotateSlash = Instance.new("TextButton") -- COMPLETE
                local FlingArms = Instance.new("TextButton") -- COMPLETE

                local FullSwing = Instance.new("TextButton") -- COMPLETE
                local GlitchLevitate = Instance.new("TextButton") -- COMPLETE
                local MoonDance = Instance.new("TextButton") -- COMPLETE
                local FullPunch = Instance.new("TextButton") -- COMPLETE
                local Crouch = Instance.new("TextButton") -- COMPLETE
                local SpinDance = Instance.new("TextButton") -- COMPLETE
                local FloorFaint = Instance.new("TextButton") -- COMPLETE
                local JumpingJacks = Instance.new("TextButton") -- COMPLETE
                local Spinner = Instance.new("TextButton") -- COMPLETE
                local MegaInsane = Instance.new("TextButton") -- COMPLETE
                local ArmDetach = Instance.new("TextButton") -- COMPLETE
                local WeirdMove = Instance.new("TextButton") -- COMPLETE
                local Faint = Instance.new("TextButton") -- COMPLETE
                local CloneIllusion = Instance.new("TextButton") -- COMPLETE
                local Levitate = Instance.new("TextButton") -- COMPLETE
                local DinoWalk = Instance.new("TextButton") -- COMPLETE
                local FloorCrawl = Instance.new("TextButton") -- COMPLETE
                local SwordSlam = Instance.new("TextButton") -- COMPLETE
                local LoopHead = Instance.new("TextButton") -- COMPLETE
                local HeroJump = Instance.new("TextButton") -- COMPLETE
                local Insane = Instance.new("TextButton") -- COMPLETE
                local FloatingHead = Instance.new("TextButton") -- COMPLETE
                local HeadThrow = Instance.new("TextButton") -- COMPLETE
                local MovingDance = Instance.new("TextButton") -- COMPLETE
                local SuperPunch = Instance.new("TextButton") -- COMPLETE
                local ArmTurbine = Instance.new("TextButton") -- COMPLETE
                local Dab = Instance.new("TextButton") -- COMPLETE
                local FloatSit = Instance.new("TextButton") -- COMPLETE
                local SuperFaint = Instance.new("TextButton") -- COMPLETE
                local BarrelRoll = Instance.new("TextButton") -- COMPLETE
                local Scared = Instance.new("TextButton") -- COMPLETE
                local InsaneArms = Instance.new("TextButton") -- COMPLETE
                local SwordSlice = Instance.new("TextButton") -- COMPLETE
                local SpinDance2 = Instance.new("TextButton") -- COMPLETE
                local BowDown = Instance.new("TextButton") -- COMPLETE
                local LoopSlam = Instance.new("TextButton") -- COMPLETE

                local GuiTopFrame = Instance.new("Frame") -- Top of the main frame
                local CloseGUI = Instance.new("TextButton") -- To close the GUI
                local Title = Instance.new("TextLabel") -- Actual title of GUI, Energize

                -- Properties

                Energize.Name = "Energize"
                Energize.Parent = game.Players.LocalPlayer.PlayerGui

                SideFrame.Name = "SideFrame"
                SideFrame.Parent = Energize
                SideFrame.Active = true
                SideFrame.BackgroundColor3 = Color3.new(1, 0.329412, 0.329412)
                SideFrame.Draggable = true
                SideFrame.Position = UDim2.new(0, 376, 0, 125)
                SideFrame.Size = UDim2.new(0, 460, 0, 32)
                SideFrame.Visible = false

                OpenGUI.Name = "OpenGUI"
                OpenGUI.Parent = SideFrame
                OpenGUI.BackgroundColor3 = Color3.new(1, 1, 1)
                OpenGUI.BackgroundTransparency = 1
                OpenGUI.Position = UDim2.new(0, 426, 0, 0)
                OpenGUI.Size = UDim2.new(0, 34, 0, 32)
                OpenGUI.Font = Enum.Font.SourceSans
                OpenGUI.FontSize = Enum.FontSize.Size48
                OpenGUI.Text = "X"
                OpenGUI.TextColor3 = Color3.new(0.333333, 0, 0)
                OpenGUI.TextSize = 40
                OpenGUI.TextWrapped = true

                SideFrameTitle.Name = "SideFrameTitle"
                SideFrameTitle.Parent = SideFrame
                SideFrameTitle.BackgroundColor3 = Color3.new(1, 1, 1)
                SideFrameTitle.BackgroundTransparency = 1
                SideFrameTitle.Position = UDim2.new(0, 170, 0, 0)
                SideFrameTitle.Size = UDim2.new(0, 119, 0, 31)
                SideFrameTitle.Font = Enum.Font.Arial
                SideFrameTitle.FontSize = Enum.FontSize.Size24
                SideFrameTitle.Text = "-Energize-"
                SideFrameTitle.TextSize = 21
                SideFrameTitle.TextStrokeColor3 =
                    Color3.new(0.27451, 0.92549, 0.905882)
                SideFrameTitle.TextStrokeTransparency = 0.69999998807907

                MainFrame.Name = "MainFrame"
                MainFrame.Parent = Energize
                MainFrame.Active = true
                MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
                MainFrame.BackgroundTransparency = 1
                MainFrame.Draggable = true
                MainFrame.Position = UDim2.new(0, 376, 0, 125)
                MainFrame.Size = UDim2.new(0, 444, 0, 280)

                GuiBottomFrame.Name = "Gui BottomFrame"
                GuiBottomFrame.Parent = MainFrame
                GuiBottomFrame.BackgroundColor3 =
                    Color3.new(1, 0.329412, 0.329412)
                GuiBottomFrame.BorderColor3 =
                    Color3.new(0.243137, 0.243137, 0.243137)
                GuiBottomFrame.Position = UDim2.new(0, 0, 0, 247)
                GuiBottomFrame.Size = UDim2.new(0, 460, 0, 32)

                Credits.Name = "Credits"
                Credits.Parent = GuiBottomFrame
                Credits.BackgroundColor3 = Color3.new(1, 1, 1)
                Credits.BackgroundTransparency = 1
                Credits.Size = UDim2.new(0, 460, 0, 32)
                Credits.FontSize = Enum.FontSize.Size14
                Credits.Text = "By illremember -FE Animations Gui"
                Credits.TextColor3 = Color3.new(0.219608, 0.219608, 0.219608)
                Credits.TextSize = 14
                Credits.TextStrokeColor3 =
                    Color3.new(0.141176, 0.870588, 0.713726)
                Credits.TextStrokeTransparency = 0.69999998807907
                Credits.TextWrapped = true

                ScrollingFrame.Parent = MainFrame
                ScrollingFrame.BackgroundColor3 =
                    Color3.new(1, 0.564706, 0.564706)
                ScrollingFrame.Position = UDim2.new(0, 0, 0, 32)
                ScrollingFrame.Size = UDim2.new(0, 460, 0, 215)
                ScrollingFrame.ScrollBarThickness = 13

                FullSwing.Name = "FullSwing"
                FullSwing.Parent = ScrollingFrame
                FullSwing.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                FullSwing.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                FullSwing.Position = UDim2.new(0, 17, 0, 322)
                FullSwing.Size = UDim2.new(0, 119, 0, 34)
                FullSwing.Font = Enum.Font.Highway
                FullSwing.FontSize = Enum.FontSize.Size24
                FullSwing.Text = "Full Swing"
                FullSwing.TextSize = 20
                FullSwing.TextWrapped = true

                GlitchLevitate.Name = "GlitchLevitate"
                GlitchLevitate.Parent = ScrollingFrame
                GlitchLevitate.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                GlitchLevitate.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                GlitchLevitate.Position = UDim2.new(0, 319, 0, 322)
                GlitchLevitate.Size = UDim2.new(0, 119, 0, 34)
                GlitchLevitate.Font = Enum.Font.Highway
                GlitchLevitate.FontSize = Enum.FontSize.Size24
                GlitchLevitate.Text = "Glitch Levitate"
                GlitchLevitate.TextSize = 20
                GlitchLevitate.TextWrapped = true

                MoonDance.Name = "MoonDance"
                MoonDance.Parent = ScrollingFrame
                MoonDance.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                MoonDance.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                MoonDance.Position = UDim2.new(0, 319, 0, 280)
                MoonDance.Size = UDim2.new(0, 119, 0, 34)
                MoonDance.Font = Enum.Font.Highway
                MoonDance.FontSize = Enum.FontSize.Size24
                MoonDance.Text = "Moon Dance"
                MoonDance.TextSize = 20
                MoonDance.TextWrapped = true

                FullPunch.Name = "FullPunch"
                FullPunch.Parent = ScrollingFrame
                FullPunch.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                FullPunch.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                FullPunch.Position = UDim2.new(0, 17, 0, 280)
                FullPunch.Size = UDim2.new(0, 119, 0, 34)
                FullPunch.Font = Enum.Font.Highway
                FullPunch.FontSize = Enum.FontSize.Size24
                FullPunch.Text = "Full Punch"
                FullPunch.TextSize = 20
                FullPunch.TextWrapped = true

                Crouch.Name = "Crouch"
                Crouch.Parent = ScrollingFrame
                Crouch.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                Crouch.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                Crouch.Position = UDim2.new(0, 168, 0, 280)
                Crouch.Size = UDim2.new(0, 119, 0, 34)
                Crouch.Font = Enum.Font.Highway
                Crouch.FontSize = Enum.FontSize.Size24
                Crouch.Text = "Crouch"
                Crouch.TextSize = 20
                Crouch.TextWrapped = true

                SpinDance.Name = "SpinDance"
                SpinDance.Parent = ScrollingFrame
                SpinDance.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                SpinDance.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                SpinDance.Position = UDim2.new(0, 168, 0, 236)
                SpinDance.Size = UDim2.new(0, 119, 0, 34)
                SpinDance.Font = Enum.Font.Highway
                SpinDance.FontSize = Enum.FontSize.Size24
                SpinDance.Text = "Spin Dance"
                SpinDance.TextSize = 20
                SpinDance.TextWrapped = true

                FloorFaint.Name = "FloorFaint"
                FloorFaint.Parent = ScrollingFrame
                FloorFaint.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                FloorFaint.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                FloorFaint.Position = UDim2.new(0, 17, 0, 236)
                FloorFaint.Size = UDim2.new(0, 119, 0, 34)
                FloorFaint.Font = Enum.Font.Highway
                FloorFaint.FontSize = Enum.FontSize.Size24
                FloorFaint.Text = "Floor Faint"
                FloorFaint.TextSize = 20
                FloorFaint.TextWrapped = true

                JumpingJacks.Name = "JumpingJacks"
                JumpingJacks.Parent = ScrollingFrame
                JumpingJacks.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                JumpingJacks.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                JumpingJacks.Position = UDim2.new(0, 319, 0, 236)
                JumpingJacks.Size = UDim2.new(0, 119, 0, 34)
                JumpingJacks.Font = Enum.Font.Highway
                JumpingJacks.FontSize = Enum.FontSize.Size24
                JumpingJacks.Text = "Jumping Jacks"
                JumpingJacks.TextSize = 20
                JumpingJacks.TextWrapped = true

                Spinner.Name = "Spinner"
                Spinner.Parent = ScrollingFrame
                Spinner.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                Spinner.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                Spinner.Position = UDim2.new(0, 17, 0, 192)
                Spinner.Size = UDim2.new(0, 119, 0, 34)
                Spinner.Font = Enum.Font.Highway
                Spinner.FontSize = Enum.FontSize.Size24
                Spinner.Text = "Spinner"
                Spinner.TextSize = 20
                Spinner.TextWrapped = true

                MegaInsane.Name = "MegaInsane"
                MegaInsane.Parent = ScrollingFrame
                MegaInsane.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                MegaInsane.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                MegaInsane.Position = UDim2.new(0, 168, 0, 192)
                MegaInsane.Size = UDim2.new(0, 119, 0, 34)
                MegaInsane.Font = Enum.Font.Highway
                MegaInsane.FontSize = Enum.FontSize.Size24
                MegaInsane.Text = "Mega Insane"
                MegaInsane.TextSize = 20
                MegaInsane.TextWrapped = true

                ArmDetach.Name = "ArmDetach"
                ArmDetach.Parent = ScrollingFrame
                ArmDetach.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                ArmDetach.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                ArmDetach.Position = UDim2.new(0, 319, 0, 192)
                ArmDetach.Size = UDim2.new(0, 119, 0, 34)
                ArmDetach.Font = Enum.Font.Highway
                ArmDetach.FontSize = Enum.FontSize.Size24
                ArmDetach.Text = "Arm Detach"
                ArmDetach.TextSize = 20
                ArmDetach.TextWrapped = true

                WeirdMove.Name = "WeirdMove"
                WeirdMove.Parent = ScrollingFrame
                WeirdMove.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                WeirdMove.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                WeirdMove.Position = UDim2.new(0, 168, 0, 148)
                WeirdMove.Size = UDim2.new(0, 119, 0, 34)
                WeirdMove.Font = Enum.Font.Highway
                WeirdMove.FontSize = Enum.FontSize.Size24
                WeirdMove.Text = "Weird Move"
                WeirdMove.TextSize = 20
                WeirdMove.TextWrapped = true

                Faint.Name = "Faint"
                Faint.Parent = ScrollingFrame
                Faint.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                Faint.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                Faint.Position = UDim2.new(0, 17, 0, 148)
                Faint.Size = UDim2.new(0, 119, 0, 34)
                Faint.Font = Enum.Font.Highway
                Faint.FontSize = Enum.FontSize.Size24
                Faint.Text = "Faint"
                Faint.TextSize = 20
                Faint.TextWrapped = true

                CloneIllusion.Name = "CloneIllusion"
                CloneIllusion.Parent = ScrollingFrame
                CloneIllusion.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                CloneIllusion.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                CloneIllusion.Position = UDim2.new(0, 319, 0, 148)
                CloneIllusion.Size = UDim2.new(0, 119, 0, 34)
                CloneIllusion.Font = Enum.Font.Highway
                CloneIllusion.FontSize = Enum.FontSize.Size24
                CloneIllusion.Text = "Clone Illusion"
                CloneIllusion.TextSize = 20
                CloneIllusion.TextWrapped = true

                Levitate.Name = "Levitate"
                Levitate.Parent = ScrollingFrame
                Levitate.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                Levitate.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                Levitate.Position = UDim2.new(0, 17, 0, 104)
                Levitate.Size = UDim2.new(0, 119, 0, 34)
                Levitate.Font = Enum.Font.Highway
                Levitate.FontSize = Enum.FontSize.Size24
                Levitate.Text = "Levitate"
                Levitate.TextSize = 20
                Levitate.TextWrapped = true

                DinoWalk.Name = "DinoWalk"
                DinoWalk.Parent = ScrollingFrame
                DinoWalk.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                DinoWalk.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                DinoWalk.Position = UDim2.new(0, 168, 0, 104)
                DinoWalk.Size = UDim2.new(0, 119, 0, 34)
                DinoWalk.Font = Enum.Font.Highway
                DinoWalk.FontSize = Enum.FontSize.Size24
                DinoWalk.Text = "Dino Walk"
                DinoWalk.TextSize = 20
                DinoWalk.TextWrapped = true

                FloorCrawl.Name = "FloorCrawl"
                FloorCrawl.Parent = ScrollingFrame
                FloorCrawl.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                FloorCrawl.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                FloorCrawl.Position = UDim2.new(0, 319, 0, 104)
                FloorCrawl.Size = UDim2.new(0, 119, 0, 34)
                FloorCrawl.Font = Enum.Font.Highway
                FloorCrawl.FontSize = Enum.FontSize.Size24
                FloorCrawl.Text = "Floor Crawl"
                FloorCrawl.TextSize = 20
                FloorCrawl.TextWrapped = true

                SwordSlam.Name = "SwordSlam"
                SwordSlam.Parent = ScrollingFrame
                SwordSlam.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                SwordSlam.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                SwordSlam.Position = UDim2.new(0, 319, 0, 60)
                SwordSlam.Size = UDim2.new(0, 119, 0, 34)
                SwordSlam.Font = Enum.Font.Highway
                SwordSlam.FontSize = Enum.FontSize.Size24
                SwordSlam.Text = "Sword Slam"
                SwordSlam.TextSize = 20
                SwordSlam.TextWrapped = true

                LoopHead.Name = "LoopHead"
                LoopHead.Parent = ScrollingFrame
                LoopHead.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                LoopHead.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                LoopHead.Position = UDim2.new(0, 168, 0, 60)
                LoopHead.Size = UDim2.new(0, 119, 0, 34)
                LoopHead.Font = Enum.Font.Highway
                LoopHead.FontSize = Enum.FontSize.Size24
                LoopHead.Text = "Loop Head"
                LoopHead.TextSize = 20
                LoopHead.TextWrapped = true

                HeroJump.Name = "HeroJump"
                HeroJump.Parent = ScrollingFrame
                HeroJump.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                HeroJump.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                HeroJump.Position = UDim2.new(0, 17, 0, 60)
                HeroJump.Size = UDim2.new(0, 119, 0, 34)
                HeroJump.Font = Enum.Font.Highway
                HeroJump.FontSize = Enum.FontSize.Size24
                HeroJump.Text = "Hero Jump"
                HeroJump.TextSize = 20
                HeroJump.TextWrapped = true

                Insane.Name = "Insane"
                Insane.Parent = ScrollingFrame
                Insane.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                Insane.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                Insane.Position = UDim2.new(0, 319, 0, 16)
                Insane.Size = UDim2.new(0, 119, 0, 34)
                Insane.Font = Enum.Font.Highway
                Insane.FontSize = Enum.FontSize.Size24
                Insane.Text = "Insane"
                Insane.TextSize = 20
                Insane.TextWrapped = true

                FloatingHead.Name = "FloatingHead"
                FloatingHead.Parent = ScrollingFrame
                FloatingHead.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                FloatingHead.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                FloatingHead.Position = UDim2.new(0, 168, 0, 16)
                FloatingHead.Size = UDim2.new(0, 119, 0, 34)
                FloatingHead.Font = Enum.Font.Highway
                FloatingHead.FontSize = Enum.FontSize.Size24
                FloatingHead.Text = "Floating Head"
                FloatingHead.TextSize = 20
                FloatingHead.TextWrapped = true

                HeadThrow.Name = "HeadThrow"
                HeadThrow.Parent = ScrollingFrame
                HeadThrow.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                HeadThrow.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                HeadThrow.Position = UDim2.new(0, 17, 0, 16)
                HeadThrow.Size = UDim2.new(0, 119, 0, 34)
                HeadThrow.Font = Enum.Font.Highway
                HeadThrow.FontSize = Enum.FontSize.Size24
                HeadThrow.Text = "Head Throw"
                HeadThrow.TextSize = 20
                HeadThrow.TextWrapped = true

                MovingDance.Name = "MovingDance"
                MovingDance.Parent = ScrollingFrame
                MovingDance.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                MovingDance.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                MovingDance.Position = UDim2.new(0, 168, 0, 324)
                MovingDance.Size = UDim2.new(0, 119, 0, 34)
                MovingDance.Font = Enum.Font.Highway
                MovingDance.FontSize = Enum.FontSize.Size24
                MovingDance.Text = "Moving Dance"
                MovingDance.TextSize = 20
                MovingDance.TextWrapped = true

                SuperPunch.Name = "SuperPunch"
                SuperPunch.Parent = ScrollingFrame
                SuperPunch.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                SuperPunch.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                SuperPunch.Position = UDim2.new(0, 168, 0, 366)
                SuperPunch.Size = UDim2.new(0, 119, 0, 34)
                SuperPunch.Font = Enum.Font.Highway
                SuperPunch.FontSize = Enum.FontSize.Size24
                SuperPunch.Text = "Super Punch"
                SuperPunch.TextSize = 20
                SuperPunch.TextWrapped = true

                ArmTurbine.Name = "ArmTurbine"
                ArmTurbine.Parent = ScrollingFrame
                ArmTurbine.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                ArmTurbine.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                ArmTurbine.Position = UDim2.new(0, 319, 0, 366)
                ArmTurbine.Size = UDim2.new(0, 119, 0, 34)
                ArmTurbine.Font = Enum.Font.Highway
                ArmTurbine.FontSize = Enum.FontSize.Size24
                ArmTurbine.Text = "Arm Turbine"
                ArmTurbine.TextSize = 20
                ArmTurbine.TextWrapped = true

                Dab.Name = "Dab"
                Dab.Parent = ScrollingFrame
                Dab.BackgroundColor3 = Color3.new(0.886275, 0.776471, 0.368627)
                Dab.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                Dab.Position = UDim2.new(0, 17, 0, 366)
                Dab.Size = UDim2.new(0, 119, 0, 34)
                Dab.Font = Enum.Font.Highway
                Dab.FontSize = Enum.FontSize.Size24
                Dab.Text = "Dab"
                Dab.TextSize = 20
                Dab.TextWrapped = true

                FloatSit.Name = "FloatSit"
                FloatSit.Parent = ScrollingFrame
                FloatSit.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                FloatSit.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                FloatSit.Position = UDim2.new(0, 168, 0, 410)
                FloatSit.Size = UDim2.new(0, 119, 0, 34)
                FloatSit.Font = Enum.Font.Highway
                FloatSit.FontSize = Enum.FontSize.Size24
                FloatSit.Text = "Float Sit"
                FloatSit.TextSize = 20
                FloatSit.TextWrapped = true

                SuperFaint.Name = "SuperFaint"
                SuperFaint.Parent = ScrollingFrame
                SuperFaint.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                SuperFaint.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                SuperFaint.Position = UDim2.new(0, 17, 0, 498)
                SuperFaint.Size = UDim2.new(0, 119, 0, 34)
                SuperFaint.Font = Enum.Font.Highway
                SuperFaint.FontSize = Enum.FontSize.Size24
                SuperFaint.Text = "Super Faint"
                SuperFaint.TextSize = 20
                SuperFaint.TextWrapped = true

                BarrelRoll.Name = "BarrelRoll"
                BarrelRoll.Parent = ScrollingFrame
                BarrelRoll.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                BarrelRoll.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                BarrelRoll.Position = UDim2.new(0, 319, 0, 410)
                BarrelRoll.Size = UDim2.new(0, 119, 0, 34)
                BarrelRoll.Font = Enum.Font.Highway
                BarrelRoll.FontSize = Enum.FontSize.Size24
                BarrelRoll.Text = "Barrel Roll"
                BarrelRoll.TextSize = 20
                BarrelRoll.TextWrapped = true

                Scared.Name = "Scared"
                Scared.Parent = ScrollingFrame
                Scared.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                Scared.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                Scared.Position = UDim2.new(0, 319, 0, 454)
                Scared.Size = UDim2.new(0, 119, 0, 34)
                Scared.Font = Enum.Font.Highway
                Scared.FontSize = Enum.FontSize.Size24
                Scared.Text = "Scared"
                Scared.TextSize = 20
                Scared.TextWrapped = true

                InsaneArms.Name = "InsaneArms"
                InsaneArms.Parent = ScrollingFrame
                InsaneArms.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                InsaneArms.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                InsaneArms.Position = UDim2.new(0, 17, 0, 454)
                InsaneArms.Size = UDim2.new(0, 119, 0, 34)
                InsaneArms.Font = Enum.Font.Highway
                InsaneArms.FontSize = Enum.FontSize.Size24
                InsaneArms.Text = "Insane Arms"
                InsaneArms.TextSize = 20
                InsaneArms.TextWrapped = true

                SwordSlice.Name = "SwordSlice"
                SwordSlice.Parent = ScrollingFrame
                SwordSlice.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                SwordSlice.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                SwordSlice.Position = UDim2.new(0, 168, 0, 454)
                SwordSlice.Size = UDim2.new(0, 119, 0, 34)
                SwordSlice.Font = Enum.Font.Highway
                SwordSlice.FontSize = Enum.FontSize.Size24
                SwordSlice.Text = "Sword Slice"
                SwordSlice.TextSize = 20
                SwordSlice.TextWrapped = true

                SpinDance2.Name = "SpinDance2"
                SpinDance2.Parent = ScrollingFrame
                SpinDance2.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                SpinDance2.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                SpinDance2.Position = UDim2.new(0, 168, 0, 498)
                SpinDance2.Size = UDim2.new(0, 119, 0, 34)
                SpinDance2.Font = Enum.Font.Highway
                SpinDance2.FontSize = Enum.FontSize.Size24
                SpinDance2.Text = "Spin Dance 2"
                SpinDance2.TextSize = 20
                SpinDance2.TextWrapped = true

                BowDown.Name = "BowDown"
                BowDown.Parent = ScrollingFrame
                BowDown.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                BowDown.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                BowDown.Position = UDim2.new(0, 319, 0, 498)
                BowDown.Size = UDim2.new(0, 119, 0, 34)
                BowDown.Font = Enum.Font.Highway
                BowDown.FontSize = Enum.FontSize.Size24
                BowDown.Text = "Bow Down"
                BowDown.TextSize = 20
                BowDown.TextWrapped = true

                LoopSlam.Name = "LoopSlam"
                LoopSlam.Parent = ScrollingFrame
                LoopSlam.BackgroundColor3 =
                    Color3.new(0.886275, 0.776471, 0.368627)
                LoopSlam.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                LoopSlam.Position = UDim2.new(0, 17, 0, 410)
                LoopSlam.Size = UDim2.new(0, 119, 0, 34)
                LoopSlam.Font = Enum.Font.Highway
                LoopSlam.FontSize = Enum.FontSize.Size24
                LoopSlam.Text = "Loop Slam"
                LoopSlam.TextSize = 20
                LoopSlam.TextWrapped = true

                GuiTopFrame.Name = "Gui TopFrame"
                GuiTopFrame.Parent = MainFrame
                GuiTopFrame.BackgroundColor3 = Color3.new(1, 0.329412, 0.329412)
                GuiTopFrame.BorderColor3 =
                    Color3.new(0.243137, 0.243137, 0.243137)
                GuiTopFrame.Size = UDim2.new(0, 460, 0, 32)

                CloseGUI.Name = "CloseGUI"
                CloseGUI.Parent = GuiTopFrame
                CloseGUI.BackgroundColor3 = Color3.new(1, 1, 1)
                CloseGUI.BackgroundTransparency = 1
                CloseGUI.Position = UDim2.new(0, 426, 0, 0)
                CloseGUI.Size = UDim2.new(0, 34, 0, 32)
                CloseGUI.Font = Enum.Font.SourceSans
                CloseGUI.FontSize = Enum.FontSize.Size48
                CloseGUI.Text = "X"
                CloseGUI.TextColor3 = Color3.new(0.333333, 0, 0)
                CloseGUI.TextSize = 40
                CloseGUI.TextWrapped = true

                Title.Name = "Title"
                Title.Parent = GuiTopFrame
                Title.BackgroundColor3 = Color3.new(1, 1, 1)
                Title.BackgroundTransparency = 1
                Title.Size = UDim2.new(0, 460, 0, 32)
                Title.FontSize = Enum.FontSize.Size14
                Title.Text = "-Energize-"
                Title.TextColor3 = Color3.new(0.164706, 0.164706, 0.164706)
                Title.TextSize = 14
                Title.TextStrokeColor3 = Color3.new(0.384314, 0.917647, 1)
                Title.TextStrokeTransparency = 0.69999998807907
                Title.TextWrapped = true

                CheckR.Name = "CheckR"
                CheckR.Parent = GuiTopFrame
                CheckR.BackgroundColor3 = Color3.new(1, 1, 1)
                CheckR.BackgroundTransparency = 1
                CheckR.Size = UDim2.new(0, 171, 0, 32)
                CheckR.Font = Enum.Font.SourceSansBold
                CheckR.FontSize = Enum.FontSize.Size14
                CheckR.Text = "Text"
                CheckR.TextScaled = true
                CheckR.TextSize = 14
                CheckR.TextWrapped = true

                ScrollingFrameR15.Name = "ScrollingFrameR15"
                ScrollingFrameR15.Parent = MainFrame
                ScrollingFrameR15.BackgroundColor3 =
                    Color3.new(1, 0.564706, 0.564706)
                ScrollingFrameR15.Position = UDim2.new(0, 0, 0, 32)
                ScrollingFrameR15.Size = UDim2.new(0, 460, 0, 215)
                ScrollingFrameR15.Visible = false
                ScrollingFrameR15.ScrollBarThickness = 13

                CrazySlash.Name = "CrazySlash"
                CrazySlash.Parent = ScrollingFrameR15
                CrazySlash.BackgroundColor3 =
                    Color3.new(0.682353, 0.701961, 0.792157)
                CrazySlash.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                CrazySlash.Position = UDim2.new(0, 17, 0, 16)
                CrazySlash.Size = UDim2.new(0, 119, 0, 34)
                CrazySlash.Font = Enum.Font.Highway
                CrazySlash.FontSize = Enum.FontSize.Size24
                CrazySlash.Text = "CrazySlash"
                CrazySlash.TextSize = 20
                CrazySlash.TextWrapped = true

                Open.Name = "Open"
                Open.Parent = ScrollingFrameR15
                Open.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
                Open.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                Open.Position = UDim2.new(0, 168, 0, 16)
                Open.Size = UDim2.new(0, 119, 0, 34)
                Open.Font = Enum.Font.Highway
                Open.FontSize = Enum.FontSize.Size24
                Open.Text = "Open"
                Open.TextSize = 20
                Open.TextWrapped = true

                R15Spinner.Name = "R15Spinner"
                R15Spinner.Parent = ScrollingFrameR15
                R15Spinner.BackgroundColor3 =
                    Color3.new(0.682353, 0.701961, 0.792157)
                R15Spinner.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                R15Spinner.Position = UDim2.new(0, 17, 0, 60)
                R15Spinner.Size = UDim2.new(0, 119, 0, 34)
                R15Spinner.Font = Enum.Font.Highway
                R15Spinner.FontSize = Enum.FontSize.Size24
                R15Spinner.Text = "Spinner"
                R15Spinner.TextSize = 20
                R15Spinner.TextWrapped = true

                ArmsOut.Name = "ArmsOut"
                ArmsOut.Parent = ScrollingFrameR15
                ArmsOut.BackgroundColor3 =
                    Color3.new(0.682353, 0.701961, 0.792157)
                ArmsOut.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                ArmsOut.Position = UDim2.new(0, 319, 0, 16)
                ArmsOut.Size = UDim2.new(0, 119, 0, 34)
                ArmsOut.Font = Enum.Font.Highway
                ArmsOut.FontSize = Enum.FontSize.Size24
                ArmsOut.Text = "ArmsOut"
                ArmsOut.TextSize = 20
                ArmsOut.TextWrapped = true

                FloatSlash.Name = "FloatSlash"
                FloatSlash.Parent = ScrollingFrameR15
                FloatSlash.BackgroundColor3 =
                    Color3.new(0.682353, 0.701961, 0.792157)
                FloatSlash.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                FloatSlash.Position = UDim2.new(0, 168, 0, 148)
                FloatSlash.Size = UDim2.new(0, 119, 0, 34)
                FloatSlash.Font = Enum.Font.Highway
                FloatSlash.FontSize = Enum.FontSize.Size24
                FloatSlash.Text = "FloatSlash"
                FloatSlash.TextSize = 20
                FloatSlash.TextWrapped = true

                WeirdZombie.Name = "WeirdZombie"
                WeirdZombie.Parent = ScrollingFrameR15
                WeirdZombie.BackgroundColor3 =
                    Color3.new(0.682353, 0.701961, 0.792157)
                WeirdZombie.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                WeirdZombie.Position = UDim2.new(0, 17, 0, 148)
                WeirdZombie.Size = UDim2.new(0, 119, 0, 34)
                WeirdZombie.Font = Enum.Font.Highway
                WeirdZombie.FontSize = Enum.FontSize.Size24
                WeirdZombie.Text = "WeirdZombie"
                WeirdZombie.TextSize = 20
                WeirdZombie.TextWrapped = true

                DownSlash.Name = "DownSlash"
                DownSlash.Parent = ScrollingFrameR15
                DownSlash.BackgroundColor3 =
                    Color3.new(0.682353, 0.701961, 0.792157)
                DownSlash.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                DownSlash.Position = UDim2.new(0, 319, 0, 148)
                DownSlash.Size = UDim2.new(0, 119, 0, 34)
                DownSlash.Font = Enum.Font.Highway
                DownSlash.FontSize = Enum.FontSize.Size24
                DownSlash.Text = "DownSlash"
                DownSlash.TextSize = 20
                DownSlash.TextWrapped = true

                Pull.Name = "Pull"
                Pull.Parent = ScrollingFrameR15
                Pull.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
                Pull.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                Pull.Position = UDim2.new(0, 17, 0, 104)
                Pull.Size = UDim2.new(0, 119, 0, 34)
                Pull.Font = Enum.Font.Highway
                Pull.FontSize = Enum.FontSize.Size24
                Pull.Text = "Pull"
                Pull.TextSize = 20
                Pull.TextWrapped = true

                CircleArm.Name = "CircleArm"
                CircleArm.Parent = ScrollingFrameR15
                CircleArm.BackgroundColor3 =
                    Color3.new(0.682353, 0.701961, 0.792157)
                CircleArm.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                CircleArm.Position = UDim2.new(0, 168, 0, 104)
                CircleArm.Size = UDim2.new(0, 119, 0, 34)
                CircleArm.Font = Enum.Font.Highway
                CircleArm.FontSize = Enum.FontSize.Size24
                CircleArm.Text = "CircleArm"
                CircleArm.TextSize = 20
                CircleArm.TextWrapped = true

                Bend.Name = "Bend"
                Bend.Parent = ScrollingFrameR15
                Bend.BackgroundColor3 = Color3.new(0.682353, 0.701961, 0.792157)
                Bend.BorderColor3 = Color3.new(0.313726, 0.313726, 0.313726)
                Bend.Position = UDim2.new(0, 319, 0, 104)
                Bend.Size = UDim2.new(0, 119, 0, 34)
                Bend.Font = Enum.Font.Highway
                Bend.FontSize = Enum.FontSize.Size24
                Bend.Text = "Bend"
                Bend.TextSize = 20
                Bend.TextWrapped = true

                RotateSlash.Name = "RotateSlash"
                RotateSlash.Parent = ScrollingFrameR15
                RotateSlash.BackgroundColor3 =
                    Color3.new(0.682353, 0.701961, 0.792157)
                RotateSlash.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                RotateSlash.Position = UDim2.new(0, 319, 0, 60)
                RotateSlash.Size = UDim2.new(0, 119, 0, 34)
                RotateSlash.Font = Enum.Font.Highway
                RotateSlash.FontSize = Enum.FontSize.Size24
                RotateSlash.Text = "RotateSlash"
                RotateSlash.TextSize = 20
                RotateSlash.TextWrapped = true

                FlingArms.Name = "FlingArms"
                FlingArms.Parent = ScrollingFrameR15
                FlingArms.BackgroundColor3 =
                    Color3.new(0.682353, 0.701961, 0.792157)
                FlingArms.BorderColor3 =
                    Color3.new(0.313726, 0.313726, 0.313726)
                FlingArms.Position = UDim2.new(0, 168, 0, 60)
                FlingArms.Size = UDim2.new(0, 119, 0, 34)
                FlingArms.Font = Enum.Font.Highway
                FlingArms.FontSize = Enum.FontSize.Size24
                FlingArms.Text = "FlingArms"
                FlingArms.TextSize = 20
                FlingArms.TextWrapped = true

                -- Buttons
                col = Color3.new(0.886275, 0.776471, 0.368627)
                loc = Color3.new(1, 0.906471, 0.568627)
                rcol = Color3.new(0.682353, 0.701961, 0.792157)
                rloc = Color3.new(0.882353, 0.901961, 0.992157)

                CloseGUI.MouseButton1Click:connect(
                    function()
                        MainFrame.Visible = false
                        SideFrame.Visible = true
                        SideFrame.Position = MainFrame.Position
                    end)

                OpenGUI.MouseButton1Click:connect(
                    function()
                        MainFrame.Visible = true
                        SideFrame.Visible = false
                        MainFrame.Position = SideFrame.Position
                    end)

                if (game:GetService "Players".LocalPlayer.Character:WaitForChild(
                    "Humanoid").RigType == Enum.HumanoidRigType.R15) then
                    ScrollingFrame.Visible = false
                    ScrollingFrameR15.Visible = true
                    CheckR.Text = "Showing R15 Animations"
                else
                    ScrollingFrame.Visible = true
                    ScrollingFrameR15.Visible = false
                    CheckR.Text = "Showing R6 Animations"
                end

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://35154961"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local HeadThrowACTIVE = false
                HeadThrow.MouseButton1Click:connect(
                    function()
                        HeadThrowACTIVE = not HeadThrowACTIVE
                        if HeadThrowACTIVE then
                            HeadThrow.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if HeadThrowACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            HeadThrow.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://121572214"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local FloatingHeadACTIVE = false
                FloatingHead.MouseButton1Click:connect(
                    function()
                        FloatingHeadACTIVE = not FloatingHeadACTIVE
                        if FloatingHeadACTIVE then
                            track:Play(.1, 1, 1)
                            FloatingHead.BackgroundColor3 = loc
                        else
                            track:Stop()
                            FloatingHead.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://182724289"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local CrouchACTIVE = false
                Crouch.MouseButton1Click:connect(
                    function()
                        CrouchACTIVE = not CrouchACTIVE
                        if CrouchACTIVE then
                            track:Play(.1, 1, 1)
                            Crouch.BackgroundColor3 = loc
                        else
                            track:Stop()
                            Crouch.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://282574440"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local FloorCrawlACTIVE = false
                FloorCrawl.MouseButton1Click:connect(
                    function()
                        FloorCrawlACTIVE = not FloorCrawlACTIVE
                        if FloorCrawlACTIVE then
                            track:Play(.1, 1, 1)
                            FloorCrawl.BackgroundColor3 = loc
                        else
                            track:Stop()
                            FloorCrawl.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://204328711"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local DinoWalkACTIVE = false
                DinoWalk.MouseButton1Click:connect(
                    function()
                        DinoWalkACTIVE = not DinoWalkACTIVE
                        if DinoWalkACTIVE then
                            track:Play(.1, 1, 1)
                            DinoWalk.BackgroundColor3 = loc
                        else
                            track:Stop()
                            DinoWalk.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://429681631"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local JumpingJacksACTIVE = false
                JumpingJacks.MouseButton1Click:connect(
                    function()
                        JumpingJacksACTIVE = not JumpingJacksACTIVE
                        if JumpingJacksACTIVE then
                            track:Play(.1, 1, 1)
                            JumpingJacks.BackgroundColor3 = loc
                        else
                            track:Stop()
                            JumpingJacks.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://35154961"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local LoopHeadACTIVE = false
                LoopHead.MouseButton1Click:connect(
                    function()
                        LoopHeadACTIVE = not LoopHeadACTIVE
                        if LoopHeadACTIVE then
                            LoopHead.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if LoopHeadACTIVE then
                                        track:Play(.5, 1, 1e6)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            LoopHead.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://184574340"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local HeroJumpACTIVE = false
                HeroJump.MouseButton1Click:connect(
                    function()
                        HeroJumpACTIVE = not HeroJumpACTIVE
                        if HeroJumpACTIVE then
                            HeroJump.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if HeroJumpACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            HeroJump.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://181526230"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local FaintACTIVE = false
                Faint.MouseButton1Click:connect(
                    function()
                        FaintACTIVE = not FaintACTIVE
                        if FaintACTIVE then
                            track:Play(.1, 1, 1)
                            Faint.BackgroundColor3 = loc
                        else
                            track:Stop()
                            Faint.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://181525546"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local FloorFaintACTIVE = false
                FloorFaint.MouseButton1Click:connect(
                    function()
                        FloorFaintACTIVE = not FloorFaintACTIVE
                        if FloorFaintACTIVE then
                            FloorFaint.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if FloorFaintACTIVE then
                                        track:Play(.1, 1, 2)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            FloorFaint.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://181525546"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local SuperFaintACTIVE = false
                SuperFaint.MouseButton1Click:connect(
                    function()
                        SuperFaintACTIVE = not SuperFaintACTIVE
                        if SuperFaintACTIVE then
                            SuperFaint.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if SuperFaintACTIVE then
                                        track:Play(.1, 0.5, 40)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            SuperFaint.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://313762630"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local LevitateACTIVE = false
                Levitate.MouseButton1Click:connect(
                    function()
                        LevitateACTIVE = not LevitateACTIVE
                        if LevitateACTIVE then
                            track:Play(.1, 1, 1)
                            Levitate.BackgroundColor3 = loc
                        else
                            track:Stop()
                            Levitate.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://183412246"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local DabACTIVE = false
                Dab.MouseButton1Click:connect(
                    function()
                        DabACTIVE = not DabACTIVE
                        if DabACTIVE then
                            Dab.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if DabACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            Dab.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://188632011"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local SpinACTIVE = false
                Spinner.MouseButton1Click:connect(
                    function()
                        SpinACTIVE = not SpinACTIVE
                        if SpinACTIVE then
                            Spinner.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if SpinACTIVE then
                                        track:Play(.1, 1, 2)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            Spinner.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://179224234"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local FloatSitACTIVE = false
                FloatSit.MouseButton1Click:connect(
                    function()
                        FloatSitACTIVE = not FloatSitACTIVE
                        if FloatSitACTIVE then
                            track:Play(.1, 1, 1)
                            FloatSit.BackgroundColor3 = loc
                        else
                            track:Stop()
                            FloatSit.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://429703734"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local MovingDanceACTIVE = false
                MovingDance.MouseButton1Click:connect(
                    function()
                        MovingDanceACTIVE = not MovingDanceACTIVE
                        if MovingDanceACTIVE then
                            MovingDance.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if MovingDanceACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            MovingDance.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://215384594"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local WeirdMoveACTIVE = false
                WeirdMove.MouseButton1Click:connect(
                    function()
                        WeirdMoveACTIVE = not WeirdMoveACTIVE
                        if WeirdMoveACTIVE then
                            track:Play(.1, 1, 1)
                            WeirdMove.BackgroundColor3 = loc
                        else
                            track:Stop()
                            WeirdMove.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://215384594"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local CloneIllusionACTIVE = false
                CloneIllusion.MouseButton1Click:connect(
                    function()
                        CloneIllusionACTIVE = not CloneIllusionACTIVE
                        if CloneIllusionACTIVE then
                            track:Play(.5, 1, 1e7)
                            CloneIllusion.BackgroundColor3 = loc
                        else
                            track:Stop()
                            CloneIllusion.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://313762630"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local GlitchLevitateACTIVE = false
                GlitchLevitate.MouseButton1Click:connect(
                    function()
                        GlitchLevitateACTIVE = not GlitchLevitateACTIVE
                        if GlitchLevitateACTIVE then
                            track:Play(.5, 1, 1e7)
                            GlitchLevitate.BackgroundColor3 = loc
                        else
                            track:Stop()
                            GlitchLevitate.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://429730430"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local SpinDanceACTIVE = false
                SpinDance.MouseButton1Click:connect(
                    function()
                        SpinDanceACTIVE = not SpinDanceACTIVE
                        if SpinDanceACTIVE then
                            SpinDance.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if SpinDanceACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            SpinDance.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://45834924"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local MoonDanceACTIVE = false
                MoonDance.MouseButton1Click:connect(
                    function()
                        MoonDanceACTIVE = not MoonDanceACTIVE
                        if MoonDanceACTIVE then
                            MoonDance.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if MoonDanceACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            MoonDance.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://204062532"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local FullPunchACTIVE = false
                FullPunch.MouseButton1Click:connect(
                    function()
                        FullPunchACTIVE = not FullPunchACTIVE
                        if FullPunchACTIVE then
                            FullPunch.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if FullPunchACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            FullPunch.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://186934910"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local SpinDance2ACTIVE = false
                SpinDance2.MouseButton1Click:connect(
                    function()
                        SpinDance2ACTIVE = not SpinDance2ACTIVE
                        if SpinDance2ACTIVE then
                            SpinDance2.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if SpinDance2ACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            SpinDance2.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://204292303"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local BowDownACTIVE = false
                BowDown.MouseButton1Click:connect(
                    function()
                        BowDownACTIVE = not BowDownACTIVE
                        if BowDownACTIVE then
                            BowDown.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if BowDownACTIVE then
                                        track:Play(.1, 1, 3)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            BowDown.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://204295235"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local SwordSlamACTIVE = false
                SwordSlam.MouseButton1Click:connect(
                    function()
                        SwordSlamACTIVE = not SwordSlamACTIVE
                        if SwordSlamACTIVE then
                            SwordSlam.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if SwordSlamACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            SwordSlam.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://204295235"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local LoopSlamACTIVE = false
                LoopSlam.MouseButton1Click:connect(
                    function()
                        LoopSlamACTIVE = not LoopSlamACTIVE
                        if LoopSlamACTIVE then
                            LoopSlam.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if LoopSlamACTIVE then
                                        track:Play(.1, 1, 1e4)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            LoopSlam.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://184574340"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local MegaInsaneACTIVE = false
                MegaInsane.MouseButton1Click:connect(
                    function()
                        MegaInsaneACTIVE = not MegaInsaneACTIVE
                        if MegaInsaneACTIVE then
                            MegaInsane.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if MegaInsaneACTIVE then
                                        track:Play(.1, 0.5, 40)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            MegaInsane.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://126753849"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local SuperPunchACTIVE = false
                SuperPunch.MouseButton1Click:connect(
                    function()
                        SuperPunchACTIVE = not SuperPunchACTIVE
                        if SuperPunchACTIVE then
                            SuperPunch.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if SuperPunchACTIVE then
                                        track:Play(.1, 1, 3)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            SuperPunch.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://218504594"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local FullSwingACTIVE = false
                FullSwing.MouseButton1Click:connect(
                    function()
                        FullSwingACTIVE = not FullSwingACTIVE
                        if FullSwingACTIVE then
                            FullSwing.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if FullSwingACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            FullSwing.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://259438880"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local ArmTurbineACTIVE = false
                ArmTurbine.MouseButton1Click:connect(
                    function()
                        ArmTurbineACTIVE = not ArmTurbineACTIVE
                        if ArmTurbineACTIVE then
                            track:Play(.1, 1, 1e3)
                            ArmTurbine.BackgroundColor3 = loc
                        else
                            track:Stop()
                            ArmTurbine.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://136801964"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local BarrelRollACTIVE = false
                BarrelRoll.MouseButton1Click:connect(
                    function()
                        BarrelRollACTIVE = not BarrelRollACTIVE
                        if BarrelRollACTIVE then
                            BarrelRoll.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if BarrelRollACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            BarrelRoll.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://180612465"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local ScaredACTIVE = false
                Scared.MouseButton1Click:connect(
                    function()
                        ScaredACTIVE = not ScaredACTIVE
                        if ScaredACTIVE then
                            Scared.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if ScaredACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            Scared.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://33796059"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local InsaneACTIVE = false
                Insane.MouseButton1Click:connect(
                    function()
                        InsaneACTIVE = not InsaneACTIVE
                        if InsaneACTIVE then
                            track:Play(.1, 1, 1e8)
                            Insane.BackgroundColor3 = loc
                        else
                            track:Stop()
                            Insane.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://33169583"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local ArmDetachACTIVE = false
                ArmDetach.MouseButton1Click:connect(
                    function()
                        ArmDetachACTIVE = not ArmDetachACTIVE
                        if ArmDetachACTIVE then
                            ArmDetach.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if ArmDetachACTIVE then
                                        track:Play(.1, 1, 1e6)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            ArmDetach.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://35978879"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local SwordSliceACTIVE = false
                SwordSlice.MouseButton1Click:connect(
                    function()
                        SwordSliceACTIVE = not SwordSliceACTIVE
                        if SwordSliceACTIVE then
                            track:Play(.1, 1, 1)
                            SwordSlice.BackgroundColor3 = loc
                        else
                            track:Stop()
                            SwordSlice.BackgroundColor3 = col
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://27432691"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local InsaneArmsACTIVE = false
                InsaneArms.MouseButton1Click:connect(
                    function()
                        InsaneArmsACTIVE = not InsaneArmsACTIVE
                        if InsaneArmsACTIVE then
                            InsaneArms.BackgroundColor3 = loc
                            while wait() do
                                if track.IsPlaying == false then
                                    if InsaneArmsACTIVE then
                                        track:Play(.1, 1, 1e4)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            InsaneArms.BackgroundColor3 = col
                        end
                    end)
                -- R15
                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://674871189"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local CrazySlashACTIVE = false
                CrazySlash.MouseButton1Click:connect(
                    function()
                        CrazySlashACTIVE = not CrazySlashACTIVE
                        if CrazySlashACTIVE then
                            CrazySlash.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if CrazySlashACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            CrazySlash.BackgroundColor3 = rcol
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://582855105"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local OpenACTIVE = false
                Open.MouseButton1Click:connect(
                    function()
                        OpenACTIVE = not OpenACTIVE
                        if OpenACTIVE then
                            Open.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if OpenACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            Open.BackgroundColor3 = rcol
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://754658275"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local R15SpinnerACTIVE = false
                R15Spinner.MouseButton1Click:connect(
                    function()
                        R15SpinnerACTIVE = not R15SpinnerACTIVE
                        if R15SpinnerACTIVE then
                            R15Spinner.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if R15SpinnerACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            R15Spinner.BackgroundColor3 = rcol
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://582384156"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local ArmsOutACTIVE = false
                ArmsOut.MouseButton1Click:connect(
                    function()
                        ArmsOutACTIVE = not ArmsOutACTIVE
                        if ArmsOutACTIVE then
                            ArmsOut.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if ArmsOutACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            ArmsOut.BackgroundColor3 = rcol
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://717879555"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                local FloatSlashACTIVE = false
                FloatSlash.MouseButton1Click:connect(
                    function()
                        FloatSlashACTIVE = not FloatSlashACTIVE
                        if FloatSlashACTIVE then
                            FloatSlash.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if FloatSlashACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            FloatSlash.BackgroundColor3 = rcol
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://708553116"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                WeirdZombieACTIVE = false
                WeirdZombie.MouseButton1Click:connect(
                    function()
                        WeirdZombieACTIVE = not WeirdZombieACTIVE
                        if WeirdZombieACTIVE then
                            WeirdZombie.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if WeirdZombieACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            WeirdZombie.BackgroundColor3 = rcol
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://746398327"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                DownSlashACTIVE = false
                DownSlash.MouseButton1Click:connect(
                    function()
                        DownSlashACTIVE = not DownSlashACTIVE
                        if DownSlashACTIVE then
                            DownSlash.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if DownSlashACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            DownSlash.BackgroundColor3 = rcol
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://675025795"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                PullACTIVE = false
                Pull.MouseButton1Click:connect(
                    function()
                        PullACTIVE = not PullACTIVE
                        if PullACTIVE then
                            Pull.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if PullACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            Pull.BackgroundColor3 = rcol
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://698251653"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                CircleArmACTIVE = false
                CircleArm.MouseButton1Click:connect(
                    function()
                        CircleArmACTIVE = not CircleArmACTIVE
                        if CircleArmACTIVE then
                            CircleArm.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if CircleArmACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            CircleArm.BackgroundColor3 = rcol
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://696096087"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                BendACTIVE = false
                Bend.MouseButton1Click:connect(
                    function()
                        BendACTIVE = not BendACTIVE
                        if BendACTIVE then
                            Bend.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if BendACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            Bend.BackgroundColor3 = rcol
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://675025570"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                RotateSlashACTIVE = false
                RotateSlash.MouseButton1Click:connect(
                    function()
                        RotateSlashACTIVE = not RotateSlashACTIVE
                        if RotateSlashACTIVE then
                            RotateSlash.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if RotateSlashACTIVE then
                                        track:Play(.1, 1, 1)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            RotateSlash.BackgroundColor3 = rcol
                        end
                    end)

                local Anim = Instance.new("Animation")
                Anim.AnimationId = "rbxassetid://754656200"
                local track = game.Workspace.gay.Humanoid:LoadAnimation(Anim)
                FlingArmsACTIVE = false
                FlingArms.MouseButton1Click:connect(
                    function()
                        FlingArmsACTIVE = not FlingArmsACTIVE
                        if FlingArmsACTIVE then
                            FlingArms.BackgroundColor3 = rloc
                            while wait() do
                                if track.IsPlaying == false then
                                    if FlingArmsACTIVE then
                                        track:Play(.1, 1, 10)
                                    end
                                end
                            end
                        else
                            track:Stop()
                            FlingArms.BackgroundColor3 = rcol
                        end
                    end)

                -- Finished update!
            end)
    end
    coroutine.wrap(JCBQ_fake_script)()
    local function QMMANRT_fake_script() -- WanderingNPC.LocalScript 
        local script = Instance.new('LocalScript', WanderingNPC)

        script.Parent.MouseButton1Down:Connect(
            function()
                local unanchoredparts = {}
                local movers = {}
                local tog = true
                local move = false
                local toggle2 = true
                local Player = game:GetService("Players").LocalPlayer
                local Character = Player.Character
                local mov = {};
                local mov2 = {};
                local head = Character:WaitForChild("BakonHead")
                local Hats = {
                    torso1 = Character:WaitForChild("No Speak Monkey"),
                    torso2 = Character:WaitForChild("Kate Hair"),
                    rightarm = Character:WaitForChild("Hat1"),
                    leftarm = Character:WaitForChild("Pal Hair"),
                    rightleg = Character:WaitForChild("LavanderHair"),
                    leftleg = Character:WaitForChild("Pink Hair")
                }
                head.Handle.AccessoryWeld:Remove()
                head.Handle.HatAttachment:Remove()
                for i, v in next, Hats do
                    v.Handle.AccessoryWeld:Remove()
                    for _, mesh in next, v:GetDescendants() do
                        if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                            mesh:Remove()
                        end
                    end
                end
                local Network = coroutine.create(
                                    function()
                        while true do
                            game:GetService("RunService").Heartbeat:Wait()
                            settings().Physics.AllowSleep = false
                            sethiddenproperty(game.Players.LocalPlayer,
                                              "MaximumSimulationRadius",
                                              math.huge)
                            sethiddenproperty(game.Players.LocalPlayer,
                                              "SimulationRadius", math.huge)
                        end
                    end)
                coroutine.resume(Network)

                function ftp(str)
                    local pt = {};
                    if str ~= 'me' and str ~= 'random' then
                        for i, v in pairs(game.Players:GetPlayers()) do
                            if v.Name:lower():find(str:lower()) then
                                table.insert(pt, v);
                            end
                        end
                    elseif str == 'me' then
                        table.insert(pt, plr);
                    elseif str == 'random' then
                        table.insert(pt, game.Players:GetPlayers()[math.random(
                                         1, #game.Players:GetPlayers())]);
                    end
                    return pt;
                end

                local function align(i, v)
                    local att0 = Instance.new("Attachment", i)
                    att0.Position = Vector3.new(0, 0, 0)
                    local att1 = Instance.new("Attachment", v)
                    att1.Position = Vector3.new(0, 0, 0)
                    local AP = Instance.new("AlignPosition", i)
                    AP.Attachment0 = att0
                    AP.Attachment1 = att1
                    AP.RigidityEnabled = false
                    AP.ReactionForceEnabled = false
                    AP.ApplyAtCenterOfMass = true
                    AP.MaxForce = 9999999
                    AP.MaxVelocity = math.huge
                    AP.Responsiveness = 65
                    local AO = Instance.new("AlignOrientation", i)
                    AO.Attachment0 = att0
                    AO.Attachment1 = att1
                    AO.ReactionTorqueEnabled = true
                    AO.PrimaryAxisOnly = false
                    AO.MaxTorque = 9999999
                    AO.MaxAngularVelocity = math.huge
                    AO.Responsiveness = 50
                end

                Character.Archivable = true
                local clone = Character:Clone()
                clone.Parent = workspace
                clone.Name = "gay"
                clone.Head.face:Destroy()

                align(head.Handle, clone["Head"])
                align(Hats.torso1.Handle, clone["Torso"])
                align(Hats.torso2.Handle, clone["Torso"])
                align(Hats.rightarm.Handle, clone["Right Arm"])
                align(Hats.leftarm.Handle, clone["Left Arm"])
                align(Hats.rightleg.Handle, clone["Right Leg"])
                align(Hats.leftleg.Handle, clone["Left Leg"])

                head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(0, 90, 0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0, 90, 0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)

                clone:WaitForChild("Head"):FindFirstChild("Attachment").Name =
                    "headattachment"
                clone:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
                    "torso1attachment"
                clone:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
                    "torso2attachment"
                clone:WaitForChild("Right Arm"):FindFirstChild("Attachment").Name =
                    "rightarmattachment"
                clone:WaitForChild("Left Arm"):FindFirstChild("Attachment").Name =
                    "leftarmattachment"
                clone:WaitForChild("Right Leg"):FindFirstChild("Attachment").Name =
                    "rightlegattachment"
                clone:WaitForChild("Left Leg"):FindFirstChild("Attachment").Name =
                    "leftlegattachment"

                clone:WaitForChild("Torso").torso1attachment.Position =
                    Vector3.new(-0, 0.5, -0)
                clone:WaitForChild("Torso").torso2attachment.Position =
                    Vector3.new(-0, -0.5, -0)

                clone:FindFirstChild("Kate Hair"):Destroy()
                clone:FindFirstChild("Hat1"):Destroy()
                clone:FindFirstChild("LavanderHair"):Destroy()
                clone:FindFirstChild("Pink Hair"):Destroy()
                clone:FindFirstChild("Pal Hair"):Destroy()
                clone:FindFirstChild("BakonHead"):Destroy()
                clone:FindFirstChild("No Speak Monkey"):Destroy()

                clone:FindFirstChild("Head").Transparency = 1
                clone:FindFirstChild("Torso").Transparency = 1
                clone:FindFirstChild("Right Arm").Transparency = 1
                clone:FindFirstChild("Left Arm").Transparency = 1
                clone:FindFirstChild("Right Leg").Transparency = 1
                clone:FindFirstChild("Left Leg").Transparency = 1

                if Character.Humanoid.Health == 0 then
                    game.Workspace.gay:Destroy()
                end

                function waitForChild(parent, childName)
                    local child = parent:findFirstChild(childName)
                    if child then return child end
                    while true do
                        child = parent.ChildAdded:wait()
                        if child.Name == childName then
                            return child
                        end
                    end
                end

                local Figure = game.Workspace.gay
                local Torso = waitForChild(Figure, "Torso")
                local RightShoulder = waitForChild(Torso, "Right Shoulder")
                local LeftShoulder = waitForChild(Torso, "Left Shoulder")
                local RightHip = waitForChild(Torso, "Right Hip")
                local LeftHip = waitForChild(Torso, "Left Hip")
                local Neck = waitForChild(Torso, "Neck")
                local Humanoid = waitForChild(Figure, "Humanoid")
                local pose = "Standing"

                local currentAnim = ""
                local currentAnimTrack = nil
                local currentAnimKeyframeHandler = nil
                local oldAnimTrack = nil
                local animTable = {}
                local animNames = {
                    idle = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750544",
                            weight = 9
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=125750618",
                            weight = 1
                        }
                    },
                    walk = {
                        {
                            id = "http://www.roblox.com/asset/?id=125749145",
                            weight = 10
                        }
                    },
                    run = {{id = "run.xml", weight = 10}},
                    jump = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750702",
                            weight = 10
                        }
                    },
                    fall = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750759",
                            weight = 10
                        }
                    },
                    climb = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750800",
                            weight = 10
                        }
                    },
                    toolnone = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750867",
                            weight = 10
                        }
                    },
                    toolslash = {
                        {
                            id = "http://www.roblox.com/asset/?id=129967390",
                            weight = 10
                        }
                        --				{ id = "slash.xml", weight = 10 } 
                    },
                    toollunge = {
                        {
                            id = "http://www.roblox.com/asset/?id=129967478",
                            weight = 10
                        }
                    },
                    wave = {
                        {
                            id = "http://www.roblox.com/asset/?id=128777973",
                            weight = 10
                        }
                    },
                    point = {
                        {
                            id = "http://www.roblox.com/asset/?id=128853357",
                            weight = 10
                        }
                    },
                    dance = {
                        {
                            id = "http://www.roblox.com/asset/?id=130018893",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=132546839",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=132546884",
                            weight = 10
                        }
                    },
                    laugh = {
                        {
                            id = "http://www.roblox.com/asset/?id=129423131",
                            weight = 10
                        }
                    },
                    cheer = {
                        {
                            id = "http://www.roblox.com/asset/?id=129423030",
                            weight = 10
                        }
                    }
                }

                -- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
                local emoteNames = {
                    wave = false,
                    point = false,
                    dance = true,
                    laugh = false,
                    cheer = false
                }

                math.randomseed(tick())

                -- Setup animation objects
                for name, fileList in pairs(animNames) do
                    animTable[name] = {}
                    animTable[name].count = 0
                    animTable[name].totalWeight = 0

                    -- check for config values
                    local config = script:FindFirstChild(name)
                    if (config ~= nil) then
                        --		print("Loading anims " .. name)
                        local idx = 1
                        for _, childPart in pairs(config:GetChildren()) do
                            animTable[name][idx] = {}
                            animTable[name][idx].anim = childPart
                            local weightObject =
                                childPart:FindFirstChild("Weight")
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

                    -- fallback to defaults
                    if (animTable[name].count <= 0) then
                        for idx, anim in pairs(fileList) do
                            animTable[name][idx] = {}
                            animTable[name][idx].anim =
                                Instance.new("Animation")
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

                -- ANIMATION

                -- declarations
                local toolAnim = "None"
                local toolAnimTime = 0

                local jumpAnimTime = 0
                local jumpAnimDuration = 0.175

                local toolTransitionTime = 0.1
                local fallTransitionTime = 0.2
                local jumpMaxLimbVelocity = 0.75

                -- functions

                function stopAllAnimations()
                    local oldAnim = currentAnim

                    -- return to idle if finishing an emote
                    if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] ==
                        false) then oldAnim = "idle" end

                    currentAnim = ""
                    if (currentAnimKeyframeHandler ~= nil) then
                        currentAnimKeyframeHandler:disconnect()
                    end

                    if (oldAnimTrack ~= nil) then
                        oldAnimTrack:Stop()
                        oldAnimTrack:Destroy()
                        oldAnimTrack = nil
                    end
                    if (currentAnimTrack ~= nil) then
                        currentAnimTrack:Stop()
                        currentAnimTrack:Destroy()
                        currentAnimTrack = nil
                    end
                    return oldAnim
                end

                local function keyFrameReachedFunc(frameName)
                    if (frameName == "End") then
                        --		print("Keyframe : ".. frameName)
                        local repeatAnim = stopAllAnimations()
                        playAnimation(repeatAnim, 0.0, Humanoid)
                    end
                end

                -- Preload animations
                function playAnimation(animName, transitionTime, humanoid)
                    if (animName ~= currentAnim) then

                        if (oldAnimTrack ~= nil) then
                            oldAnimTrack:Stop()
                            oldAnimTrack:Destroy()
                        end

                        local roll = math.random(1, animTable[animName]
                                                     .totalWeight)
                        local origRoll = roll
                        local idx = 1
                        while (roll > animTable[animName][idx].weight) do
                            roll = roll - animTable[animName][idx].weight
                            idx = idx + 1
                        end
                        --		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
                        local anim = animTable[animName][idx].anim

                        -- load it to the humanoid; get AnimationTrack
                        oldAnimTrack = currentAnimTrack
                        currentAnimTrack = humanoid:LoadAnimation(anim)

                        -- play the animation
                        currentAnimTrack:Play(transitionTime)
                        currentAnim = animName

                        -- set up keyframe name triggers
                        if (currentAnimKeyframeHandler ~= nil) then
                            currentAnimKeyframeHandler:disconnect()
                        end
                        currentAnimKeyframeHandler =
                            currentAnimTrack.KeyframeReached:connect(
                                keyFrameReachedFunc)
                    end
                end

                -------------------------------------------------------------------------------------------
                -------------------------------------------------------------------------------------------

                local toolAnimName = ""
                local toolOldAnimTrack = nil
                local toolAnimTrack = nil
                local currentToolAnimKeyframeHandler = nil

                local function toolKeyFrameReachedFunc(frameName)
                    if (frameName == "End") then
                        --		print("Keyframe : ".. frameName)
                        local repeatAnim = stopToolAnimations()
                        playToolAnimation(repeatAnim, 0.0, Humanoid)
                    end
                end

                function playToolAnimation(animName, transitionTime, humanoid)
                    if (animName ~= toolAnimName) then

                        if (toolAnimTrack ~= nil) then
                            toolAnimTrack:Stop()
                            toolAnimTrack:Destroy()
                            transitionTime = 0
                        end

                        local roll = math.random(1, animTable[animName]
                                                     .totalWeight)
                        local origRoll = roll
                        local idx = 1
                        while (roll > animTable[animName][idx].weight) do
                            roll = roll - animTable[animName][idx].weight
                            idx = idx + 1
                        end
                        --		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
                        local anim = animTable[animName][idx].anim

                        -- load it to the humanoid; get AnimationTrack
                        toolOldAnimTrack = toolAnimTrack
                        toolAnimTrack = humanoid:LoadAnimation(anim)

                        -- play the animation
                        toolAnimTrack:Play(transitionTime)
                        toolAnimName = animName

                        currentToolAnimKeyframeHandler =
                            toolAnimTrack.KeyframeReached:connect(
                                toolKeyFrameReachedFunc)
                    end
                end

                function stopToolAnimations()
                    local oldAnim = toolAnimName

                    if (currentToolAnimKeyframeHandler ~= nil) then
                        currentToolAnimKeyframeHandler:disconnect()
                    end

                    toolAnimName = ""
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
                    if speed > 0 then
                        playAnimation("walk", 0.1, Humanoid)
                        pose = "Running"
                    else
                        playAnimation("idle", 0.1, Humanoid)
                        pose = "Standing"
                    end
                end

                function onDied() pose = "Dead" end

                function onJumping()
                    playAnimation("jump", 0.1, Humanoid)
                    jumpAnimTime = jumpAnimDuration
                    pose = "Jumping"
                end

                function onClimbing()
                    playAnimation("climb", 0.1, Humanoid)
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

                function onPlatformStanding()
                    pose = "PlatformStanding"
                end

                function onSwimming(speed)
                    if speed > 0 then
                        pose = "Running"
                    else
                        pose = "Standing"
                    end
                end

                local function getTool()
                    for _, kid in ipairs(Figure:GetChildren()) do
                        if kid.className == "Tool" then
                            return kid
                        end
                    end
                    return nil
                end

                local function getToolAnim(tool)
                    for _, c in ipairs(tool:GetChildren()) do
                        if c.Name == "toolanim" and c.className == "StringValue" then
                            return c
                        end
                    end
                    return nil
                end

                local function animateTool()

                    if (toolAnim == "None") then
                        playToolAnimation("toolnone", toolTransitionTime,
                                          Humanoid)
                        return
                    end

                    if (toolAnim == "Slash") then
                        playToolAnimation("toolslash", 0, Humanoid)
                        return
                    end

                    if (toolAnim == "Lunge") then
                        playToolAnimation("toollunge", 0, Humanoid)
                        return
                    end
                end

                local function moveSit()
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
                        stopAllAnimations()
                        moveSit()
                        return
                    elseif (pose == "Running") then
                        playAnimation("walk", 0.1, Humanoid)
                    elseif (pose == "Dead" or pose == "GettingUp" or pose ==
                        "FallingDown" or pose == "Seated" or pose ==
                        "PlatformStanding") then
                        --		print("Wha " .. pose)
                        amplitude = 0.1
                        frequency = 1
                        setAngles = true
                    end

                    if (setAngles) then
                        local desiredAngle =
                            amplitude * math.sin(time * frequency)

                        RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
                        LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
                        RightHip:SetDesiredAngle(-desiredAngle)
                        LeftHip:SetDesiredAngle(-desiredAngle)
                    end

                    -- Tool Animation handling
                    local tool = getTool()
                    if tool then

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
                        toolAnimTime = 0
                    end
                end

                -- connect events
                Humanoid.Died:connect(onDied)
                Humanoid.Running:connect(onRunning)
                Humanoid.Jumping:connect(onJumping)
                Humanoid.Climbing:connect(onClimbing)
                Humanoid.GettingUp:connect(onGettingUp)
                Humanoid.FreeFalling:connect(onFreeFall)
                Humanoid.FallingDown:connect(onFallingDown)
                Humanoid.Seated:connect(onSeated)
                Humanoid.PlatformStanding:connect(onPlatformStanding)
                Humanoid.Swimming:connect(onSwimming)

                -- main program

                local runService = game:service("RunService");

                -- initialize to idle
                playAnimation("idle", 1, Humanoid)
                pose = "Standing"

                while Figure.Parent ~= nil do
                    local _, time = wait(1)
                    move(time)
                end
            end)
    end
    coroutine.wrap(QMMANRT_fake_script)()
    local function UDMGTCD_fake_script() -- WanderingNPC.LocalScript 
        local script = Instance.new('LocalScript', WanderingNPC)

        script.Parent.MouseButton1Down:Connect(
            function()
                wait(1)
                local CurrentPart = nil
                local MaxInc = 60

                function onTouched(hit)
                    if hit.Parent == nil then return end

                    local humanoid = hit.Parent:findFirstChild("Humanoid")

                    if humanoid == nil then CurrentPart = hit end
                end

                function waitForChild(parent, childName)
                    local child = parent:findFirstChild(childName)

                    if child then return child end

                    while true do
                        print(childName)

                        child = parent.ChildAdded:wait()

                        if child.Name == childName then
                            return child
                        end
                    end
                end

                local Figure = game.Workspace.gay
                local Humanoid = waitForChild(Figure, "Humanoid")
                local Torso = waitForChild(Figure, "HumanoidRootPart")
                local Left = waitForChild(Figure, "Left Leg")
                local Right = waitForChild(Figure, "Right Leg")

                Humanoid.Jump = true

                Left.Touched:connect(onTouched)
                Right.Touched:connect(onTouched)

                while true do
                    wait(math.random(2, 6))

                    if CurrentPart ~= nil then
                        if math.random(5, 7) == 1 then
                            Humanoid.Jump = true
                        end

                        Humanoid:MoveTo(Torso.Position +
                                            Vector3.new(
                                                math.random(-MaxInc, MaxInc), 0,
                                                math.random(-MaxInc, MaxInc)),
                                        CurrentPart)
                    end
                end
            end)
    end
    coroutine.wrap(UDMGTCD_fake_script)()
    local function IOYV_fake_script() -- ClearNPCS.LocalScript 
        local script = Instance.new('LocalScript', ClearNPCS)

        script.Parent.MouseButton1Down:Connect(
            function() game.Workspace.gay:Destroy() end)
    end
    coroutine.wrap(IOYV_fake_script)()
    local function AKTO_fake_script() -- SpawnNPC.LocalScript 
        local script = Instance.new('LocalScript', SpawnNPC)

        script.Parent.MouseButton1Down:Connect(
            function()
                local unanchoredparts = {}
                local movers = {}
                local tog = true
                local move = false
                local toggle2 = true
                local Player = game:GetService("Players").LocalPlayer
                local Character = Player.Character
                local mov = {};
                local mov2 = {};
                local head = Character:WaitForChild("BakonHead")
                local Hats = {
                    torso1 = Character:WaitForChild("No Speak Monkey"),
                    torso2 = Character:WaitForChild("Kate Hair"),
                    rightarm = Character:WaitForChild("Hat1"),
                    leftarm = Character:WaitForChild("Pal Hair"),
                    rightleg = Character:WaitForChild("LavanderHair"),
                    leftleg = Character:WaitForChild("Pink Hair")
                }
                head.Handle.AccessoryWeld:Remove()
                head.Handle.HatAttachment:Remove()
                for i, v in next, Hats do
                    v.Handle.AccessoryWeld:Remove()
                    for _, mesh in next, v:GetDescendants() do
                        if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                            mesh:Remove()
                        end
                    end
                end
                local Network = coroutine.create(
                                    function()
                        while true do
                            game:GetService("RunService").Heartbeat:Wait()
                            settings().Physics.AllowSleep = false
                            sethiddenproperty(game.Players.LocalPlayer,
                                              "MaximumSimulationRadius",
                                              math.huge)
                            sethiddenproperty(game.Players.LocalPlayer,
                                              "SimulationRadius", math.huge)
                        end
                    end)
                coroutine.resume(Network)

                function ftp(str)
                    local pt = {};
                    if str ~= 'me' and str ~= 'random' then
                        for i, v in pairs(game.Players:GetPlayers()) do
                            if v.Name:lower():find(str:lower()) then
                                table.insert(pt, v);
                            end
                        end
                    elseif str == 'me' then
                        table.insert(pt, plr);
                    elseif str == 'random' then
                        table.insert(pt, game.Players:GetPlayers()[math.random(
                                         1, #game.Players:GetPlayers())]);
                    end
                    return pt;
                end

                local function align(i, v)
                    local att0 = Instance.new("Attachment", i)
                    att0.Position = Vector3.new(0, 0, 0)
                    local att1 = Instance.new("Attachment", v)
                    att1.Position = Vector3.new(0, 0, 0)
                    local AP = Instance.new("AlignPosition", i)
                    AP.Attachment0 = att0
                    AP.Attachment1 = att1
                    AP.RigidityEnabled = false
                    AP.ReactionForceEnabled = false
                    AP.ApplyAtCenterOfMass = true
                    AP.MaxForce = 9999999
                    AP.MaxVelocity = math.huge
                    AP.Responsiveness = 65
                    local AO = Instance.new("AlignOrientation", i)
                    AO.Attachment0 = att0
                    AO.Attachment1 = att1
                    AO.ReactionTorqueEnabled = true
                    AO.PrimaryAxisOnly = false
                    AO.MaxTorque = 9999999
                    AO.MaxAngularVelocity = math.huge
                    AO.Responsiveness = 50
                end

                Character.Archivable = true
                local clone = Character:Clone()
                clone.Parent = workspace
                clone.Name = "gay"
                clone.Head.face:Destroy()

                align(head.Handle, clone["Head"])
                align(Hats.torso1.Handle, clone["Torso"])
                align(Hats.torso2.Handle, clone["Torso"])
                align(Hats.rightarm.Handle, clone["Right Arm"])
                align(Hats.leftarm.Handle, clone["Left Arm"])
                align(Hats.rightleg.Handle, clone["Right Leg"])
                align(Hats.leftleg.Handle, clone["Left Leg"])

                head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(0, 90, 0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0, 90, 0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)

                clone:WaitForChild("Head"):FindFirstChild("Attachment").Name =
                    "headattachment"
                clone:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
                    "torso1attachment"
                clone:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
                    "torso2attachment"
                clone:WaitForChild("Right Arm"):FindFirstChild("Attachment").Name =
                    "rightarmattachment"
                clone:WaitForChild("Left Arm"):FindFirstChild("Attachment").Name =
                    "leftarmattachment"
                clone:WaitForChild("Right Leg"):FindFirstChild("Attachment").Name =
                    "rightlegattachment"
                clone:WaitForChild("Left Leg"):FindFirstChild("Attachment").Name =
                    "leftlegattachment"

                clone:WaitForChild("Torso").torso1attachment.Position =
                    Vector3.new(-0, 0.5, -0)
                clone:WaitForChild("Torso").torso2attachment.Position =
                    Vector3.new(-0, -0.5, -0)

                clone:FindFirstChild("Kate Hair"):Destroy()
                clone:FindFirstChild("Hat1"):Destroy()
                clone:FindFirstChild("LavanderHair"):Destroy()
                clone:FindFirstChild("Pink Hair"):Destroy()
                clone:FindFirstChild("Pal Hair"):Destroy()
                clone:FindFirstChild("BakonHead"):Destroy()
                clone:FindFirstChild("No Speak Monkey"):Destroy()

                clone:FindFirstChild("Head").Transparency = 1
                clone:FindFirstChild("Torso").Transparency = 1
                clone:FindFirstChild("Right Arm").Transparency = 1
                clone:FindFirstChild("Left Arm").Transparency = 1
                clone:FindFirstChild("Right Leg").Transparency = 1
                clone:FindFirstChild("Left Leg").Transparency = 1

                if Character.Humanoid.Health == 0 then
                    game.Workspace.gay:Destroy()
                end

                function waitForChild(parent, childName)
                    local child = parent:findFirstChild(childName)
                    if child then return child end
                    while true do
                        child = parent.ChildAdded:wait()
                        if child.Name == childName then
                            return child
                        end
                    end
                end

                local Figure = game.Workspace.gay
                local Torso = waitForChild(Figure, "Torso")
                local RightShoulder = waitForChild(Torso, "Right Shoulder")
                local LeftShoulder = waitForChild(Torso, "Left Shoulder")
                local RightHip = waitForChild(Torso, "Right Hip")
                local LeftHip = waitForChild(Torso, "Left Hip")
                local Neck = waitForChild(Torso, "Neck")
                local Humanoid = waitForChild(Figure, "Humanoid")
                local pose = "Standing"

                local currentAnim = ""
                local currentAnimTrack = nil
                local currentAnimKeyframeHandler = nil
                local oldAnimTrack = nil
                local animTable = {}
                local animNames = {
                    idle = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750544",
                            weight = 9
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=125750618",
                            weight = 1
                        }
                    },
                    walk = {
                        {
                            id = "http://www.roblox.com/asset/?id=125749145",
                            weight = 10
                        }
                    },
                    run = {{id = "run.xml", weight = 10}},
                    jump = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750702",
                            weight = 10
                        }
                    },
                    fall = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750759",
                            weight = 10
                        }
                    },
                    climb = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750800",
                            weight = 10
                        }
                    },
                    toolnone = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750867",
                            weight = 10
                        }
                    },
                    toolslash = {
                        {
                            id = "http://www.roblox.com/asset/?id=129967390",
                            weight = 10
                        }
                        --				{ id = "slash.xml", weight = 10 } 
                    },
                    toollunge = {
                        {
                            id = "http://www.roblox.com/asset/?id=129967478",
                            weight = 10
                        }
                    },
                    wave = {
                        {
                            id = "http://www.roblox.com/asset/?id=128777973",
                            weight = 10
                        }
                    },
                    point = {
                        {
                            id = "http://www.roblox.com/asset/?id=128853357",
                            weight = 10
                        }
                    },
                    dance = {
                        {
                            id = "http://www.roblox.com/asset/?id=130018893",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=132546839",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=132546884",
                            weight = 10
                        }
                    },
                    laugh = {
                        {
                            id = "http://www.roblox.com/asset/?id=129423131",
                            weight = 10
                        }
                    },
                    cheer = {
                        {
                            id = "http://www.roblox.com/asset/?id=129423030",
                            weight = 10
                        }
                    }
                }

                -- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
                local emoteNames = {
                    wave = false,
                    point = false,
                    dance = true,
                    laugh = false,
                    cheer = false
                }

                math.randomseed(tick())

                -- Setup animation objects
                for name, fileList in pairs(animNames) do
                    animTable[name] = {}
                    animTable[name].count = 0
                    animTable[name].totalWeight = 0

                    -- check for config values
                    local config = script:FindFirstChild(name)
                    if (config ~= nil) then
                        --		print("Loading anims " .. name)
                        local idx = 1
                        for _, childPart in pairs(config:GetChildren()) do
                            animTable[name][idx] = {}
                            animTable[name][idx].anim = childPart
                            local weightObject =
                                childPart:FindFirstChild("Weight")
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

                    -- fallback to defaults
                    if (animTable[name].count <= 0) then
                        for idx, anim in pairs(fileList) do
                            animTable[name][idx] = {}
                            animTable[name][idx].anim =
                                Instance.new("Animation")
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

                -- ANIMATION

                -- declarations
                local toolAnim = "None"
                local toolAnimTime = 0

                local jumpAnimTime = 0
                local jumpAnimDuration = 0.175

                local toolTransitionTime = 0.1
                local fallTransitionTime = 0.2
                local jumpMaxLimbVelocity = 0.75

                -- functions

                function stopAllAnimations()
                    local oldAnim = currentAnim

                    -- return to idle if finishing an emote
                    if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] ==
                        false) then oldAnim = "idle" end

                    currentAnim = ""
                    if (currentAnimKeyframeHandler ~= nil) then
                        currentAnimKeyframeHandler:disconnect()
                    end

                    if (oldAnimTrack ~= nil) then
                        oldAnimTrack:Stop()
                        oldAnimTrack:Destroy()
                        oldAnimTrack = nil
                    end
                    if (currentAnimTrack ~= nil) then
                        currentAnimTrack:Stop()
                        currentAnimTrack:Destroy()
                        currentAnimTrack = nil
                    end
                    return oldAnim
                end

                local function keyFrameReachedFunc(frameName)
                    if (frameName == "End") then
                        --		print("Keyframe : ".. frameName)
                        local repeatAnim = stopAllAnimations()
                        playAnimation(repeatAnim, 0.0, Humanoid)
                    end
                end

                -- Preload animations
                function playAnimation(animName, transitionTime, humanoid)
                    if (animName ~= currentAnim) then

                        if (oldAnimTrack ~= nil) then
                            oldAnimTrack:Stop()
                            oldAnimTrack:Destroy()
                        end

                        local roll = math.random(1, animTable[animName]
                                                     .totalWeight)
                        local origRoll = roll
                        local idx = 1
                        while (roll > animTable[animName][idx].weight) do
                            roll = roll - animTable[animName][idx].weight
                            idx = idx + 1
                        end
                        --		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
                        local anim = animTable[animName][idx].anim

                        -- load it to the humanoid; get AnimationTrack
                        oldAnimTrack = currentAnimTrack
                        currentAnimTrack = humanoid:LoadAnimation(anim)

                        -- play the animation
                        currentAnimTrack:Play(transitionTime)
                        currentAnim = animName

                        -- set up keyframe name triggers
                        if (currentAnimKeyframeHandler ~= nil) then
                            currentAnimKeyframeHandler:disconnect()
                        end
                        currentAnimKeyframeHandler =
                            currentAnimTrack.KeyframeReached:connect(
                                keyFrameReachedFunc)
                    end
                end

                -------------------------------------------------------------------------------------------
                -------------------------------------------------------------------------------------------

                local toolAnimName = ""
                local toolOldAnimTrack = nil
                local toolAnimTrack = nil
                local currentToolAnimKeyframeHandler = nil

                local function toolKeyFrameReachedFunc(frameName)
                    if (frameName == "End") then
                        --		print("Keyframe : ".. frameName)
                        local repeatAnim = stopToolAnimations()
                        playToolAnimation(repeatAnim, 0.0, Humanoid)
                    end
                end

                function playToolAnimation(animName, transitionTime, humanoid)
                    if (animName ~= toolAnimName) then

                        if (toolAnimTrack ~= nil) then
                            toolAnimTrack:Stop()
                            toolAnimTrack:Destroy()
                            transitionTime = 0
                        end

                        local roll = math.random(1, animTable[animName]
                                                     .totalWeight)
                        local origRoll = roll
                        local idx = 1
                        while (roll > animTable[animName][idx].weight) do
                            roll = roll - animTable[animName][idx].weight
                            idx = idx + 1
                        end
                        --		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
                        local anim = animTable[animName][idx].anim

                        -- load it to the humanoid; get AnimationTrack
                        toolOldAnimTrack = toolAnimTrack
                        toolAnimTrack = humanoid:LoadAnimation(anim)

                        -- play the animation
                        toolAnimTrack:Play(transitionTime)
                        toolAnimName = animName

                        currentToolAnimKeyframeHandler =
                            toolAnimTrack.KeyframeReached:connect(
                                toolKeyFrameReachedFunc)
                    end
                end

                function stopToolAnimations()
                    local oldAnim = toolAnimName

                    if (currentToolAnimKeyframeHandler ~= nil) then
                        currentToolAnimKeyframeHandler:disconnect()
                    end

                    toolAnimName = ""
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
                    if speed > 0 then
                        playAnimation("walk", 0.1, Humanoid)
                        pose = "Running"
                    else
                        playAnimation("idle", 0.1, Humanoid)
                        pose = "Standing"
                    end
                end

                function onDied() pose = "Dead" end

                function onJumping()
                    playAnimation("jump", 0.1, Humanoid)
                    jumpAnimTime = jumpAnimDuration
                    pose = "Jumping"
                end

                function onClimbing()
                    playAnimation("climb", 0.1, Humanoid)
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

                function onPlatformStanding()
                    pose = "PlatformStanding"
                end

                function onSwimming(speed)
                    if speed > 0 then
                        pose = "Running"
                    else
                        pose = "Standing"
                    end
                end

                local function getTool()
                    for _, kid in ipairs(Figure:GetChildren()) do
                        if kid.className == "Tool" then
                            return kid
                        end
                    end
                    return nil
                end

                local function getToolAnim(tool)
                    for _, c in ipairs(tool:GetChildren()) do
                        if c.Name == "toolanim" and c.className == "StringValue" then
                            return c
                        end
                    end
                    return nil
                end

                local function animateTool()

                    if (toolAnim == "None") then
                        playToolAnimation("toolnone", toolTransitionTime,
                                          Humanoid)
                        return
                    end

                    if (toolAnim == "Slash") then
                        playToolAnimation("toolslash", 0, Humanoid)
                        return
                    end

                    if (toolAnim == "Lunge") then
                        playToolAnimation("toollunge", 0, Humanoid)
                        return
                    end
                end

                local function moveSit()
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
                        stopAllAnimations()
                        moveSit()
                        return
                    elseif (pose == "Running") then
                        playAnimation("walk", 0.1, Humanoid)
                    elseif (pose == "Dead" or pose == "GettingUp" or pose ==
                        "FallingDown" or pose == "Seated" or pose ==
                        "PlatformStanding") then
                        --		print("Wha " .. pose)
                        amplitude = 0.1
                        frequency = 1
                        setAngles = true
                    end

                    if (setAngles) then
                        local desiredAngle =
                            amplitude * math.sin(time * frequency)

                        RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
                        LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
                        RightHip:SetDesiredAngle(-desiredAngle)
                        LeftHip:SetDesiredAngle(-desiredAngle)
                    end

                    -- Tool Animation handling
                    local tool = getTool()
                    if tool then

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
                        toolAnimTime = 0
                    end
                end

                -- connect events
                Humanoid.Died:connect(onDied)
                Humanoid.Running:connect(onRunning)
                Humanoid.Jumping:connect(onJumping)
                Humanoid.Climbing:connect(onClimbing)
                Humanoid.GettingUp:connect(onGettingUp)
                Humanoid.FreeFalling:connect(onFreeFall)
                Humanoid.FallingDown:connect(onFallingDown)
                Humanoid.Seated:connect(onSeated)
                Humanoid.PlatformStanding:connect(onPlatformStanding)
                Humanoid.Swimming:connect(onSwimming)

                -- main program

                local runService = game:service("RunService");

                -- initialize to idle
                playAnimation("idle", 1, Humanoid)
                pose = "Standing"

                while Figure.Parent ~= nil do
                    local _, time = wait(1)
                    move(time)
                end
            end)
    end
    coroutine.wrap(AKTO_fake_script)()
    local function NQXG_fake_script() -- FollowingNPC.LocalScript 
        local script = Instance.new('LocalScript', FollowingNPC)

        script.Parent.MouseButton1Down:Connect(
            function()
                local unanchoredparts = {}
                local movers = {}
                local tog = true
                local move = false
                local toggle2 = true
                local Player = game:GetService("Players").LocalPlayer
                local Character = Player.Character
                local mov = {};
                local mov2 = {};
                local head = Character:WaitForChild("BakonHead")
                local Hats = {
                    torso1 = Character:WaitForChild("No Speak Monkey"),
                    torso2 = Character:WaitForChild("Kate Hair"),
                    rightarm = Character:WaitForChild("Hat1"),
                    leftarm = Character:WaitForChild("Pal Hair"),
                    rightleg = Character:WaitForChild("LavanderHair"),
                    leftleg = Character:WaitForChild("Pink Hair")
                }
                head.Handle.AccessoryWeld:Remove()
                head.Handle.HatAttachment:Remove()
                for i, v in next, Hats do
                    v.Handle.AccessoryWeld:Remove()
                    for _, mesh in next, v:GetDescendants() do
                        if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                            mesh:Remove()
                        end
                    end
                end
                local Network = coroutine.create(
                                    function()
                        while true do
                            game:GetService("RunService").Heartbeat:Wait()
                            settings().Physics.AllowSleep = false
                            sethiddenproperty(game.Players.LocalPlayer,
                                              "MaximumSimulationRadius",
                                              math.huge)
                            sethiddenproperty(game.Players.LocalPlayer,
                                              "SimulationRadius", math.huge)
                        end
                    end)
                coroutine.resume(Network)

                function ftp(str)
                    local pt = {};
                    if str ~= 'me' and str ~= 'random' then
                        for i, v in pairs(game.Players:GetPlayers()) do
                            if v.Name:lower():find(str:lower()) then
                                table.insert(pt, v);
                            end
                        end
                    elseif str == 'me' then
                        table.insert(pt, plr);
                    elseif str == 'random' then
                        table.insert(pt, game.Players:GetPlayers()[math.random(
                                         1, #game.Players:GetPlayers())]);
                    end
                    return pt;
                end

                local function align(i, v)
                    local att0 = Instance.new("Attachment", i)
                    att0.Position = Vector3.new(0, 0, 0)
                    local att1 = Instance.new("Attachment", v)
                    att1.Position = Vector3.new(0, 0, 0)
                    local AP = Instance.new("AlignPosition", i)
                    AP.Attachment0 = att0
                    AP.Attachment1 = att1
                    AP.RigidityEnabled = false
                    AP.ReactionForceEnabled = false
                    AP.ApplyAtCenterOfMass = true
                    AP.MaxForce = 9999999
                    AP.MaxVelocity = math.huge
                    AP.Responsiveness = 65
                    local AO = Instance.new("AlignOrientation", i)
                    AO.Attachment0 = att0
                    AO.Attachment1 = att1
                    AO.ReactionTorqueEnabled = true
                    AO.PrimaryAxisOnly = false
                    AO.MaxTorque = 9999999
                    AO.MaxAngularVelocity = math.huge
                    AO.Responsiveness = 50
                end

                Character.Archivable = true
                local clone = Character:Clone()
                clone.Parent = workspace
                clone.Name = "gay"
                clone.Head.face:Destroy()

                align(head.Handle, clone["Head"])
                align(Hats.torso1.Handle, clone["Torso"])
                align(Hats.torso2.Handle, clone["Torso"])
                align(Hats.rightarm.Handle, clone["Right Arm"])
                align(Hats.leftarm.Handle, clone["Left Arm"])
                align(Hats.rightleg.Handle, clone["Right Leg"])
                align(Hats.leftleg.Handle, clone["Left Leg"])

                head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(0, 90, 0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0, 90, 0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)

                clone:WaitForChild("Head"):FindFirstChild("Attachment").Name =
                    "headattachment"
                clone:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
                    "torso1attachment"
                clone:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
                    "torso2attachment"
                clone:WaitForChild("Right Arm"):FindFirstChild("Attachment").Name =
                    "rightarmattachment"
                clone:WaitForChild("Left Arm"):FindFirstChild("Attachment").Name =
                    "leftarmattachment"
                clone:WaitForChild("Right Leg"):FindFirstChild("Attachment").Name =
                    "rightlegattachment"
                clone:WaitForChild("Left Leg"):FindFirstChild("Attachment").Name =
                    "leftlegattachment"

                clone:WaitForChild("Torso").torso1attachment.Position =
                    Vector3.new(-0, 0.5, -0)
                clone:WaitForChild("Torso").torso2attachment.Position =
                    Vector3.new(-0, -0.5, -0)

                clone:FindFirstChild("Kate Hair"):Destroy()
                clone:FindFirstChild("Hat1"):Destroy()
                clone:FindFirstChild("LavanderHair"):Destroy()
                clone:FindFirstChild("Pink Hair"):Destroy()
                clone:FindFirstChild("Pal Hair"):Destroy()
                clone:FindFirstChild("BakonHead"):Destroy()
                clone:FindFirstChild("No Speak Monkey"):Destroy()

                clone:FindFirstChild("Head").Transparency = 1
                clone:FindFirstChild("Torso").Transparency = 1
                clone:FindFirstChild("Right Arm").Transparency = 1
                clone:FindFirstChild("Left Arm").Transparency = 1
                clone:FindFirstChild("Right Leg").Transparency = 1
                clone:FindFirstChild("Left Leg").Transparency = 1

                if Character.Humanoid.Health == 0 then
                    game.Workspace.gay:Destroy()
                end

                function waitForChild(parent, childName)
                    local child = parent:findFirstChild(childName)
                    if child then return child end
                    while true do
                        child = parent.ChildAdded:wait()
                        if child.Name == childName then
                            return child
                        end
                    end
                end

                local Figure = game.Workspace.gay
                local Torso = waitForChild(Figure, "Torso")
                local RightShoulder = waitForChild(Torso, "Right Shoulder")
                local LeftShoulder = waitForChild(Torso, "Left Shoulder")
                local RightHip = waitForChild(Torso, "Right Hip")
                local LeftHip = waitForChild(Torso, "Left Hip")
                local Neck = waitForChild(Torso, "Neck")
                local Humanoid = waitForChild(Figure, "Humanoid")
                local pose = "Standing"

                local currentAnim = ""
                local currentAnimTrack = nil
                local currentAnimKeyframeHandler = nil
                local oldAnimTrack = nil
                local animTable = {}
                local animNames = {
                    idle = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750544",
                            weight = 9
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=125750618",
                            weight = 1
                        }
                    },
                    walk = {
                        {
                            id = "http://www.roblox.com/asset/?id=125749145",
                            weight = 10
                        }
                    },
                    run = {{id = "run.xml", weight = 10}},
                    jump = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750702",
                            weight = 10
                        }
                    },
                    fall = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750759",
                            weight = 10
                        }
                    },
                    climb = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750800",
                            weight = 10
                        }
                    },
                    toolnone = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750867",
                            weight = 10
                        }
                    },
                    toolslash = {
                        {
                            id = "http://www.roblox.com/asset/?id=129967390",
                            weight = 10
                        }
                        --				{ id = "slash.xml", weight = 10 } 
                    },
                    toollunge = {
                        {
                            id = "http://www.roblox.com/asset/?id=129967478",
                            weight = 10
                        }
                    },
                    wave = {
                        {
                            id = "http://www.roblox.com/asset/?id=128777973",
                            weight = 10
                        }
                    },
                    point = {
                        {
                            id = "http://www.roblox.com/asset/?id=128853357",
                            weight = 10
                        }
                    },
                    dance = {
                        {
                            id = "http://www.roblox.com/asset/?id=130018893",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=132546839",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=132546884",
                            weight = 10
                        }
                    },
                    laugh = {
                        {
                            id = "http://www.roblox.com/asset/?id=129423131",
                            weight = 10
                        }
                    },
                    cheer = {
                        {
                            id = "http://www.roblox.com/asset/?id=129423030",
                            weight = 10
                        }
                    }
                }

                -- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
                local emoteNames = {
                    wave = false,
                    point = false,
                    dance = true,
                    laugh = false,
                    cheer = false
                }

                math.randomseed(tick())

                -- Setup animation objects
                for name, fileList in pairs(animNames) do
                    animTable[name] = {}
                    animTable[name].count = 0
                    animTable[name].totalWeight = 0

                    -- check for config values
                    local config = script:FindFirstChild(name)
                    if (config ~= nil) then
                        --		print("Loading anims " .. name)
                        local idx = 1
                        for _, childPart in pairs(config:GetChildren()) do
                            animTable[name][idx] = {}
                            animTable[name][idx].anim = childPart
                            local weightObject =
                                childPart:FindFirstChild("Weight")
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

                    -- fallback to defaults
                    if (animTable[name].count <= 0) then
                        for idx, anim in pairs(fileList) do
                            animTable[name][idx] = {}
                            animTable[name][idx].anim =
                                Instance.new("Animation")
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

                -- ANIMATION

                -- declarations
                local toolAnim = "None"
                local toolAnimTime = 0

                local jumpAnimTime = 0
                local jumpAnimDuration = 0.175

                local toolTransitionTime = 0.1
                local fallTransitionTime = 0.2
                local jumpMaxLimbVelocity = 0.75

                -- functions

                function stopAllAnimations()
                    local oldAnim = currentAnim

                    -- return to idle if finishing an emote
                    if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] ==
                        false) then oldAnim = "idle" end

                    currentAnim = ""
                    if (currentAnimKeyframeHandler ~= nil) then
                        currentAnimKeyframeHandler:disconnect()
                    end

                    if (oldAnimTrack ~= nil) then
                        oldAnimTrack:Stop()
                        oldAnimTrack:Destroy()
                        oldAnimTrack = nil
                    end
                    if (currentAnimTrack ~= nil) then
                        currentAnimTrack:Stop()
                        currentAnimTrack:Destroy()
                        currentAnimTrack = nil
                    end
                    return oldAnim
                end

                local function keyFrameReachedFunc(frameName)
                    if (frameName == "End") then
                        --		print("Keyframe : ".. frameName)
                        local repeatAnim = stopAllAnimations()
                        playAnimation(repeatAnim, 0.0, Humanoid)
                    end
                end

                -- Preload animations
                function playAnimation(animName, transitionTime, humanoid)
                    if (animName ~= currentAnim) then

                        if (oldAnimTrack ~= nil) then
                            oldAnimTrack:Stop()
                            oldAnimTrack:Destroy()
                        end

                        local roll = math.random(1, animTable[animName]
                                                     .totalWeight)
                        local origRoll = roll
                        local idx = 1
                        while (roll > animTable[animName][idx].weight) do
                            roll = roll - animTable[animName][idx].weight
                            idx = idx + 1
                        end
                        --		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
                        local anim = animTable[animName][idx].anim

                        -- load it to the humanoid; get AnimationTrack
                        oldAnimTrack = currentAnimTrack
                        currentAnimTrack = humanoid:LoadAnimation(anim)

                        -- play the animation
                        currentAnimTrack:Play(transitionTime)
                        currentAnim = animName

                        -- set up keyframe name triggers
                        if (currentAnimKeyframeHandler ~= nil) then
                            currentAnimKeyframeHandler:disconnect()
                        end
                        currentAnimKeyframeHandler =
                            currentAnimTrack.KeyframeReached:connect(
                                keyFrameReachedFunc)
                    end
                end

                -------------------------------------------------------------------------------------------
                -------------------------------------------------------------------------------------------

                local toolAnimName = ""
                local toolOldAnimTrack = nil
                local toolAnimTrack = nil
                local currentToolAnimKeyframeHandler = nil

                local function toolKeyFrameReachedFunc(frameName)
                    if (frameName == "End") then
                        --		print("Keyframe : ".. frameName)
                        local repeatAnim = stopToolAnimations()
                        playToolAnimation(repeatAnim, 0.0, Humanoid)
                    end
                end

                function playToolAnimation(animName, transitionTime, humanoid)
                    if (animName ~= toolAnimName) then

                        if (toolAnimTrack ~= nil) then
                            toolAnimTrack:Stop()
                            toolAnimTrack:Destroy()
                            transitionTime = 0
                        end

                        local roll = math.random(1, animTable[animName]
                                                     .totalWeight)
                        local origRoll = roll
                        local idx = 1
                        while (roll > animTable[animName][idx].weight) do
                            roll = roll - animTable[animName][idx].weight
                            idx = idx + 1
                        end
                        --		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
                        local anim = animTable[animName][idx].anim

                        -- load it to the humanoid; get AnimationTrack
                        toolOldAnimTrack = toolAnimTrack
                        toolAnimTrack = humanoid:LoadAnimation(anim)

                        -- play the animation
                        toolAnimTrack:Play(transitionTime)
                        toolAnimName = animName

                        currentToolAnimKeyframeHandler =
                            toolAnimTrack.KeyframeReached:connect(
                                toolKeyFrameReachedFunc)
                    end
                end

                function stopToolAnimations()
                    local oldAnim = toolAnimName

                    if (currentToolAnimKeyframeHandler ~= nil) then
                        currentToolAnimKeyframeHandler:disconnect()
                    end

                    toolAnimName = ""
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
                    if speed > 0 then
                        playAnimation("walk", 0.1, Humanoid)
                        pose = "Running"
                    else
                        playAnimation("idle", 0.1, Humanoid)
                        pose = "Standing"
                    end
                end

                function onDied() pose = "Dead" end

                function onJumping()
                    playAnimation("jump", 0.1, Humanoid)
                    jumpAnimTime = jumpAnimDuration
                    pose = "Jumping"
                end

                function onClimbing()
                    playAnimation("climb", 0.1, Humanoid)
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

                function onPlatformStanding()
                    pose = "PlatformStanding"
                end

                function onSwimming(speed)
                    if speed > 0 then
                        pose = "Running"
                    else
                        pose = "Standing"
                    end
                end

                local function getTool()
                    for _, kid in ipairs(Figure:GetChildren()) do
                        if kid.className == "Tool" then
                            return kid
                        end
                    end
                    return nil
                end

                local function getToolAnim(tool)
                    for _, c in ipairs(tool:GetChildren()) do
                        if c.Name == "toolanim" and c.className == "StringValue" then
                            return c
                        end
                    end
                    return nil
                end

                local function animateTool()

                    if (toolAnim == "None") then
                        playToolAnimation("toolnone", toolTransitionTime,
                                          Humanoid)
                        return
                    end

                    if (toolAnim == "Slash") then
                        playToolAnimation("toolslash", 0, Humanoid)
                        return
                    end

                    if (toolAnim == "Lunge") then
                        playToolAnimation("toollunge", 0, Humanoid)
                        return
                    end
                end

                local function moveSit()
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
                        stopAllAnimations()
                        moveSit()
                        return
                    elseif (pose == "Running") then
                        playAnimation("walk", 0.1, Humanoid)
                    elseif (pose == "Dead" or pose == "GettingUp" or pose ==
                        "FallingDown" or pose == "Seated" or pose ==
                        "PlatformStanding") then
                        --		print("Wha " .. pose)
                        amplitude = 0.1
                        frequency = 1
                        setAngles = true
                    end

                    if (setAngles) then
                        local desiredAngle =
                            amplitude * math.sin(time * frequency)

                        RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
                        LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
                        RightHip:SetDesiredAngle(-desiredAngle)
                        LeftHip:SetDesiredAngle(-desiredAngle)
                    end

                    -- Tool Animation handling
                    local tool = getTool()
                    if tool then

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
                        toolAnimTime = 0
                    end
                end

                -- connect events
                Humanoid.Died:connect(onDied)
                Humanoid.Running:connect(onRunning)
                Humanoid.Jumping:connect(onJumping)
                Humanoid.Climbing:connect(onClimbing)
                Humanoid.GettingUp:connect(onGettingUp)
                Humanoid.FreeFalling:connect(onFreeFall)
                Humanoid.FallingDown:connect(onFallingDown)
                Humanoid.Seated:connect(onSeated)
                Humanoid.PlatformStanding:connect(onPlatformStanding)
                Humanoid.Swimming:connect(onSwimming)

                -- main program

                local runService = game:service("RunService");

                -- initialize to idle
                playAnimation("idle", 1, Humanoid)
                pose = "Standing"

                while Figure.Parent ~= nil do
                    local _, time = wait(1)
                    move(time)
                end
            end)
    end
    coroutine.wrap(NQXG_fake_script)()
    local function TVZL_fake_script() -- FollowingNPC.LocalScript 
        local script = Instance.new('LocalScript', FollowingNPC)

        script.Parent.MouseButton1Down:Connect(
            function()
                wait(1)
                local larm = game.Workspace.gay:FindFirstChild(
                                 "HumanoidRootPart")
                local rarm = game.Workspace.gay:FindFirstChild(
                                 "HumanoidRootPart")

                function findNearestTorso(pos)
                    local list = game.Workspace:children()
                    local torso = nil
                    local dist = 10000
                    local temp = nil
                    local human = nil
                    local temp2 = nil
                    for x = 1, #list do
                        temp2 = list[x]
                        if (temp2.className == "Model") and
                            (temp2 ~= game.Workspace.gay) then
                            temp = temp2:findFirstChild("HumanoidRootPart")
                            human = temp2:findFirstChild("Humanoid")
                            if (temp ~= nil) and (human ~= nil) and
                                (human.Health > 0) then
                                if (temp.Position - pos).magnitude < dist then
                                    torso = temp
                                    dist = (temp.Position - pos).magnitude
                                end
                            end
                        end
                    end
                    return torso
                end

                while true do
                    wait(math.random(1, 5))
                    local target = findNearestTorso(
                                       game.Workspace.gay.HumanoidRootPart
                                           .Position)
                    if target ~= nil then
                        game.Workspace.gay.Humanoid:MoveTo(target.Position,
                                                           target)
                    end

                end
            end)
    end
    coroutine.wrap(TVZL_fake_script)()
    local function KIVAYYY_fake_script() -- Reset.LocalScript 
        local script = Instance.new('LocalScript', Reset)

        script.Parent.MouseButton1Down:Connect(
            function()
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
            end)
    end
    coroutine.wrap(KIVAYYY_fake_script)()
    local function VZMQ_fake_script() -- ControlNPC.LocalScript 
        local script = Instance.new('LocalScript', ControlNPC)

        script.Parent.MouseButton1Down:Connect(
            function()
                plr = game.Players.LocalPlayer
                if script.Parent.Text == "Control" then
                    script.Parent.Text = "Uncontrol"
                    workspace.gay.Humanoid.PlatformStand = true
                    W1 = Instance.new("Weld", workspace)
                    W1.Name = "Weld1"
                    W1.Part0 = plr.Character.Torso
                    W1.Part1 = workspace.gay.Torso
                    W2 = Instance.new("Weld", workspace)
                    W2.Name = "Weld2"
                    W2.Part0 = plr.Character.Head
                    W2.Part1 = workspace.gay.Head
                    W3 = Instance.new("Weld", workspace)
                    W3.Name = "Weld3"
                    W3.Part0 = plr.Character.HumanoidRootPart
                    W3.Part1 = workspace.gay.HumanoidRootPart
                    W4 = Instance.new("Weld", workspace)
                    W4.Name = "Weld4"
                    W4.Part0 = plr.Character["Left Arm"]
                    W4.Part1 = workspace.gay["Left Arm"]
                    W5 = Instance.new("Weld", workspace)
                    W5.Name = "Weld5"
                    W5.Part0 = plr.Character["Left Leg"]
                    W5.Part1 = workspace.gay["Left Leg"]
                    W6 = Instance.new("Weld", workspace)
                    W6.Name = "Weld6"
                    W6.Part0 = plr.Character["Right Arm"]
                    W6.Part1 = workspace.gay["Right Arm"]
                    W7 = Instance.new("Weld", workspace)
                    W7.Name = "Weld7"
                    W7.Part0 = plr.Character["Right Leg"]
                    W7.Part1 = workspace.gay["Right Leg"]
                    for i, v in pairs(plr.Character:GetChildren()) do
                        if v.ClassName == "Part" then
                            v.Transparency = 1
                        end
                        plr.Character.HumanoidRootPart.Transparency = 1
                        if v.ClassName == "Accessory" then
                            v.Handle.Transparency = 0
                        end
                        plr.Character.Humanoid.NameOcclusion = "NoOcclusion"
                    end
                elseif script.Parent.Text == "Uncontrol" then
                    script.Parent.Text = "Control"
                    workspace.gay.Humanoid.PlatformStand = false
                    workspace.Weld1:Remove()
                    workspace.Weld2:Remove()
                    workspace.Weld3:Remove()
                    workspace.Weld4:Remove()
                    workspace.Weld5:Remove()
                    workspace.Weld6:Remove()
                    workspace.Weld7:Remove()
                    for i, v in pairs(plr.Character:GetChildren()) do
                        if v.ClassName == "Part" then
                            v.Transparency = 0
                        end
                        plr.Character.HumanoidRootPart.Transparency = 1
                        if v.ClassName == "Accessory" then
                            v.Handle.Transparency = 0
                        end
                        plr.Character.Humanoid.NameOcclusion = "OccludeAll"
                    end
                end
            end)
    end
    coroutine.wrap(VZMQ_fake_script)()
    local function ZXJL_fake_script() -- AnimationPlayer.LocalScript 
        local script = Instance.new('LocalScript', AnimationPlayer)

        local toggle = false
        script.Parent.MouseButton1Down:Connect(
            function()
                script.Parent.Parent.Parent.Parent.Parent.Frame2.Visible = true
            end)

    end
    coroutine.wrap(ZXJL_fake_script)()
    local function IHVMURQ_fake_script() -- SpawnEasyControlNPC.LocalScript 
        local script = Instance.new('LocalScript', SpawnEasyControlNPC)

        script.Parent.MouseButton1Down:Connect(
            function()
                local unanchoredparts = {}
                local movers = {}
                local tog = true
                local move = false
                local toggle2 = true
                local Player = game:GetService("Players").LocalPlayer
                local Character = Player.Character
                local mov = {};
                local mov2 = {};
                local head = Character:WaitForChild("BakonHead")
                local Hats = {
                    torso1 = Character:WaitForChild("No Speak Monkey"),
                    torso2 = Character:WaitForChild("Kate Hair"),
                    rightarm = Character:WaitForChild("Hat1"),
                    leftarm = Character:WaitForChild("Pal Hair"),
                    rightleg = Character:WaitForChild("LavanderHair"),
                    leftleg = Character:WaitForChild("Pink Hair")
                }
                head.Handle.AccessoryWeld:Remove()
                head.Handle.HatAttachment:Remove()
                for i, v in next, Hats do
                    v.Handle.AccessoryWeld:Remove()
                    for _, mesh in next, v:GetDescendants() do
                        if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                            mesh:Remove()
                        end
                    end
                end
                local Network = coroutine.create(
                                    function()
                        while true do
                            game:GetService("RunService").Heartbeat:Wait()
                            settings().Physics.AllowSleep = false
                            sethiddenproperty(game.Players.LocalPlayer,
                                              "MaximumSimulationRadius",
                                              math.huge)
                            sethiddenproperty(game.Players.LocalPlayer,
                                              "SimulationRadius", math.huge)
                        end
                    end)
                coroutine.resume(Network)

                function ftp(str)
                    local pt = {};
                    if str ~= 'me' and str ~= 'random' then
                        for i, v in pairs(game.Players:GetPlayers()) do
                            if v.Name:lower():find(str:lower()) then
                                table.insert(pt, v);
                            end
                        end
                    elseif str == 'me' then
                        table.insert(pt, plr);
                    elseif str == 'random' then
                        table.insert(pt, game.Players:GetPlayers()[math.random(
                                         1, #game.Players:GetPlayers())]);
                    end
                    return pt;
                end

                local function align(i, v)
                    local att0 = Instance.new("Attachment", i)
                    att0.Position = Vector3.new(0, 0, 0)
                    local att1 = Instance.new("Attachment", v)
                    att1.Position = Vector3.new(0, 0, 0)
                    local AP = Instance.new("AlignPosition", i)
                    AP.Attachment0 = att0
                    AP.Attachment1 = att1
                    AP.RigidityEnabled = false
                    AP.ReactionForceEnabled = false
                    AP.ApplyAtCenterOfMass = true
                    AP.MaxForce = 9999999
                    AP.MaxVelocity = math.huge
                    AP.Responsiveness = 65
                    local AO = Instance.new("AlignOrientation", i)
                    AO.Attachment0 = att0
                    AO.Attachment1 = att1
                    AO.ReactionTorqueEnabled = true
                    AO.PrimaryAxisOnly = false
                    AO.MaxTorque = 9999999
                    AO.MaxAngularVelocity = math.huge
                    AO.Responsiveness = 50
                end

                Character.Archivable = true
                local clone = Character:Clone()
                clone.Parent = workspace
                clone.Name = "gay"
                clone.Head.face:Destroy()

                align(head.Handle, clone["Head"])
                align(Hats.torso1.Handle, clone["Torso"])
                align(Hats.torso2.Handle, clone["Torso"])
                align(Hats.rightarm.Handle, clone["Right Arm"])
                align(Hats.leftarm.Handle, clone["Left Arm"])
                align(Hats.rightleg.Handle, clone["Right Leg"])
                align(Hats.leftleg.Handle, clone["Left Leg"])

                head.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(0, 90, 0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0, 90, 0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)

                clone:WaitForChild("Head"):FindFirstChild("Attachment").Name =
                    "headattachment"
                clone:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
                    "torso1attachment"
                clone:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
                    "torso2attachment"
                clone:WaitForChild("Right Arm"):FindFirstChild("Attachment").Name =
                    "rightarmattachment"
                clone:WaitForChild("Left Arm"):FindFirstChild("Attachment").Name =
                    "leftarmattachment"
                clone:WaitForChild("Right Leg"):FindFirstChild("Attachment").Name =
                    "rightlegattachment"
                clone:WaitForChild("Left Leg"):FindFirstChild("Attachment").Name =
                    "leftlegattachment"

                clone:WaitForChild("Torso").torso1attachment.Position =
                    Vector3.new(-0, 0.5, -0)
                clone:WaitForChild("Torso").torso2attachment.Position =
                    Vector3.new(-0, -0.5, -0)

                clone:FindFirstChild("Kate Hair"):Destroy()
                clone:FindFirstChild("Hat1"):Destroy()
                clone:FindFirstChild("LavanderHair"):Destroy()
                clone:FindFirstChild("Pink Hair"):Destroy()
                clone:FindFirstChild("Pal Hair"):Destroy()
                clone:FindFirstChild("BakonHead"):Destroy()
                clone:FindFirstChild("No Speak Monkey"):Destroy()

                clone:FindFirstChild("Head").Transparency = 1
                clone:FindFirstChild("Torso").Transparency = 1
                clone:FindFirstChild("Right Arm").Transparency = 1
                clone:FindFirstChild("Left Arm").Transparency = 1
                clone:FindFirstChild("Right Leg").Transparency = 1
                clone:FindFirstChild("Left Leg").Transparency = 1

                if Character.Humanoid.Health == 0 then
                    game.Workspace.gay:Destroy()
                end

                function waitForChild(parent, childName)
                    local child = parent:findFirstChild(childName)
                    if child then return child end
                    while true do
                        child = parent.ChildAdded:wait()
                        if child.Name == childName then
                            return child
                        end
                    end
                end

                local Figure = game.Workspace.gay
                local Torso = waitForChild(Figure, "Torso")
                local RightShoulder = waitForChild(Torso, "Right Shoulder")
                local LeftShoulder = waitForChild(Torso, "Left Shoulder")
                local RightHip = waitForChild(Torso, "Right Hip")
                local LeftHip = waitForChild(Torso, "Left Hip")
                local Neck = waitForChild(Torso, "Neck")
                local Humanoid = waitForChild(Figure, "Humanoid")
                local pose = "Standing"

                local currentAnim = ""
                local currentAnimTrack = nil
                local currentAnimKeyframeHandler = nil
                local oldAnimTrack = nil
                local animTable = {}
                local animNames = {
                    idle = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750544",
                            weight = 9
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=125750618",
                            weight = 1
                        }
                    },
                    walk = {
                        {
                            id = "http://www.roblox.com/asset/?id=125749145",
                            weight = 10
                        }
                    },
                    run = {{id = "run.xml", weight = 10}},
                    jump = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750702",
                            weight = 10
                        }
                    },
                    fall = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750759",
                            weight = 10
                        }
                    },
                    climb = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750800",
                            weight = 10
                        }
                    },
                    toolnone = {
                        {
                            id = "http://www.roblox.com/asset/?id=125750867",
                            weight = 10
                        }
                    },
                    toolslash = {
                        {
                            id = "http://www.roblox.com/asset/?id=129967390",
                            weight = 10
                        }
                        --				{ id = "slash.xml", weight = 10 } 
                    },
                    toollunge = {
                        {
                            id = "http://www.roblox.com/asset/?id=129967478",
                            weight = 10
                        }
                    },
                    wave = {
                        {
                            id = "http://www.roblox.com/asset/?id=128777973",
                            weight = 10
                        }
                    },
                    point = {
                        {
                            id = "http://www.roblox.com/asset/?id=128853357",
                            weight = 10
                        }
                    },
                    dance = {
                        {
                            id = "http://www.roblox.com/asset/?id=130018893",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=132546839",
                            weight = 10
                        },
                        {
                            id = "http://www.roblox.com/asset/?id=132546884",
                            weight = 10
                        }
                    },
                    laugh = {
                        {
                            id = "http://www.roblox.com/asset/?id=129423131",
                            weight = 10
                        }
                    },
                    cheer = {
                        {
                            id = "http://www.roblox.com/asset/?id=129423030",
                            weight = 10
                        }
                    }
                }

                -- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
                local emoteNames = {
                    wave = false,
                    point = false,
                    dance = true,
                    laugh = false,
                    cheer = false
                }

                math.randomseed(tick())

                -- Setup animation objects
                for name, fileList in pairs(animNames) do
                    animTable[name] = {}
                    animTable[name].count = 0
                    animTable[name].totalWeight = 0

                    -- check for config values
                    local config = script:FindFirstChild(name)
                    if (config ~= nil) then
                        --		print("Loading anims " .. name)
                        local idx = 1
                        for _, childPart in pairs(config:GetChildren()) do
                            animTable[name][idx] = {}
                            animTable[name][idx].anim = childPart
                            local weightObject =
                                childPart:FindFirstChild("Weight")
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

                    -- fallback to defaults
                    if (animTable[name].count <= 0) then
                        for idx, anim in pairs(fileList) do
                            animTable[name][idx] = {}
                            animTable[name][idx].anim =
                                Instance.new("Animation")
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

                -- ANIMATION

                -- declarations
                local toolAnim = "None"
                local toolAnimTime = 0

                local jumpAnimTime = 0
                local jumpAnimDuration = 0.175

                local toolTransitionTime = 0.1
                local fallTransitionTime = 0.2
                local jumpMaxLimbVelocity = 0.75

                -- functions

                function stopAllAnimations()
                    local oldAnim = currentAnim

                    -- return to idle if finishing an emote
                    if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] ==
                        false) then oldAnim = "idle" end

                    currentAnim = ""
                    if (currentAnimKeyframeHandler ~= nil) then
                        currentAnimKeyframeHandler:disconnect()
                    end

                    if (oldAnimTrack ~= nil) then
                        oldAnimTrack:Stop()
                        oldAnimTrack:Destroy()
                        oldAnimTrack = nil
                    end
                    if (currentAnimTrack ~= nil) then
                        currentAnimTrack:Stop()
                        currentAnimTrack:Destroy()
                        currentAnimTrack = nil
                    end
                    return oldAnim
                end

                local function keyFrameReachedFunc(frameName)
                    if (frameName == "End") then
                        --		print("Keyframe : ".. frameName)
                        local repeatAnim = stopAllAnimations()
                        playAnimation(repeatAnim, 0.0, Humanoid)
                    end
                end

                -- Preload animations
                function playAnimation(animName, transitionTime, humanoid)
                    if (animName ~= currentAnim) then

                        if (oldAnimTrack ~= nil) then
                            oldAnimTrack:Stop()
                            oldAnimTrack:Destroy()
                        end

                        local roll = math.random(1, animTable[animName]
                                                     .totalWeight)
                        local origRoll = roll
                        local idx = 1
                        while (roll > animTable[animName][idx].weight) do
                            roll = roll - animTable[animName][idx].weight
                            idx = idx + 1
                        end
                        --		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
                        local anim = animTable[animName][idx].anim

                        -- load it to the humanoid; get AnimationTrack
                        oldAnimTrack = currentAnimTrack
                        currentAnimTrack = humanoid:LoadAnimation(anim)

                        -- play the animation
                        currentAnimTrack:Play(transitionTime)
                        currentAnim = animName

                        -- set up keyframe name triggers
                        if (currentAnimKeyframeHandler ~= nil) then
                            currentAnimKeyframeHandler:disconnect()
                        end
                        currentAnimKeyframeHandler =
                            currentAnimTrack.KeyframeReached:connect(
                                keyFrameReachedFunc)
                    end
                end

                -------------------------------------------------------------------------------------------
                -------------------------------------------------------------------------------------------

                local toolAnimName = ""
                local toolOldAnimTrack = nil
                local toolAnimTrack = nil
                local currentToolAnimKeyframeHandler = nil

                local function toolKeyFrameReachedFunc(frameName)
                    if (frameName == "End") then
                        --		print("Keyframe : ".. frameName)
                        local repeatAnim = stopToolAnimations()
                        playToolAnimation(repeatAnim, 0.0, Humanoid)
                    end
                end

                function playToolAnimation(animName, transitionTime, humanoid)
                    if (animName ~= toolAnimName) then

                        if (toolAnimTrack ~= nil) then
                            toolAnimTrack:Stop()
                            toolAnimTrack:Destroy()
                            transitionTime = 0
                        end

                        local roll = math.random(1, animTable[animName]
                                                     .totalWeight)
                        local origRoll = roll
                        local idx = 1
                        while (roll > animTable[animName][idx].weight) do
                            roll = roll - animTable[animName][idx].weight
                            idx = idx + 1
                        end
                        --		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
                        local anim = animTable[animName][idx].anim

                        -- load it to the humanoid; get AnimationTrack
                        toolOldAnimTrack = toolAnimTrack
                        toolAnimTrack = humanoid:LoadAnimation(anim)

                        -- play the animation
                        toolAnimTrack:Play(transitionTime)
                        toolAnimName = animName

                        currentToolAnimKeyframeHandler =
                            toolAnimTrack.KeyframeReached:connect(
                                toolKeyFrameReachedFunc)
                    end
                end

                function stopToolAnimations()
                    local oldAnim = toolAnimName

                    if (currentToolAnimKeyframeHandler ~= nil) then
                        currentToolAnimKeyframeHandler:disconnect()
                    end

                    toolAnimName = ""
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
                    if speed > 0 then
                        playAnimation("walk", 0.1, Humanoid)
                        pose = "Running"
                    else
                        playAnimation("idle", 0.1, Humanoid)
                        pose = "Standing"
                    end
                end

                function onDied() pose = "Dead" end

                function onJumping()
                    playAnimation("jump", 0.1, Humanoid)
                    jumpAnimTime = jumpAnimDuration
                    pose = "Jumping"
                end

                function onClimbing()
                    playAnimation("climb", 0.1, Humanoid)
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

                function onPlatformStanding()
                    pose = "PlatformStanding"
                end

                function onSwimming(speed)
                    if speed > 0 then
                        pose = "Running"
                    else
                        pose = "Standing"
                    end
                end

                local function getTool()
                    for _, kid in ipairs(Figure:GetChildren()) do
                        if kid.className == "Tool" then
                            return kid
                        end
                    end
                    return nil
                end

                local function getToolAnim(tool)
                    for _, c in ipairs(tool:GetChildren()) do
                        if c.Name == "toolanim" and c.className == "StringValue" then
                            return c
                        end
                    end
                    return nil
                end

                local function animateTool()

                    if (toolAnim == "None") then
                        playToolAnimation("toolnone", toolTransitionTime,
                                          Humanoid)
                        return
                    end

                    if (toolAnim == "Slash") then
                        playToolAnimation("toolslash", 0, Humanoid)
                        return
                    end

                    if (toolAnim == "Lunge") then
                        playToolAnimation("toollunge", 0, Humanoid)
                        return
                    end
                end

                local function moveSit()
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
                        stopAllAnimations()
                        moveSit()
                        return
                    elseif (pose == "Running") then
                        playAnimation("walk", 0.1, Humanoid)
                    elseif (pose == "Dead" or pose == "GettingUp" or pose ==
                        "FallingDown" or pose == "Seated" or pose ==
                        "PlatformStanding") then
                        --		print("Wha " .. pose)
                        amplitude = 0.1
                        frequency = 1
                        setAngles = true
                    end

                    if (setAngles) then
                        local desiredAngle =
                            amplitude * math.sin(time * frequency)

                        RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
                        LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
                        RightHip:SetDesiredAngle(-desiredAngle)
                        LeftHip:SetDesiredAngle(-desiredAngle)
                    end

                    -- Tool Animation handling
                    local tool = getTool()
                    if tool then

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
                        toolAnimTime = 0
                    end
                end

                -- connect events
                Humanoid.Died:connect(onDied)
                Humanoid.Running:connect(onRunning)
                Humanoid.Jumping:connect(onJumping)
                Humanoid.Climbing:connect(onClimbing)
                Humanoid.GettingUp:connect(onGettingUp)
                Humanoid.FreeFalling:connect(onFreeFall)
                Humanoid.FallingDown:connect(onFallingDown)
                Humanoid.Seated:connect(onSeated)
                Humanoid.PlatformStanding:connect(onPlatformStanding)
                Humanoid.Swimming:connect(onSwimming)

                -- main program

                local runService = game:service("RunService");

                -- initialize to idle
                playAnimation("idle", 1, Humanoid)
                pose = "Standing"

                while Figure.Parent ~= nil do
                    local _, time = wait(1)
                    move(time)
                end
            end)
    end
    coroutine.wrap(IHVMURQ_fake_script)()
    local function ZPXIAAZ_fake_script() -- SpawnEasyControlNPC.LocalScript 
        local script = Instance.new('LocalScript', SpawnEasyControlNPC)

        script.Parent.MouseButton1Down:Connect(
            function()
                wait(1)
                game:GetService("RunService").Stepped:Connect(
                    function()
                        sethiddenproperty(game.Players.LocalPlayer,
                                          "MaximumSimulationRadius", math.huge)
                        sethiddenproperty(game.Players.LocalPlayer,
                                          "SimulationRadius", math.huge)
                    end)

                local Players = game:GetService('Players');
                local LP = Players['LocalPlayer'];
                Create = Instance.new
                local Char = game.Workspace.gay;
                local Torso, Root, Humanoid = Char['Torso'],
                                              Char['HumanoidRootPart'],
                                              Char:FindFirstChildOfClass(
                                                  'Humanoid')
                local TS, Heartbeat = game:GetService('TweenService'),
                                      game:GetService('RunService')['Heartbeat']

                settings().Physics['AllowSleep'] = false;
                sethiddenproperty(game.Players.LocalPlayer,
                                  "MaximumSimulationRadius", math.huge)
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",
                                  math.huge)

                local PoseToCF = function(Pose, Motor)
                    return
                        (Motor['Part0'].CFrame * Motor['C0'] * Pose['CFrame'] *
                            Motor['C1']:Inverse()):ToObjectSpace(
                            Motor['Part0'].CFrame)
                end

                local Joints = {
                    ['Torso'] = Root['RootJoint'],
                    ['Left Arm'] = Torso['Left Shoulder'],
                    ['Right Arm'] = Torso['Right Shoulder'],
                    ['Left Leg'] = Torso['Left Hip'],
                    ['Right Leg'] = Torso['Right Hip']
                }

                coroutine.wrap(function()
                    Char['HumanoidRootPart'].Anchored = true;
                    wait(.6)
                    Char['HumanoidRootPart'].Anchored = false;
                    Humanoid['Died']:Wait()
                    for K, V in next, Char:GetChildren() do
                        if not V:IsA('Humanoid') then
                            V:Destroy()
                        end
                    end
                end)()

                for K, V in next, Joints do
                    local AP, AO, A0, A1 = Create('AlignPosition', V['Part1']),
                                           Create('AlignOrientation', V['Part1']),
                                           Create('Attachment', V['Part1']),
                                           Create('Attachment', V['Part0'])
                    AP['RigidityEnabled'] = true;
                    AO['RigidityEnabled'] = true
                    AP['Attachment0'] = A0;
                    AP['Attachment1'] = A1;
                    AO['Attachment0'] = A0;
                    AO['Attachment1'] = A1;
                    A0['Name'] = 'CFAttachment';
                    A0['CFrame'] = V['C1'] * V['C0']:Inverse();
                    V:Remove()
                end

                local Edit = function(Part, Value, Duration, Style, Direction)
                    Style = Style or 'Enum.EasingStyle.Linear';
                    Direction = Direction or 'Enum.EasingDirection.In'
                    local Attachment = Part:FindFirstChild('CFAttachment')
                    if Attachment ~= nil then
                        TS:Create(Attachment,
                                  TweenInfo.new(Duration,
                                                Enum['EasingStyle'][tostring(
                                                    Style):split('.')[3]],
                                                Enum['EasingDirection'][tostring(
                                                    Direction):split('.')[3]],
                                                0, false, 0), {CFrame = Value})
                            :Play()
                    end
                end

                local PreloadAnimation =
                    function(AssetId)
                        local Sequence =
                            game:GetObjects('rbxassetid://' .. AssetId)[1];
                        assert(Sequence:IsA('KeyframeSequence'),
                               'Instance is not a KeyframeSequence')
                        local Keyframes, Poses = Sequence:GetKeyframes(), {};
                        local Yield = function(Seconds)
                            for I = 1, Seconds * 60 do
                                Heartbeat:Wait()
                            end
                        end
                        for I = 1, #Keyframes do
                            local K0, K1 = Keyframes[I - 1], Keyframes[I]
                            local Duration =
                                K0 ~= nil and K1['Time'] - K0['Time'] or 0;
                            for K, V in next, K1:GetDescendants() do
                                if V:IsA('Pose') and V['Name'] ~= 'Head' and
                                    V['Name'] ~= 'HumanoidRootPart' then
                                    local Args =
                                        {
                                            Char:FindFirstChild(V.Name),
                                            PoseToCF(V, Joints[V.Name]),
                                            Duration, V['EasingStyle'],
                                            V['EasingDirection'], K1['Time']
                                        }
                                    table.insert(Poses, Args)
                                end
                            end
                        end
                        local Track = {}
                        -- /* Class Functions/Events
                        Track['Finished'] = Instance.new('BindableEvent')
                        local Run = function()
                            for K, V in next, Poses do
                                coroutine.wrap(
                                    function()
                                        Yield(V[6])
                                        Edit(table.unpack(V))
                                    end)()
                            end
                            coroutine.wrap(
                                function()
                                    Yield(Poses[#Poses][6])
                                    Track.Finished:Fire()
                                end)()
                        end
                        Track['Play'] = function()
                            Run();
                            if Sequence['Loop'] ~= false then
                                repeat
                                    Track.Finished.Event:Wait();
                                    Run()
                                until Stopped or Humanoid['Health'] < 1
                            end
                        end
                        return Track
                    end

                local Anim = PreloadAnimation(0)

                Anim:Play()
                Anim.Finished.Event:Wait()
                wait(0.5)
                repeat
                    game:GetService('RunService').Stepped:Wait()
                    for i, v in pairs(
                                    game.Players.LocalPlayer.Character:GetChildren()) do
                        if v:IsA("Part") then
                            v.CanCollide = false
                        end
                    end
                until game.Players.LocalPlayer.Character.Humanoid.Health <= 0
            end)
    end
    coroutine.wrap(ZPXIAAZ_fake_script)()
    local function JLLWLZP_fake_script() -- FollowPlayer.LocalScript 
        local script = Instance.new('LocalScript', FollowPlayer)

        local toggle = false
        script.Parent.MouseButton1Down:Connect(
            function()
                script.Parent.Parent.Parent.Parent.Parent.Frame3.Visible = true
            end)

    end
    coroutine.wrap(JLLWLZP_fake_script)()
    local function UUFOHEA_fake_script() -- TextButton.LocalScript 
        local script = Instance.new('LocalScript', TextButton)

        local back = script.Parent.Parent.Frame
        local gay = back.ScrollingFrame

        local window = {count = 0, toggles = {}, closed = false}
        script.Parent.MouseButton1Click:connect(
            function()
                window.closed = not window.closed
                script.Parent.Text = (window.closed and "+" or "-")
                if script.Parent.Text == "+" then
                    back:TweenSize(UDim2.new(0, 461, 0, 0), "Out", "Sine", 1)
                    wait()
                    do gay.Visible = false end
                else
                    back:TweenSize(UDim2.new(0, 461, 0, 348), "Out", "Sine", 1)
                    wait(1)
                    do gay.Visible = true end
                end

            end)

    end
    coroutine.wrap(UUFOHEA_fake_script)()
    local function JBTT_fake_script() -- Frame2.LocalScript 
        local script = Instance.new('LocalScript', Frame2)

        local dragger = {};
        local resizer = {};

        do
            local mouse = game:GetService("Players").LocalPlayer:GetMouse();
            local inputService = game:GetService('UserInputService');
            local heartbeat = game:GetService("RunService").Heartbeat;
            -- // credits to Ririchi / Inori for this cute drag function :)
            function dragger.new(frame)
                local s, event = pcall(function()
                    return frame.MouseEnter
                end)

                if s then
                    frame.Active = true;

                    event:connect(function()
                        local input = frame.InputBegan:connect(
                                          function(key)
                                if key.UserInputType ==
                                    Enum.UserInputType.MouseButton1 then
                                    local objectPosition =
                                        Vector2.new(
                                            mouse.X - frame.AbsolutePosition.X,
                                            mouse.Y - frame.AbsolutePosition.Y);
                                    while heartbeat:wait() and
                                        inputService:IsMouseButtonPressed(
                                            Enum.UserInputType.MouseButton1) do
                                        frame:TweenPosition(
                                            UDim2.new(0, mouse.X -
                                                          objectPosition.X +
                                                          (frame.Size.X.Offset *
                                                              frame.AnchorPoint
                                                                  .X), 0,
                                                      mouse.Y - objectPosition.Y +
                                                          (frame.Size.Y.Offset *
                                                              frame.AnchorPoint
                                                                  .Y)), 'Out',
                                            'Quad', 0.1, true);
                                    end
                                end
                            end)

                        local leave;
                        leave = frame.MouseLeave:connect(
                                    function()
                                input:disconnect();
                                leave:disconnect();
                            end)
                    end)
                end
            end

            function resizer.new(p, s)
                p:GetPropertyChangedSignal('AbsoluteSize'):connect(
                    function()
                        s.Size = UDim2.new(s.Size.X.Scale, s.Size.X.Offset,
                                           s.Size.Y.Scale, p.AbsoluteSize.Y);
                    end)
            end
        end
        script.Parent.Active = true
        script.Parent.Draggable = true
    end
    coroutine.wrap(JBTT_fake_script)()
    local function MSML_fake_script() -- TextButton_2.LocalScript 
        local script = Instance.new('LocalScript', TextButton_2)

        script.Parent.MouseButton1Down:Connect(
            function() script.Parent.Parent.Visible = false end)
    end
    coroutine.wrap(MSML_fake_script)()
    local function NCUDEV_fake_script() -- PlayAnimation.LocalScript 
        local script = Instance.new('LocalScript', PlayAnimation)

        script.Parent.MouseButton1Down:Connect(
            function()
                game:GetService("RunService").Stepped:Connect(
                    function()
                        sethiddenproperty(game.Players.LocalPlayer,
                                          "MaximumSimulationRadius", math.huge)
                        sethiddenproperty(game.Players.LocalPlayer,
                                          "SimulationRadius", math.huge)
                    end)

                local Players = game:GetService('Players');
                local LP = Players['LocalPlayer'];
                Create = Instance.new
                local Char = game.Workspace.gay;
                local Torso, Root, Humanoid = Char['Torso'],
                                              Char['HumanoidRootPart'],
                                              Char:FindFirstChildOfClass(
                                                  'Humanoid')
                local TS, Heartbeat = game:GetService('TweenService'),
                                      game:GetService('RunService')['Heartbeat']

                settings().Physics['AllowSleep'] = false;
                sethiddenproperty(game.Players.LocalPlayer,
                                  "MaximumSimulationRadius", math.huge)
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",
                                  math.huge)

                local PoseToCF = function(Pose, Motor)
                    return
                        (Motor['Part0'].CFrame * Motor['C0'] * Pose['CFrame'] *
                            Motor['C1']:Inverse()):ToObjectSpace(
                            Motor['Part0'].CFrame)
                end

                local Joints = {
                    ['Torso'] = Root['RootJoint'],
                    ['Left Arm'] = Torso['Left Shoulder'],
                    ['Right Arm'] = Torso['Right Shoulder'],
                    ['Left Leg'] = Torso['Left Hip'],
                    ['Right Leg'] = Torso['Right Hip']
                }

                coroutine.wrap(function()
                    Char['HumanoidRootPart'].Anchored = true;
                    wait(.6)
                    Char['HumanoidRootPart'].Anchored = false;
                    Humanoid['Died']:Wait()
                    for K, V in next, Char:GetChildren() do
                        if not V:IsA('Humanoid') then
                            V:Destroy()
                        end
                    end
                end)()

                for K, V in next, Joints do
                    local AP, AO, A0, A1 = Create('AlignPosition', V['Part1']),
                                           Create('AlignOrientation', V['Part1']),
                                           Create('Attachment', V['Part1']),
                                           Create('Attachment', V['Part0'])
                    AP['RigidityEnabled'] = true;
                    AO['RigidityEnabled'] = true
                    AP['Attachment0'] = A0;
                    AP['Attachment1'] = A1;
                    AO['Attachment0'] = A0;
                    AO['Attachment1'] = A1;
                    A0['Name'] = 'CFAttachment';
                    A0['CFrame'] = V['C1'] * V['C0']:Inverse();
                    V:Remove()
                end

                local Edit = function(Part, Value, Duration, Style, Direction)
                    Style = Style or 'Enum.EasingStyle.Linear';
                    Direction = Direction or 'Enum.EasingDirection.In'
                    local Attachment = Part:FindFirstChild('CFAttachment')
                    if Attachment ~= nil then
                        TS:Create(Attachment,
                                  TweenInfo.new(Duration,
                                                Enum['EasingStyle'][tostring(
                                                    Style):split('.')[3]],
                                                Enum['EasingDirection'][tostring(
                                                    Direction):split('.')[3]],
                                                0, false, 0), {CFrame = Value})
                            :Play()
                    end
                end

                local PreloadAnimation =
                    function(AssetId)
                        local Sequence =
                            game:GetObjects('rbxassetid://' .. AssetId)[1];
                        assert(Sequence:IsA('KeyframeSequence'),
                               'Instance is not a KeyframeSequence')
                        local Keyframes, Poses = Sequence:GetKeyframes(), {};
                        local Yield = function(Seconds)
                            for I = 1, Seconds * 60 do
                                Heartbeat:Wait()
                            end
                        end
                        for I = 1, #Keyframes do
                            local K0, K1 = Keyframes[I - 1], Keyframes[I]
                            local Duration =
                                K0 ~= nil and K1['Time'] - K0['Time'] or 0;
                            for K, V in next, K1:GetDescendants() do
                                if V:IsA('Pose') and V['Name'] ~= 'Head' and
                                    V['Name'] ~= 'HumanoidRootPart' then
                                    local Args =
                                        {
                                            Char:FindFirstChild(V.Name),
                                            PoseToCF(V, Joints[V.Name]),
                                            Duration, V['EasingStyle'],
                                            V['EasingDirection'], K1['Time']
                                        }
                                    table.insert(Poses, Args)
                                end
                            end
                        end
                        local Track = {}
                        -- /* Class Functions/Events
                        Track['Finished'] = Instance.new('BindableEvent')
                        local Run = function()
                            for K, V in next, Poses do
                                coroutine.wrap(
                                    function()
                                        Yield(V[6])
                                        Edit(table.unpack(V))
                                    end)()
                            end
                            coroutine.wrap(
                                function()
                                    Yield(Poses[#Poses][6])
                                    Track.Finished:Fire()
                                end)()
                        end
                        Track['Play'] = function()
                            Run();
                            if Sequence['Loop'] ~= false then
                                repeat
                                    Track.Finished.Event:Wait();
                                    Run()
                                until Stopped or Humanoid['Health'] < 1
                            end
                        end
                        return Track
                    end

                local Anim = PreloadAnimation(script.Parent.Parent.TextBox.Text)

                Anim:Play()
                Anim.Finished.Event:Wait()
                wait(0.5)
                repeat
                    game:GetService('RunService').Stepped:Wait()
                    for i, v in pairs(
                                    game.Players.LocalPlayer.Character:GetChildren()) do
                        if v:IsA("Part") then
                            v.CanCollide = false
                        end
                    end
                until game.Players.LocalPlayer.Character.Humanoid.Health <= 0
            end)
    end
    coroutine.wrap(NCUDEV_fake_script)()
    local function PCKJD_fake_script() -- Frame3.LocalScript 
        local script = Instance.new('LocalScript', Frame3)

        local dragger = {};
        local resizer = {};

        do
            local mouse = game:GetService("Players").LocalPlayer:GetMouse();
            local inputService = game:GetService('UserInputService');
            local heartbeat = game:GetService("RunService").Heartbeat;
            -- // credits to Ririchi / Inori for this cute drag function :)
            function dragger.new(frame)
                local s, event = pcall(function()
                    return frame.MouseEnter
                end)

                if s then
                    frame.Active = true;

                    event:connect(function()
                        local input = frame.InputBegan:connect(
                                          function(key)
                                if key.UserInputType ==
                                    Enum.UserInputType.MouseButton1 then
                                    local objectPosition =
                                        Vector2.new(
                                            mouse.X - frame.AbsolutePosition.X,
                                            mouse.Y - frame.AbsolutePosition.Y);
                                    while heartbeat:wait() and
                                        inputService:IsMouseButtonPressed(
                                            Enum.UserInputType.MouseButton1) do
                                        frame:TweenPosition(
                                            UDim2.new(0, mouse.X -
                                                          objectPosition.X +
                                                          (frame.Size.X.Offset *
                                                              frame.AnchorPoint
                                                                  .X), 0,
                                                      mouse.Y - objectPosition.Y +
                                                          (frame.Size.Y.Offset *
                                                              frame.AnchorPoint
                                                                  .Y)), 'Out',
                                            'Quad', 0.1, true);
                                    end
                                end
                            end)

                        local leave;
                        leave = frame.MouseLeave:connect(
                                    function()
                                input:disconnect();
                                leave:disconnect();
                            end)
                    end)
                end
            end

            function resizer.new(p, s)
                p:GetPropertyChangedSignal('AbsoluteSize'):connect(
                    function()
                        s.Size = UDim2.new(s.Size.X.Scale, s.Size.X.Offset,
                                           s.Size.Y.Scale, p.AbsoluteSize.Y);
                    end)
            end
        end
        script.Parent.Active = true
        script.Parent.Draggable = true
    end
    coroutine.wrap(PCKJD_fake_script)()
    local function YHWX_fake_script() -- TextButton_3.LocalScript 
        local script = Instance.new('LocalScript', TextButton_3)

        script.Parent.MouseButton1Down:Connect(
            function() script.Parent.Parent.Visible = false end)
    end
    coroutine.wrap(YHWX_fake_script)()
    local function EMFGJKS_fake_script() -- Follow.LocalScript 
        local script = Instance.new('LocalScript', Follow)

        script.Parent.MouseButton1Down:Connect(
            function()
                local oof = script.Parent.Parent.TextBox.Text
                if script.Parent.Text == "Follow" then
                    script.Parent.Text = "Unfollow"
                    repeat
                        wait(math.random(1, 5))
                        local target = game.Players:FindFirstChild(oof)
                                           .Character.HumanoidRootPart
                        if target ~= nil then
                            game.Workspace.gay.Humanoid:MoveTo(target.Position,
                                                               target)
                        end
                    until script.Parent.Text == "Follow"
                elseif script.Parent.Text == "Unfollow" then
                    script.Parent.Text = "Follow"
                end
            end)

    end
    coroutine.wrap(EMFGJKS_fake_script)()
end)

PP.Name = "PP"
PP.Parent = Scripts
PP.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
PP.BorderColor3 = Color3.fromRGB(27, 42, 53)
PP.BorderSizePixel = 0
PP.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
PP.Size = UDim2.new(0, 85, 0, 32)
PP.Font = Enum.Font.SourceSansItalic
PP.Text = "PP"
PP.TextColor3 = Color3.fromRGB(0, 0, 0)
PP.TextSize = 30.000
PP.TextWrapped = true
PP.MouseButton1Down:connect(function()
    for i, v in pairs(
                    game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if v:IsA("Accessory") then print(v) end
    end

    -- Just prints hats your wearing in console incase u wanted to change hats^

    local unanchoredparts = {}
    local movers = {}
    local tog = true
    local move = false
    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character
    local mov = {};
    local mov2 = {};

    local tip = "Mushroom" -- press f9 and find the hat that looks like a heads name and put it here
    local x = -0.011 -- Edit Position for head n +left and -Right
    local y = -0.587 -- Edit Position for head up and down
    local z = -3.234 -- Edit Position for head x3

    local Hats = {
        pp = Character:WaitForChild("Pal Hair"),
        ball1 = Character:WaitForChild("InternationalFedora"),
        ball2 = Character:WaitForChild("MeshPartAccessory")
    }

    -- Dont touch below

    for i, v in next, Hats do
        v.Handle.AccessoryWeld:Remove()
        for _, mesh in next, v:GetDescendants() do
            if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                mesh:Remove()
            end
        end
    end
    local Network = coroutine.create(function()
        while true do
            game:GetService("RunService").Heartbeat:Wait()
            settings().Physics.AllowSleep = false
            sethiddenproperty(game.Players.LocalPlayer,
                              "MaximumSimulationRadius", math.huge)
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",
                              math.huge)
        end
    end)
    coroutine.resume(Network)

    function ftp(str)
        local pt = {};
        if str ~= 'me' and str ~= 'random' then
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Name:lower():find(str:lower()) then
                    table.insert(pt, v);
                end
            end
        elseif str == 'me' then
            table.insert(pt, plr);
        elseif str == 'random' then
            table.insert(pt, game.Players:GetPlayers()[math.random(1,
                                                                   #game.Players:GetPlayers())]);
        end
        return pt;
    end

    local function align(i, v)
        local att0 = Instance.new("Attachment", i)
        att0.Position = Vector3.new(0, 0, 0)
        local att1 = Instance.new("Attachment", v)
        att1.Position = Vector3.new(0, 0, 0)
        local AP = Instance.new("AlignPosition", i)
        AP.Attachment0 = att0
        AP.Attachment1 = att1
        AP.RigidityEnabled = false
        AP.ReactionForceEnabled = false
        AP.ApplyAtCenterOfMass = true
        AP.MaxForce = 9999999
        AP.MaxVelocity = math.huge
        AP.Responsiveness = 65
        local AO = Instance.new("AlignOrientation", i)
        AO.Attachment0 = att0
        AO.Attachment1 = att1
        AO.ReactionTorqueEnabled = true
        AO.PrimaryAxisOnly = false
        AO.MaxTorque = 9999999
        AO.MaxAngularVelocity = math.huge
        AO.Responsiveness = 50
    end

    -- Dont touch above

    align(Hats.pp.Handle, Character["Torso"])
    align(Hats.ball1.Handle, Character["Torso"])
    align(Hats.ball2.Handle, Character["Torso"])

    Hats.pp.Handle.Attachment.Rotation = Vector3.new(-11.21, 0, 0)
    Hats.ball1.Handle.Attachment.Rotation = Vector3.new(-8.27, 0, 0)
    Hats.ball2.Handle.Attachment.Rotation = Vector3.new(-8.27, 0, 0)

    -- Attachmment1 is the 1st hat u put in Hats at the top. it goes in order

    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment1"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment2"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment3"

    Character:WaitForChild("Torso").Attachment1.Position =
        Vector3.new(-0, -0.898, -1.519)
    Character:WaitForChild("Torso").Attachment2.Position =
        Vector3.new(0.542, -1.34, -0.746)
    Character:WaitForChild("Torso").Attachment3.Position =
        Vector3.new(-0.582, -1.34, -0.746)

    Character:WaitForChild(tip).Handle.AccessoryWeld:Remove()
    local alignpos = Instance.new("AlignPosition", Character)
    local alignorien = Instance.new("AlignOrientation", Character)
    local att1 = Instance.new("Attachment", Character:WaitForChild(tip).Handle)
    local att2 = Instance.new("Attachment", Character:WaitForChild("Torso"))
    alignpos.Attachment0 = att1
    alignpos.Attachment1 = att2
    alignpos.RigidityEnabled = false
    alignpos.ReactionForceEnabled = false
    alignpos.ApplyAtCenterOfMass = true
    alignpos.MaxForce = 99999999
    alignpos.MaxVelocity = math.huge
    alignpos.Responsiveness = 65
    alignorien.Attachment0 = att1
    alignorien.Attachment1 = att2
    alignorien.ReactionTorqueEnabled = true
    alignorien.PrimaryAxisOnly = false
    alignorien.MaxTorque = 99999999
    alignorien.MaxAngularVelocity = math.huge
    alignorien.Responsiveness = 50
    att2.Position = Vector3.new(x, y, z)
    att2.Rotation = Vector3.new(-78.79, 0, 0)
end)

Plane.Name = "Plane"
Plane.Parent = Scripts
Plane.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
Plane.BorderColor3 = Color3.fromRGB(27, 42, 53)
Plane.BorderSizePixel = 0
Plane.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
Plane.Size = UDim2.new(0, 85, 0, 32)
Plane.Font = Enum.Font.SourceSansItalic
Plane.Text = "Plane"
Plane.TextColor3 = Color3.fromRGB(0, 0, 0)
Plane.TextSize = 30.000
Plane.TextWrapped = true
Plane.MouseButton1Down:connect(function()
    game.Players.LocalPlayer.Character["Right Arm"]:Destroy()
    game.Players.LocalPlayer.Character["Left Arm"]:Destroy()
    game.Players.LocalPlayer.Character["Right Leg"]:Destroy()
    game.Players.LocalPlayer.Character["Left Leg"]:Destroy()

    local unanchoredparts = {}
    local movers = {}
    local tog = true
    local move = false
    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character
    local mov = {};
    local mov2 = {};

    Character.Humanoid.HipHeight = 4
    Character.Humanoid.WalkSpeed = 16

    local pro = "HeliHat" -- press f9 and find the hat that looks like a heads name and put it here
    local x = 0 -- Edit Position for head n +left and -Right
    local y = 0 -- Edit Position for head up and down
    local z = 0 -- Edit Position for head x3

    local Hats = {
        base = Character:WaitForChild("MeshPartAccessory"),
        wing1 = Character:WaitForChild("Da Vinci's Wings"),
        fire = Character:WaitForChild("FireMohawk"),
        top = Character:WaitForChild("InvisibleEgg")
    }

    -- Dont touch below

    for i, v in next, Hats do
        v.Handle.AccessoryWeld:Remove()
        for _, mesh in next, v:GetDescendants() do
            if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                mesh:Remove()
            end
        end
    end

    function ftp(str)
        local pt = {};
        if str ~= 'me' and str ~= 'random' then
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Name:lower():find(str:lower()) then
                    table.insert(pt, v);
                end
            end
        elseif str == 'me' then
            table.insert(pt, plr);
        elseif str == 'random' then
            table.insert(pt, game.Players:GetPlayers()[math.random(1,
                                                                   #game.Players:GetPlayers())]);
        end
        return pt;
    end

    local function align(i, v)
        local att0 = Instance.new("Attachment", i)
        att0.Position = Vector3.new(0, 0, 0)
        local att1 = Instance.new("Attachment", v)
        att1.Position = Vector3.new(0, 0, 0)
        local AP = Instance.new("AlignPosition", i)
        AP.Attachment0 = att0
        AP.Attachment1 = att1
        AP.RigidityEnabled = false
        AP.ReactionForceEnabled = false
        AP.ApplyAtCenterOfMass = true
        AP.MaxForce = 9999999
        AP.MaxVelocity = math.huge
        AP.Responsiveness = 100
        local AO = Instance.new("AlignOrientation", i)
        AO.Attachment0 = att0
        AO.Attachment1 = att1
        AO.ReactionTorqueEnabled = false
        AO.PrimaryAxisOnly = false
        AO.MaxTorque = 9999999
        AO.MaxAngularVelocity = math.huge
        AO.Responsiveness = 50
    end

    -- Dont touch above

    align(Hats.base.Handle, Character["Torso"])
    align(Hats.wing1.Handle, Character["Torso"])
    align(Hats.fire.Handle, Character["Torso"])
    align(Hats.top.Handle, Character["Torso"])
    Hats.base.Handle.Attachment.Rotation = Vector3.new(0, 0, 0) -- Rotation for the hats
    Hats.wing1.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
    Hats.fire.Handle.Attachment.Rotation = Vector3.new(-90, 0, 0)
    Hats.top.Handle.Attachment.Rotation = Vector3.new(45, 0, 0)

    -- Attachmment1 is the 1st hat u put in Hats at the top. it goes in order

    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment1"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment2"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment3"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment4"

    Character:WaitForChild("Torso").Attachment1.Position =
        Vector3.new(0, -0.3, 0) -- Position of the hats
    Character:WaitForChild("Torso").Attachment2.Position =
        Vector3.new(0, -0.3, 0)
    Character:WaitForChild("Torso").Attachment3.Position =
        Vector3.new(0, -0.3, 2.3)
    Character:WaitForChild("Torso").Attachment4.Position =
        Vector3.new(0, 1.3, 0)

    Character:WaitForChild(pro).Handle.AccessoryWeld:Remove()
    local alignpos = Instance.new("AlignPosition", Character)
    local alignorien = Instance.new("AlignOrientation", Character)
    local att1 = Instance.new("Attachment", Character:WaitForChild(pro).Handle)
    local att2 = Instance.new("Attachment", Character:WaitForChild("Head"))
    alignpos.Attachment0 = att1
    alignpos.Attachment1 = att2
    alignpos.RigidityEnabled = false
    alignpos.ReactionForceEnabled = false
    alignpos.ApplyAtCenterOfMass = true
    alignpos.MaxForce = 99999999
    alignpos.MaxVelocity = math.huge
    alignpos.Responsiveness = 65
    alignorien.Attachment0 = att1
    alignorien.Attachment1 = att2
    alignorien.ReactionTorqueEnabled = false
    alignorien.PrimaryAxisOnly = false
    alignorien.MaxTorque = 99999999
    alignorien.MaxAngularVelocity = math.huge
    alignorien.Responsiveness = 50
    att2.Position = Vector3.new(x, -1.5, -3.2)
    att2.Rotation = Vector3.new(-90, 0, 0)

    repeat wait() until game.Players.LocalPlayer and
        game.Players.LocalPlayer.Character and
        game.Players.LocalPlayer.Character:findFirstChild("Head") and
        game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
    local mouse = game.Players.LocalPlayer:GetMouse()
    repeat wait() until mouse
    local plr = game.Players.LocalPlayer
    local torso = plr.Character.Head
    local flying = false
    local deb = true
    local ctrl = {f = 0, b = 0, l = 0, r = 0}
    local lastctrl = {f = 0, b = 0, l = 0, r = 0}
    local maxspeed = 1000
    local speed = 5000

    function Fly()
        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0, 0.1, 0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        repeat
            wait()
            plr.Character.Humanoid.PlatformStand = true
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed + .5 + (speed / maxspeed)
                if speed > maxspeed then speed = maxspeed end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~=
                0 then
                speed = speed - 2
                if speed < 0 then speed = 0 end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame
                                  .lookVector * (ctrl.f + ctrl.b)) +
                                  ((game.Workspace.CurrentCamera.CoordinateFrame *
                                      CFrame.new(ctrl.l + ctrl.r,
                                                 (ctrl.f + ctrl.b) * .2, 0).p) -
                                      game.Workspace.CurrentCamera
                                          .CoordinateFrame.p)) * speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~=
                0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame
                                  .lookVector * (lastctrl.f + lastctrl.b)) +
                                  ((game.Workspace.CurrentCamera.CoordinateFrame *
                                      CFrame.new(lastctrl.l + lastctrl.r,
                                                 (lastctrl.f + lastctrl.b) * .2,
                                                 0).p) -
                                      game.Workspace.CurrentCamera
                                          .CoordinateFrame.p)) * speed
            else
                bv.velocity = Vector3.new(0, 0.1, 0)
            end
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame *
                            CFrame.Angles(
                                -math.rad(
                                    (ctrl.f + ctrl.b) * 50 * speed / maxspeed),
                                0, 0)
        until not flying
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
    end
    mouse.KeyDown:connect(function(key)
        if key:lower() == "e" then
            if flying then
                flying = false
            else
                flying = true
                Fly()
            end
        elseif key:lower() == "w" then
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
    Fly()

    sphere = Character:WaitForChild("Head").Attachment
    a = 0
    repeat
        sphere.Rotation = Vector3.new(-90, a, 0)
        wait(.01)
        a = a + 30
    until pigs == 1
end)

Bike.Name = "Bike"
Bike.Parent = Scripts
Bike.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
Bike.BorderColor3 = Color3.fromRGB(27, 42, 53)
Bike.BorderSizePixel = 0
Bike.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
Bike.Size = UDim2.new(0, 85, 0, 32)
Bike.Font = Enum.Font.SourceSansItalic
Bike.Text = "Bike"
Bike.TextColor3 = Color3.fromRGB(0, 0, 0)
Bike.TextSize = 30.000
Bike.TextWrapped = true
Bike.MouseButton1Down:connect(function()

    local NetworkAccess = coroutine.create(
                              function()
            settings().Physics.AllowSleep = false
            while true do
                game:GetService("RunService").RenderStepped:Wait()
                game:GetService("Players").LocalPlayer.ReplicationFocus =
                    workspace
                game:GetService("Players").LocalPlayer.MaximumSimulationRadius =
                    math.pow(math.huge, math.huge)
                sethiddenproperty(game:GetService("Players").LocalPlayer,
                                  "SimulationRadius", math.huge * math.huge)
            end
        end)
    coroutine.resume(NetworkAccess)

    plr = game.Players.LocalPlayer
    char = plr.Character
    torso = char.Torso
    local lol = Instance.new("Part")
    lol.Parent = char
    lol.Name = "lol"
    lol.CanCollide = true
    lol.Transparency = 1
    lol.Size = Vector3.new(2, 2.9, 2)

    function Align(Part1, Part0, Position, Angle, name)
        local AlignPos = Instance.new("AlignPosition", Part1)
        AlignPos.Parent.CanCollide = false
        AlignPos.ApplyAtCenterOfMass = true
        AlignPos.MaxForce = 67752
        AlignPos.MaxVelocity = math.huge / 9e110
        AlignPos.ReactionForceEnabled = false
        AlignPos.Responsiveness = 200
        AlignPos.RigidityEnabled = false
        local AlignOrient = Instance.new("AlignOrientation", Part1)
        AlignOrient.MaxAngularVelocity = math.huge / 9e110
        AlignOrient.MaxTorque = 67752
        AlignOrient.PrimaryAxisOnly = false
        AlignOrient.ReactionTorqueEnabled = false
        AlignOrient.Responsiveness = 200
        AlignOrient.RigidityEnabled = false
        local AttachmentA = Instance.new("Attachment", Part1)
        local AttachmentB = Instance.new("Attachment", Part0)
        AttachmentB.Orientation = Angle
        AttachmentB.Position = Position
        AttachmentB.Name = name
        AlignPos.Attachment0 = AttachmentA
        AlignPos.Attachment1 = AttachmentB
        AlignOrient.Attachment0 = AttachmentA
        AlignOrient.Attachment1 = AttachmentB
    end

    bike = char["Bike"]
    bhandle = bike.Handle
    bhandle.AccessoryWeld:Destroy()

    fire = char["FireMohawk"]
    fhandle = fire.Handle
    fhandle.AccessoryWeld:Destroy()
    fhandle.Mesh:Destroy()

    h = Instance.new("Attachment", bhandle)
    h.Rotation = Vector3.new(0, 0, 0)
    h.Position = Vector3.new(0, 0, 0)

    lg = Instance.new("Attachment", torso)
    lg.Rotation = Vector3.new(0, 90, 0)
    lg.Position = Vector3.new(-0, -1.35, -1)

    gap = Instance.new("AlignPosition", bhandle)
    gap.Attachment0 = h
    gap.Attachment1 = lg
    gap.RigidityEnabled = true

    gao = Instance.new("AlignOrientation", bhandle)
    gao.Attachment0 = h
    gao.Attachment1 = lg
    gao.RigidityEnabled = true

    a = Instance.new("Attachment", fhandle)
    a.Rotation = Vector3.new(0, 0, 0)
    a.Position = Vector3.new(0, 0, 0)

    a1 = Instance.new("Attachment", torso)
    a1.Rotation = Vector3.new(90, 0, 0)
    a1.Position = Vector3.new(0, -1.94, -0.46)

    a2 = Instance.new("AlignPosition", fhandle)
    a2.Attachment0 = a
    a2.Attachment1 = a1
    a2.RigidityEnabled = true

    a3 = Instance.new("AlignOrientation", fhandle)
    a3.Attachment0 = a
    a3.Attachment1 = a1
    a3.RigidityEnabled = true

    game.Players.LocalPlayer.Character.Torso["Right Shoulder"]:Destroy()
    game.Players.LocalPlayer.Character.Torso["Left Shoulder"]:Destroy()
    game.Players.LocalPlayer.Character.Torso["Right Hip"]:Destroy()
    game.Players.LocalPlayer.Character.Torso["Left Hip"]:Destroy()
    Align(game.Players.LocalPlayer.Character["Left Arm"],
          game.Players.LocalPlayer.Character.Torso,
          Vector3.new(-1.243, 0.195, -0.793), Vector3.new(74.51, 0, 8.28),
          "Left")
    Align(game.Players.LocalPlayer.Character["Right Arm"],
          game.Players.LocalPlayer.Character.Torso,
          Vector3.new(1.243, 0.195, -0.793), Vector3.new(74.51, 0, -8.28),
          "Right")
    Align(game.Players.LocalPlayer.Character["Right Leg"],
          game.Players.LocalPlayer.Character.Torso,
          Vector3.new(0.82, -1.532, -0.518), Vector3.new(9.89, 0, 0), "Right")
    Align(game.Players.LocalPlayer.Character["Left Leg"],
          game.Players.LocalPlayer.Character.Torso,
          Vector3.new(-0.82, -1.532, -0.518), Vector3.new(9.89, 0, 0), "Left")

    function WaitForChild(parent, child)
        while not parent:FindFirstChild(child) do
            print("roped waiting for " .. child)
            wait()
        end
        return parent[child]
    end

    local handle = game.Players.LocalPlayer:FindFirstChild("Torso")

    local left = false
    local right = false
    local up = false
    local down = false
    local mouse
    local Character
    local key_down_connect
    local key_up_connect

    local thrustForce
    local thrustMagnitude
    local thrustDirection
    local RotationForce
    local TurnGyro

    local torsoWeld

    local acceleration = 10
    local deceleration = 10
    local turnAlpha = .35
    local alphaDampening = .2

    local Equipped = false

    local LastPosition = nil
    local ActualVelocity = Vector3.new(0, 0, 0)

    local FakeHandle = nil

    local WheelMesh = Instance.new('SpecialMesh')
    WheelMesh.MeshId = "http://www.roblox.com/asset/?id=122202439"
    WheelMesh.TextureId = "http://www.roblox.com/asset/?id=122185866"
    WheelMesh.Scale = Vector3.new(2.5, 2.5, 2.5)

    local LightWeld = nil

    local FrontMotor = nil
    local BackMotor = nil

    local CurrentSpeed = 0
    local turnSpeed = 0
    local turnSpeedAim = 5
    function ThrustUpdater()
        while Equipped do
            local direction = Character:FindFirstChild("Torso").CFrame
                                  .lookVector
            direction = Vector3.new(direction.x, 0, direction.z).unit
            thrustForce.velocity = direction * (CurrentSpeed)

            if FrontMotor then
                FrontMotor.DesiredAngle =
                    (999999999) * (-CurrentSpeed / math.abs(CurrentSpeed))
                FrontMotor.MaxVelocity = CurrentSpeed / 250
                if BackMotor then
                    BackMotor.DesiredAngle = FrontMotor.DesiredAngle
                    BackMotor.MaxVelocity = FrontMotor.MaxVelocity
                end
            end

            RotationForce.angularvelocity = Vector3.new(0, turnSpeed, 0)
            if math.abs(turnSpeed) > alphaDampening then
                turnSpeed = turnSpeed -
                                ((alphaDampening) *
                                    (math.abs(turnSpeed) / turnSpeed))
            else
                turnSpeed = 0
            end
            local leanAmount = -turnSpeed * (math.pi / 6) / 4

            if not forwards or back then
                CurrentSpeed = CurrentSpeed * .99
            end

            local xzAngle = math.atan2(Character.Torso.CFrame.lookVector.z, 0,
                                       Character.Torso.CFrame.lookVector.x)
            TurnGyro.cframe = CFrame.Angles(leanAmount * direction.x, 0,
                                            leanAmount * direction.z)
            if LastPosition then
                local npos = Vector3.new(Character.Torso.CFrame.p.x, 0,
                                         Character.Torso.CFrame.p.z)
                -- (npos-LastPosition).magnitude
                local myspeed = Vector3.new(FakeHandle.Velocity.X, 0,
                                            FakeHandle.Velocity.Z).magnitude
                local velocityDifference =
                    math.abs((myspeed - (thrustForce.velocity.magnitude)))
                if myspeed > 3 and thrustForce.velocity.magnitude > 3 and
                    velocityDifference > .7 * thrustForce.velocity.magnitude then
                    print('stopping: ' .. myspeed .. " : " ..
                              thrustForce.velocity.magnitude)
                    CurrentSpeed = CurrentSpeed * .9
                end

            end
            LastPosition = Vector3.new(Character.Torso.CFrame.p.x, 0,
                                       Character.Torso.CFrame.p.z)
            wait(1 / 60)
        end

    end

    function onEquipped(nmouse)
        print('got to equipped')
        Spawn(function()
            if Equipped then return end

            Character = game.Players.LocalPlayer.Character
            local myTorso = WaitForChild(Character, 'Torso')
            if not FakeHandle then FakeHandle = handle end
            handle.Transparency = 0

            CurrentSpeed = 0
            turnSpeed = 0
            print('got in if')
            mouse = game.Players.LocalPlayer:GetMouse()
            Equipped = true

            WaitForChild(Character, 'Humanoid').PlatformStand = true

            if RotationForce then RotationForce:Destroy() end
            RotationForce = Instance.new('BodyAngularVelocity')
            RotationForce.maxTorque = Vector3.new(0, math.huge, 0)
            RotationForce.angularvelocity = Vector3.new(0, 0, 0)
            RotationForce.Parent = myTorso

            if thrustForce then thrustForce:Destroy() end
            thrustForce = Instance.new('BodyVelocity')
            thrustForce.maxForce = Vector3.new(math.huge, 0, math.huge)
            thrustForce.velocity = Vector3.new(0, 0, 0)
            thrustForce.P = 100
            thrustForce.Parent = FakeHandle -- myTorso

            if TurnGyro then TurnGyro:Destroy() end
            TurnGyro = Instance.new('BodyGyro')
            TurnGyro.maxTorque = Vector3.new(5000, 0, 5000)
            TurnGyro.P = 300
            TurnGyro.D = 100
            TurnGyro.Parent = myTorso

            Spawn(ThrustUpdater)
            Spawn(function()

                myTorso.Anchored = true
                myTorso.CFrame = myTorso.CFrame + Vector3.new(0, 3, 0)

                if torsoWeld then torsoWeld:Destroy() end
                torsoWeld = Instance.new('Weld')
                torsoWeld.C0 = CFrame.Angles(0, 0, 0) +
                                   Vector3.new(0, -1.6, -0.7)
                torsoWeld.Part0 = myTorso
                torsoWeld.Part1 = lol
                torsoWeld.Parent = lol
                lol.CanCollide = true

                wait(.1)
                lol.CanCollide = true
                myTorso.Anchored = false
            end)

            if key_down_connect then
                key_down_connect:disconnect()
                key_up_connect:disconnect()
            end
            key_down_connect = mouse.KeyDown:connect(keyDownFunc)
            key_up_connect = mouse.KeyUp:connect(keyUpFunc)

            Character.Humanoid.WalkSpeed = 0
            -- end
        end)
    end

    function keyUpFunc(key)
        if key == nil then return end
        local key = key:lower()
        if key == "w" then
            forwards = false
        elseif key == "a" then
            left = false
        elseif key == "s" then
            back = false
        elseif key == "d" then
            right = false
        end
    end
    local LastSpace = tick()
    function keyDownFunc(key)
        if key == nil then return end
        if inIntro then return end
        local key = key:lower()
        if key == "w" then
            forwards = true
            while forwards do
                CurrentSpeed = math.min(70, CurrentSpeed +
                                            (acceleration * (1 / 30)))
                wait(1 / 30)
            end
        elseif key == "a" then
            left = true
            while left do
                turnSpeed = math.min(5, turnSpeed + (turnAlpha))
                wait(1 / 30)
            end
        elseif key == "s" then
            back = true
            while back do
                if CurrentSpeed > 0 then
                    CurrentSpeed = math.max(-20, CurrentSpeed -
                                                (deceleration * 2.8 * (1 / 30)))
                else
                    CurrentSpeed = math.max(-20, CurrentSpeed -
                                                (deceleration * (1 / 30)))
                end
                wait(1 / 30)
            end
        elseif key == "d" then
            right = true

            while right do
                turnSpeed = math.max(-5, turnSpeed - (turnAlpha))
                wait(1 / 30)
            end
        elseif key == ' ' then
            if tick() - LastSpace > 1.9 then
                LastSpace = tick()
                local bforce = Instance.new('BodyForce')
                bforce.force = Vector3.new(0, 10000, 0)
                bforce.Parent = FakeHandle
                wait(.1)
                bforce:Destroy()
            end
        elseif key == "c" then
            game.Workspace.CurrentCamera.CameraSubject =
                game.Players.LocalPlayer.Character.Humanoid
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
        elseif key == "x" then
            game.Workspace.CurrentCamera.CameraSubject =
                game.Players.LocalPlayer.Humanoid
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
        print(("The '%s' key was pressed"):format(key))
    end

    onEquipped()
end)

_911Plane.Name = "911 Plane"
_911Plane.Parent = Scripts
_911Plane.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
_911Plane.BorderColor3 = Color3.fromRGB(27, 42, 53)
_911Plane.BorderSizePixel = 0
_911Plane.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
_911Plane.Size = UDim2.new(0, 85, 0, 32)
_911Plane.Font = Enum.Font.SourceSansItalic
_911Plane.Text = "911 Plane"
_911Plane.TextColor3 = Color3.fromRGB(0, 0, 0)
_911Plane.TextSize = 30.000
_911Plane.TextWrapped = true
_911Plane.MouseButton1Down:connect(function()
    game.Players.LocalPlayer.Character:FindFirstChild("Tech Buggies").Name =
        "a7"
    game.Players.LocalPlayer.Character:FindFirstChild(
        "Angelic Messenger Accessory").Name = "a8"
    game.Players.LocalPlayer.Character:FindFirstChild("Feathery Angel Wings")
        .Name = "a3"
    game.Players.LocalPlayer.Character:FindFirstChild("MeshPartAccessory").Name =
        "a1"
    game.Players.LocalPlayer.Character:FindFirstChild("MeshPartAccessory").Name =
        "a4"
    game.Players.LocalPlayer.Character:FindFirstChild("MeshPartAccessory").Name =
        "a2"
    game.Players.LocalPlayer.Character:FindFirstChild("Feathery Angel Wings")
        .Name = "a5"
    game.Players.LocalPlayer.Character:FindFirstChild("MeshPartAccessory").Name =
        "a6"

    wait(1)

    local unanchoredparts = {}
    local movers = {}
    local tog = true
    local move = false
    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character
    local mov = {};
    local mov2 = {};

    Character.Humanoid.HipHeight = 4
    Character.Humanoid.WalkSpeed = 16

    local Hats = {
        base = Character:WaitForChild("a1"),
        base2 = Character:WaitForChild("a2"),
        wing = Character:WaitForChild("a3"),
        wingtip = Character:WaitForChild("a4"),
        wing2 = Character:WaitForChild("a5"),
        wingtip2 = Character:WaitForChild("a6"),
        tail = Character:WaitForChild("a7"),
        tailtip = Character:WaitForChild("a8")
    }

    -- Dont touch below

    for i, v in next, Hats do
        v.Handle.AccessoryWeld:Remove()
        for _, mesh in next, v:GetDescendants() do
            if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                mesh:Remove()
            end
        end
    end

    function ftp(str)
        local pt = {};
        if str ~= 'me' and str ~= 'random' then
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Name:lower():find(str:lower()) then
                    table.insert(pt, v);
                end
            end
        elseif str == 'me' then
            table.insert(pt, plr);
        elseif str == 'random' then
            table.insert(pt, game.Players:GetPlayers()[math.random(1,
                                                                   #game.Players:GetPlayers())]);
        end
        return pt;
    end

    local function align(i, v)
        local att0 = Instance.new("Attachment", i)
        att0.Position = Vector3.new(0, 0, 0)
        local att1 = Instance.new("Attachment", v)
        att1.Position = Vector3.new(0, 0, 0)
        local AP = Instance.new("AlignPosition", i)
        AP.Attachment0 = att0
        AP.Attachment1 = att1
        AP.RigidityEnabled = false
        AP.ReactionForceEnabled = false
        AP.ApplyAtCenterOfMass = true
        AP.MaxForce = 9999999
        AP.MaxVelocity = math.huge
        AP.Responsiveness = 100
        local AO = Instance.new("AlignOrientation", i)
        AO.Attachment0 = att0
        AO.Attachment1 = att1
        AO.ReactionTorqueEnabled = false
        AO.PrimaryAxisOnly = false
        AO.MaxTorque = 9999999
        AO.MaxAngularVelocity = math.huge
        AO.Responsiveness = 50
    end

    -- Dont touch above

    align(Hats.base.Handle, Character["Torso"])
    align(Hats.base2.Handle, Character["Torso"])
    align(Hats.wing.Handle, Character["Torso"])
    align(Hats.wingtip.Handle, Character["Torso"])
    align(Hats.wing2.Handle, Character["Torso"])
    align(Hats.wingtip2.Handle, Character["Torso"])
    align(Hats.tail.Handle, Character["Torso"])
    align(Hats.tailtip.Handle, Character["Torso"])

    Hats.base.Handle.Attachment.Rotation = Vector3.new(0, 0, 0) -- Rotation for the hats
    Hats.base2.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
    Hats.wing.Handle.Attachment.Rotation = Vector3.new(-90, -180, 0)
    Hats.wingtip.Handle.Attachment.Rotation = Vector3.new(-25, 90, 0)
    Hats.wing2.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
    Hats.wingtip2.Handle.Attachment.Rotation = Vector3.new(25, 90, 0)
    Hats.tail.Handle.Attachment.Rotation = Vector3.new(90, -90, 0)
    Hats.tailtip.Handle.Attachment.Rotation = Vector3.new(-25, 0, 0)

    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment1"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment2"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment3"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment4"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment5"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment6"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment7"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment8"

    Character:WaitForChild("Torso").Attachment1.Position =
        Vector3.new(-0, -0, -3) -- Position of the hats
    Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(0, -0, 3)
    Character:WaitForChild("Torso").Attachment3.Position =
        Vector3.new(-7.5, 0, 0)
    Character:WaitForChild("Torso").Attachment4.Position =
        Vector3.new(-12.413, 1.032, 0)
    Character:WaitForChild("Torso").Attachment5.Position =
        Vector3.new(7.5, -0, -0)
    Character:WaitForChild("Torso").Attachment6.Position =
        Vector3.new(12.413, 1.032, 0)
    Character:WaitForChild("Torso").Attachment7.Position =
        Vector3.new(0, 0, 10.5)
    Character:WaitForChild("Torso").Attachment8.Position =
        Vector3.new(0, 1.099, 15.226)

    repeat wait() until game.Players.LocalPlayer and
        game.Players.LocalPlayer.Character and
        game.Players.LocalPlayer.Character:findFirstChild("Head") and
        game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
    local mouse = game.Players.LocalPlayer:GetMouse()
    repeat wait() until mouse
    local plr = game.Players.LocalPlayer
    local torso = plr.Character.Head
    local flying = false
    local deb = true
    local ctrl = {f = 0, b = 0, l = 0, r = 0}
    local lastctrl = {f = 0, b = 0, l = 0, r = 0}
    local maxspeed = 1000
    local speed = 5000

    function Fly()
        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0, 0.1, 0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        repeat
            wait()
            plr.Character.Humanoid.PlatformStand = true
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed + .5 + (speed / maxspeed)
                if speed > maxspeed then speed = maxspeed end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~=
                0 then
                speed = speed - 2
                if speed < 0 then speed = 0 end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame
                                  .lookVector * (ctrl.f + ctrl.b)) +
                                  ((game.Workspace.CurrentCamera.CoordinateFrame *
                                      CFrame.new(ctrl.l + ctrl.r,
                                                 (ctrl.f + ctrl.b) * .2, 0).p) -
                                      game.Workspace.CurrentCamera
                                          .CoordinateFrame.p)) * speed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~=
                0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame
                                  .lookVector * (lastctrl.f + lastctrl.b)) +
                                  ((game.Workspace.CurrentCamera.CoordinateFrame *
                                      CFrame.new(lastctrl.l + lastctrl.r,
                                                 (lastctrl.f + lastctrl.b) * .2,
                                                 0).p) -
                                      game.Workspace.CurrentCamera
                                          .CoordinateFrame.p)) * speed
            else
                bv.velocity = Vector3.new(0, 0.1, 0)
            end
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame *
                            CFrame.Angles(
                                -math.rad(
                                    (ctrl.f + ctrl.b) * 50 * speed / maxspeed),
                                0, 0)
        until not flying
        ctrl = {f = 0, b = 0, l = 0, r = 0}
        lastctrl = {f = 0, b = 0, l = 0, r = 0}
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
    end
    mouse.KeyDown:connect(function(key)
        if key:lower() == "e" then
            if flying then
                flying = false
            else
                flying = true
                Fly()
            end
        elseif key:lower() == "w" then
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
    Fly()
end)

_911.Name = "911"
_911.Parent = Scripts
_911.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
_911.BorderColor3 = Color3.fromRGB(27, 42, 53)
_911.BorderSizePixel = 0
_911.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
_911.Size = UDim2.new(0, 85, 0, 32)
_911.Font = Enum.Font.SourceSansItalic
_911.Text = "911"
_911.TextColor3 = Color3.fromRGB(0, 0, 0)
_911.TextSize = 30.000
_911.TextWrapped = true
_911.MouseButton1Down:connect(function()

    local unanchoredparts = {}
    local movers = {}
    local tog = true
    local move = false
    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character
    local mov = {};
    local mov2 = {};
    Character.Torso.Anchored = true

    local pl = "Plane"
    local x = 11.086
    local y = 3.399
    local z = -9.105

    local Hats = {
        tower = Character:WaitForChild("Kate Hair"),
        tower2 = Character:WaitForChild("Pal Hair"),
        tower3 = Character:WaitForChild("Bedhead"),
        tower4 = Character:WaitForChild("Hat1"),
        tower5 = Character:WaitForChild("LavanderHair"),
        tower6 = Character:WaitForChild("No Speak Monkey")
    }

    for i, v in next, Hats do
        v.Handle.AccessoryWeld:Remove()
        for _, mesh in next, v:GetDescendants() do
            if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                mesh:Remove()
            end
        end
    end

    function ftp(str)
        local pt = {};
        if str ~= 'me' and str ~= 'random' then
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Name:lower():find(str:lower()) then
                    table.insert(pt, v);
                end
            end
        elseif str == 'me' then
            table.insert(pt, plr);
        elseif str == 'random' then
            table.insert(pt, game.Players:GetPlayers()[math.random(1,
                                                                   #game.Players:GetPlayers())]);
        end
        return pt;
    end

    local function align(i, v)
        local att0 = Instance.new("Attachment", i)
        att0.Position = Vector3.new(0, 0, 0)
        local att1 = Instance.new("Attachment", v)
        att1.Position = Vector3.new(0, 0, 0)
        local AP = Instance.new("AlignPosition", i)
        AP.Attachment0 = att0
        AP.Attachment1 = att1
        AP.RigidityEnabled = false
        AP.ReactionForceEnabled = false
        AP.ApplyAtCenterOfMass = true
        AP.MaxForce = 9999999
        AP.MaxVelocity = math.huge
        AP.Responsiveness = 5
        local AO = Instance.new("AlignOrientation", i)
        AO.Attachment0 = att0
        AO.Attachment1 = att1
        AO.ReactionTorqueEnabled = false
        AO.PrimaryAxisOnly = false
        AO.MaxTorque = 9999999
        AO.MaxAngularVelocity = math.huge
        AO.Responsiveness = 50
    end
    align(Hats.tower.Handle, Character["Torso"])
    align(Hats.tower2.Handle, Character["Torso"])
    align(Hats.tower3.Handle, Character["Torso"])
    align(Hats.tower4.Handle, Character["Torso"])
    align(Hats.tower5.Handle, Character["Torso"])
    align(Hats.tower6.Handle, Character["Torso"])

    Hats.tower.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
    Hats.tower2.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
    Hats.tower3.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
    Hats.tower4.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
    Hats.tower5.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)
    Hats.tower6.Handle.Attachment.Rotation = Vector3.new(90, 0, 0)

    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment1"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment2"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment3"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment4"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment5"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment6"

    Character:WaitForChild("Torso").Attachment1.Position =
        Vector3.new(2, -2.417, -5)
    Character:WaitForChild("Torso").Attachment2.Position =
        Vector3.new(2, -0.45, -5)
    Character:WaitForChild("Torso").Attachment3.Position =
        Vector3.new(2, 1.55, -5)
    Character:WaitForChild("Torso").Attachment4.Position =
        Vector3.new(-2, -2.417, -5)
    Character:WaitForChild("Torso").Attachment5.Position =
        Vector3.new(-2, -0.45, -5)
    Character:WaitForChild("Torso").Attachment6.Position =
        Vector3.new(-2, 1.55, -5)

    Character:WaitForChild(pl).Handle.AccessoryWeld:Remove()
    local alignpos = Instance.new("AlignPosition", Character)
    local alignorien = Instance.new("AlignOrientation", Character)
    local att1 = Instance.new("Attachment", Character:WaitForChild(pl).Handle)
    local att2 = Instance.new("Attachment", Character:WaitForChild("Head"))
    alignpos.Attachment0 = att1
    alignpos.Attachment1 = att2
    alignpos.RigidityEnabled = false
    alignpos.ReactionForceEnabled = false
    alignpos.ApplyAtCenterOfMass = true
    alignpos.MaxForce = 99999999
    alignpos.MaxVelocity = math.huge
    alignpos.Responsiveness = 0.1
    alignorien.Attachment0 = att1
    alignorien.Attachment1 = att2
    alignorien.ReactionTorqueEnabled = false
    alignorien.PrimaryAxisOnly = false
    alignorien.MaxTorque = 99999999
    alignorien.MaxAngularVelocity = math.huge
    alignorien.Responsiveness = 50
    att2.Position = Vector3.new(x, y, z)
    att2.Rotation = Vector3.new(-13.09, 68.31, 14.79)

    wait(3)

    att2.Position = Vector3.new(2.5, 0, -5.483)

    wait(2.5)

    att2.Position = Vector3.new(2.5, -6, -5.483)
    Character:WaitForChild("Torso").Attachment1.Position =
        Vector3.new(2, -5, -5)
    Character:WaitForChild("Torso").Attachment2.Position =
        Vector3.new(2, -5, -5)
    Character:WaitForChild("Torso").Attachment3.Position =
        Vector3.new(2, -5, -5)
    Character:WaitForChild("Torso").Attachment4.Position =
        Vector3.new(-2, -2.417, -5)
    Character:WaitForChild("Torso").Attachment5.Position =
        Vector3.new(-2, -0.45, -5)
    Character:WaitForChild("Torso").Attachment6.Position =
        Vector3.new(-2, 1.55, -5)

    wait(2)
    att2.Position = Vector3.new(-6.493, -6, -15.772)
    att2.Rotation = Vector3.new(-6.71, 158.68, 13.5)

    wait(1.5)
    att2.Position = Vector3.new(-6.493, 2.729, -15.772)

    wait(2)
    att2.Position = Vector3.new(-2.288, -0.5, -5.596)

    wait(2.5)
    att2.Position = Vector3.new(-2.288, -6, -5.596)
    Character:WaitForChild("Torso").Attachment1.Position =
        Vector3.new(2, -5, -5)
    Character:WaitForChild("Torso").Attachment2.Position =
        Vector3.new(2, -5, -5)
    Character:WaitForChild("Torso").Attachment3.Position =
        Vector3.new(2, -5, -5)
    Character:WaitForChild("Torso").Attachment4.Position =
        Vector3.new(-2, -5, -5)
    Character:WaitForChild("Torso").Attachment5.Position =
        Vector3.new(-2, -5, -5)
    Character:WaitForChild("Torso").Attachment6.Position =
        Vector3.new(-2, -5, -5)
    wait(2)
    local pcframe = Player.Character:FindFirstChild("HumanoidRootPart").CFrame
    Player.Character:BreakJoints()

    local added
    added = Player.CharacterAdded:Connect(
                function(Character)
            Character:WaitForChild("HumanoidRootPart")

            Character.HumanoidRootPart.CFrame = pcframe + Vector3.new(0, .8, 0)
            added:Disconnect()
        end)
end)

Car.Name = "Car"
Car.Parent = Scripts
Car.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
Car.BorderColor3 = Color3.fromRGB(27, 42, 53)
Car.BorderSizePixel = 0
Car.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
Car.Size = UDim2.new(0, 85, 0, 32)
Car.Font = Enum.Font.SourceSansItalic
Car.Text = "Car"
Car.TextColor3 = Color3.fromRGB(0, 0, 0)
Car.TextSize = 30.000
Car.TextWrapped = true
Car.MouseButton1Down:connect(function()
    local NetworkAccess = coroutine.create(
                              function()
            settings().Physics.AllowSleep = false
            while true do
                game:GetService("RunService").RenderStepped:Wait()
                game:GetService("Players").LocalPlayer.ReplicationFocus =
                    workspace
                game:GetService("Players").LocalPlayer.MaximumSimulationRadius =
                    math.pow(math.huge, math.huge)
                sethiddenproperty(game:GetService("Players").LocalPlayer,
                                  "SimulationRadius", math.huge * math.huge)
            end
        end)
    coroutine.resume(NetworkAccess)

    plr = game.Players.LocalPlayer
    char = plr.Character
    torso = char.Torso
    char["Left Leg"]:Remove()
    char["Right Leg"]:Remove()
    char.Humanoid.WalkSpeed = 75
    char.Humanoid.HipHeight = 0.8

    function Align(Part1, Part0, Position, Angle, name)
        local AlignPos = Instance.new("AlignPosition", Part1)
        AlignPos.Parent.CanCollide = false
        AlignPos.ApplyAtCenterOfMass = true
        AlignPos.MaxForce = 67752
        AlignPos.MaxVelocity = math.huge / 9e110
        AlignPos.ReactionForceEnabled = false
        AlignPos.Responsiveness = 200
        AlignPos.RigidityEnabled = false
        local AlignOrient = Instance.new("AlignOrientation", Part1)
        AlignOrient.MaxAngularVelocity = math.huge / 9e110
        AlignOrient.MaxTorque = 67752
        AlignOrient.PrimaryAxisOnly = false
        AlignOrient.ReactionTorqueEnabled = false
        AlignOrient.Responsiveness = 200
        AlignOrient.RigidityEnabled = false
        local AttachmentA = Instance.new("Attachment", Part1)
        local AttachmentB = Instance.new("Attachment", Part0)
        AttachmentB.Orientation = Angle
        AttachmentB.Position = Position
        AttachmentB.Name = name
        AlignPos.Attachment0 = AttachmentA
        AlignPos.Attachment1 = AttachmentB
        AlignOrient.Attachment0 = AttachmentA
        AlignOrient.Attachment1 = AttachmentB
    end

    car = char["MeshPartAccessory"]
    chandle = car.Handle
    chandle.AccessoryWeld:Destroy()

    fire = char["FireMohawk"]
    fhandle = fire.Handle
    fhandle.AccessoryWeld:Destroy()
    fhandle.Mesh:Destroy()

    h = Instance.new("Attachment", chandle)
    h.Rotation = Vector3.new(0, 0, 0)
    h.Position = Vector3.new(0, 0, 0)

    lg = Instance.new("Attachment", torso)
    lg.Rotation = Vector3.new(0, 0, 0)
    lg.Position = Vector3.new(0, -0.767, -0.942)

    gap = Instance.new("AlignPosition", chandle)
    gap.Attachment0 = h
    gap.Attachment1 = lg
    gap.RigidityEnabled = true

    gao = Instance.new("AlignOrientation", chandle)
    gao.Attachment0 = h
    gao.Attachment1 = lg
    gao.RigidityEnabled = true

    a = Instance.new("Attachment", fhandle)
    a.Rotation = Vector3.new(0, 0, 0)
    a.Position = Vector3.new(0, 0, 0)

    a1 = Instance.new("Attachment", torso)
    a1.Rotation = Vector3.new(90, 0, 0)
    a1.Position = Vector3.new(0, -0.974, 0.975)

    a2 = Instance.new("AlignPosition", fhandle)
    a2.Attachment0 = a
    a2.Attachment1 = a1
    a2.RigidityEnabled = true

    a3 = Instance.new("AlignOrientation", fhandle)
    a3.Attachment0 = a
    a3.Attachment1 = a1
    a3.RigidityEnabled = true

    game.Players.LocalPlayer.Character.Torso["Right Shoulder"]:Destroy()
    game.Players.LocalPlayer.Character["Right Arm"].RightShoulderAttachment:Destroy()
    game.Players.LocalPlayer.Character["Right Arm"].RightGripAttachment:Destroy()
    game.Players.LocalPlayer.Character.Torso["Left Shoulder"]:Destroy()
    game.Players.LocalPlayer.Character["Left Arm"].LeftShoulderAttachment:Destroy()
    game.Players.LocalPlayer.Character["Left Arm"].LeftGripAttachment:Destroy()
    Align(game.Players.LocalPlayer.Character["Left Arm"],
          game.Players.LocalPlayer.Character.Torso,
          Vector3.new(-1.243, 0.195, -0.793), Vector3.new(74.51, 0, 8.28),
          "Left")
    Align(game.Players.LocalPlayer.Character["Right Arm"],
          game.Players.LocalPlayer.Character.Torso,
          Vector3.new(1.243, 0.195, -0.793), Vector3.new(74.51, 0, -8.28),
          "Right")
end)

Shidashian.Name = "Shidashian"
Shidashian.Parent = Scripts
Shidashian.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
Shidashian.BorderColor3 = Color3.fromRGB(27, 42, 53)
Shidashian.BorderSizePixel = 0
Shidashian.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
Shidashian.Size = UDim2.new(0, 85, 0, 32)
Shidashian.Font = Enum.Font.SourceSansItalic
Shidashian.Text = "Shidashian"
Shidashian.TextColor3 = Color3.fromRGB(0, 0, 0)
Shidashian.TextSize = 25.000
Shidashian.TextWrapped = true
Shidashian.MouseButton1Down:connect(function()
    local unanchoredparts = {}
    local movers = {}
    local tog = true
    local move = false
    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character
    local tor = Character.Torso
    local mov = {};
    local mov2 = {};

    local poop = "Poop"
    local x = 0
    local y = -1.086
    local z = 0.808

    pom = Character["Pink Pom poms"]
    phandle = pom.Handle
    phandle.AccessoryWeld:Destroy()

    local Hats = {
        but1 = Character:WaitForChild("NoxiousEgg"),
        but2 = Character:WaitForChild("SFOTHEgg"),
        but3 = Character:WaitForChild("UglyEgg"),
        but4 = Character:WaitForChild("StarryEgg")
    }

    for i, v in next, Hats do
        v.Handle.AccessoryWeld:Remove()
        for _, mesh in next, v:GetDescendants() do
            if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
                mesh:Remove()
            end
        end
    end

    function ftp(str)
        local pt = {};
        if str ~= 'me' and str ~= 'random' then
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Name:lower():find(str:lower()) then
                    table.insert(pt, v);
                end
            end
        elseif str == 'me' then
            table.insert(pt, plr);
        elseif str == 'random' then
            table.insert(pt, game.Players:GetPlayers()[math.random(1,
                                                                   #game.Players:GetPlayers())]);
        end
        return pt;
    end

    local function align(i, v)
        local att0 = Instance.new("Attachment", i)
        att0.Position = Vector3.new(0, 0, 0)
        local att1 = Instance.new("Attachment", v)
        att1.Position = Vector3.new(0, 0, 0)
        local AP = Instance.new("AlignPosition", i)
        AP.Attachment0 = att0
        AP.Attachment1 = att1
        AP.RigidityEnabled = false
        AP.ReactionForceEnabled = false
        AP.ApplyAtCenterOfMass = true
        AP.MaxForce = 9999999
        AP.MaxVelocity = math.huge
        AP.Responsiveness = 65
        local AO = Instance.new("AlignOrientation", i)
        AO.Attachment0 = att0
        AO.Attachment1 = att1
        AO.ReactionTorqueEnabled = true
        AO.PrimaryAxisOnly = false
        AO.MaxTorque = 9999999
        AO.MaxAngularVelocity = math.huge
        AO.Responsiveness = 50
    end

    align(Hats.but1.Handle, Character["Torso"])
    align(Hats.but2.Handle, Character["Torso"])
    align(Hats.but3.Handle, Character["Torso"])
    align(Hats.but4.Handle, Character["Torso"])

    Hats.but1.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
    Hats.but2.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
    Hats.but3.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)
    Hats.but4.Handle.Attachment.Rotation = Vector3.new(0, 0, 0)

    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment1"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment2"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment3"
    Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name =
        "Attachment4"

    Character:WaitForChild("Torso").Attachment1.Position =
        Vector3.new(0.527, 0.142, -0.595)
    Character:WaitForChild("Torso").Attachment2.Position =
        Vector3.new(-0.527, 0.142, -0.595)
    Character:WaitForChild("Torso").Attachment3.Position =
        Vector3.new(-0.527, -1.161, 0.57)
    Character:WaitForChild("Torso").Attachment4.Position =
        Vector3.new(0.527, -1.161, 0.57)

    h = Instance.new("Attachment", phandle)
    h.Rotation = Vector3.new(0, 0, 0)
    h.Position = Vector3.new(0, 0, 0)

    lg = Instance.new("Attachment", tor)
    lg.Rotation = Vector3.new(0, 0, 0)
    lg.Position = Vector3.new(0, 0, -1.386)

    gap = Instance.new("AlignPosition", phandle)
    gap.Attachment0 = h
    gap.Attachment1 = lg
    gap.RigidityEnabled = true

    gao = Instance.new("AlignOrientation", phandle)
    gao.Attachment0 = h
    gao.Attachment1 = lg
    gao.RigidityEnabled = true

    Character:WaitForChild(poop).Handle.AccessoryWeld:Remove()
    local alignpos = Instance.new("AlignPosition", Character)
    local alignorien = Instance.new("AlignOrientation", Character)
    local att1 = Instance.new("Attachment", Character:WaitForChild(poop).Handle)
    local att2 = Instance.new("Attachment", Character:WaitForChild("Torso"))
    alignpos.Attachment0 = att1
    alignpos.Attachment1 = att2
    alignpos.RigidityEnabled = false
    alignpos.ReactionForceEnabled = false
    alignpos.ApplyAtCenterOfMass = true
    alignpos.MaxForce = 99999999
    alignpos.MaxVelocity = math.huge
    alignpos.Responsiveness = 50
    alignorien.Attachment0 = att1
    alignorien.Attachment1 = att2
    alignorien.ReactionTorqueEnabled = false
    alignorien.PrimaryAxisOnly = false
    alignorien.MaxTorque = 99999999
    alignorien.MaxAngularVelocity = math.huge
    alignorien.Responsiveness = 50
    att2.Position = Vector3.new(x, y, z)
    att2.Rotation = Vector3.new(-72.25, 180, 180)

    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(
        function(KeyPressed)
            if KeyPressed == "q" then
                if toggle == false then
                    att2.Position = Vector3.new(x, y, z)
                    toggle = true
                else
                    att2.Position = Vector3.new(0, -1.808, 1.609)
                    toggle = false
                end
            end
        end)
end)

Hoverboard.Name = "Hoverboard"
Hoverboard.Parent = Scripts
Hoverboard.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
Hoverboard.BorderColor3 = Color3.fromRGB(27, 42, 53)
Hoverboard.BorderSizePixel = 0
Hoverboard.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
Hoverboard.Size = UDim2.new(0, 85, 0, 32)
Hoverboard.Font = Enum.Font.SourceSansItalic
Hoverboard.Text = "Hoverboard"
Hoverboard.TextColor3 = Color3.fromRGB(0, 0, 0)
Hoverboard.TextSize = 24.000
Hoverboard.TextWrapped = true
Hoverboard.MouseButton1Down:connect(function()

    game.Players.LocalPlayer.Character.Head.Transparency = 1
    game.Players.LocalPlayer.Character.Head.face:Remove()
    game.Players.LocalPlayer.Character.Torso.Transparency = 1
    game.Players.LocalPlayer.Character['Right Arm'].Transparency = 1
    game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
    game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
    game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1

    Local = game:GetService('Players').LocalPlayer
    Char = Local.Character
    touched, tpdback = false, false
    Local.CharacterAdded:connect(function(char)
        if script.Disabled ~= true then
            wait(.00001)
            loc = Char.HumanoidRootPart.Position
            Char:MoveTo(box.Position + Vector3.new(0, .5, 0))
        end
    end)
    box = Instance.new('Part', workspace)
    box.Anchored = true
    box.Transparency = 1
    box.CanCollide = true
    box.Size = Vector3.new(10, 1, 10)
    box.Position = Vector3.new(0, 10000, 0)
    box.Touched:connect(function(part)
        if (part.Parent.Name == Local.Name) then
            if touched == false then
                touched = true
                function apply()
                    if script.Disabled ~= true then
                        no = Char.HumanoidRootPart:Clone()
                        wait(.0001)
                        Char.HumanoidRootPart:Destroy()
                        no.Parent = Char
                        Char:MoveTo(loc)
                        touched = false
                    end
                end
                if Char then apply() end
            end
        end
    end)
    repeat wait() until Char
    loc = Char.HumanoidRootPart.Position
    Char:MoveTo(box.Position + Vector3.new(0, .5, 0))

    wait(0.5)
    local LocalPlayer = game.Players.LocalPlayer;
    local Character = LocalPlayer.Character;
    local Mouse = LocalPlayer:GetMouse()
    Character["Pink Hair"].Name = "Brick1";
    Character["Bedhead"].Name = "Brick2"
    Character["LongHairHeadBand Black"].Name = "Brick3";
    Character["Hat1"].Name = "Brick4"
    Character["Kate Hair"].Name = "Brick5";
    Character["BakonHead"].Name = "Brick6"
    Character["FireMohawk"].Name = "Brick7";
    Character["No Speak Monkey"].Name = "Brick8"
    Character["Pal Hair"].Name = "Brick9";
    Character["LavanderHair"].Name = "Brick10"
    local Head = Character["Head"];
    local Torso = Character["Torso"]
    local RArm = Character["Right Arm"];
    local LArm = Character["Left Arm"]
    local RLeg = Character["Right Leg"];
    local LLeg = Character["Left Leg"]
    local Hat1 = Character["Brick1"];
    local Hat2 = Character["Brick2"]
    local Hat3 = Character["Brick3"];
    local Hat4 = Character["Brick4"]
    local Hat5 = Character["Brick5"];
    local Hat6 = Character["Brick6"]
    local Hat7 = Character["Brick7"];
    local Hat8 = Character["Brick8"]
    local Hat9 = Character["Brick9"];
    local Hat10 = Character["Brick10"]

    Hat1.Handle.Mesh:Destroy()
    Hat2.Handle.Mesh:Destroy()
    Hat3.Handle.Mesh:Destroy()
    Hat4.Handle.Mesh:Destroy()
    Hat5.Handle.Mesh:Destroy()
    Hat7.Handle.Mesh:Destroy()
    Hat8.Handle.Mesh:Destroy()
    Hat9.Handle.Mesh:Destroy()
    Hat10.Handle.Mesh:Destroy()

    -- LostDevelopers Alignment Function
    function Align(Part1, Part0, Position, Angle)
        local AlignPos = Instance.new("AlignPosition", Part1);
        AlignPos.Parent.CanCollide = false;
        AlignPos.ApplyAtCenterOfMass = true;
        AlignPos.MaxForce = 67752;
        AlignPos.MaxVelocity = math.huge / 9e110;
        AlignPos.ReactionForceEnabled = false;
        AlignPos.Responsiveness = 200;
        AlignPos.RigidityEnabled = false;
        local AlignOri = Instance.new("AlignOrientation", Part1);
        AlignOri.MaxAngularVelocity = math.huge / 9e110;
        AlignOri.MaxTorque = 67752;
        AlignOri.PrimaryAxisOnly = false;
        AlignOri.ReactionTorqueEnabled = false;
        AlignOri.Responsiveness = 200;
        AlignOri.RigidityEnabled = false;
        local AttachmentA = Instance.new("Attachment", Part1);
        local AttachmentB = Instance.new("Attachment", Part0);
        AttachmentB.Orientation = Angle
        AttachmentB.Position = Position
        AlignPos.Attachment0 = AttachmentA;
        AlignPos.Attachment1 = AttachmentB;
        AlignOri.Attachment0 = AttachmentA;
        AlignOri.Attachment1 = AttachmentB;
    end
    Character.Humanoid.HipHeight = 0
    function Weld(Part) Part.Handle.AccessoryWeld:Destroy() end
    function Mesh(Part) Part.Handle.SpecialMesh:Destroy() end
    Weld(Hat1);
    Weld(Hat2);
    Weld(Hat3)
    Weld(Hat4);
    Weld(Hat5);
    Weld(Hat6)
    Weld(Hat7);
    Weld(Hat8);
    Weld(Hat9)
    Weld(Hat10)
    --[[ Alignment and Measurements ]] --
    Align(Hat1.Handle, RLeg, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat2.Handle, LLeg, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat3.Handle, Torso, Vector3.new(0, -0.2, 0), Vector3.new(0, 90, 0))
    Align(Hat4.Handle, LArm, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat5.Handle, RArm, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat6.Handle, Head, Vector3.new(0, 0, 0), Vector3.new(0, 40, 0))
    Align(Hat7.Handle, Torso, Vector3.new(1, -3.3, 0), Vector3.new(90, 90, 0))
    Align(Hat8.Handle, Torso, Vector3.new(2.2, -3, 0), Vector3.new(0, 0, 50))
    Align(Hat9.Handle, Torso, Vector3.new(-1, -3.2, 0), Vector3.new(0, 90, 0))
    Align(Hat10.Handle, Torso, Vector3.new(-1, -3.2, -0.2),
          Vector3.new(0, 90, 0))
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = 1

    wait(0.2)
    loadstring(game:HttpGet(('https://pastebin.com/raw/hkFAiC1y'), true))()
end)

Trashcan.Name = "Trashcan"
Trashcan.Parent = Scripts
Trashcan.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
Trashcan.BorderColor3 = Color3.fromRGB(27, 42, 53)
Trashcan.BorderSizePixel = 0
Trashcan.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
Trashcan.Size = UDim2.new(0, 85, 0, 32)
Trashcan.Font = Enum.Font.SourceSansItalic
Trashcan.Text = "Trash can"
Trashcan.TextColor3 = Color3.fromRGB(0, 0, 0)
Trashcan.TextSize = 30.000
Trashcan.TextWrapped = true
Trashcan.MouseButton1Down:connect(function()

    game.Players.LocalPlayer.Character.Head.Transparency = 1
    game.Players.LocalPlayer.Character.Head.face:Remove()
    game.Players.LocalPlayer.Character.Torso.Transparency = 1
    game.Players.LocalPlayer.Character['Right Arm'].Transparency = 1
    game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
    game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
    game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1

    Local = game:GetService('Players').LocalPlayer
    Char = Local.Character
    touched, tpdback = false, false
    Local.CharacterAdded:connect(function(char)
        if script.Disabled ~= true then
            wait(.00001)
            loc = Char.HumanoidRootPart.Position
            Char:MoveTo(box.Position + Vector3.new(0, .5, 0))
        end
    end)
    box = Instance.new('Part', workspace)
    box.Anchored = true
    box.Transparency = 1
    box.CanCollide = true
    box.Size = Vector3.new(10, 1, 10)
    box.Position = Vector3.new(0, 10000, 0)
    box.Touched:connect(function(part)
        if (part.Parent.Name == Local.Name) then
            if touched == false then
                touched = true
                function apply()
                    if script.Disabled ~= true then
                        no = Char.HumanoidRootPart:Clone()
                        wait(.0001)
                        Char.HumanoidRootPart:Destroy()
                        no.Parent = Char
                        Char:MoveTo(loc)
                        touched = false
                    end
                end
                if Char then apply() end
            end
        end
    end)
    repeat wait() until Char
    loc = Char.HumanoidRootPart.Position
    Char:MoveTo(box.Position + Vector3.new(0, .5, 0))

    wait(0.5)
    local LocalPlayer = game.Players.LocalPlayer;
    local Character = LocalPlayer.Character;
    local Mouse = LocalPlayer:GetMouse()
    Character["LavanderHair"].Name = "Brick1";
    Character["Kate Hair"].Name = "Brick2"
    Character["Hat1"].Name = "Brick3";
    Character["Pal Hair"].Name = "Brick4"
    Character["LongHairHeadBand Black"].Name = "Brick5";
    Character["Trash Can"].Name = "Brick6"
    Character["Trash Can Lid"].Name = "Brick7"
    local Head = Character["Head"];
    local Torso = Character["Torso"]
    local RArm = Character["Right Arm"];
    local LArm = Character["Left Arm"]
    local RLeg = Character["Right Leg"];
    local LLeg = Character["Left Leg"]
    local Hat1 = Character["Brick1"];
    local Hat2 = Character["Brick2"]
    local Hat3 = Character["Brick3"];
    local Hat4 = Character["Brick4"]
    local Hat5 = Character["Brick5"];
    local Hat6 = Character["Brick6"]
    local Hat7 = Character["Brick7"]

    Hat1.Handle.Mesh:Destroy()
    Hat2.Handle.Mesh:Destroy()
    Hat3.Handle.Mesh:Destroy()
    Hat4.Handle.Mesh:Destroy()
    Hat5.Handle.Mesh:Destroy()

    -- LostDevelopers Alignment Function
    function Align(Part1, Part0, Position, Angle)
        local AlignPos = Instance.new("AlignPosition", Part1);
        AlignPos.Parent.CanCollide = false;
        AlignPos.ApplyAtCenterOfMass = true;
        AlignPos.MaxForce = 67752;
        AlignPos.MaxVelocity = math.huge / 9e110;
        AlignPos.ReactionForceEnabled = false;
        AlignPos.Responsiveness = 200;
        AlignPos.RigidityEnabled = false;
        local AlignOri = Instance.new("AlignOrientation", Part1);
        AlignOri.MaxAngularVelocity = math.huge / 9e110;
        AlignOri.MaxTorque = 67752;
        AlignOri.PrimaryAxisOnly = false;
        AlignOri.ReactionTorqueEnabled = false;
        AlignOri.Responsiveness = 200;
        AlignOri.RigidityEnabled = false;
        local AttachmentA = Instance.new("Attachment", Part1);
        local AttachmentB = Instance.new("Attachment", Part0);
        AttachmentB.Orientation = Angle
        AttachmentB.Position = Position
        AlignPos.Attachment0 = AttachmentA;
        AlignPos.Attachment1 = AttachmentB;
        AlignOri.Attachment0 = AttachmentA;
        AlignOri.Attachment1 = AttachmentB;
    end
    Character.Humanoid.HipHeight = 0
    function Weld(Part) Part.Handle.AccessoryWeld:Destroy() end
    function Mesh(Part) Part.Handle.SpecialMesh:Destroy() end
    Weld(Hat1);
    Weld(Hat2);
    Weld(Hat3)
    Weld(Hat4);
    Weld(Hat5);
    Weld(Hat6)
    Weld(Hat7)
    --[[ Alignment and Measurements ]] --
    Align(Hat1.Handle, RLeg, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat2.Handle, LLeg, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat5.Handle, Torso, Vector3.new(0, -0.2, 0), Vector3.new(0, 90, 0))
    Align(Hat4.Handle, LArm, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat3.Handle, RArm, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat6.Handle, Torso, Vector3.new(0, 0.3, 0), Vector3.new(0, 40, 0))
    Align(Hat7.Handle, Torso, Vector3.new(0, 2, 0), Vector3.new(0, 0, 0))

    wait(0.1)
    loadstring(game:HttpGet(('https://ghostbin.co/paste/5r3k3/raw'), true))()
end)

Fairy.Name = "Fairy"
Fairy.Parent = Scripts
Fairy.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
Fairy.BorderColor3 = Color3.fromRGB(27, 42, 53)
Fairy.BorderSizePixel = 0
Fairy.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
Fairy.Size = UDim2.new(0, 85, 0, 32)
Fairy.Font = Enum.Font.SourceSansItalic
Fairy.Text = "Fairy"
Fairy.TextColor3 = Color3.fromRGB(0, 0, 0)
Fairy.TextSize = 30.000
Fairy.TextWrapped = true
Fairy.MouseButton1Down:connect(function()

    game.Players.LocalPlayer.Character.Head.Transparency = 1
    game.Players.LocalPlayer.Character.Head.face:Remove()
    game.Players.LocalPlayer.Character.Torso.Transparency = 1
    game.Players.LocalPlayer.Character['Right Arm'].Transparency = 1
    game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
    game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
    game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1

    Local = game:GetService('Players').LocalPlayer
    Char = Local.Character
    touched, tpdback = false, false
    Local.CharacterAdded:connect(function(char)
        if script.Disabled ~= true then
            wait(.00001)
            loc = Char.HumanoidRootPart.Position
            Char:MoveTo(box.Position + Vector3.new(0, .5, 0))
        end
    end)
    box = Instance.new('Part', workspace)
    box.Anchored = true
    box.Transparency = 1
    box.CanCollide = true
    box.Size = Vector3.new(10, 1, 10)
    box.Position = Vector3.new(0, 10000, 0)
    box.Touched:connect(function(part)
        if (part.Parent.Name == Local.Name) then
            if touched == false then
                touched = true
                function apply()
                    if script.Disabled ~= true then
                        no = Char.HumanoidRootPart:Clone()
                        wait(.0001)
                        Char.HumanoidRootPart:Destroy()
                        no.Parent = Char
                        Char:MoveTo(loc)
                        touched = false
                    end
                end
                if Char then apply() end
            end
        end
    end)
    repeat wait() until Char
    loc = Char.HumanoidRootPart.Position
    Char:MoveTo(box.Position + Vector3.new(0, .5, 0))

    wait(0.5)
    local LocalPlayer = game.Players.LocalPlayer;
    local Character = LocalPlayer.Character;
    local Mouse = LocalPlayer:GetMouse()
    Character["SpringPixie"].Name = "Brick1"
    local Head = Character["Head"];
    local Torso = Character["Torso"]
    local RArm = Character["Right Arm"];
    local LArm = Character["Left Arm"]
    local RLeg = Character["Right Leg"];
    local LLeg = Character["Left Leg"]
    local Hat1 = Character["Brick1"]

    -- LostDevelopers Alignment Function
    function Align(Part1, Part0, Position, Angle)
        local AlignPos = Instance.new("AlignPosition", Part1);
        AlignPos.Parent.CanCollide = false;
        AlignPos.ApplyAtCenterOfMass = true;
        AlignPos.MaxForce = 67752;
        AlignPos.MaxVelocity = math.huge / 9e110;
        AlignPos.ReactionForceEnabled = false;
        AlignPos.Responsiveness = 200;
        AlignPos.RigidityEnabled = false;
        local AlignOri = Instance.new("AlignOrientation", Part1);
        AlignOri.MaxAngularVelocity = math.huge / 9e110;
        AlignOri.MaxTorque = 67752;
        AlignOri.PrimaryAxisOnly = false;
        AlignOri.ReactionTorqueEnabled = false;
        AlignOri.Responsiveness = 200;
        AlignOri.RigidityEnabled = false;
        local AttachmentA = Instance.new("Attachment", Part1);
        local AttachmentB = Instance.new("Attachment", Part0);
        AttachmentB.Orientation = Angle
        AttachmentB.Position = Position
        AlignPos.Attachment0 = AttachmentA;
        AlignPos.Attachment1 = AttachmentB;
        AlignOri.Attachment0 = AttachmentA;
        AlignOri.Attachment1 = AttachmentB;
    end
    Character.Humanoid.HipHeight = 0
    function Weld(Part) Part.Handle.AccessoryWeld:Destroy() end
    function Mesh(Part) Part.Handle.SpecialMesh:Destroy() end
    Weld(Hat1)
    --[[ Alignment and Measurements ]] --
    Align(Hat1.Handle, Torso, Vector3.new(0, 0, 0.1), Vector3.new(0, 0, 0))

    Hat1.Handle.Mesh.Scale = Vector3.new(6, 6, 6)

    wait(0.5)
    loadstring(game:HttpGet(('https://pastebin.com/raw/1Mv3AQ3a'), true))()
end)

NoobDance.Name = "NoobDance"
NoobDance.Parent = Scripts
NoobDance.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
NoobDance.BorderColor3 = Color3.fromRGB(27, 42, 53)
NoobDance.BorderSizePixel = 0
NoobDance.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
NoobDance.Size = UDim2.new(0, 85, 0, 32)
NoobDance.Font = Enum.Font.SourceSansItalic
NoobDance.Text = "Noob Dance"
NoobDance.TextColor3 = Color3.fromRGB(0, 0, 0)
NoobDance.TextSize = 23.000
NoobDance.TextWrapped = true
NoobDance.MouseButton1Down:connect(function()

    game.Players.LocalPlayer.Character.Head.Transparency = 1
    game.Players.LocalPlayer.Character.Head.face:Remove()
    game.Players.LocalPlayer.Character.Torso.Transparency = 1
    game.Players.LocalPlayer.Character['Right Arm'].Transparency = 1
    game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
    game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
    game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1

    Local = game:GetService('Players').LocalPlayer
    Char = Local.Character
    touched, tpdback = false, false
    Local.CharacterAdded:connect(function(char)
        if script.Disabled ~= true then
            wait(.00001)
            loc = Char.HumanoidRootPart.Position
            Char:MoveTo(box.Position + Vector3.new(0, .5, 0))
        end
    end)
    box = Instance.new('Part', workspace)
    box.Anchored = true
    box.Transparency = 1
    box.CanCollide = true
    box.Size = Vector3.new(10, 1, 10)
    box.Position = Vector3.new(0, 10000, 0)
    box.Touched:connect(function(part)
        if (part.Parent.Name == Local.Name) then
            if touched == false then
                touched = true
                function apply()
                    if script.Disabled ~= true then
                        no = Char.HumanoidRootPart:Clone()
                        wait(.0001)
                        Char.HumanoidRootPart:Destroy()
                        no.Parent = Char
                        Char:MoveTo(loc)
                        touched = false
                    end
                end
                if Char then apply() end
            end
        end
    end)
    repeat wait() until Char
    loc = Char.HumanoidRootPart.Position
    Char:MoveTo(box.Position + Vector3.new(0, .5, 0))

    wait(0.5)
    local LocalPlayer = game.Players.LocalPlayer;
    local Character = LocalPlayer.Character;
    local Mouse = LocalPlayer:GetMouse()
    Character["LavanderHair"].Name = "Brick1";
    Character["Pal Hair"].Name = "Brick2"
    Character["LongHairHeadBand Black"].Name = "Brick3";
    Character["Hat1"].Name = "Brick4"
    Character["Kate Hair"].Name = "Brick5";
    Character["PlushNoob"].Name = "Brick6"
    local Head = Character["Head"];
    local Torso = Character["Torso"]
    local RArm = Character["Right Arm"];
    local LArm = Character["Left Arm"]
    local RLeg = Character["Right Leg"];
    local LLeg = Character["Left Leg"]
    local Hat1 = Character["Brick1"];
    local Hat2 = Character["Brick2"]
    local Hat3 = Character["Brick3"];
    local Hat4 = Character["Brick4"]
    local Hat5 = Character["Brick5"];
    local Hat6 = Character["Brick6"]

    Hat1.Handle.Mesh:Destroy()
    Hat2.Handle.Mesh:Destroy()
    Hat3.Handle.Mesh:Destroy()
    Hat4.Handle.Mesh:Destroy()
    Hat5.Handle.Mesh:Destroy()

    -- LostDevelopers Alignment Function
    function Align(Part1, Part0, Position, Angle)
        local AlignPos = Instance.new("AlignPosition", Part1);
        AlignPos.Parent.CanCollide = false;
        AlignPos.ApplyAtCenterOfMass = true;
        AlignPos.MaxForce = 67752;
        AlignPos.MaxVelocity = math.huge / 9e110;
        AlignPos.ReactionForceEnabled = false;
        AlignPos.Responsiveness = 200;
        AlignPos.RigidityEnabled = false;
        local AlignOri = Instance.new("AlignOrientation", Part1);
        AlignOri.MaxAngularVelocity = math.huge / 9e110;
        AlignOri.MaxTorque = 67752;
        AlignOri.PrimaryAxisOnly = false;
        AlignOri.ReactionTorqueEnabled = false;
        AlignOri.Responsiveness = 200;
        AlignOri.RigidityEnabled = false;
        local AttachmentA = Instance.new("Attachment", Part1);
        local AttachmentB = Instance.new("Attachment", Part0);
        AttachmentB.Orientation = Angle
        AttachmentB.Position = Position
        AlignPos.Attachment0 = AttachmentA;
        AlignPos.Attachment1 = AttachmentB;
        AlignOri.Attachment0 = AttachmentA;
        AlignOri.Attachment1 = AttachmentB;
    end
    Character.Humanoid.HipHeight = 0
    function Weld(Part) Part.Handle.AccessoryWeld:Destroy() end
    function Mesh(Part) Part.Handle.SpecialMesh:Destroy() end
    Weld(Hat1);
    Weld(Hat2);
    Weld(Hat3)
    Weld(Hat4);
    Weld(Hat5);
    Weld(Hat6)
    --[[ Alignment and Measurements ]] --
    Align(Hat1.Handle, RLeg, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat2.Handle, LLeg, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat3.Handle, Torso, Vector3.new(0, -0.2, 0), Vector3.new(0, 90, 0))
    Align(Hat4.Handle, LArm, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat5.Handle, RArm, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat6.Handle, Head, Vector3.new(0, 0.1, 0), Vector3.new(0, 0, 0))

    wait(0.5)
    loadstring(game:HttpGet(('https://ghostbin.co/paste/je98d/raw'), true))()
end)

Knight.Name = "Knight"
Knight.Parent = Scripts
Knight.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
Knight.BorderColor3 = Color3.fromRGB(27, 42, 53)
Knight.BorderSizePixel = 0
Knight.Position = UDim2.new(0.0370370373, 0, 0.0113740861, 0)
Knight.Size = UDim2.new(0, 85, 0, 32)
Knight.Font = Enum.Font.SourceSansItalic
Knight.Text = "Knight"
Knight.TextColor3 = Color3.fromRGB(0, 0, 0)
Knight.TextSize = 30.000
Knight.TextWrapped = true
Knight.MouseButton1Down:connect(function()

    game.Players.LocalPlayer.Character.Head.Transparency = 1
    game.Players.LocalPlayer.Character.Head.face:Remove()
    game.Players.LocalPlayer.Character.Torso.Transparency = 1
    game.Players.LocalPlayer.Character['Right Arm'].Transparency = 1
    game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
    game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
    game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1

    Local = game:GetService('Players').LocalPlayer
    Char = Local.Character
    touched, tpdback = false, false
    Local.CharacterAdded:connect(function(char)
        if script.Disabled ~= true then
            wait(.00001)
            loc = Char.HumanoidRootPart.Position
            Char:MoveTo(box.Position + Vector3.new(0, .5, 0))
        end
    end)
    box = Instance.new('Part', workspace)
    box.Anchored = true
    box.Transparency = 1
    box.CanCollide = true
    box.Size = Vector3.new(10, 1, 10)
    box.Position = Vector3.new(0, 10000, 0)
    box.Touched:connect(function(part)
        if (part.Parent.Name == Local.Name) then
            if touched == false then
                touched = true
                function apply()
                    if script.Disabled ~= true then
                        no = Char.HumanoidRootPart:Clone()
                        wait(.0001)
                        Char.HumanoidRootPart:Destroy()
                        no.Parent = Char
                        Char:MoveTo(loc)
                        touched = false
                    end
                end
                if Char then apply() end
            end
        end
    end)
    repeat wait() until Char
    loc = Char.HumanoidRootPart.Position
    Char:MoveTo(box.Position + Vector3.new(0, .5, 0))

    wait(0.5)
    local LocalPlayer = game.Players.LocalPlayer;
    local Character = LocalPlayer.Character;
    local Mouse = LocalPlayer:GetMouse()
    Character["LavanderHair"].Name = "Brick1";
    Character["Pal Hair"].Name = "Brick2"
    Character["LongHairHeadBand Black"].Name = "Brick3";
    Character["Hat1"].Name = "Brick4"
    Character["Kate Hair"].Name = "Brick5";
    Character["helmet"].Name = "Brick6"
    Character["danielAccessory"].Name = "Brick7"
    local Head = Character["Head"];
    local Torso = Character["Torso"]
    local RArm = Character["Right Arm"];
    local LArm = Character["Left Arm"]
    local RLeg = Character["Right Leg"];
    local LLeg = Character["Left Leg"]
    local Hat1 = Character["Brick1"];
    local Hat2 = Character["Brick2"]
    local Hat3 = Character["Brick3"];
    local Hat4 = Character["Brick4"]
    local Hat5 = Character["Brick5"];
    local Hat6 = Character["Brick6"]
    local Hat7 = Character["Brick7"]

    Hat1.Handle.Mesh:Destroy()
    Hat2.Handle.Mesh:Destroy()
    Hat3.Handle.Mesh:Destroy()
    Hat4.Handle.Mesh:Destroy()
    Hat5.Handle.Mesh:Destroy()

    -- LostDevelopers Alignment Function
    function Align(Part1, Part0, Position, Angle)
        local AlignPos = Instance.new("AlignPosition", Part1);
        AlignPos.Parent.CanCollide = false;
        AlignPos.ApplyAtCenterOfMass = true;
        AlignPos.MaxForce = 67752;
        AlignPos.MaxVelocity = math.huge / 9e110;
        AlignPos.ReactionForceEnabled = false;
        AlignPos.Responsiveness = 200;
        AlignPos.RigidityEnabled = false;
        local AlignOri = Instance.new("AlignOrientation", Part1);
        AlignOri.MaxAngularVelocity = math.huge / 9e110;
        AlignOri.MaxTorque = 67752;
        AlignOri.PrimaryAxisOnly = false;
        AlignOri.ReactionTorqueEnabled = false;
        AlignOri.Responsiveness = 200;
        AlignOri.RigidityEnabled = false;
        local AttachmentA = Instance.new("Attachment", Part1);
        local AttachmentB = Instance.new("Attachment", Part0);
        AttachmentB.Orientation = Angle
        AttachmentB.Position = Position
        AlignPos.Attachment0 = AttachmentA;
        AlignPos.Attachment1 = AttachmentB;
        AlignOri.Attachment0 = AttachmentA;
        AlignOri.Attachment1 = AttachmentB;
    end
    Character.Humanoid.HipHeight = 0
    function Weld(Part) Part.Handle.AccessoryWeld:Destroy() end
    function Mesh(Part) Part.Handle.SpecialMesh:Destroy() end
    Weld(Hat1);
    Weld(Hat2);
    Weld(Hat3)
    Weld(Hat4);
    Weld(Hat5);
    Weld(Hat6)
    Weld(Hat7)
    --[[ Alignment and Measurements ]] --
    Align(Hat1.Handle, RLeg, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat2.Handle, LLeg, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat3.Handle, Torso, Vector3.new(0, -0.2, 0), Vector3.new(0, 90, 0))
    Align(Hat4.Handle, LArm, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat5.Handle, RArm, Vector3.new(0, 0, 0), Vector3.new(90, 0, 0))
    Align(Hat6.Handle, Head, Vector3.new(0, 0.3, 0), Vector3.new(0, 0, 0))
    Align(Hat7.Handle, Torso, Vector3.new(0, 0, 1), Vector3.new(180, 0, 180))

    wait(0.5)
    loadstring(game:HttpGet(('https://ghostbin.co/paste/9ouy9/raw'), true))()
end)

credits.Name = "credits"
credits.Parent = Main
credits.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
credits.BorderSizePixel = 0
credits.Position = UDim2.new(0.0188882221, 0, 0.758816004, 0)
credits.Size = UDim2.new(0, 70, 0, 46)
credits.AutoButtonColor = false
credits.Font = Enum.Font.SourceSansSemibold
credits.Text = "Credits"
credits.TextColor3 = Color3.fromRGB(0, 0, 0)
credits.TextSize = 17.000

scripts.Name = "scripts"
scripts.Parent = Main
scripts.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
scripts.BorderSizePixel = 0
scripts.Position = UDim2.new(0.0187450238, 0, 0.456513822, 0)
scripts.Size = UDim2.new(0, 70, 0, 46)
scripts.AutoButtonColor = false
scripts.Font = Enum.Font.SourceSansSemibold
scripts.Text = "Scripts"
scripts.TextColor3 = Color3.fromRGB(0, 0, 0)
scripts.TextSize = 17.000

updates.Name = "updates"
updates.Parent = Main
updates.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
updates.BorderSizePixel = 0
updates.Position = UDim2.new(0.0188882221, 0, 0.153641224, 0)
updates.Size = UDim2.new(0, 70, 0, 46)
updates.AutoButtonColor = false
updates.Font = Enum.Font.SourceSansSemibold
updates.Text = "Updates"
updates.TextColor3 = Color3.fromRGB(0, 0, 0)
updates.TextSize = 17.000

Welcome.Name = "Welcome"
Welcome.Parent = Main
Welcome.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Welcome.BackgroundTransparency = 1.000
Welcome.BorderSizePixel = 0
Welcome.Position = UDim2.new(0.368291467, 0, 0, 0)
Welcome.Size = UDim2.new(0, 172, 0, 27)
Welcome.Font = Enum.Font.SourceSans
Welcome.Text = "-"
Welcome.TextColor3 = Color3.fromRGB(0, 0, 0)
Welcome.TextScaled = true
Welcome.TextSize = 20.000
Welcome.TextWrapped = true

Hub.Name = "Hub"
Hub.Parent = Main
Hub.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
Hub.BorderSizePixel = 0
Hub.Position = UDim2.new(0.148261026, 0, 0, 0)
Hub.Size = UDim2.new(0, 53, 0, 27)

TextLabel_10.Parent = Hub
TextLabel_10.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_10.BackgroundTransparency = 1.000
TextLabel_10.BorderSizePixel = 0
TextLabel_10.Position = UDim2.new(-0.00564749539, 0, 0, 0)
TextLabel_10.Size = UDim2.new(0, 52, 0, 27)
TextLabel_10.Font = Enum.Font.SourceSans
TextLabel_10.Text = "Hub"
TextLabel_10.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_10.TextScaled = true
TextLabel_10.TextSize = 50.000
TextLabel_10.TextWrapped = true

TextLabel_11.Parent = Main
TextLabel_11.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
TextLabel_11.BackgroundTransparency = 1.000
TextLabel_11.BorderSizePixel = 0
TextLabel_11.Position = UDim2.new(-0.000354729069, 0, 0, 0)
TextLabel_11.Size = UDim2.new(0, 49, 0, 27)
TextLabel_11.Font = Enum.Font.SourceSans
TextLabel_11.Text = "Hat"
TextLabel_11.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_11.TextScaled = true
TextLabel_11.TextSize = 50.000
TextLabel_11.TextWrapped = true

-- Scripts:

local function UCTSGTA_fake_script() -- credits.LocalScript 
    local script = Instance.new('LocalScript', credits)

    script.Parent.MouseButton1Click:Connect(
        function()
            script.Parent.Parent.Scripts.Visible = false
            script.Parent.Parent.Credits.Visible = true
            script.Parent.Parent.Updates.Visible = false
        end)
end
coroutine.wrap(UCTSGTA_fake_script)()
local function FUPUUWX_fake_script() -- scripts.LocalScript 
    local script = Instance.new('LocalScript', scripts)

    script.Parent.MouseButton1Click:Connect(
        function()
            script.Parent.Parent.Scripts.Visible = true
            script.Parent.Parent.Credits.Visible = false
            script.Parent.Parent.Updates.Visible = false
        end)
end
coroutine.wrap(FUPUUWX_fake_script)()
local function LFORL_fake_script() -- updates.LocalScript 
    local script = Instance.new('LocalScript', updates)

    script.Parent.MouseButton1Click:Connect(
        function()
            script.Parent.Parent.Scripts.Visible = false
            script.Parent.Parent.Credits.Visible = false
            script.Parent.Parent.Updates.Visible = true
        end)
end
coroutine.wrap(LFORL_fake_script)()
local function YLMDVM_fake_script() -- Welcome.LocalScript 
    local script = Instance.new('LocalScript', Welcome)

    user = game.Players.LocalPlayer

    script.Parent.Text = "Welcome, " .. user.Name
end
coroutine.wrap(YLMDVM_fake_script)()
local function QHASD_fake_script() -- Main.Open/Close 
    local script = Instance.new('LocalScript', Main)

    local HH = script.Parent
    local open = false
    local UserInputService = game:GetService("UserInputService")

    UserInputService.InputBegan:connect(function(keyCode)
        if keyCode.keyCode == Enum.KeyCode.LeftAlt then
            if open then
                HH.Visible = true
                open = false
            else
                open = true
                HH.Visible = false
            end
        end
    end)
end
coroutine.wrap(QHASD_fake_script)()
local function EREBEG_fake_script() -- Main.Drag 
    local script = Instance.new('LocalScript', Main)

    local dragger = {};
    local resizer = {};

    do
        local mouse = game:GetService("Players").LocalPlayer:GetMouse();
        local inputService = game:GetService('UserInputService');
        local heartbeat = game:GetService("RunService").Heartbeat;
        function dragger.new(frame)
            local s, event = pcall(function() return frame.MouseEnter end)

            if s then
                frame.Active = true;

                event:connect(function()
                    local input = frame.InputBegan:connect(
                                      function(key)
                            if key.UserInputType ==
                                Enum.UserInputType.MouseButton1 then
                                local objectPosition =
                                    Vector2.new(
                                        mouse.X - frame.AbsolutePosition.X,
                                        mouse.Y - frame.AbsolutePosition.Y);
                                while heartbeat:wait() and
                                    inputService:IsMouseButtonPressed(
                                        Enum.UserInputType.MouseButton1) do
                                    frame:TweenPosition(
                                        UDim2.new(0,
                                                  mouse.X - objectPosition.X +
                                                      (frame.Size.X.Offset *
                                                          frame.AnchorPoint.X),
                                                  0,
                                                  mouse.Y - objectPosition.Y +
                                                      (frame.Size.Y.Offset *
                                                          frame.AnchorPoint.Y)),
                                        'Out', 'Quad', 0.1, true);
                                end
                            end
                        end)

                    local leave;
                    leave = frame.MouseLeave:connect(
                                function()
                            input:disconnect();
                            leave:disconnect();
                        end)
                end)
            end
        end

        function resizer.new(p, s)
            p:GetPropertyChangedSignal('AbsoluteSize'):connect(
                function()
                    s.Size = UDim2.new(s.Size.X.Scale, s.Size.X.Offset,
                                       s.Size.Y.Scale, p.AbsoluteSize.Y);
                end)
        end
    end
    script.Parent.Active = true
    script.Parent.Draggable = true
end
