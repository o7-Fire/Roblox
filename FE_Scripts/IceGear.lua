
--/ This admin IS skidded from Overflow v1 that got leaked Credits go to them: Synttax, dhruvil, ANN0B1S
--/ If you plan to make a admin using these commands please credit the original creators.

repeat
    wait()
until game:GetService("Players").LocalPlayer ~= nil

if not game:GetService("Players").LocalPlayer.Character then
    game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
end

--/ Variables

local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")

local IceGear = {
    Cmds = {}, 
    Events = {}, 
    Debounces = {CmdCooldown = false}, 
    CommandKey = "BackSlash", -- what to open the commandbar with (check out: https://developer.roblox.com/en-us/api-reference/enum/KeyCode)
    Prefix = ";", -- need to use prefix in default chat, can also be used in commandbar but isn't necessary
}

local Settings = {
    Prefix = ";",
    Version = "1.0.0"
}

for i, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v.Name == "IceGear_AdminGui" then
        v:Destroy()
    end
end

for i, v in pairs(game:GetService("Lighting"):GetChildren()) do
    if v.Name == "BlueColorCorrection" or v.Name == "CmdBlurEffect" then
        v:Destroy()
    end
end

--/ Main Gui Creation 'n it's properties

local IceGear_AdminGui = Instance.new("ScreenGui")
local Intro = Instance.new("Folder")
local LeftFrameThing = Instance.new("Frame")
local LoadingFrame = Instance.new("Frame")
local LoadingThing = Instance.new("Frame")
local RightFrameThing = Instance.new("Frame")
local LoadingFrame_2 = Instance.new("Frame")
local LoadingThing_2 = Instance.new("Frame")
local MainLogo = Instance.new("ImageLabel")
local MainLogo2 = Instance.new("ImageLabel")
local MiddleLogoThing = Instance.new("ImageLabel")
local AdminNameLabel = Instance.new("TextLabel")
local BlueColorCorrection = Instance.new("ColorCorrectionEffect")

local ExampleLabel = Instance.new("TextLabel")
local CmdList = Instance.new("ScrollingFrame")
local CmdListUIListLayout = Instance.new("UIListLayout")
local CmdBarFrame = Instance.new("Frame")
local CmdBarDesign = Instance.new("ImageLabel")
local CmdBar = Instance.new("TextBox")
local NotificationFrame = Instance.new("TextLabel")
local CmdBlurEffect = Instance.new("BlurEffect")

local Main = Instance.new("Folder")


IceGear_AdminGui.Name = "IceGear_AdminGui"
IceGear_AdminGui.Parent = game:GetService("CoreGui")

Intro.Name = "Intro"
Intro.Parent = IceGear_AdminGui

LeftFrameThing.Name = "LeftFrameThing"
LeftFrameThing.Parent = Intro
LeftFrameThing.AnchorPoint = Vector2.new(1, 0.5)
LeftFrameThing.BackgroundColor3 = Color3.fromRGB(69, 70, 72)
LeftFrameThing.LayoutOrder = 0
LeftFrameThing.Position = UDim2.new(-0.00100000005, 0, 0.5, 0)
LeftFrameThing.Size = UDim2.new(0.5, 0, 0.25, 0)

RightFrameThing.Name = "RightFrameThing"
RightFrameThing.Parent = Intro
RightFrameThing.AnchorPoint = Vector2.new(0, 0.5)
RightFrameThing.BackgroundColor3 = Color3.fromRGB(69, 70, 72)
RightFrameThing.LayoutOrder = 0
RightFrameThing.Position = UDim2.new(1.00100005, 0, 0.5, 0)
RightFrameThing.Size = UDim2.new(0.5, 0, 0.25, 0)

LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Parent = LeftFrameThing
LoadingFrame.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(62, 63, 65)
LoadingFrame.LayoutOrder = 1
LoadingFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingFrame.Size = UDim2.new(0.100000001, 0, 0.850000024, 0)

LoadingThing.Name = "LoadingThing"
LoadingThing.Parent = LoadingFrame
LoadingThing.AnchorPoint = Vector2.new(0.5, 1)
LoadingThing.BackgroundColor3 = Color3.fromRGB(89, 130, 82)
LoadingThing.BorderSizePixel = 0
LoadingThing.LayoutOrder = 1
LoadingThing.Position = UDim2.new(0.5, 0, 1, 0)
LoadingThing.Size = UDim2.new(1, 0, 0, 0)

LoadingFrame_2.Name = "LoadingFrame"
LoadingFrame_2.Parent = RightFrameThing
LoadingFrame_2.AnchorPoint = Vector2.new(0.5, 0.5)
LoadingFrame_2.BackgroundColor3 = Color3.fromRGB(62, 63, 65)
LoadingFrame_2.LayoutOrder = 1
LoadingFrame_2.Position = UDim2.new(0.5, 0, 0.5, 0)
LoadingFrame_2.Size = UDim2.new(0.100000001, 0, 0.850000024, 0)

LoadingThing_2.Name = "LoadingThing"
LoadingThing_2.Parent = LoadingFrame_2
LoadingThing_2.AnchorPoint = Vector2.new(0.5, 1)
LoadingThing_2.BackgroundColor3 = Color3.fromRGB(89, 130, 82)
LoadingThing_2.BorderSizePixel = 0
LoadingThing_2.LayoutOrder = 1
LoadingThing_2.Position = UDim2.new(0.5, 0, 1, 0)
LoadingThing_2.Size = UDim2.new(1, 0, 0, 0)

MiddleLogoThing.Name = "MiddleLogoThing"
MiddleLogoThing.Parent = Intro
MiddleLogoThing.AnchorPoint = Vector2.new(0.5, 0.5)
MiddleLogoThing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MiddleLogoThing.BackgroundTransparency = 1.000
MiddleLogoThing.LayoutOrder = 1
MiddleLogoThing.Position = UDim2.new(0.5, 0, 0.5, 0)
MiddleLogoThing.Size = UDim2.new(0.126000002, 0, 0.224999994, 0)
MiddleLogoThing.Visible = false
MiddleLogoThing.Image = "rbxassetid://3570695787"
MiddleLogoThing.ImageColor3 = Color3.fromRGB(53, 53, 53)
MiddleLogoThing.ImageTransparency = 1.000
MiddleLogoThing.ScaleType = Enum.ScaleType.Fit
MiddleLogoThing.SliceCenter = Rect.new(100, 100, 100, 100)
MiddleLogoThing.SliceScale = 0.120

MainLogo.Name = "MainLogo"
MainLogo.Parent = Intro
MainLogo.AnchorPoint = Vector2.new(0.5, 0.5)
MainLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainLogo.BackgroundTransparency = 1.000
MainLogo.LayoutOrder = 2
MainLogo.Position = UDim2.new(0.5, 0, 0.5, 0)
MainLogo.Size = UDim2.new(0.126000002, 0, 0.224999994, 0)
MainLogo.Visible = false
MainLogo.Image = "http://www.roblox.com/asset/?id=5280464374"
MainLogo.ImageColor3 = Color3.fromRGB(0, 0, 0)
MainLogo.ImageTransparency = 1.000
MainLogo.ScaleType = Enum.ScaleType.Fit
MainLogo.SliceCenter = Rect.new(100, 100, 100, 100)
MainLogo.SliceScale = 0.120

MainLogo2.Name = "MainLogo2"
MainLogo2.Parent = MainLogo
MainLogo2.AnchorPoint = Vector2.new(0.5, 0.5)
MainLogo2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainLogo2.BackgroundTransparency = 1.000
MainLogo2.LayoutOrder = 4
MainLogo2.Position = UDim2.new(0.5, 0, 0.5, 0)
MainLogo2.Size = UDim2.new(0.99000001, 0, 0.99000001, 0)
MainLogo2.Image = "http://www.roblox.com/asset/?id=5280464374"
MainLogo2.ImageColor3 = Color3.fromRGB(89, 85, 73)
MainLogo2.ImageTransparency = 1.000
MainLogo2.ScaleType = Enum.ScaleType.Fit
MainLogo2.SliceCenter = Rect.new(100, 100, 100, 100)
MainLogo2.SliceScale = 0.120

AdminNameLabel.Name = "AdminNameLabel"
AdminNameLabel.Parent = Intro
AdminNameLabel.AnchorPoint = Vector2.new(0.5, 0.5)
AdminNameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AdminNameLabel.BackgroundTransparency = 1.000
AdminNameLabel.BorderSizePixel = 0
AdminNameLabel.Position = UDim2.new(0.5, 0, 0.725000024, 0)
AdminNameLabel.Size = UDim2.new(0.600000024, 0, 0.075000003, 0)
AdminNameLabel.Visible = false
AdminNameLabel.Font = Enum.Font.SourceSans
AdminNameLabel.Text = ""
AdminNameLabel.TextColor3 = Color3.fromRGB(200, 197, 166)
AdminNameLabel.TextScaled = true
AdminNameLabel.TextSize = 14.000
AdminNameLabel.TextStrokeTransparency = 0.800
AdminNameLabel.TextWrapped = true

BlueColorCorrection.Name = "BlueColorCorrection"
BlueColorCorrection.Parent = game:GetService("Lighting")
BlueColorCorrection.Brightness = 0
BlueColorCorrection.Contrast = 0
BlueColorCorrection.Enabled = true
BlueColorCorrection.Saturation = 0
BlueColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)

Main.Name = "Main"
Main.Parent = IceGear_AdminGui

CmdList.Name = "-CmdList"
CmdList.Parent = Main
CmdList.Active = true
CmdList.Visible = false
CmdList.AnchorPoint = Vector2.new(0.5, 0)
CmdList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdList.BackgroundTransparency = 1.000
CmdList.BorderSizePixel = 0
CmdList.Position = UDim2.new(0.5, 0, 0.574999988, 0)
CmdList.Size = UDim2.new(0.200000003, 0, 0.300000012, 0)
CmdList.CanvasSize = UDim2.new(0, 0, 0, 0)

ExampleLabel.Name = "ExampleLabel"
ExampleLabel.Parent = CmdList
ExampleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ExampleLabel.BackgroundTransparency = 1.000
ExampleLabel.BorderSizePixel = 0
ExampleLabel.Size = UDim2.new(1, 0, 0.174999997, 0)
ExampleLabel.Visible = false
ExampleLabel.Font = Enum.Font.SourceSans
ExampleLabel.TextColor3 = Color3.fromRGB(222, 222, 222)
ExampleLabel.TextSize = 14.000
ExampleLabel.TextStrokeTransparency = 1 -- 0.9
ExampleLabel.TextTransparency = 1 -- 0


CmdListUIListLayout.Name = "CmdListUIListLayout"
CmdListUIListLayout.Parent = CmdList
CmdListUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

CmdBarFrame.Name = "CmdBarFrame"
CmdBarFrame.Parent = Main
CmdBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
CmdBarFrame.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
CmdBarFrame.BackgroundTransparency = 0.500
CmdBarFrame.BorderSizePixel = 0
CmdBarFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
CmdBarFrame.Size = UDim2.new(1, 0, 0, 0) -- UDim2.new(1, 0, 0.100000001, 0)

CmdBarDesign.Name = "CmdBarDesign"
CmdBarDesign.Parent = CmdBarFrame
CmdBarDesign.AnchorPoint = Vector2.new(0.5, 0.5)
CmdBarDesign.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdBarDesign.BackgroundTransparency = 1.000
CmdBarDesign.BorderSizePixel = 0
CmdBarDesign.Position = UDim2.new(0.5, 0, 0.5, 0)
CmdBarDesign.Size = UDim2.new(0.25, 0, 0.75, 0)
CmdBarDesign.Image = "rbxassetid://3570695787"
CmdBarDesign.ImageColor3 = Color3.fromRGB(53, 53, 53)
CmdBarDesign.ImageTransparency = 1 -- 0.750
CmdBarDesign.ScaleType = Enum.ScaleType.Slice
CmdBarDesign.SliceCenter = Rect.new(100, 100, 100, 100)
CmdBarDesign.SliceScale = 0.120

CmdBar.Name = "CmdBar"
CmdBar.Parent = CmdBarDesign
CmdBar.AnchorPoint = Vector2.new(0.5, 0.5)
CmdBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdBar.BackgroundTransparency = 1.000
CmdBar.BorderSizePixel = 0
CmdBar.Position = UDim2.new(0.5, 0, 0.5, 0)
CmdBar.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
CmdBar.Font = Enum.Font.SourceSans
CmdBar.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
CmdBar.PlaceholderText = "Type command here, enter to execute"
CmdBar.Text = ""
CmdBar.TextColor3 = Color3.fromRGB(231, 231, 231)
CmdBar.TextTransparency = 1 -- 0
CmdBar.TextSize = 17.000

NotificationFrame.Name = "NotificationFrame"
NotificationFrame.Parent = ScreenGui
NotificationFrame.AnchorPoint = Vector2.new(0.5, 0)
NotificationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationFrame.BackgroundTransparency = 1.000
NotificationFrame.BorderSizePixel = 0
NotificationFrame.Position = UDim2.new(0.5, 0, -0.5, 0) -- UDim2.new(0.5, 0, 0.0250000004, 0)
NotificationFrame.Size = UDim2.new(0.5, 0, 0, 20)
NotificationFrame.Visible = false
NotificationFrame.Font = Enum.Font.SourceSans
NotificationFrame.Text = ""
NotificationFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
NotificationFrame.TextSize = 20.000
NotificationFrame.TextStrokeTransparency = 0.800
NotificationFrame.TextWrapped = true
NotificationFrame.TextYAlignment = Enum.TextYAlignment.Top

CmdBlurEffect.Name = "CmdBlurEffect"
CmdBlurEffect.Parent = game:GetService("Lighting")
CmdBlurEffect.Enabled = true
CmdBlurEffect.Size = 0 -- 10


--/ Functions

function IceGear.Notify(message, possibletimer)
    spawn(function()
        for i, v in pairs(Main:GetChildren()) do
            if v.Name == "-NewNotification" then
                spawn(function()
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 1, TextStrokeTransparency = 1, Position = UDim2.new(0.5, 0, -0.5, 0)}):Play()
                    wait(0.25)
                    v:Destroy()
                end)
            end
        end

        local Notification = NotificationFrame:Clone()
        Notification.Name = "-NewNotification"
        Notification.Parent = Main
        Notification.Visible = true 
        Notification.Text = tostring(message)
        game:GetService("TweenService"):Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 0, TextStrokeTransparency = 0.8, Position = UDim2.new(0.5, 0, 0.0250000004, 0)}):Play()

        local NotificationRemove = false
        local Timer = 1

        if typeof(possibletimer) == "table" and typeof(possibletimer[1]) == "number" and typeof(possibletimer[2]) == "number" and typeof(possibletimer[3]) == "number" then
            spawn(function()
                
                for i = possibletimer[1], possibletimer[2], -possibletimer[3] do
                    Timer = i

                    if NotificationRemove == false and Timer > 0 then
                        wait(possibletimer[3])
                    else
                        break
                    end
                end
                if NotificationRemove == false then
                    NotificationRemove = true 
                end
            end)
        end

        repeat
            if typeof(possibletimer) == "table" and typeof(possibletimer[1]) == "number" and typeof(possibletimer[2]) == "number" and typeof(possibletimer[3]) == "number" then
                Notification.Text = tostring(message) .. "\n(" .. Timer .. ")"
            else
                Notification.Text = tostring(message)
            end
            Notification.Size = UDim2.new(0.5, 0, 9e9, 0)
            Notification.Size = UDim2.new(0.5, 0, Notification.TextBounds.Y, 0)
            
            wait()
        until NotificationRemove == true or IceGear_AdminGui.Parent ~= game:GetService("CoreGui") or Timer <= 0
        
        game:GetService("TweenService"):Create(Notification, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 1, TextStrokeTransparency = 1, Position = UDim2.new(0.5, 0, -0.5, 0)}):Play()
        wait(0.25)
        Notification:Destroy()
    end)
end

function IceGear.UpdateCmdList(cmdguiobject, cmdlistsettings)
    if cmdguiobject.Name == "-CmdList" and cmdguiobject.ClassName == "ScrollingFrame" then
        
        for i, v in pairs(cmdguiobject:GetChildren()) do
            if v:IsA("GuiObject") and v.Visible == true then
                v:Destroy()
            end
        end


        if typeof(cmdlistsettings) == "table" and cmdlistsettings[1] ~= nil and cmdlistsettings[1].ClassName == "TextBox" then
            if cmdlistsettings[2] == "alphabetical" then
                
                cmdguiobject.CanvasSize = UDim2.new(0, 0, 0, 0)

                for i, v in pairs(IceGear.Cmds) do
                    if v[1] ~= nil and string.find(string.lower(v[1]), string.lower(string.split(cmdlistsettings[1].Text, " ")[1])) then
                        
                        local Cmd = ExampleLabel:Clone()
                        Cmd.Name = v[1] .. "_Cmd"
                        Cmd.Visible = true
                        Cmd.Parent = cmdguiobject
                        game:GetService("TweenService"):Create(Cmd, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0, TextStrokeTransparency = 0.9}):Play()
                        if v[4] ~= nil then
                            Cmd.Text = v[1] .. " [" .. v[4] .. "]"
                        else
                            Cmd.Text = v[1]
                        end
                        
                        local GetTextSizeY = game:GetService("TextService"):GetTextSize(Cmd.Text, Cmd.TextSize, Cmd.Font, Cmd.AbsoluteSize).Y
                        Cmd.Size = UDim2.new(0.949999988, 0, 0, GetTextSizeY + 10)
                        
                        cmdguiobject.CanvasSize = UDim2.new(cmdguiobject.CanvasSize.X.Scale, cmdguiobject.CanvasSize.X.Offset, 0, cmdguiobject.CanvasSize.Y.Offset + Cmd.TextBounds.Y + 15)

                    end
                end
                
            elseif cmdlistsettings[2] == "none" then
                
                cmdguiobject.CanvasSize = UDim2.new(0, 0, 0, 0)

                for i, v in pairs(IceGear.Cmds) do
                    if v[1] ~= nil and string.find(string.lower(v[1]), string.lower(string.split(cmdlistsettings[1].Text, " ")[1])) then
                        
                        local Cmd = ExampleLabel:Clone()
                        Cmd.Name = v[1] .. "_Cmd"
                        Cmd.Visible = true
                        Cmd.Parent = cmdguiobject
                        game:GetService("TweenService"):Create(Cmd, TweenInfo.new(035, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0, TextStrokeTransparency = 0.9}):Play()
                        if v[4] ~= nil then
                            Cmd.Text = v[1] .. " [" .. v[4] .. "]"
                        else
                            Cmd.Text = v[1]
                        end
                        
                        local GetTextSizeY = game:GetService("TextService"):GetTextSize(Cmd.Text, Cmd.TextSize, Cmd.Font, Cmd.AbsoluteSize).Y
                        Cmd.Size = UDim2.new(0.949999988, 0, 0, GetTextSizeY + 10)
                        
                        cmdguiobject.CanvasSize = UDim2.new(cmdguiobject.CanvasSize.X.Scale, cmdguiobject.CanvasSize.X.Offset, 0, cmdguiobject.CanvasSize.Y.Offset + Cmd.TextBounds.Y + 15)

                    end
                end
                
                cmdguiobject.CanvasSize = UDim2.new(cmdguiobject.CanvasSize.X.Scale, cmdguiobject.CanvasSize.X.Offset, 0, cmdguiobject.CanvasSize.Y.Offset + 15)
                
            end
        end

    end
end

function IceGear.GetShortenedPlrFromName(name)
    name = string.lower(tostring(name))
    
    if not game:GetService("Players"):FindFirstChild("me") and name == "me" or game:GetService("Players"):FindFirstChild("me") and game:GetService("Players"):FindFirstChild("me").ClassName ~= "Player" and name == "me" then
        return {LocalPlayer}
    end
    if not game:GetService("Players"):FindFirstChild("all") and name == "all" or game:GetService("Players"):FindFirstChild("all") and game:GetService("Players"):FindFirstChild("all").ClassName ~= "Player" and name == "all" then
        return game:GetService("Players"):GetPlayers()
    end
    if not game:GetService("Players"):FindFirstChild("others") and name == "others" or game:GetService("Players"):FindFirstChild("others") and game:GetService("Players"):FindFirstChild("others").ClassName ~= "Player" and name == "others" then
        name = game:GetService("Players"):GetPlayers()
        for i, v in pairs(name) do
            if v == LocalPlayer then
                table.remove(name, i)
            end
        end
        return name
    end
    
    for i, v in pairs(game.Players:GetPlayers()) do
        if string.lower(string.sub(v.Name, 1, #name)) == name then
            return {v}
        end
    end

    return nil
end

function IceGear.AddCommand(cmdname, description, mainfunction, cmdargs)
    for i, v in pairs(IceGear.Cmds) do
        if v[1] ~= nil and string.lower(v[1]) == string.lower(cmdname) then
            return nil
        end
    end

    if typeof(mainfunction) == "function" then
        if cmdargs then
            table.insert(IceGear.Cmds, {cmdname, description, mainfunction, cmdargs})
        else
            table.insert(IceGear.Cmds, {cmdname, description, mainfunction})
        end
    else
        return nil
    end
end



--/ Scripting: Intro

game:GetService("TweenService"):Create(LeftFrameThing, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1, 0, 0.5, 0)}):Play()
game:GetService("TweenService"):Create(RightFrameThing, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(0, 0, 0.5, 0)}):Play()
wait(0.5)

MiddleLogoThing.Visible = true
game:GetService("TweenService"):Create(MiddleLogoThing, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 0}):Play()
wait(0.35 / 2)
MainLogo.Visible = true
MainLogo2.Visible = true
game:GetService("TweenService"):Create(MainLogo, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 0}):Play()
game:GetService("TweenService"):Create(MainLogo, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Rotation = 180}):Play()
game:GetService("TweenService"):Create(MainLogo2, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 0}):Play()
wait(0.35)


game:GetService("TweenService"):Create(MainLogo, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Rotation = 360}):Play()

game:GetService("TweenService"):Create(BlueColorCorrection, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TintColor = Color3.fromRGB(207, 241, 255)}):Play()
game:GetService("TweenService"):Create(LoadingThing, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(1, 0, 1, 0)}):Play()
game:GetService("TweenService"):Create(LoadingThing_2, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(1, 0, 1, 0)}):Play()

AdminNameLabel.Visible = true
for i = 1, #"IceGear | V" + #Settings.Version do
    AdminNameLabel.Text = string.sub("IceGear | V" .. Settings.Version, 1, i)
    wait(0.5 / (#"IceGear | V" + #Settings.Version))
end
game:GetService("TweenService"):Create(MainLogo, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Rotation = 360 + 180}):Play()
wait(0.5)
game:GetService("TweenService"):Create(MainLogo, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Rotation = 360 * 2 + 180}):Play()
wait(0.5)

game:GetService("TweenService"):Create(LeftFrameThing, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Position = UDim2.new(-0.001, 0, 0.5, 0)}):Play()
game:GetService("TweenService"):Create(RightFrameThing, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Position = UDim2.new(1.001, 0, 0.5, 0)}):Play()
wait(0.35 / 2)

game:GetService("TweenService"):Create(MiddleLogoThing, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()

game:GetService("TweenService"):Create(MainLogo, TweenInfo.new(0.45, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()
game:GetService("TweenService"):Create(MainLogo, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Rotation = 45}):Play()
game:GetService("TweenService"):Create(MainLogo2, TweenInfo.new(0.45, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()
game:GetService("TweenService"):Create(BlueColorCorrection, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TintColor = Color3.fromRGB(255, 255, 255)}):Play()
wait(0.5)
Intro:Destroy()
BlueColorCorrection:Destroy()



--/ Scripting: Main

-- CommandKey Check(s):

if not (typeof(IceGear.CommandKey) == "string" and Enum.KeyCode[IceGear.CommandKey]) then
    print("Error in IceGear command key, key has been set to back slash.")
    IceGear.CommandKey = "BackSlash"
end

-- Commandbar Functionality:

IceGear.Debounces.CmdCooldown = false

IceGear.Events.InputBegan = game:GetService("UserInputService").InputBegan:Connect(function(Key)
    if Key.KeyCode.Name == IceGear.CommandKey then
        if IceGear.Debounces.CmdCooldown == false then
            IceGear.Debounces.CmdCooldown = true
            
            game:GetService("TweenService"):Create(CmdBlurEffect, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = 15}):Play()
            game:GetService("TweenService"):Create(CmdBarFrame, TweenInfo.new(0.5, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0.100000001, 0)}):Play()
            wait(0.25)
            CmdBar:CaptureFocus()
            CmdList.Visible = true
            game:GetService("TweenService"):Create(CmdBarDesign, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 0.75}):Play()
            game:GetService("TweenService"):Create(CmdBar, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
            wait(0.25)

            IceGear.Debounces.CmdCooldown = false
        end
    end
end)

CmdBar:GetPropertyChangedSignal("Text"):Connect(function()
    IceGear.UpdateCmdList(CmdList, {CmdBar, "alphabetical"})
end)

CmdBar.FocusLost:Connect(function(EnterPressed)
    spawn(function()
        if IceGear.Debounces.CmdCooldown == false then
            if EnterPressed then
                
                IceGear.Debounces.CmdCooldown = true

                local getcmd = string.split(string.lower(CmdBar.Text), " ")[1]
                local getargs = string.split(string.lower(CmdBar.Text), " ")

                if string.sub(getcmd, 1, #IceGear.Prefix) == IceGear.Prefix then
                    getcmd = string.sub(getcmd, #Settings.Prefix + 1, #getcmd)
                end

                for i, v in pairs(string.split(string.lower(CmdBar.Text), ",")) do
                    if i ~= 1 then
                        table.insert(getargs, v)
                    end
                end
                for i, v in pairs(string.split(string.lower(CmdBar.Text), ", ")) do
                    if i ~= 1 then
                        table.insert(getargs, v)
                    end
                end

                table.remove(getargs, 1)

                for i, v in pairs(IceGear.Cmds) do
                    if v[1] ~= nil and string.find(v[1], "/") then
                        for i2, v2 in pairs( string.split(v[1], "/") ) do
                            
                            v2 = string.lower(v2)
                            if getcmd == v2 then
                                if v[4] ~= nil then
                                    spawn(function()
                                        v[3](unpack(getargs))
                                    end)
                                else
                                    spawn(function()
                                        v[3]()
                                    end) 
                                end
                                break
                            end

                        end
                    elseif v[1] ~= nil then
                        v[1] = string.lower(v[1])
                        if getcmd == v[1] then
                            if v[4] ~= nil then
                                spawn(function()
                                    v[3](unpack(getargs))
                                end)
                            else
                                spawn(function()
                                    v[3]() 
                                end)
                            end
                            break
                        end
                    end
                end

            end
            
            game:GetService("TweenService"):Create(CmdBlurEffect, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = 0}):Play()
            game:GetService("TweenService"):Create(CmdBarFrame, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Size = UDim2.new(1, 0, 0.0, 0)}):Play()
            CmdBar:ReleaseFocus()
            CmdList.Visible = false
            game:GetService("TweenService"):Create(CmdBarDesign, TweenInfo.new(0.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()
            game:GetService("TweenService"):Create(CmdBar, TweenInfo.new(0.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
            wait(0.25)
            CmdBar.Text = ""
            IceGear.Debounces.CmdCooldown = false
        end
    end)
end)

LocalPlayer.Chatted:Connect(function(msg)
    spawn(function()
        if IceGear.Debounces.CmdCooldown == false and string.sub(msg, 1, #Settings.Prefix) == Settings.Prefix then
        
            IceGear.Debounces.CmdCooldown = true

            local getcmd = string.split(string.lower(msg), " ")[1]
            local getargs = string.split(string.lower(msg), " ")

            if string.sub(getcmd, 1, #IceGear.Prefix) == IceGear.Prefix then
                getcmd = string.sub(getcmd, #Settings.Prefix + 1, #getcmd)
            end

            for i, v in pairs(string.split(string.lower(msg), ",")) do
                if i ~= 1 then
                    table.insert(getargs, v)
                end
            end
            for i, v in pairs(string.split(string.lower(msg), ", ")) do
                if i ~= 1 then
                    table.insert(getargs, v)
                end
            end

            table.remove(getargs, 1)

            for i, v in pairs(IceGear.Cmds) do
                if v[1] ~= nil and string.find(v[1], "/") then
                    for i2, v2 in pairs( string.split(v[1], "/") ) do
                        
                        v2 = string.lower(v2)
                        if getcmd == v2 then
                            if v[4] ~= nil then
                                spawn(function()
                                    v[3](unpack(getargs))
                                end)
                            else
                                spawn(function()
                                    v[3]() 
                                end)
                            end
                            break
                        end

                    end
                elseif v[1] ~= nil then
                    v[1] = string.lower(v[1])
                    if getcmd == v[1] then
                        if v[4] ~= nil then
                            spawn(function()
                                v[3](unpack(getargs))
                            end)
                        else
                            spawn(function()
                                v[3]() 
                            end)
                        end
                        break
                    end
                end
            end

            game:GetService("TweenService"):Create(CmdBlurEffect, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = 0}):Play()
            game:GetService("TweenService"):Create(CmdBarFrame, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Size = UDim2.new(1, 0, 0.0, 0)}):Play()
            CmdBar:ReleaseFocus()
            CmdList.Visible = false
            game:GetService("TweenService"):Create(CmdBarDesign, TweenInfo.new(0.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()
            game:GetService("TweenService"):Create(CmdBar, TweenInfo.new(0.125, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
            wait(0.25)
            CmdBar.Text = ""
            IceGear.Debounces.CmdCooldown = false
        end
    end)
end)


game:GetService("RunService").Heartbeat:Connect(function()
    LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge) * math.huge
    pcall(function() sethiddenproperty(LocalPlayer, "SimulationRadius", math.pow(math.huge, math.huge) * math.huge) end)

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer then
            LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge) * math.huge
            pcall(function() settings().Physics.AllowSleep = false ; sethiddenproperty(LocalPlayer, "SimulationRadius", math.pow(math.huge, math.huge) * math.huge) end)
            LocalPlayer.ReplicationFocus = Workspace
        end
    end
end)

IceGear.Notify("Welcome to IceGear. \nPrefix is: " .. IceGear.Prefix, {10, 1, 1})

IceGear.AddCommand("Prefix", "Changes the prefix", function(prefix)
    if typeof(prefix) == "string" and #prefix <= 3 then
        IceGear.Notify("Prefix was succesfully changed to: " .. prefix, {5, 1, 1})
    elseif #prefix > 3 then
        IceGear.Notify("Prefix cannot be longer than 3 characters", {5, 1, 1})
    end
end, "prefix")

IceGear.AddCommand("Runline", "Runs a 1-line of script (a.k.a. the first argument)", function(scriptline)
    local worked, geterror = pcall(function()
        loadstring(tostring(scriptline))()
    end)

    if geterror then
        IceGear.Notify("Error in script (runline command): " .. geterror, {10, 1, 1})
    end
end, "script")

function IceGear.GetHatsInWorkspace()
    local amount = 0
    
    for i, v in pairs(game.Workspace:GetDescendants()) do
        if v.ClassName == "Accessory" or v.ClassName == "Hat" then
            if v:FindFirstChild("Handle") and v.Handle.Anchored == false and not game.Players:GetPlayerFromCharacter(v.Parent) then
                amount = amount + 1
            elseif v:FindFirstChild("Handle") and v.Handle.Anchored == false and game.Players:GetPlayerFromCharacter(v.Parent) == game.PlayeRA.LocalPlayer then
                amount = amount + 1
            end
        end
    end
    
    return amount
end

IceGear.AddCommand("Clearhats", "Clears all the hats in the workspace", function()
    for i, v in pairs(game.PlayeRA.LocalPlayer.Character:GetChildren()) do
        if v.ClassName == "Accessory" or v.ClassName == "Hat" then
            v:Destroy()
        end
    end
    
    
    repeat
        for i, v in pairs(game.Workspace:GetDescendants()) do
            if v.ClassName == "Accessory" or v.ClassName == "Hat" then
                if v:FindFirstChild("Handle") and v.Handle.Anchored == false and not game.Players:GetPlayerFromCharacter(v.Parent) then
                    repeat
                        v.Handle.CFrame = game.PlayeRA.LocalPlayer.Character.HumanoidRootPart.CFrame
                        wait()
                    until v.Parent == game.PlayeRA.LocalPlayer.Character or v.Parent == nil
                    v:Destroy()
                elseif v:FindFirstChild("Handle") and v.Handle.Anchored == false and game.Players:GetPlayerFromCharacter(v.Parent) == game.PlayeRA.LocalPlayer then
                    v:Destroy()
                end
            end
        end
        wait()
    until IceGear.GetHatsInWorkspace() <= 0
end)

IceGear.AddCommand("Rejoin", "Rejoins the server", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

IceGear.AddCommand("checknet/netcheck", "Notifies you about who is using networkownership", function()
    local CheckIfWorks = pcall(function()
        gethiddenproperty(LocalPlayer, "SimulationRadius")
    end)

    local Plrs = {}
    local Msg = ""

    if CheckIfWorks then
        for i, v in pairs(game.Players:GetPlayers()) do
            if gethiddenproperty(v, "SimulationRadius") >= 5000 then
                table.insert(Plrs, v.Name)
            end
        end

        if #Plrs <= 0 then
            Msg = "Network check ran: No players have been found using networkownership."
        elseif #Plrs == 1 then
            Msg = "Network check ran, the player using network: " .. Plrs[1]
        elseif #Plrs > 1 then
            Msg = "Network check ran, the players using network: "
            for i, v in pairs(Plrs) do
                Msg = Msg .. v .. ", "
            end
            Msg = string.sub(Msg, 1, #Msg - 2)
        end

        return IceGear.Notify(Msg, {10, 1, 1})
    else
        return IceGear.Notify("Error: exploit doesn't support gethiddenproperty/sethiddenproperty?", {10, 1, 1})
    end
end)

IceGear.AddCommand("tp", "Teleports first player argument (player1/players) to second player argument (player2)", function(player1, player2)
    if IceGear.GetShortenedPlrFromName(player1) ~= nil and IceGear.GetShortenedPlrFromName(player2) ~= nil then
        local Player1
        local Player2

        for i, v in pairs(IceGear.GetShortenedPlrFromName(player1)) do
            Player1 = v
            for i2, v2 in pairs(IceGear.GetShortenedPlrFromName(player2)) do
                Player2 = v2
                if not (Player1 and Player1.Character) or not (Player2 and Player2.Character) then
                    return IceGear.Notify("Error in tp command", "Player does not have character/is not loaded in", {5, 1, 1})
                elseif not (Player1.Character:FindFirstChild("HumanoidRootPart") or Player1.Character.PrimaryPart) or not (Player2.Character:FindFirstChild("HumanoidRootPart") or Player2.Character.PrimaryPart) then
                    return IceGear.Notify("Error in tp command", "Player cannot be teleported", {5, 1, 1})
                end
        
                if Player1.Character:FindFirstChild("HumanoidRootPart") and Player2.Character:FindFirstChild("HumanoidRootPart") then
                    Player1.Character.HumanoidRootPart.CFrame = Player2.Character.HumanoidRootPart.CFrame
                elseif Player1.Character.PrimaryPart and Player2.Character.PrimaryPart then
                    Player1.Character:SetPrimaryPartCFrame(Player2.Character.PrimaryPart.CFrame)
                end
            end

        end
    else
        IceGear.Notify("Could not find player(s)", "Could not find player(s). perhaps username was/usernames were spelt wrong?", {5, 1, 1})
    end
end, "player 1, player 2")

IceGear.AddCommand("goto/to", "Teleports to player", function(player)
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        local Player
        for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
            Player = v
            if not (LocalPlayer and LocalPlayer.Character) or not (Player and Player.Character) then
                return IceGear.Notify("Error in goto/to command", "Player or LocalPlayer does not have character/is not loaded in", {5, 1, 1})
            elseif not (LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or LocalPlayer.Character.PrimaryPart) or not (Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character.PrimaryPart) then
                return IceGear.Notify("Error in goto/to command", "Player or LocalPlayer cannot be teleported", {5, 1, 1})
            end
    
            if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame
            elseif LocalPlayer.Character.PrimaryPart and Player.Character.PrimaryPart then
                LocalPlayer.Character:SetPrimaryPartCFrame(Player.Character.PrimaryPart.CFrame)
            end
        end
    else
        IceGear.Notify("Could not find player", "Such player does not exist in the server (or username was spelt wrong?)", {5, 1, 1})
    end
end, "player")

IceGear.AddCommand("bring", "Brings player", function(player)
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        local Player
        for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
            Player = v
            if not (LocalPlayer and LocalPlayer.Character) or not (Player and Player.Character) then
                return IceGear.Notify("Error in bring command", "Player or LocalPlayer does not have character/is not loaded in", {5, 1, 1})
            elseif not (LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or LocalPlayer.Character.PrimaryPart) or not (Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character.PrimaryPart) then
                return IceGear.Notify("Error in bring command", "Player or LocalPlayer cannot be teleported", {5, 1, 1})
            end
    
            if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("HumanoidRootPart") then
                Player.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
            elseif LocalPlayer.Character.PrimaryPart and Player.Character.PrimaryPart then
                Player.Character:SetPrimaryPartCFrame(LocalPlayer.Character.PrimaryPart.CFrame)
            end
        end
    else
        IceGear.Notify("Could not find player", "Such player does not exist in the server (or username was spelt wrong?)", {5, 1, 1})
    end
end, "player")

IceGear.AddCommand("walkspeed/speed/ws", "Sets walkspeed of player, ONLY REPLICATES on other players IF player is/players are claimed with claim command (localplayer doesn't need to be claimed).", function(player, speed)   
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        local Player
        print(tonumber(speed))
        for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
            Player = v
            if not (Player and Player.Character) then
                return IceGear.Notify("Error in walkspeed/speed/ws command", "Player does not have character/is not loaded in", {5, 1, 1})
            elseif not Player.Character:FindFirstChildOfClass("Humanoid") then
                return IceGear.Notify("Error in walkspeed/speed/ws command", "Player does not have a humanoid", {5, 1, 1})
            end

            if Player.Character:FindFirstChildOfClass("Humanoid") and typeof(tonumber(speed)) == "number" then
                Player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = tonumber(speed)
            elseif typeof(tonumber(speed)) ~= "number" then
                IceGear.Notify("Incorrect speed number", "speed value entered is not a number/could not be turned into a number", {5, 1, 1})
            end
        end
    else
        IceGear.Notify("Could not find player(s)", "Could not find player(s). perhaps username was/usernames were spelt wrong?", {5, 1, 1})
    end
end, "player(s), speed")

IceGear.AddCommand("jumppower/jp", "Sets jumppower of player, ONLY REPLICATES on other players IF player is/players are claimed with claim command (localplayer doesn't need to be claimed).", function(player, power)   
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        local Player

        for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
            Player = v
            if not (Player and Player.Character) then
                return IceGear.Notify("Error in jumppower/jp command", "Player does not have character/is not loaded in", {5, 1, 1})
            elseif not Player.Character:FindFirstChildOfClass("Humanoid") then
                return IceGear.Notify("Error in jumppower/jp command", "Player does not have a humanoid", {5, 1, 1})
            end

            if Player.Character:FindFirstChildOfClass("Humanoid") and typeof(tonumber(power)) == "number" then
                Player.Character:FindFirstChildOfClass("Humanoid").JumpPower = tonumber(power)
            elseif typeof(tonumber(power)) ~= "number" then
                IceGear.Notify("Incorrect jumppower number", "jumppower value entered is not a number/could not be turned into a number", {5, 1, 1})
            end
        end
    else
        IceGear.Notify("Could not find player(s)", "Could not find player(s). perhaps username was/usernames were spelt wrong?", {5, 1, 1})
    end
end, "player(s), power")


IceGear.AddCommand("hipheight/hh", "Sets hipheight of player, ONLY REPLICATES on other players IF player is/players are claimed with claim command (localplayer doesn't need to be claimed).", function(player, height)   
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        local Player

        for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
            Player = v
            if not (Player and Player.Character) then
                return IceGear.Notify("Error in hipheight/hh command", "Player does not have character/is not loaded in", {5, 1, 1})
            elseif not Player.Character:FindFirstChildOfClass("Humanoid") then
                return IceGear.Notify("Error in hipheight/hh command", "Player does not have a humanoid", {5, 1, 1})
            end

            if Player.Character:FindFirstChildOfClass("Humanoid") and typeof(tonumber(height)) == "number" then
                Player.Character:FindFirstChildOfClass("Humanoid").HipHeight = tonumber(height)
            elseif typeof(tonumber(height)) ~= "number" then
                IceGear.Notify("Incorrect hipheight number", "hipheight value entered is not a number/could not be turned into a number", {5, 1, 1})
            end
        end
    else
        IceGear.Notify("Could not find player(s)", "Could not find player(s). perhaps username was/usernames were spelt wrong?", {5, 1, 1})
    end
end, "player(s), height")

IceGear.AddCommand("noclip", "Noclips player until disabled/player dies, ONLY REPLICATES on other players IF player is/players are claimed with claim command (localplayer doesn't need to be claimed).", function(player)   
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        local Player

        for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
            Player = v
            if not (Player and Player.Character) then
                return IceGear.Notify("Error in noclip command", "Player does not have character/is not loaded in", {5, 1, 1})
            elseif not Player.Character:FindFirstChildOfClass("Humanoid") then
                return IceGear.Notify("Error in noclip command", "Player does not have a humanoid", {5, 1, 1})
            end

            if Player.Character:FindFirstChild("-Noclipped") then
                Player.Character:FindFirstChild("-Noclipped"):Destroy()
            end
            
            local Noclipped = Instance.new("ObjectValue")
            Noclipped.Name = "-Noclipped"
            Noclipped.Parent = Player.Character

            local LoopTillEnd
            LoopTillEnd = game:GetService("RunService").Stepped:Connect(function()
                if Player and Player.Character and Player.Character:FindFirstChild("-Noclipped") then
                    for i2, v2 in pairs(Player.Character:GetDescendants()) do
                        if v2:IsA("BasePart") then
                            v2.CanCollide = false
                        end
                    end
                else
                    LoopTillEnd:Disconnect()
                end
            end)
        end
    else
        IceGear.Notify("Could not find player(s)", "Could not find player(s). perhaps username was/usernames were spelt wrong?", {5, 1, 1})
    end
end, "player(s)")

IceGear.AddCommand("clip", "Disables player noclip if player is noclipped with noclip command, ONLY REPLICATES on other players IF player is/players are claimed with claim command (localplayer doesn't need to be claimed).", function(player)   
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        local Player

        for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
            Player = v
            if Player and Player.Character and Player.Character:FindFirstChild("-Noclipped") then
                Player.Character:FindFirstChild("-Noclipped"):Destroy()
            end
        end
    else
        IceGear.Notify("Could not find player(s)", "Could not find player(s). perhaps username was/usernames were spelt wrong?", {5, 1, 1})
    end
end, "player(s)")

IceGear.AddCommand("changestate", "Changes player's humanoid state until disabled/player dies, ONLY REPLICATES on other players IF player is/players are claimed with claim command (localplayer doesn't need to be claimed).", function(player, numberstate)
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        local Player

        for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
            Player = v
            if not (Player and Player.Character) then
                return IceGear.Notify("Error in changestate command", "Player does not have character/is not loaded in", {5, 1, 1})
            elseif not Player.Character:FindFirstChildOfClass("Humanoid") then
                return IceGear.Notify("Error in changestate command", "Player does not have a humanoid", {5, 1, 1})
            end

            if typeof(tonumber(numberstate)) ~= "number" then
                return IceGear.Notify("Error in changestate command", "number state is not a number/could not be turned into a number", {5, 1, 1})
            end

            if Player.Character:FindFirstChild("-Statechanging") then
                Player.Character:FindFirstChild("-Statechanging"):Destroy()
            end
            
            local Noclipped = Instance.new("ObjectValue")
            Noclipped.Name = "-Statechanging"
            Noclipped.Parent = Player.Character

            local LoopTillEnd
            LoopTillEnd = game:GetService("RunService").Stepped:Connect(function()
                if Player and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character:FindFirstChild("-Statechanging") then
                    for i2, v2 in pairs(Player.Character:GetDescendants()) do
                        if v2.ClassName == "Humanoid" then
                            v2:ChangeState(tonumber(numberstate))
                        end
                    end
                else
                    LoopTillEnd:Disconnect()
                end
            end)
        end
    else
        IceGear.Notify("Could not find player(s)", "Could not find player(s). perhaps username was/usernames were spelt wrong?", {5, 1, 1})
    end
end, "player(s), numberstate")

IceGear.AddCommand("unchangestate", "Disables player changestate if player is statechanged with changestate command, ONLY REPLICATES on other players IF player is/players are claimed with claim command (localplayer doesn't need to be claimed).", function(player)   
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        local Player

        for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
            Player = v
            if Player and Player.Character and Player.Character:FindFirstChild("-Statechanging") then
                Player.Character:FindFirstChild("-Statechanging"):Destroy()
            end
        end
    else
        IceGear.Notify("Could not find player(s)", "Could not find player(s). perhaps username was/usernames were spelt wrong?", {5, 1, 1})
    end
end, "player(s)")

IceGear.AddCommand("kill", "Kills player, ONLY REPLICATES on other players IF player is/players are claimed with claim command (localplayer doesn't need to be claimed).", function(player)   
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        local Player
        for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
            Player = v
            if Player and Player.Character and Player.Character then
                Player.Character:BreakJoints()
            end
        end
    else
        IceGear.Notify("Could not find player(s)", "Could not find player(s). perhaps username was/usernames were spelt wrong?", {5, 1, 1})
    end
end, "player(s)")

IceGear.AddCommand("control", "controls player using claim", function(player)   
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        local Player
        for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
            Player = v
            if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChildOfClass("Humanoid") then
                Player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 100
                Player.Character:FindFirstChildOfClass("Humanoid").Jump = true
                Player.Character:FindFirstChildOfClass("Humanoid").Jump = false
                
                Player.Character.HumanoidRootPart.Parent = LocalPlayer.Character

                LocalPlayer.Character.HumanoidRootPart.Anchored = true
            end
        end
    else
        IceGear.Notify("Could not find player(s)", "Could not find player(s). perhaps username was/usernames were spelt wrong?", {5, 1, 1})
    end
end, "player(s)")

IceGear.AddCommand("claim", "Claims player with networkownership.", function(player)   
    if IceGear.GetShortenedPlrFromName(player) ~= nil then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("Part") then v:Remove()
            end
        end
        wait(6.7)
        local Player

        if LocalPlayer and LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("Right Arm") and LocalPlayer.Character:FindFirstChild("Right Arm"):IsA("BasePart") or LocalPlayer.Character:FindFirstChild("Right Hand") and LocalPlayer.Character:FindFirstChild("Right Hand"):IsA("BasePart")) then
            if LocalPlayer.Character:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
                local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                
            
                for i, v in pairs(IceGear.GetShortenedPlrFromName(player)) do
                    Player = v
                    if Player and Player.Character and (Player.Character:FindFirstChild("Right Arm") and Player.Character:FindFirstChild("Right Arm"):IsA("BasePart") or Player.Character:FindFirstChild("Right Hand") and Player.Character:FindFirstChild("Right Hand"):IsA("BasePart")) then
                        LocalPlayer.Character['Left Leg']:Destroy()
                        LocalPlayer.Character['Right Leg']:Destroy()
                        LocalPlayer.Character['Left Arm']:Destroy()
                        wait(0.3544556)

                        if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then 
                            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):Destroy()
                        end
                        Instance.new("Humanoid").Parent = LocalPlayer.Character

                        Tool.Parent = LocalPlayer.Character
                        if Tool:FindFirstChild("Handle") and Player.Character.PrimaryPart ~= nil then
                            repeat
                                Player.Character:SetPrimaryPartCFrame(Tool.Handle.CFrame)
                                game:GetService("RunService").Stepped:Wait()
                            until Tool.Parent == Player.Character

                            Workspace.FallenPartsDestroyHeight = 0/1/0
                            local CurrentCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                            wait(0.3)

                            for i = 1, 10 do
                                LocalPlayer.Character.HumanoidRootPart.CFrame = CurrentCFrame - Vector3.new(0, math.huge, 0)
                            end
                            wait(0.3)

                            for i = 1, 10 do
                                LocalPlayer.Character.HumanoidRootPart.CFrame = CurrentCFrame
                            end
                            
                            if not Player.Character:FindFirstChild("-Claimed") then
                                local Claimed = Instance.new("ObjectValue")
                                Claimed.Name = "-Claimed"
                                Claimed.Parent = Player.Character
                            end

                            LocalPlayer.CharacterAdded:Wait()
                            repeat
                                wait()
                            until LocalPlayer.Character.HumanoidRootPart and LocalPlayer.Character:FindFirstChild("Head") and LocalPlayer.Character:FindFirstChild("Torso") and LocalPlayer.Character.Torso:FindFirstChild("Neck")
                        
                            if #IceGear.GetShortenedPlrFromName(player) > 1 then
                                repeat wait() until LocalPlayer.Character:FindFirstChildOfClass("Tool") or LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                            end
                        end
                    end
                end
            else
                return IceGear.Notify("Need 1 tool", "You need at least 1 tool in order to claim player", {5, 1, 1})
            end
        end
    else
        IceGear.Notify("Could not find player(s)", "Could not find player(s). perhaps username was/usernames were spelt wrong?", {5, 1, 1})
    end
end, "player(s)")

IceGear.AddCommand("GrabKnife", "Loads FE grab knife remake", function()
    local KnifeAccessory

    if LocalPlayer:FindFirstChild("-Running") then
        return IceGear.Notify("Command: " .. LocalPlayer["-Running"].Value .. " is already running.", {7, 1, 1})
    elseif not LocalPlayer.Character:FindFirstChildOfClass("Accessory") then
        return IceGear.Notify("You need at least 1 hat or preferably accessory: https://www.roblox.com/catalog/4684948729/Kawaii-Knife", {7, 1, 1})
    else

        if LocalPlayer.Character:FindFirstChild("YandereKnife") and LocalPlayer.Character["YandereKnife"].ClassName == "Accessory" then
            KnifeAccessory = LocalPlayer.Character["YandereKnife"]
        else
            KnifeAccessory = LocalPlayer.Character:FindFirstChildOfClass("Accessory")
        end

        local Running = Instance.new("StringValue")
        Running.Parent = LocalPlayer
        Running.Name = "-Running"
        Running.Value = "Grab Knife"

        


        local LeftArm = LocalPlayer.Character["Left Arm"]:Clone()
        LeftArm.Parent = LocalPlayer.Character
        LeftArm.Name = "LeftArm"
        LeftArm.Transparency = 1
        LeftArm:ClearAllChildren()

        local RightArm = LocalPlayer.Character["Right Arm"]:Clone()
        RightArm.Parent = LocalPlayer.Character
        RightArm.Name = "RightArm"
        RightArm.Transparency = 1
        RightArm:ClearAllChildren()

        local Stuff = {
            Events = {}, 
            Debounces = {Button1DownDebounce = false}, 
            PlrHeld = nil, 
            Mode = 1 -- 1 = kill, 2 = throw, 3 = let go, 4 = suicide
        }
        
        if LocalPlayer.Character:FindFirstChild("-GrabKnife") then
            LocalPlayer.Character:FindFirstChild("-GrabKnife"):Destroy()
        end
        if LocalPlayer.Character:FindFirstChild("GrabKnifeLA") then
            LocalPlayer.Character:FindFirstChild("GrabKnifeLA"):Destroy()
        end
        if LocalPlayer.Character:FindFirstChild("GrabKnifeRA") then
            LocalPlayer.Character:FindFirstChild("GrabKnifeRA"):Destroy()
        end
        
        
        
        local LA
        local RA

        local RS = LocalPlayer.Character.Torso["Right Shoulder"]:Clone()
        LocalPlayer.Character.Torso["Right Shoulder"]:Destroy()
        
        RS.Parent = LocalPlayer.Character.Torso
        RS.Part0 = RS.Parent
        RS.Part1 = RightArm

        local Attach0 = Instance.new("Attachment")
        Attach0.Parent = LocalPlayer.Character["Right Arm"]
        local Attach1 = Instance.new("Attachment")
        Attach1.Parent = RightArm
        
        local Pos = Instance.new("AlignPosition")
        Pos.Parent = LocalPlayer.Character.Torso
        Pos.RigidityEnabled = true
        Pos.Attachment0, Pos.Attachment1 = Attach0, Attach1

        local Rot = Instance.new("AlignOrientation")
        Rot.Parent = LocalPlayer.Character.Torso
        Rot.RigidityEnabled = true
        Rot.Attachment0, Rot.Attachment1 = Attach0, Attach1
        
        local LS = LocalPlayer.Character.Torso["Left Shoulder"]:Clone()
        LocalPlayer.Character.Torso["Left Shoulder"]:Destroy()
        
        LS.Parent = LocalPlayer.Character.Torso
        LS.Part0 = LS.Parent
        LS.Part1 = LeftArm

        local Attach0 = Instance.new("Attachment")
        Attach0.Parent = LocalPlayer.Character["Left Arm"]
        local Attach1 = Instance.new("Attachment")
        Attach1.Parent = LeftArm
        
        local Pos = Instance.new("AlignPosition")
        Pos.Parent = LocalPlayer.Character.Torso
        Pos.RigidityEnabled = true
        Pos.Attachment0, Pos.Attachment1 = Attach0, Attach1

        local Rot = Instance.new("AlignOrientation")
        Rot.Parent = LocalPlayer.Character.Torso
        Rot.RigidityEnabled = true
        Rot.Attachment0, Rot.Attachment1 = Attach0, Attach1


        local Knife = Instance.new("Part")
        Knife.Name = "-GrabKnife"
        Knife.Parent = LocalPlayer.Character
        Knife.Size = Vector3.new(0.25, 2, 0.25)
        Knife.Transparency = 1
        Knife.CanCollide = false

        local KnifeWeld = Instance.new("Weld")
        KnifeWeld.Parent = Knife
        KnifeWeld.Part0 = LeftArm
        KnifeWeld.Part1 = Knife
        KnifeWeld.C0 = CFrame.new(Vector3.new(0.2, -0.85, 0)) * CFrame.Angles(math.rad(0), math.rad(00), math.rad(0))
        KnifeWeld.C1 = CFrame.new(Vector3.new(0, 0.75, -0.125)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

        KnifeAccessory.Handle.AccessoryWeld:Destroy()
        local Attach0 = Instance.new("Attachment")
        Attach0.Parent = KnifeAccessory.Handle
        Attach0.CFrame = CFrame.new(Vector3.new(-0.5, 0, -0.5)) * CFrame.Angles(math.rad(0), math.rad(-90), math.rad(-90))
        local Attach1 = Instance.new("Attachment")
        Attach1.Parent = Knife
        
        local Pos = Instance.new("AlignPosition")
        Pos.Parent = Knife
        Pos.RigidityEnabled = true
        Pos.Attachment0, Pos.Attachment1 = Attach0, Attach1

        local Rot = Instance.new("AlignOrientation")
        Rot.Parent = Knife
        Rot.RigidityEnabled = true
        Rot.Attachment0, Rot.Attachment1 = Attach0, Attach1
        

        Stuff.Events.ModeChangeEvent = game:GetService("UserInputService").InputBegan:Connect(function(Key)
            if Key.KeyCode == Enum.KeyCode.Q then
                Stuff.Mode = 1
            elseif Key.KeyCode == Enum.KeyCode.E then
                Stuff.Mode = 2
            elseif Key.KeyCode == Enum.KeyCode.R then
                Stuff.Mode = 3
            elseif Key.KeyCode == Enum.KeyCode.T then
                Stuff.Mode = 4
            end
        end)

        Stuff.Events.Button1DownEvent = LocalPlayer:GetMouse().Button1Down:Connect(function()
            if Stuff.Debounces.Button1DownDebounce == false and Stuff.PlrHeld == nil and Stuff.Mode ~= 4 then
            
                Stuff.Debounces.Button1DownDebounce = true
                
                LA = Instance.new("Weld")
                LA.Name = "GrabKnifeLA"
                LA.Parent = LocalPlayer.Character
                LA.Part0 = LocalPlayer.Character.Torso
                LA.Part1 = LeftArm
                LA.C0 = CFrame.new(Vector3.new(-1, 1, 0)) * CFrame.Angles(math.rad(10), math.rad(10), math.rad(-10))
                LA.C1 = CFrame.new(Vector3.new(0.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                
                RA = Instance.new("Weld")
                RA.Name = "GrabKnifeRA"
                RA.Parent = LocalPlayer.Character
                RA.Part0 = LocalPlayer.Character.Torso
                RA.Part1 = RightArm
                RA.C0 = CFrame.new(Vector3.new(1, 1, 0)) * CFrame.Angles(math.rad(10), math.rad(-10), math.rad(10))
                RA.C1 = CFrame.new(Vector3.new(-0.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                
                wait(0.1)
                game:GetService("TweenService"):Create(LA, TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(-1, 0.75, 0)) * CFrame.Angles(math.rad(80), math.rad(-90), math.rad(-10)) }):Play()
                game:GetService("TweenService"):Create(RA, TweenInfo.new(0.25, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(1, 0.75, 0)) * CFrame.Angles(math.rad(70), math.rad(40), math.rad(10)) }):Play()
                
                local PossiblePlr
                for i = 1, 20 do
                    if Stuff.PlrHeld == nil then
                        PossiblePlr = game.Workspace:FindPartOnRay(Ray.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2))
                        if PossiblePlr ~= nil and game.Players:GetPlayerFromCharacter(PossiblePlr.Parent) and game.Players:GetPlayerFromCharacter(PossiblePlr.Parent).Character and game.Players:GetPlayerFromCharacter(PossiblePlr.Parent).Character:FindFirstChild("-Claimed") then
                            Stuff.PlrHeld = game.Players:GetPlayerFromCharacter(PossiblePlr.Parent)
                            break
                        end
                        wait(0.0375)
                    end
                end
                LA:Destroy()
                RA:Destroy()
                LA = nil
                RA = nil
                Stuff.Debounces.Button1DownDebounce = false
                
            elseif Stuff.Mode ~= 4 and Stuff.PlrHeld ~= nil and Stuff.PlrHeld.ClassName == "Player" and Stuff.PlrHeld.Character and Stuff.PlrHeld.Character.PrimaryPart and Stuff.PlrHeld.Character:FindFirstChildOfClass("Humanoid") and Stuff.PlrHeld.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                
                if Stuff.Mode == 1 then -- kill
                    game:GetService("TweenService"):Create(LA, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(-1, 0.75, 0)) * CFrame.Angles(math.rad(90), math.rad(-100), math.rad(-10)) }):Play()
                    wait(0.35)
                    game:GetService("TweenService"):Create(LA, TweenInfo.new(0.175, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(-1, 0.75, 0)) * CFrame.Angles(math.rad(50), math.rad(-60), math.rad(-20)) }):Play()
                    wait(0.175)
                    Stuff.PlrHeld.Character:FindFirstChildOfClass("Humanoid").Health = 0
                    wait(0.25)
                    Stuff.PlrHeld = nil
                    if LA then
                    LA:Destroy()
                    LA = nil
                    end
                    if RA then
                    RA:Destroy()
                    RA = nil
                    end
                elseif Stuff.Mode == 2 then -- throw
                    game:GetService("TweenService"):Create(LA, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(-1, 0.75, 0)) * CFrame.Angles(math.rad(0), math.rad(10), math.rad(-10)) }):Play()
                    game:GetService("TweenService"):Create(RA, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(1, 0.75, 1)) * CFrame.Angles(math.rad(70), math.rad(60), math.rad(10)) }):Play()
                    wait(0.075)
                    Stuff.PlrHeld.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                    local BF = Instance.new("BodyForce")
                    BF.Parent = Stuff.PlrHeld.Character.PrimaryPart
                    BF.Force = Vector3.new(0, 20, 0) + LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 20
                    wait(0.25)
                    BF:Destroy()
                    wait(0.25)
                    Stuff.PlrHeld.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                    if Stuff.PlrHeld.Character.PrimaryPart:FindFirstChild("CFrameFix") then
                        Stuff.PlrHeld.Character.PrimaryPart:FindFirstChild("CFrameFix"):Destroy()
                    end
                    Stuff.PlrHeld = nil
                    if LA then
                    LA:Destroy()
                    LA = nil
                    end
                    if RA then
                    RA:Destroy()
                    RA = nil
                    end
                elseif Stuff.Mode == 3 then -- let go
                    if Stuff.PlrHeld.Character.PrimaryPart:FindFirstChild("CFrameFix") then
                        Stuff.PlrHeld.Character.PrimaryPart:FindFirstChild("CFrameFix"):Destroy()
                    end
                    Stuff.PlrHeld.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
                    Stuff.PlrHeld = nil
                    if LA then
                    LA:Destroy()
                    LA = nil
                    end
                    if RA then
                    RA:Destroy()
                    RA = nil
                    end
                end

            elseif Stuff.Mode == 4 then -- suicide

                if LA then
                    LA:Destroy()
                    LA = nil
                end
                if RA then
                    RA:Destroy()
                    RA = nil
                end

                LA = Instance.new("Weld")
                LA.Name = "GrabKnifeLA"
                LA.Parent = LocalPlayer.Character
                LA.Part0 = LocalPlayer.Character.Torso
                LA.Part1 = LeftArm
                LA.C0 = CFrame.new(Vector3.new(-1, 0.75, 0)) * CFrame.Angles(math.rad(10), math.rad(10), math.rad(-10))
                LA.C1 = CFrame.new(Vector3.new(0.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                wait(0.5)
                
                game:GetService("TweenService"):Create(LA, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(-1.5, 0.75, 0)) * CFrame.Angles(math.rad(80), math.rad(-100), math.rad(-10)) }):Play()
                wait(1.5)

                game:GetService("TweenService"):Create(LA, TweenInfo.new(0.075, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(-1.5, 0.75, 1)) * CFrame.Angles(math.rad(30), math.rad(-130), math.rad(-10)) }):Play()
                wait(0.1)
                if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
                end

            end
        end)


        repeat
            if Stuff.PlrHeld ~= nil and Stuff.PlrHeld.ClassName == "Player" and Stuff.PlrHeld.Character and Stuff.PlrHeld.Character.PrimaryPart and Stuff.PlrHeld.Character:FindFirstChildOfClass("Humanoid") and Stuff.PlrHeld.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                if LA == nil then
                    LA = Instance.new("Weld")
                    LA.Name = "GrabKnifeLA"
                    LA.Parent = LocalPlayer.Character
                    LA.Part0 = LocalPlayer.Character.Torso
                    LA.Part1 = LeftArm
                    LA.C0 = CFrame.new(Vector3.new(-1, 0.75, 0)) * CFrame.Angles(math.rad(80), math.rad(-90), math.rad(-10))
                    LA.C1 = CFrame.new(Vector3.new(0.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                end
                if RA == nil then
                    RA = Instance.new("Weld")
                    RA.Name = "GrabKnifeRA"
                    RA.Parent = LocalPlayer.Character
                    RA.Part0 = LocalPlayer.Character.Torso
                    RA.Part1 = RightArm
                    RA.C0 = CFrame.new(Vector3.new(1, 0.75, 0)) * CFrame.Angles(math.rad(70), math.rad(40), math.rad(10))
                    RA.C1 = CFrame.new(Vector3.new(-0.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                end
                for i, v in pairs(Stuff.PlrHeld.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false 
                    end
                end
                Stuff.PlrHeld.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                if not Stuff.PlrHeld.Character.PrimaryPart:FindFirstChild("CFrameFix") then
                    local bv = Instance.new("BodyVelocity")
                    bv.Name = "CFrameFix"
                    bv.Parent = Stuff.PlrHeld.Character.PrimaryPart
                    bv.Velocity = Vector3.new(0, 0, 0)
                end
                Stuff.PlrHeld.Character:SetPrimaryPartCFrame(LocalPlayer.Character.PrimaryPart.CFrame + LocalPlayer.Character.PrimaryPart.CFrame.LookVector * LocalPlayer.Character.PrimaryPart.Size.Z)
            end
            game:GetService("RunService").Stepped:Wait()
        until not (LocalPlayer and LocalPlayer.Character and Knife and Knife.Parent == LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health > 0)

        if LA ~= nil then
            LA:Destroy()
            LA = nil
        end
        if RA ~= nil then
            RA:Destroy() 
            RA = nil
        end

        for i, v in pairs(Stuff.Events) do
            v:Disconnect() 
        end

        if LocalPlayer:FindFirstChild("-Running") then
            LocalPlayer:FindFirstChild("-Running"):Destroy()
        end

        if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
        end

    end
end)

IceGear.AddCommand("Karambit", "Loads FE karambit", function()
    local KnifeAccessory

    if LocalPlayer:FindFirstChild("-Running") then
        return IceGear.Notify("Command: " .. LocalPlayer["-Running"].Value .. " is already running.", {7, 1, 1})
    elseif not LocalPlayer.Character:FindFirstChildOfClass("Accessory") then
        return IceGear.Notify("You need at least 1 hat or preferably accessory:\n https://www.roblox.com/catalog/4684948729/Kawaii-Knife", {7, 1, 1})
    else

        if LocalPlayer.Character:FindFirstChild("YandereKnife") and LocalPlayer.Character["YandereKnife"].ClassName == "Accessory" then
            KnifeAccessory = LocalPlayer.Character["YandereKnife"]
        else
            KnifeAccessory = LocalPlayer.Character:FindFirstChildOfClass("Accessory")
        end

        local Running = Instance.new("StringValue")
        Running.Parent = LocalPlayer
        Running.Name = "-Running"
        Running.Value = "Karambit"

        local Torso = LocalPlayer.Character.Torso:Clone()
        Torso.Parent = LocalPlayer.Character
        Torso.Name = "AnimTorso"
        Torso.Transparency = 1
        Torso.CanCollide = false
        Torso:ClearAllChildren()
        
        local LeftArm = LocalPlayer.Character["Left Arm"]:Clone()
        LeftArm.Parent = LocalPlayer.Character
        LeftArm.Name = "LeftArm"
        LeftArm.Transparency = 1
        LeftArm.CanCollide = false
        LeftArm:ClearAllChildren()

        local RightArm = LocalPlayer.Character["Right Arm"]:Clone()
        RightArm.Parent = LocalPlayer.Character
        RightArm.Name = "RightArm"
        RightArm.Transparency = 1
        RightArm.CanCollide = false
        RightArm:ClearAllChildren()

        --LocalPlayer.Character.HumanoidRootPart.CanCollide = true

        local Stuff = {
            Events = {}, 
            Debounces = {Button1DownDebounce = false}, 
            LeftClickHolding = false, 
            Mode = 1,  -- 1 = attack, 2 = climb mode
            AttackCombo = 1, 
            Stab = false, 
            Climbing = false
        }
        
        if LocalPlayer.Character:FindFirstChild("-Karambit") then
            LocalPlayer.Character:FindFirstChild("-Karambit"):Destroy()
        end
        if LocalPlayer.Character:FindFirstChild("KarambitLA") then
            LocalPlayer.Character:FindFirstChild("KarambitLA"):Destroy()
        end
        if LocalPlayer.Character:FindFirstChild("KarambitRA") then
            LocalPlayer.Character:FindFirstChild("KarambitRA"):Destroy()
        end
        if LocalPlayer.Character:FindFirstChild("KarambitT") then
            LocalPlayer.Character:FindFirstChild("KarambitT"):Destroy()
        end
        
        local LA
        local RA
        local RJ
        
        LocalPlayer.Character.HumanoidRootPart.Anchored = true

        
        local Attach0 = Instance.new("Attachment")
        Attach0.Parent = LocalPlayer.Character.Torso
        local Attach1 = Instance.new("Attachment")
        Attach1.Parent = Torso
        
        local Pos = Instance.new("AlignPosition")
        Pos.Parent = LocalPlayer.Character.Torso
        Pos.RigidityEnabled = true
        Pos.Attachment0, Pos.Attachment1 = Attach0, Attach1

        local Rot = Instance.new("AlignOrientation")
        Rot.Parent = LocalPlayer.Character.Torso
        Rot.RigidityEnabled = true
        Rot.Attachment0, Rot.Attachment1 = Attach0, Attach1
        
        LocalPlayer.Character.HumanoidRootPart.RootJoint:Destroy()
        
        local Attach0 = Instance.new("Attachment")
        Attach0.Parent = LocalPlayer.Character["Right Arm"]
        local Attach1 = Instance.new("Attachment")
        Attach1.Parent = RightArm
        
        local Pos = Instance.new("AlignPosition")
        Pos.Parent = LocalPlayer.Character.Torso
        Pos.RigidityEnabled = true
        Pos.Attachment0, Pos.Attachment1 = Attach0, Attach1

        local Rot = Instance.new("AlignOrientation")
        Rot.Parent = LocalPlayer.Character.Torso
        Rot.RigidityEnabled = true
        Rot.Attachment0, Rot.Attachment1 = Attach0, Attach1
        
        LocalPlayer.Character.Torso["Right Shoulder"]:Destroy()
        

        local Attach0 = Instance.new("Attachment")
        Attach0.Parent = LocalPlayer.Character["Left Arm"]
        local Attach1 = Instance.new("Attachment")
        Attach1.Parent = LeftArm
        
        local Pos = Instance.new("AlignPosition")
        Pos.Parent = LocalPlayer.Character.Torso
        Pos.RigidityEnabled = true
        Pos.Attachment0, Pos.Attachment1 = Attach0, Attach1

        local Rot = Instance.new("AlignOrientation")
        Rot.Parent = LocalPlayer.Character.Torso
        Rot.RigidityEnabled = true
        Rot.Attachment0, Rot.Attachment1 = Attach0, Attach1

        LocalPlayer.Character.Torso["Left Shoulder"]:Destroy()
        

        local Knife = Instance.new("Part")
        Knife.Name = "-Karambit"
        Knife.Parent = LocalPlayer.Character
        Knife.Size = Vector3.new(0.25, 2, 0.25)
        Knife.Transparency = 1
        Knife.CanCollide = false
        
        local KnifeWeld = Instance.new("Weld")
        KnifeWeld.Parent = Knife
        KnifeWeld.Part0 = RightArm
        KnifeWeld.Part1 = Knife
        KnifeWeld.C0 = CFrame.new(Vector3.new(-0.2, -1.125, 0.5)) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))
        KnifeWeld.C1 = CFrame.new(Vector3.new(0, 0, -0.125)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
        
        local BV = Instance.new("BodyVelocity")
        BV.Parent = KnifeAccessory.Handle
        BV.Velocity = Vector3.new(0, 0, 0)
        
        KnifeAccessory.Handle.AccessoryWeld:Destroy()
        
        RA = Instance.new("Weld")
        RA.Name = "KarambitRA"
        RA.Parent = LocalPlayer.Character
        RA.Part0 = Torso
        RA.Part1 = RightArm
        RA.C0 = CFrame.new(Vector3.new(1.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
        RA.C1 = CFrame.new(Vector3.new(0, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
        
        LA = Instance.new("Weld")
        LA.Name = "KarambitLA"
        LA.Parent = LocalPlayer.Character
        LA.Part0 = Torso
        LA.Part1 = LeftArm
        LA.C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
        LA.C1 = CFrame.new(Vector3.new(0, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
        
        RJ = Instance.new("Weld")
        RJ.Name = "KarambitT"
        RJ.Parent = LocalPlayer.Character
        RJ.Part0 = LocalPlayer.Character.HumanoidRootPart
        RJ.Part1 = Torso
        RJ.C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
        RJ.C1 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))

        game:GetService("TweenService"):Create(RA, TweenInfo.new(0.75, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(1.35, 0, -0.25)) * CFrame.Angles(math.rad(150), math.rad(35), math.rad(-10)) }):Play()
        wait(0.75)
        
        LocalPlayer.Character.HumanoidRootPart.Anchored = false
        LocalPlayer.Character.HumanoidRootPart.CanCollide = true

        Stuff.Events.ModeChangeEvent = game:GetService("UserInputService").InputBegan:Connect(function(Key)
            if Key.KeyCode == Enum.KeyCode.Q then
               Stuff.Mode = 1
            elseif Key.KeyCode == Enum.KeyCode.E then
               Stuff.Mode = 2
            end
        end)
        
        Stuff.Events.Button1DownEvent = LocalPlayer:GetMouse().Button1Down:Connect(function()
            Stuff.LeftClickHolding = true
            if Stuff.Debounces.Button1DownDebounce == false then
                Stuff.Debounces.Button1DownDebounce = true
                
                if LA ~= nil then
                   LA:Destroy()
                   LA = nil
                end
                if RA ~= nil then
                   RA:Destroy()
                   RA = nil
                end
                if RJ ~= nil then
                   RJ:Destroy()
                   RJ = nil
                end
                
                RA = Instance.new("Weld")
                RA.Name = "KarambitRA"
                RA.Parent = LocalPlayer.Character
                RA.Part0 = Torso
                RA.Part1 = RightArm
                RA.C0 = CFrame.new(Vector3.new(1.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                RA.C1 = CFrame.new(Vector3.new(0, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                
                LA = Instance.new("Weld")
                LA.Name = "KarambitLA"
                LA.Parent = LocalPlayer.Character
                LA.Part0 = Torso
                LA.Part1 = LeftArm
                LA.C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                LA.C1 = CFrame.new(Vector3.new(0, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                
                RJ = Instance.new("Weld")
                RJ.Name = "KarambitT"
                RJ.Parent = LocalPlayer.Character
                RJ.Part0 = LocalPlayer.Character.HumanoidRootPart
                RJ.Part1 = Torso
                RJ.C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                RJ.C1 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                
                if Stuff.Mode == 1 then
                    if Stuff.AttackCombo == 1 then
                        game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(45), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(RA, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(1.15, 1, 0)) * CFrame.Angles(math.rad(90), math.rad(80), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(LA, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(-50), math.rad(45), math.rad(0)) }):Play()
                        wait(0.45)
                        
                        game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(-30), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(RA, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(1.15, 1, 0)) * CFrame.Angles(math.rad(-70), math.rad(-80), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(LA, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(70), math.rad(-45), math.rad(0)) }):Play()
                        
                        wait(0.025)
                        Stuff.Stab = true
                        wait(0.1)
                        Stuff.Stab = false
                        
                        LA.C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                        
                        game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(RA, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { C0 = CFrame.new(Vector3.new(1.35, 0, -0.25)) * CFrame.Angles(math.rad(100), math.rad(35), math.rad(-10)) }):Play()
                        wait(0.3)
                        game:GetService("TweenService"):Create(RA, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(1.35, 0, -0.25)) * CFrame.Angles(math.rad(140), math.rad(35), math.rad(-10)) }):Play()
                        Stuff.Debounces.Button1DownDebounce = false
                    elseif Stuff.AttackCombo == 2 then
                        game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(20), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(RA, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(1.5, 1, -0.25)) * CFrame.Angles(math.rad(20), math.rad(-10), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(LA, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(-10), math.rad(10), math.rad(0)) }):Play()
                        wait(0.45)
                        game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(30), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(RA, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { C0 = CFrame.new(Vector3.new(1.5, 1.5, -0.25)) * CFrame.Angles(math.rad(130), math.rad(-10), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(LA, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { C0 = CFrame.new(Vector3.new(-1.5, 0.8, 0)) * CFrame.Angles(math.rad(-10), math.rad(20), math.rad(0)) }):Play()
                        wait(0.05)
                        Stuff.Stab = true
                        wait(0.1)
                        Stuff.Stab = false
                        
                        LA.C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                        
                        game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(RA, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(1.35, 0, -0.25)) * CFrame.Angles(math.rad(140), math.rad(35), math.rad(-10)) }):Play()
                        Stuff.Debounces.Button1DownDebounce = false
                    elseif Stuff.AttackCombo == 3 then
                        game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(20), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(RA, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(1.5, 1.25, -0.25)) * CFrame.Angles(math.rad(130), math.rad(-10), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(LA, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(-10), math.rad(10), math.rad(0)) }):Play()
                        wait(0.45)
                        game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(30), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(RA, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { C0 = CFrame.new(Vector3.new(1.5, 0.75, -0.25)) * CFrame.Angles(math.rad(90), math.rad(-10), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(LA, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { C0 = CFrame.new(Vector3.new(-1.5, 1.2, 0)) * CFrame.Angles(math.rad(-10), math.rad(20), math.rad(0)) }):Play()
                        wait(0.05)
                        Stuff.Stab = true
                        wait(0.1)
                        Stuff.Stab = false
                        
                        LA.C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                        
                        game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)) }):Play()
                        game:GetService("TweenService"):Create(RA, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(1.35, 0, -0.25)) * CFrame.Angles(math.rad(140), math.rad(35), math.rad(-10)) }):Play()
                        
                        Stuff.Debounces.Button1DownDebounce = false
                    end
                    
                    if Stuff.AttackCombo >= 3 then
                        Stuff.AttackCombo = 1
                    else
                        Stuff.AttackCombo = Stuff.AttackCombo + 1
                    end
                
                elseif Stuff.Mode == 2 then
                    if Stuff.Climbing == true then
                        
                        Stuff.Climbing = false 
                    end
                    game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(-20), math.rad(0)) }):Play()
                    game:GetService("TweenService"):Create(RA, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(1.5, 1.25, 0.25)) * CFrame.Angles(math.rad(200), math.rad(-10), math.rad(0)) }):Play()
                    game:GetService("TweenService"):Create(LA, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(70), math.rad(45), math.rad(0)) }):Play()
                    wait(0.15)
                    
                    
                    
                    repeat
                        wait()
                    until Stuff.LeftClickHolding == false
                    
                    Stuff.Debounces.Button1DownDebounce = false
                end
                
                
            end
        end)
        
        Stuff.Events.Button1UpEvent = LocalPlayer:GetMouse().Button1Up:Connect(function()
            Stuff.LeftClickHolding = false
            
            if RJ and LA and RA and Stuff.Mode == 2 then
                
                local PossibleWall = game.Workspace:FindPartOnRay(Ray.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2), LocalPlayer.Character)
                if PossibleWall ~= nil and PossibleWall.Size.Y >= 5 then
                    game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)) }):Play()
                    game:GetService("TweenService"):Create(RA, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { C0 = CFrame.new(Vector3.new(1.5, 1.25, 0.25)) * CFrame.Angles(math.rad(180), math.rad(5), math.rad(10)) }):Play()
                    game:GetService("TweenService"):Create(LA, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), { C0 = CFrame.new(Vector3.new(-1.5, 0.5, 0)) * CFrame.Angles(math.rad(-10), math.rad(10), math.rad(0)) }):Play()
                    
                    LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    
                    repeat
                        wait()
                    until Stuff.LeftClickHolding == true or Stuff.Mode ~= 2 or not game.Workspace:FindPartOnRay(Ray.new(LocalPlayer.Character.HumanoidRootPart.Position, LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 5), LocalPlayer.Character) or not (LocalPlayer and LocalPlayer.Character and Knife and Knife.Parent == LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health > 0)
                    
                    LocalPlayer.Character.HumanoidRootPart.Anchored = false
                    LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(LocalPlayer.Character.HumanoidRootPart.Velocity.X, LocalPlayer.Character.Humanoid.JumpPower * 1.5, LocalPlayer.Character.HumanoidRootPart.Velocity.Z)
                    
                    game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)) }):Play()
                    game:GetService("TweenService"):Create(RA, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(1.35, 1.5, -0.25)) * CFrame.Angles(math.rad(30), math.rad(-10), math.rad(-10)) }):Play()
                    game:GetService("TweenService"):Create(LA, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(-1.5, 1.1, 0)) * CFrame.Angles(math.rad(0), math.rad(10), math.rad(45)) }):Play()
                    wait(0.25)
                    
                    game:GetService("TweenService"):Create(RA, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(1.35, 0, -0.25)) * CFrame.Angles(math.rad(150), math.rad(35), math.rad(-10)) }):Play()
                else
                    game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(20), math.rad(0)) }):Play()
                    game:GetService("TweenService"):Create(RA, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(1.5, 1.25, 0.25)) * CFrame.Angles(math.rad(50), math.rad(10), math.rad(0)) }):Play()
                    game:GetService("TweenService"):Create(LA, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(-10), math.rad(10), math.rad(0)) }):Play()
                    wait(0.3)
                    game:GetService("TweenService"):Create(RJ, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0)) }):Play()
                    game:GetService("TweenService"):Create(RA, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { C0 = CFrame.new(Vector3.new(1.35, 0, -0.25)) * CFrame.Angles(math.rad(150), math.rad(35), math.rad(-10)) }):Play()
                    
                    LA.C0 = CFrame.new(Vector3.new(-1.5, 1, 0)) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
                end
                
            end
        end)
        
        repeat

            if Stuff.Stab == true then
                for i, v in pairs(game.Players:GetPlayers()) do
                    if v and v.Character and v.Character:FindFirstChild("-Claimed") and v.Character:FindFirstChildOfClass("Humanoid") then
                        if v.Character:FindFirstChildOfClass("Humanoid").Health > 0 and v.Character:FindFirstChildOfClass("Humanoid").Health ~= 1 then
                            spawn(function()
                                v.Character:FindFirstChildOfClass("Humanoid").Health = 1
                                v.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                                wait(0.5)
                                v.Character:FindFirstChildOfClass("Humanoid").Health = 0
                            end)
                        end
                    end
                end
            end

            LocalPlayer.Character.Head.CanCollide = false
            LocalPlayer.Character.Torso.CanCollide = false

            KnifeAccessory.Handle.CanCollide = false
            Knife.CanCollide = false
            KnifeAccessory.Handle.CFrame = Knife.CFrame * CFrame.new(Vector3.new(0, 0, 0)) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(90))
            game:GetService("RunService").Stepped:Wait()
        until not (LocalPlayer and LocalPlayer.Character and Knife and Knife.Parent == LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health > 0)
        
        if LA ~= nil then
            LA:Destroy()
            LA = nil
        end
        if RA ~= nil then
            RA:Destroy() 
            RA = nil
        end
        for i, v in pairs(Stuff.Events) do
           v:Disconnect() 
        end
        if Running then
            Running:Destroy()
        end
        Stuff = nil
    end
end)






-- updating cmdlist

IceGear.UpdateCmdList(CmdList, {CmdBar, "alphabetical"})

-- Disconnecting all the events along with the functions if gui is re-executed:

repeat
    wait()
until IceGear_AdminGui.Parent ~= game:GetService("CoreGui")

for i, v in pairs(IceGear.Events) do
    pcall(function()
        v:Disconnect()
    end)
end

IceGear = nil
