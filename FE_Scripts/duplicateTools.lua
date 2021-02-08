--[[
Cyclically's FE Tool Duplicate Tools V5
After executing the script, please wait until you are able to move your character again.
https://v3rmillion.net/member.php?action=profile&uid=785986

guess who's back. nothing special here, just some minor adjustments
]] local toolamount = 10 -- Amount of tools you want to get

-- Don't edit script unless you know what you're doing. If you wanna add this into a script, please give credits and message me on discord that you added it in a script at Cyclically#9215

local LocalPlayer, runservice = game:GetService("Players").LocalPlayer,
                                game:GetService("RunService")
LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
LocalPlayer.Character.Archivable = true
local tempchar, lastchar, savepos, currentamount =
    LocalPlayer.Character:Clone(), nil,
    LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame,
    #LocalPlayer.Backpack:GetChildren()
tempchar.Parent = workspace
repeat
    for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
        if tool:IsA("Tool") then tool.Parent = LocalPlayer end
    end
    LocalPlayer.Character:ClearAllChildren()
    local char = Instance.new("Model", workspace)
    Instance.new("Humanoid", char)
    LocalPlayer.Character = char
    if lastchar ~= nil then lastchar:Destroy() end
    repeat runservice.Heartbeat:Wait() until LocalPlayer.Character ~= nil
    workspace.CurrentCamera.CameraSubject = tempchar:FindFirstChild("Humanoid")
    lastchar = char
until #LocalPlayer:GetChildren() - 2 - currentamount >= toolamount and
    LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil
lastchar:Destroy()
workspace.CurrentCamera.CameraSubject = LocalPlayer.Character:FindFirstChild(
                                            "Humanoid")
for _, tool in pairs(LocalPlayer:GetChildren()) do
    if tool:IsA("Tool") then tool.Parent = LocalPlayer.Backpack end
end
LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = savepos
tempchar:Destroy()
