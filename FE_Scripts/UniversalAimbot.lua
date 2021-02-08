print("Key to toggle esp is V.")
print("Aim-key is Left-Alt.")

ENABLED = false
PLAYER = game.Players.LocalPlayer
MOUSE = PLAYER:GetMouse()
CC = game.Workspace.CurrentCamera
_G.FREE_FOR_ALL = false
_G.BIND = 52
_G.AIM_AT = 'Head'
local player = game.Players.LocalPlayer
local esp = false
local track = false

function Create(base, team)
    local bb = Instance.new("BillboardGui", player.PlayerGui)
    bb.Adornee = base
    bb.ExtentsOffset = Vector3.new(0, 1, 0)
    bb.AlwaysOnTop = true
    bb.Size = UDim2.new(0, 5, 0, 5)
    bb.StudsOffset = Vector3.new(0, 1, 0)
    bb.Name = "tracker"
    local frame = Instance.new("Frame", bb)
    frame.ZIndex = 10
    frame.BackgroundTransparency = 0.3
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Position = UDim2.new(0, 0, 0)
    frame.Transparency = 1
    local txtlbl = Instance.new("TextLabel", bb)
    txtlbl.ZIndex = 10
    txtlbl.Text = (string.upper(base.Parent.Name))
    txtlbl.BackgroundTransparency = 1
    txtlbl.Position = UDim2.new(0, 0, 0, -35)
    txtlbl.Size = UDim2.new(1, 0, 10, 0)
    txtlbl.Font = "SourceSansBold"
    txtlbl.FontSize = "Size10"
    txtlbl.TextStrokeTransparency = 0.5

    local txtlbl2 = Instance.new("TextLabel", bb)
    txtlbl2.ZIndex = 10
    txtlbl2.Text = (math.floor(base.Parent.Humanoid.Health * 100) / 100)
    txtlbl2.BackgroundTransparency = 1
    txtlbl2.Position = UDim2.new(0, 0, 0, -25)
    txtlbl2.Size = UDim2.new(1, 0, 10, 0)
    txtlbl2.Font = "SourceSansBold"
    txtlbl2.FontSize = "Size10"

    txtlbl2.TextStrokeTransparency = 0.5
    if team then
        txtlbl.TextColor3 = Color3.new(0, 255, 0)
        txtlbl2.TextColor3 = Color3.new(255, 0, 0)
        frame.BackgroundColor3 = Color3.new(255, 0, 0)

    elseif base.Parent.Name == "whielist kid" or base.Parent.Name ==
        "second whitelist kid here" then
        txtlbl.TextColor3 = Color3.new(0, 255, 0)
        txtlbl2.TextColor3 = Color3.new(0, 255, 0)
        frame.BackgroundColor3 = Color3.new(0, 255, 0)
        txtlbl.Text = "FRIEND"
        txtlbl.FontSize = "Size14"
        txtlbl2.FontSize = "Size14"

    elseif base.Parent.Name == game.Players.LocalPlayer.Name then
        txtlbl2.Transparency = 1
        txtlbl.Transparency = 1
        frame.Transparency = 1
    else
        txtlbl.TextColor3 = Color3.new(255, 0, 0)
        txtlbl2.TextColor3 = Color3.new(255, 0, 0)
        frame.BackgroundColor3 = Color3.new(255, 0, 0)

    end
end

function Find()
    Clear()
    track = true
    spawn(function()
        while wait() do
            if track then
                Clear()
                for _, v in pairs(game.Players:players()) do

                    if v.Character and v.Character.Head then
                        Create(v.Character.Head, false)
                    end
                end
            end
        end
        wait(1)
    end)
end
function Clear()
    for _, v in pairs(player.PlayerGui:children()) do
        if v.Name == "tracker" and v:isA("BillboardGui") then v:Destroy() end
    end
end
mouse = game.Players.LocalPlayer:GetMouse()
mouse.keyDown:connect(function(key)
    if key == "v" then
        if not esp then
            Find()
            print("ESP ENABLED")
            esp = true
        else
            Clear()
            track = false
            print("ESP DISABLED")
            esp = false
        end

    end

end)

-- aimbot

function GetNearestPlayerToMouse()
    local PLAYERS = {}
    local PLAYER_HOLD = {}
    local DISTANCES = {}
    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= PLAYER then table.insert(PLAYERS, v) end
    end
    for i, v in pairs(PLAYERS) do
        if _G.FREE_FOR_ALL == false then
            if v and (v.Character) ~= nil and v.TeamColor ~= PLAYER.TeamColor then
                local AIM = v.Character:FindFirstChild(_G.AIM_AT)
                if AIM ~= nil then
                    local DISTANCE = (AIM.Position -
                                         game.Workspace.CurrentCamera
                                             .CoordinateFrame.p).magnitude
                    local RAY = Ray.new(game.Workspace.CurrentCamera
                                            .CoordinateFrame.p, (MOUSE.Hit.p -
                                            CC.CoordinateFrame.p).unit *
                                            DISTANCE)
                    local HIT, POS = game.Workspace:FindPartOnRay(RAY,
                                                                  game.Workspace)
                    local DIFF = math.floor((POS - AIM.Position).magnitude)
                    PLAYER_HOLD[v.Name .. i] = {}
                    PLAYER_HOLD[v.Name .. i].dist = DISTANCE
                    PLAYER_HOLD[v.Name .. i].plr = v
                    PLAYER_HOLD[v.Name .. i].diff = DIFF
                    table.insert(DISTANCES, DIFF)
                end
            end
        elseif _G.FREE_FOR_ALL == true then
            local AIM = v.Character:FindFirstChild(_G.AIM_AT)
            if AIM ~= nil then
                local DISTANCE = (AIM.Position -
                                     game.Workspace.CurrentCamera
                                         .CoordinateFrame.p).magnitude
                local RAY = Ray.new(
                                game.Workspace.CurrentCamera.CoordinateFrame.p,
                                (MOUSE.Hit.p - CC.CoordinateFrame.p).unit *
                                    DISTANCE)
                local HIT, POS = game.Workspace:FindPartOnRay(RAY,
                                                              game.Workspace)
                local DIFF = math.floor((POS - AIM.Position).magnitude)
                PLAYER_HOLD[v.Name .. i] = {}
                PLAYER_HOLD[v.Name .. i].dist = DISTANCE
                PLAYER_HOLD[v.Name .. i].plr = v
                PLAYER_HOLD[v.Name .. i].diff = DIFF
                table.insert(DISTANCES, DIFF)
            end
        end
    end

    if unpack(DISTANCES) == nil then return false end

    local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
    if L_DISTANCE > 20 then return false end

    for i, v in pairs(PLAYER_HOLD) do
        if v.diff == L_DISTANCE then return v.plr end
    end
    return false
end

local TRACK = false

MOUSE.KeyDown:connect(function(KEY)
    KEY = KEY:lower():byte()
    if KEY == _G.BIND then ENABLED = true end
end)
MOUSE.KeyUp:connect(function(KEY)
    KEY = KEY:lower():byte()
    if KEY == _G.BIND then ENABLED = false end
end)

game:GetService('RunService').RenderStepped:connect(
    function()
        if ENABLED then
            local TARGET = GetNearestPlayerToMouse()
            if TARGET.Name == "Whitelist kid here" or TARGET.Name ==
                "second whitelist kid here" then
            else

                if (TARGET ~= false) then
                    local AIM = TARGET.Character:FindFirstChild(_G.AIM_AT)
                    if AIM then
                        CC.CoordinateFrame =
                            CFrame.new(CC.CoordinateFrame.p, AIM.CFrame.p)
                    end
                end
            end
        end
    end)
