-- what the script has:
-- kill aura, god mode, auto pickup, inf stamina
warn("LOADING SCRIPT, MADE BY ProtonDev-Sys#4419")
local httpservice = game:GetService("HttpService")
local old
old = hookfunction(game:GetService("ReplicatedStorage").modules.network
                       .replicatePlayerAnimationSequence.FireServer,
                   function(...)
    local args = {...}
    for i, v in pairs({...}) do
        if v == 'monster' then args[i] = 'equipment' end
    end
    return old(unpack(args))
end)
local c = 1
coroutine.wrap(function() while wait(1) do c = 1 end end)()
local ohString1 = "daggerAnimations"
local ohTable3 = {["attackSpeed"] = 0}

function dmg(v)
    if v:FindFirstChild('health') == nil or v.health.Value <= 0 then return end

    game:GetService("ReplicatedStorage").modules.network
        .playerRequest_damageEntity:FireServer(v, game.Players.LocalPlayer
                                                   .Character.PrimaryPart
                                                   .Position, 'equipment')
    game:GetService("ReplicatedStorage").modules.network
        .playerRequest_damageEntity:FireServer(v, game.Players.LocalPlayer
                                                   .Character.PrimaryPart
                                                   .Position, 'equipment')
    local ida = httpservice:GenerateGUID()
    ida = string.sub(ida, 1, #ida - 1)
    local id = math.random(10, 100)
    local ohNumber1 = id
    local ohBoolean2 = true
    local ohTable3 = {
        ["cast-weapon-id"] = 5,
        ["mouse-world-position"] = v.Position,
        ["ability-statistics"] = {
            ["range"] = math.huge,
            ["manaCost"] = 0,
            ["cooldown"] = 0,
            ["damageMultiplier"] = math.huge
        },
        ["manual-aim"] = false,
        ["ability-guid"] = ida,
        ["_dex"] = 0,
        ["target-position"] = v.Position,
        ["target-velocity"] = v.Velocity,
        ["camera-cframe"] = CFrame.new(-4.23738432, 82.7017441, -139.418304,
                                       0.973817468, -0.12980631, 0.186627701, 0,
                                       0.820949852, 0.571000278, -0.22733143,
                                       -0.556050062, 0.799455285),
        ["mouse-screen-position"] = Vector2.new(706, 416),
        ["_str"] = 12,
        ["id"] = id,
        ["step"] = 1,
        ["_int"] = 0,
        ["mouse-target-position"] = v.Position,
        ["cast-origin"] = v.Position,
        ["cast-player-userId"] = game.Players.LocalPlayer.UserId,
        ["times-updated"] = 0,
        ["_vit"] = 0,
        ["ability-state"] = "begin",
        ["absolute-mouse-world-position"] = v.Position,
        ["target-distance-away"] = 0,
        ["mouse-target"] = v
    }
    local ohString4 = ida

    game:GetService("ReplicatedStorage").modules.network
        .replicateAbilityStateChangeByPlayer:FireServer(ohNumber1, ohBoolean2,
                                                        ohTable3, ohString4)

    local ohInstance1 = v
    local ohVector32 = v.Position
    local ohString3 = "ability"
    local ohNumber4 = id
    local ohString5 = "rock-hit"
    local ohString6 = ida

    game:GetService("ReplicatedStorage").modules.network
        .playerRequest_damageEntity:FireServer(ohInstance1, ohVector32,
                                               ohString3, ohNumber4, ohString5,
                                               ohString6)
    game:GetService("ReplicatedStorage").modules.network
        .playerRequest_damageEntity:FireServer(ohInstance1, ohVector32,
                                               ohString3, ohNumber4, ohString5,
                                               ohString6)

    local ohNumber1 = id
    local ohString2 = "end"

    game:GetService("ReplicatedStorage").modules.network
        .replicateAbilityStateChangeByPlayer:FireServer(ohNumber1, ohString2)

end
coroutine.wrap(function()
    while wait() do
        game:GetService("ReplicatedStorage").modules.network
            .replicatePlayerAnimationSequence:FireServer(ohString1, "strike1",
                                                         ohTable3)
        game:GetService("ReplicatedStorage").modules.network
            .replicatePlayerAnimationSequence:FireServer(ohString1, "strike2",
                                                         ohTable3)
        game:GetService("ReplicatedStorage").modules.network.fireEvent:FireServer(
            "playerWillUseBasicAttack", game.Players.LocalPlayer)
    end
end)()
function attack()
    for i, v in pairs(game:GetService("Workspace").placeFolders
                          .entityRenderCollection:GetChildren()) do

        if v:FindFirstChild('clientHitboxToServerHitboxReference') and
            v.clientHitboxToServerHitboxReference.Value ~= nil then
            if v.clientHitboxToServerHitboxReference.Value.Name == 'hitbox' and
                game.Players:FindFirstChild(
                    v.clientHitboxToServerHitboxReference.Value.Parent.Name) ==
                nil or v.clientHitboxToServerHitboxReference.Value.Name ~=
                'hitbox' then
                if (v.clientHitboxToServerHitboxReference.Value.Position -
                    game.Players.LocalPlayer.Character.PrimaryPart.Position).magnitude <=
                    15 then
                    dmg(v.clientHitboxToServerHitboxReference.Value)
                end
            end
        end
    end
end
coroutine.wrap(function()
    while wait() do
        for i, v in pairs(
                        game:GetService("Workspace").placeFolders.items:GetChildren()) do
            if v.ClassName ~= 'Model' and
                (v.Position -
                    game.Players.LocalPlayer.Character.PrimaryPart.Position).magnitude <
                5 or v.ClassName == 'Model' and (v.PrimaryPart.Position -
                game.Players.LocalPlayer.Character.PrimaryPart.Position).magnitude <
                5 then
                game:GetService("ReplicatedStorage").modules.network
                    .pickUpItemRequest:InvokeServer(v)
            end
        end
    end
end)()
coroutine.wrap(function()
    while wait() do
        game.Players.LocalPlayer.Character.hitbox.stamina.Value =
            game.Players.LocalPlayer.Character.hitbox.maxStamina.Value
    end
end)()
coroutine.wrap(function()
    while true do
        game:GetService("RunService").Heartbeat:wait()
        game.Players.LocalPlayer.Character.PrimaryPart.mana.Value =
            game.Players.LocalPlayer.Character.PrimaryPart.maxMana.Value
    end
end)()
while wait() do attack() end
