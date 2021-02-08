-- Hats Needed
-- https://www.roblox.com/catalog/62724852/Chestnut-Bun
-- https://www.roblox.com/catalog/63690008/Pal-Hair
-- https://www.roblox.com/catalog/48474294/ROBLOX-Girl-Hair
-- Replace USERNAME with your Roblox Username
game.Players.LocalPlayer.Character["Pal Hair"].Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character["Kate Hair"].Handle.Mesh:Destroy()
game.Players.LocalPlayer.Character["Pink Hair"].Handle.Mesh:Destroy()

local Player = game:GetService("Players").LocalPlayer
local Character = game.Workspace.USERNAME -- REPLACE USERNAME WITH UR NAME
local Hats = {
    gun = game.Workspace.USERNAME:WaitForChild("Kate Hair") -- REPLACE USERNAME WITH UR NAME

}
Hats.gun.Handle.AccessoryWeld:Remove()
local function align(i, v)
    local att0 = Instance.new("Attachment", i)
    att0.Position = Vector3.new(0, 0, 0)
    local att1 = Instance.new("Attachment", v)
    att1.Position = Vector3.new(0, -1.5, -1)
    local AP = Instance.new("AlignPosition", i)
    AP.Attachment0 = att0
    AP.Attachment1 = att1
    AP.RigidityEnabled = false
    AP.ReactionForceEnabled = false
    AP.ApplyAtCenterOfMass = true
    AP.MaxForce = 9999999
    AP.MaxVelocity = math.huge
    AP.Responsiveness = 1000000000000
    local AO = Instance.new("AlignOrientation", i)
    AO.Attachment0 = att0
    AO.Attachment1 = att1
    AO.ReactionTorqueEnabled = false
    AO.PrimaryAxisOnly = false
    AO.MaxTorque = 9999999
    AO.MaxAngularVelocity = math.huge
    AO.Responsiveness = 10000000000000
end
align(Hats.gun.Handle, Character["Torso"])

Hats.gun.Handle.Attachment.Orientation = Vector3.new(90, 90, 0)
local Hats = {
    gun = game.Workspace.USERNAME:WaitForChild("Pink Hair") -- REPLACE USERNAME WITH UR NAME

}
Hats.gun.Handle.AccessoryWeld:Remove()
local function align(i, v)
    local att0 = Instance.new("Attachment", i)
    att0.Position = Vector3.new(0, 0, 0)
    local att1 = Instance.new("Attachment", v)
    att1.Position = Vector3.new(0, -1, -1.5)
    local AP = Instance.new("AlignPosition", i)
    AP.Attachment0 = att0
    AP.Attachment1 = att1
    AP.RigidityEnabled = false
    AP.ReactionForceEnabled = false
    AP.ApplyAtCenterOfMass = true
    AP.MaxForce = 9999999
    AP.MaxVelocity = math.huge
    AP.Responsiveness = 1000000000000
    local AO = Instance.new("AlignOrientation", i)
    AO.Attachment0 = att0
    AO.Attachment1 = att1
    AO.ReactionTorqueEnabled = false
    AO.PrimaryAxisOnly = false
    AO.MaxTorque = 9999999
    AO.MaxAngularVelocity = math.huge
    AO.Responsiveness = 10000000000000
end
align(Hats.gun.Handle, Character["Torso"])

Hats.gun.Handle.Attachment.Orientation = Vector3.new(0, 0, 0)
local Hats = {
    gun = game.Workspace.USERNAME:WaitForChild("Pal Hair") -- REPLACE USERNAME WITH UR NAME

}
Hats.gun.Handle.AccessoryWeld:Remove()
local function align(i, v)
    local att0 = Instance.new("Attachment", i)
    att0.Position = Vector3.new(0, 0, 0)
    local att1 = Instance.new("Attachment", v)
    att1.Position = Vector3.new(0, -1, -3.5)
    local AP = Instance.new("AlignPosition", i)
    AP.Attachment0 = att0
    AP.Attachment1 = att1
    AP.RigidityEnabled = false
    AP.ReactionForceEnabled = false
    AP.ApplyAtCenterOfMass = true
    AP.MaxForce = 9999999
    AP.MaxVelocity = math.huge
    AP.Responsiveness = 1000000000000
    local AO = Instance.new("AlignOrientation", i)
    AO.Attachment0 = att0
    AO.Attachment1 = att1
    AO.ReactionTorqueEnabled = false
    AO.PrimaryAxisOnly = false
    AO.MaxTorque = 9999999
    AO.MaxAngularVelocity = math.huge
    AO.Responsiveness = 10000000000000
end
align(Hats.gun.Handle, Character["Torso"])

Hats.gun.Handle.Attachment.Orientation = Vector3.new(0, 0, 0)
