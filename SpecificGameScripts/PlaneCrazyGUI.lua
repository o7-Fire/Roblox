_G.Settings = {
['Name'] = 'Plane Crazy o7',
['Intro'] = false,
['Keybind'] = 'P'
}
local hornpitch = {}
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/QPehPJ6m", true))()

local Tab1 = Library:CreateTab('Tab 1')
Tab1:Label('Random Scripts')
Tab1:Button('Ocean Map', function()
    local region = Region3.new(Vector3.new(-3750,-100,-2050), Vector3.new(2500,43,2700))
    region = region:ExpandToGrid(4)
    game.Workspace.Terrain:FillRegion(region, 4, Enum.Material.Water)
end)
Tab1:Button('Gravity Gun', function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/6cfa5Wxa'),true))()
end)
Tab1:Button('Infinite Yield', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
Tab1:Button("Destroy this GUI", function()
    game.CoreGui.ShadowLib:Destroy()
end)
Tab1:Label('Made by Nexity#2106')

local Tab2 = Library:CreateTab('Tab 2')
Tab2:Label('Change All Horn Pitch')
Tab2:TextBox('Pitch', 'Number', function(output)
    hornpitch = output
end)
Tab2:Button('Change', function()
    for i,v in pairs(game.Workspace[tostring(game.Players.LocalPlayer) .. 'Aircraft']:GetChildren()) do
        if v.Name == "Horn" then
            v.Configuration.Pitch.Value = hornpitch
        end
    end
end)

local Tab3 = Library:CreateTab('Tab 3')
Tab3:Label('Teleport to Base')
Tab3:Button('Refresh', function()
    for i,v in pairs(game.CoreGui.ShadowLib.MainFrame['Tab 3']:GetChildren()) do
        if v.ClassName == "ImageButton" then
            if v.Title.Text == "Refresh" then
                print("no")
            else
                v:Destroy()
            end
        end
    end
    for i,v in pairs(game.Workspace.BuildingZones:GetChildren()) do
        if tostring(v.Owner.Value) == "nil" then
            print("nil owner")
        else
            Tab3:Button(tostring(v.Owner.Value), function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position.x, v.Position.y, v.Position.z - 75)
            end)
        end
    end
end)

local Tab4 = Library:CreateTab('Tab 4')
Tab4:Label('Kill with seats')
Tab4:Button('Refresh', function()
    for i,v in pairs(game.CoreGui.ShadowLib.MainFrame['Tab 4']:GetChildren()) do
        if v.ClassName == "ImageButton" then
            if v.Title.Text == "Refresh" then
                print("no")
            else
                v:Destroy()
            end
        end
    end
    for i,v in pairs(game.Workspace.BuildingZones:GetChildren()) do
        if tostring(v.Owner.Value) == "nil" then
            print("nil owner")
        else
            Tab4:Button(tostring(v.Owner.Value), function()
                for i,blocks in pairs(game.Workspace[tostring(game.Players.LocalPlayer) .. 'Aircraft']:GetChildren()) do
                    pcall(function()
                        if blocks.Name == "Seat" then
                            blocks.Seat.CFrame = game.Players[tostring(v.Owner.Value)].Character.HumanoidRootPart.CFrame
                            wait(0.8)
                            blocks.Seat.CFrame = CFrame.new(blocks.Seat.Position.x, (blocks.Seat.Position.y-5000), blocks.Seat.Position.z)
                        end
                    end)
                end
            end)
        end
    end
end)

local Tab5 = Library:CreateTab('Tab 5')
Tab5:Label('Teleport TNT to player')
Tab5:Button('Refresh', function()
    for i,v in pairs(game.CoreGui.ShadowLib.MainFrame['Tab 5']:GetChildren()) do
        if v.ClassName == "ImageButton" then
            if v.Title.Text == "Refresh" then
                print("no")
            else
                v:Destroy()
            end
        end
    end
    for i,v in pairs(game.Workspace.BuildingZones:GetChildren()) do
        if tostring(v.Owner.Value) == "nil" then
            print("nil owner")
        else
            Tab5:Button(tostring(v.Owner.Value), function()
                for i,blocks in pairs(game.Workspace[tostring(game.Players.LocalPlayer) .. 'Aircraft']:GetChildren()) do
                    if blocks.Name == "ExplosiveBlock" then
                        blocks.Decorate.CFrame = game.Players[tostring(v.Owner.Value)].Character.HumanoidRootPart.CFrame
                        wait()
                    end
                    if blocks.Name == "ExplosiveBall" then
                        blocks.Decorate.CFrame = game.Players[tostring(v.Owner.Value)].Character.HumanoidRootPart.CFrame
                        wait()
                    end
                end
            end)
        end
    end
end)
