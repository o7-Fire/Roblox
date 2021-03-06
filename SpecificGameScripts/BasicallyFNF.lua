-- trash osu!mania rip off game
-- now on roblox wtf
-- https://v3rmillion.net/showthread.php?tid=1101199
-- https://www.roblox.com/games/6417009050/Basically-FNF
-- script makes it downscroll and change the keybinds
-- Binds
local Settings = {
    DownScroll = true,
    Position = 800
}
local binds = {
    Z = "Left",
    X = "Down",
    N = "Up",
    M = "Right"
}

-- Variable
local player = game.Players.LocalPlayer

-- Services
local vim = game:GetService("VirtualInputManager")
local uis = game:GetService("UserInputService")

-- Listener
uis.InputBegan:Connect(function(sex)
    if binds[sex.KeyCode.Name] then
        vim:SendKeyEvent(true,Enum.KeyCode[binds[sex.KeyCode.Name]],false,game)
        vim:SendKeyEvent(false,Enum.KeyCode[binds[sex.KeyCode.Name]],false,game)
    end
end)

-- Game
function gameGui()
    local stuff = player.PlayerGui:GetChildren()
    for i = 1, #stuff do local v = stuff[i]
        if #v:GetChildren() > 3 then return v end
    end
end

-- Downscroll
function downsyndrome()
    local fuckoff = {"O","P"}
    for i = 1, 2 do
        for i,v in pairs(gameGui()["KeySync"..fuckoff[i]]:GetChildren()) do
            if v.Name:find("Arrow") then
                v.Rotation += 180
                v.Position = UDim2.new(v.Position.X.Scale, v.Position.X.Offset, v.Position.Y.Scale, Settings.Position)
            elseif v.Name == "Hit" then
                for i,v in pairs(v:GetChildren()) do
                    v.Rotation += 180
                    v.Position = UDim2.new(v.Position.X.Scale, v.Position.X.Offset, v.Position.Y.Scale, Settings.Position)                
                end
            end
        end
    end
end

-- Start
if Settings.DownScroll then
    if gameGui() then
        downsyndrome()
    end
    game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(v)
        wait(1)
        if gameGui() then
            downsyndrome()
        end
    end)
end
