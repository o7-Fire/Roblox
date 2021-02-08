-- written by nexity
-- strucid has a gay anti cheat so heres how to bypass it
-- first execute this
-- it makes so you dont get kicked
function Yeet()
    game.ScriptContext:SetTimeout(0.05) -- Really does nothing now just I like to add it

    if game:GetService("Players").LocalPlayer.PlayerGui.Yeet then
        game:GetService("Players").LocalPlayer.PlayerGui.Yeet:Destroy()
    end
end

local Network = game:GetService("ReplicatedStorage").Network.RemoteEvent -- Where the kick is stored in the remotes ofc
local Hook
Hook = hookfunction(Network.FireServer, newcclosure(
                        function(...)
        local args = {...}
        if tostring(args[3]) == "INPUT VALUE" then -- Find the value hint not a number also args[3] is not the value
            Yeet()
            return nil; -- obv returns nil to the kick
        end
        return Hook(...)
    end))

-- then execute this
-- it removes the garfield

for i, v in pairs(game.Players:GetDescendants()) do
    if string.find(tostring(v.Name):lower(), 'guihandler') then v:Destroy() end
end

-- finally execute this
-- it removes the sound of ban screen

workspace.ChildAdded:Connect(function(BANSOUND)
    if BANSOUND.Name == "Sound" then BANSOUND:Destroy() end
end)

-- now you bypassed anti cheat
-- heres the actual exploits

-- god mode

while true do
    wait()
    pcall(function()
        if game:GetService 'Players'.LocalPlayer.Character:FindFirstChild(
            "Shield") then
            game:GetService 'Players'.LocalPlayer.Character.Shield:Destroy()
        end
    end)
end

-- rapid fire
-- basically firerate goes insanely high
-- changes the guns speed via upvalues

debug.getupvalue(getsenv(game:GetService("Players").LocalPlayer.PlayerGui
                             .MainGui.MainLocal).Reload, 3).Debounce = value

-- no fatigue

local RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)
