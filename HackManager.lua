-- gui made by Nexity
-- Roblox Engine is doomed -Itzbenz

-- Instances:
local scripthubb = Instance.new("Frame")
local armoredpatrolgui = Instance.new("TextButton")
local lumbergui = Instance.new("TextButton")
local madcitygui = Instance.new("TextButton")
local startfling = Instance.new("TextButton")
local topkekscript = Instance.new("TextButton")
local stopfling = Instance.new("TextButton")
local tittle = Instance.new("TextLabel")
local informationhub = Instance.new("TextLabel")
--Properties:
scripthubb.Name = "scripthubb"
scripthubb.Parent = game.StarterGui.ScreenGui.login
scripthubb.BackgroundColor3 = Color3.new(0, 0, 0)
scripthubb.BackgroundTransparency = 0.30000001192093
scripthubb.Position = UDim2.new(1.19514966, 0, 0.263546169, 0)
scripthubb.Size = UDim2.new(0, 572, 0, 318)

armoredpatrolgui.Name = "armoredpatrolgui"
armoredpatrolgui.Parent = scripthubb
armoredpatrolgui.BackgroundColor3 = Color3.new(0, 0, 0)
armoredpatrolgui.Position = UDim2.new(0.713123918, 0, 0.166671276, 0)
armoredpatrolgui.Size = UDim2.new(0, 164, 0, 37)
armoredpatrolgui.Font = Enum.Font.GothamBold
armoredpatrolgui.Text = "Armored Patrol GUI"
armoredpatrolgui.TextColor3 = Color3.new(1, 1, 1)
armoredpatrolgui.TextSize = 15
armoredpatrolgui.TextWrapped = true

lumbergui.Name = "lumbergui"
lumbergui.Parent = scripthubb
lumbergui.BackgroundColor3 = Color3.new(0, 0, 0)
lumbergui.Position = UDim2.new(0.356309444, 0, 0.166671276, 0)
lumbergui.Size = UDim2.new(0, 164, 0, 37)
lumbergui.Font = Enum.Font.GothamBold
lumbergui.Text = "LT2 GUI"
lumbergui.TextColor3 = Color3.new(1, 1, 1)
lumbergui.TextSize = 15
lumbergui.TextWrapped = true

madcitygui.Name = "madcitygui"
madcitygui.Parent = scripthubb
madcitygui.BackgroundColor3 = Color3.new(0, 0, 0)
madcitygui.Position = UDim2.new(0.356309444, 0, 0.348260105, 0)
madcitygui.Size = UDim2.new(0, 164, 0, 37)
madcitygui.Font = Enum.Font.GothamBold
madcitygui.Text = "Mad City GUI"
madcitygui.TextColor3 = Color3.new(1, 1, 1)
madcitygui.TextSize = 15
madcitygui.TextWrapped = true

startfling.Name = "startfling"
startfling.Parent = scripthubb
startfling.BackgroundColor3 = Color3.new(0, 0, 0)
startfling.Position = UDim2.new(0.712781668, 0, 0.348260105, 0)
startfling.Size = UDim2.new(0, 164, 0, 37)
startfling.Font = Enum.Font.GothamBold
startfling.Text = "Fling Kill (Start)"
startfling.TextColor3 = Color3.new(1, 1, 1)
startfling.TextSize = 15
startfling.TextWrapped = true

topkekscript.Name = "topkekscript"
topkekscript.Parent = scripthubb
topkekscript.BackgroundColor3 = Color3.new(0, 0, 0)
topkekscript.Position = UDim2.new(-0.000505030155, 0, 0.166671276, 0)
topkekscript.Size = UDim2.new(0, 164, 0, 37)
topkekscript.Font = Enum.Font.GothamBold
topkekscript.Text = "T0PK3K v4"
topkekscript.TextColor3 = Color3.new(1, 1, 1)
topkekscript.TextSize = 15
topkekscript.TextWrapped = true

stopfling.Name = "stopfling"
stopfling.Parent = scripthubb
stopfling.BackgroundColor3 = Color3.new(0, 0, 0)
stopfling.Position = UDim2.new(-0.000162790529, 0, 0.348260105, 0)
stopfling.Size = UDim2.new(0, 164, 0, 37)
stopfling.Font = Enum.Font.GothamBold
stopfling.Text = "Fling Kill (Stop)"
stopfling.TextColor3 = Color3.new(1, 1, 1)
stopfling.TextSize = 15
stopfling.TextWrapped = true

tittle.Name = "tittle"
tittle.Parent = scripthubb
tittle.BackgroundColor3 = Color3.new(0, 0, 0)
tittle.BackgroundTransparency = 1
tittle.Position = UDim2.new(-0.000733047724, 0, -0.00293746591, 0)
tittle.Size = UDim2.new(0, 572, 0, 50)
tittle.Font = Enum.Font.GothamBold
tittle.Text = "Mad's Script Hub"
tittle.TextColor3 = Color3.new(1, 1, 1)
tittle.TextSize = 20

informationhub.Name = "informationhub"
informationhub.Parent = scripthubb
informationhub.BackgroundColor3 = Color3.new(0, 0, 0)
informationhub.Position = UDim2.new(0.00174825173, 0, 0.8205356, 0)
informationhub.Size = UDim2.new(0, 571, 0, 57)
informationhub.Font = Enum.Font.GothamBold
informationhub.Text = "This is a script hub made by Mad. If you encounter any problems or you would like to give suggestions, DM MadRobloxGuy2017#3407"
informationhub.TextColor3 = Color3.new(1, 1, 1)
informationhub.TextSize = 14
informationhub.TextWrapped = true
-- Scripts:

armoredpatrolgui.MouseButton1Down:connect(function()
	 loadstring(game:HttpGet("https://raw.githubusercontent.com/machport/machport.github.io/master/ArmoredPatrol.lua"))()
end)
