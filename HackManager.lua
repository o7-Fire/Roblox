-- gui made by Nexity
-- Roblox Engine is doomed -Itzbenz

local allhacks = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ArmoredPatrol = Instance.new("TextButton")

allhacks.Name = "All Hacks"
allhacks.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
allhacks.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


Frame.Parent = HitboxExtender
Frame.BackgroundColor3 = Color3.new(0.552941, 0.552941, 0.552941)
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 4
Frame.Position = UDim2.new(0.209570959, 0, 0.217821777, 0)
Frame.Size = UDim2.new(0, 224, 0, 216)

ArmoredPatrol.Name = "ArmoredPatrol"
ArmoredPatrol.Parent = Frame
ArmoredPatrol.BackgroundColor3 = Color3.new(0.737255, 0.737255, 0.737255)
ArmoredPatrol.BorderColor3 = Color3.new(0, 0, 0)
ArmoredPatrol.BorderSizePixel = 4
ArmoredPatrol.Position = UDim2.new(0.0535714291, 0, 0.717948675, 0)
ArmoredPatrol.Size = UDim2.new(0, 200, 0, 34)
ArmoredPatrol.Font = Enum.Font.SourceSans
ArmoredPatrol.Text = "Armored Patrol"
ArmoredPatrol.TextColor3 = Color3.new(0, 0, 0)
ArmoredPatrol.TextSize = 20

function ArmoredPatrolButton() -- Act.LocalScript 
  loadstring(game:HttpGet("https://raw.githubusercontent.com/machport/machport.github.io/master/ArmoredPatrol.lua"))()
end
coroutine.resume(coroutine.create(ArmoredPatrolButton))
