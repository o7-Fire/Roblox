nction sandbox(var,func)
local env = getfenv(func)
local newenv = setmetatable({},{
__index = function(self,k)
if k=="script" then
return var
else
return env[k]
end
end,
})
setfenv(func,newenv)
return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
ScreenGui0 = Instance.new("ScreenGui")
Frame1 = Instance.new("Frame")
Frame2 = Instance.new("Frame")
TextBox3 = Instance.new("TextBox")
TextLabel4 = Instance.new("TextLabel")
Frame5 = Instance.new("Frame")
TextLabel6 = Instance.new("TextLabel")
TextLabel7 = Instance.new("TextLabel")
TextBox8 = Instance.new("TextBox")
TextLabel9 = Instance.new("TextLabel")
TextBox10 = Instance.new("TextBox")
TextButton11 = Instance.new("TextButton")
LocalScript12 = Instance.new("LocalScript")
LocalScript13 = Instance.new("LocalScript")
ScreenGui0.Parent = mas
ScreenGui0.ResetOnSpawn = false
Frame1.Parent = ScreenGui0
Frame1.Position = UDim2.new(0.096632503, 0, 0.648711979, 0)
Frame1.Size = UDim2.new(0, 438, 0, 179)
Frame1.BackgroundColor = BrickColor.new("Really black")
Frame1.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
Frame1.BorderSizePixel = 0
Frame2.Name = "pt1"
Frame2.Parent = Frame1
Frame2.Position = UDim2.new(0, 0, 0.114857376, 0)
Frame2.Size = UDim2.new(0, 438, 0, 9)
Frame2.BackgroundColor = BrickColor.new("Dark blue")
Frame2.BackgroundColor3 = Color3.new(0, 0.215686, 0.65098)
Frame2.BorderSizePixel = 0
TextBox3.Parent = Frame2
TextBox3.Position = UDim2.new(0.098173514, 0, 1.66666675, 0)
TextBox3.Size = UDim2.new(0, 224, 0, 28)
TextBox3.BackgroundColor = BrickColor.new("Black metallic")
TextBox3.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
TextBox3.BorderSizePixel = 0
TextBox3.Font = Enum.Font.SourceSans
TextBox3.FontSize = Enum.FontSize.Size24
TextBox3.Text = ""
TextBox3.TextColor = BrickColor.new("Institutional white")
TextBox3.TextColor3 = Color3.new(1, 1, 1)
TextBox3.TextSize = 23
TextBox3.TextXAlignment = Enum.TextXAlignment.Left
TextBox3.TextYAlignment = Enum.TextYAlignment.Top
TextBox3.ClearTextOnFocus = false
TextLabel4.Parent = Frame1
TextLabel4.Size = UDim2.new(0, 121, 0, 21)
TextLabel4.BackgroundColor = BrickColor.new("Institutional white")
TextLabel4.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel4.BackgroundTransparency = 1
TextLabel4.BorderSizePixel = 0
TextLabel4.Font = Enum.Font.SourceSans
TextLabel4.FontSize = Enum.FontSize.Size14
TextLabel4.Text = "FE Chat Hax"
TextLabel4.TextColor = BrickColor.new("Institutional white")
TextLabel4.TextColor3 = Color3.new(1, 1, 1)
TextLabel4.TextScaled = true
TextLabel4.TextSize = 14
TextLabel4.TextWrap = true
TextLabel4.TextWrapped = true
Frame5.Name = "pt2"
Frame5.Parent = Frame1
Frame5.Position = UDim2.new(0, 0, 0.401840836, 0)
Frame5.Size = UDim2.new(0, 438, 0, 9)
Frame5.BackgroundColor = BrickColor.new("Dark blue")
Frame5.BackgroundColor3 = Color3.new(0, 0.215686, 0.65098)
Frame5.BorderSizePixel = 0
TextLabel6.Parent = Frame5
TextLabel6.Position = UDim2.new(0, 0, -4, 0)
TextLabel6.Size = UDim2.new(0, 49, 0, 20)
TextLabel6.BackgroundColor = BrickColor.new("Institutional white")
TextLabel6.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel6.BackgroundTransparency = 1
TextLabel6.Font = Enum.Font.SourceSans
TextLabel6.FontSize = Enum.FontSize.Size14
TextLabel6.Text = "You:"
TextLabel6.TextColor = BrickColor.new("Institutional white")
TextLabel6.TextColor3 = Color3.new(1, 1, 1)
TextLabel6.TextScaled = true
TextLabel6.TextSize = 14
TextLabel6.TextWrap = true
TextLabel6.TextWrapped = true
TextLabel7.Parent = Frame5
TextLabel7.Position = UDim2.new(0, 0, 6.77777767, 0)
TextLabel7.Size = UDim2.new(0, 76, 0, 33)
TextLabel7.BackgroundColor = BrickColor.new("Institutional white")
TextLabel7.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel7.BackgroundTransparency = 1
TextLabel7.Font = Enum.Font.SourceSans
TextLabel7.FontSize = Enum.FontSize.Size14
TextLabel7.Text = "ChatHaxx:"
TextLabel7.TextColor = BrickColor.new("Institutional white")
TextLabel7.TextColor3 = Color3.new(1, 1, 1)
TextLabel7.TextScaled = true
TextLabel7.TextSize = 14
TextLabel7.TextWrap = true
TextLabel7.TextWrapped = true
TextBox8.Name = "Usernamee"
TextBox8.Parent = Frame5
TextBox8.Position = UDim2.new(0.194063917, 0, 3.66666651, 0)
TextBox8.Size = UDim2.new(0, 224, 0, 28)
TextBox8.BackgroundColor = BrickColor.new("Black metallic")
TextBox8.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
TextBox8.BorderSizePixel = 0
TextBox8.Font = Enum.Font.SourceSans
TextBox8.FontSize = Enum.FontSize.Size24
TextBox8.Text = ""
TextBox8.TextColor = BrickColor.new("Institutional white")
TextBox8.TextColor3 = Color3.new(1, 1, 1)
TextBox8.TextSize = 23
TextBox8.TextXAlignment = Enum.TextXAlignment.Left
TextBox8.TextYAlignment = Enum.TextYAlignment.Top
TextBox8.ClearTextOnFocus = false
TextLabel9.Parent = Frame5
TextLabel9.Position = UDim2.new(0, 0, 3.11111116, 0)
TextLabel9.Size = UDim2.new(0, 76, 0, 33)
TextLabel9.BackgroundColor = BrickColor.new("Institutional white")
TextLabel9.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel9.BackgroundTransparency = 1
TextLabel9.Font = Enum.Font.SourceSans
TextLabel9.FontSize = Enum.FontSize.Size14
TextLabel9.Text = "Username:"
TextLabel9.TextColor = BrickColor.new("Institutional white")
TextLabel9.TextColor3 = Color3.new(1, 1, 1)
TextLabel9.TextScaled = true
TextLabel9.TextSize = 14
TextLabel9.TextWrap = true
TextLabel9.TextWrapped = true
TextBox10.Name = "Chathaxxx"
TextBox10.Parent = Frame5
TextBox10.Position = UDim2.new(0.194063917, 0, 7.33333302, 0)
TextBox10.Size = UDim2.new(0, 224, 0, 28)
TextBox10.BackgroundColor = BrickColor.new("Black metallic")
TextBox10.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
TextBox10.BorderSizePixel = 0
TextBox10.Font = Enum.Font.SourceSans
TextBox10.FontSize = Enum.FontSize.Size24
TextBox10.Text = ""
TextBox10.TextColor = BrickColor.new("Institutional white")
TextBox10.TextColor3 = Color3.new(1, 1, 1)
TextBox10.TextSize = 23
TextBox10.TextXAlignment = Enum.TextXAlignment.Left
TextBox10.TextYAlignment = Enum.TextYAlignment.Top
TextBox10.ClearTextOnFocus = false
TextButton11.Name = "Send"
TextButton11.Parent = Frame5
TextButton11.Position = UDim2.new(0.746575356, 0, 5.11111116, 0)
TextButton11.Size = UDim2.new(0, 82, 0, 40)
TextButton11.BackgroundColor = BrickColor.new("Black metallic")
TextButton11.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
TextButton11.BorderSizePixel = 0
TextButton11.Font = Enum.Font.Oswald
TextButton11.FontSize = Enum.FontSize.Size14
TextButton11.Text = "Send"
TextButton11.TextColor = BrickColor.new("Really black")
TextButton11.TextColor3 = Color3.new(0, 0, 0)
TextButton11.TextScaled = true
TextButton11.TextSize = 14
TextButton11.TextWrap = true
TextButton11.TextWrapped = true
LocalScript12.Parent = TextButton11
table.insert(cors,sandbox(LocalScript12,function()

script.Parent.MouseButton1Click:Connect(function()
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(""..script.Parent.Parent.Parent.pt1.TextBox.Text.." \224\185\142\204\183\224\185\142\204\182\224\185\142\204\184\224\185\142\204\182\224\185\142\204\180\224\185\142\204\184\224\185\142\204\181\224\185\142\204\180\224\185\142\204\182\224\185\142\204\181\224\185\142\204\183\224\185\142\204\181\224\185\142\204\181\224\185\142\204\183\224\185\142\204\184\224\185\142\204\182\224\185\142\204\182\224\185\142\204\184\224\185\142\204\182\224\185\142\204\184\224\185\142\204\184\224\185\142\204\180\224\185\142\204\180\224\185\142\204\182\224\185\142\204\182\224\185\142\204\182\224\185\142\204\182\224\185\142\204\182\224\185\142\204\182\224\185\142\224\185\142\204\183\224\185\142\204\182\224\185\142\204\184\224\185\142\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\184\224\185\142\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\184\224\185\142\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180\204\182\224\185\142\204\180["..script.Parent.Parent.Usernamee.Text.."]: "..script.Parent.Parent.Chathaxxx.Text.."","All")
end)

end))
LocalScript13.Name = "Dragify"
LocalScript13.Parent = Frame1
table.insert(cors,sandbox(LocalScript13,function()
local UIS = game:GetService("UserInputService")
function dragify(Frame)
    dragToggle = nil
    local dragSpeed = 0.50
    dragInput = nil
    dragStart = nil
    local dragPos = nil
    function updateInput(input)
        local Delta = input.Position - dragStart
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.30), {Position = Position}):Play()
    end
    Frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            updateInput(input)
        end
    end)
end

dragify(script.Parent)
end))
for i,v in pairs(mas:GetChildren()) do
v.Parent = game.CoreGui
pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
spawn(function()
pcall(v)
end)
end
