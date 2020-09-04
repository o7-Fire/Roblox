local abc = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local scrolling = Instance.new("ScrollingFrame")
local bar = Instance.new("Frame")

abc.Name = "abc"
abc.Parent = game.CoreGui

main.Name = "main"
main.Parent = abc
main.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
bar.BorderSizePixel = 0
main.Position = UDim2.new(0.362022996, 0, 0.26242438, 0)
main.Size = UDim2.new(0, 354, 0, 240)
main.Active = true
main.Draggable = true

scrolling.Name = "scrolling"
scrolling.Parent = main
scrolling.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
bar.BorderSizePixel = 0
scrolling.Position = UDim2.new(0, 0, 0.15, 0)
scrolling.Size = UDim2.new(0, 300, 0, 200)
scrolling.Active = true

bar.Name = "bar"
bar.Parent = main
bar.BackgroundColor3 = Color3.new(0.12549, 0.12549, 0.12549)
bar.BorderSizePixel = 0
bar.Position = UDim2.new(-0.000933796167, 0, -0.00093537569, 0)
bar.Size = UDim2.new(0, 354, 0, 34)

local armoredpatrol = Instance.new("Frame")
local aptext = Instance.new("TextLabel")
local chatbypass = Instance.new("Frame")
local cbtext = Instance.new("TextLabel")

function MakeNewCmd(name, nametext, name2, posy, functionload)
name.Name = name
name.Parent = scrolling
name.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
name.BorderColor3 = Color3.new(1, 1, 1)
name.Position = UDim2.new(0.100628927, -20, posy, 0)
name.Size = UDim2.new(0, 18, 0, 18)
name.AutoButtonColor = false
name.Font = Enum.Font.SourceSans
name.Text = ""
name.TextColor3 = Color3.new(0, 0, 0)
name.TextSize = 14

nametext.Name = nametext
nametext.Parent = scrolling
nametext.BackgroundColor3 = Color3.new(1, 1, 1)
nametext.BackgroundTransparency = 1
nametext.Position = UDim2.new(0.268361211, -0, posy, 0)
nametext.Size = UDim2.new(0, 85, 0, 18)
nametext.Font = Enum.Font.Gotham
nametext.Text = name2
nametext.TextColor3 = Color3.new(1, 1, 1)
nametext.TextSize = 12
name.MouseButton1Down:connect(function()
	 loadstring(game:HttpGet(functionload))()
end)
end

MakeNewCmd(armoredpatrol, aptext, "Armored Patrol", 0.05, "https://raw.githubusercontent.com/machport/machport.github.io/master/ArmoredPatrol.lua")
MakeNewCmd(chatbypass, cbtext, "Chat Bypasser", 0.1, "https://pastebin.com/raw/JFeVbTv6")
