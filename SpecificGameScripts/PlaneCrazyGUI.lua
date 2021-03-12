-- no, this is not a copy script
-- its just for fun. it doesnt ruin other people's experience
-- made by Nexity#2106

_G.Settings = {
['Name'] = 'Plane Crazy o7',
['Intro'] = false,
['Keybind'] = 'P'
}
local playeraircraft = {}
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
Tab1:Label('Made by Nexity#2106')

local Tab2 = Library:CreateTab('Tab 2')
Tab2:Label('Change All Horn Pitch')
Tab2:Label('how name: YourNameHere + Aircraft')
Tab2:TextBox('Name', 'YourNameHere', function(output)
    playeraircraft = game.Workspace[output]:GetChildren()
end)
Tab2:TextBox('Pitch', 'Number', function(output)
    hornpitch = output
end)
Tab2:Button('Change', function()
    for i,v in pairs(playeraircraft) do
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
Tab4:Label('how name: YourNameHere + Aircraft')
Tab4:TextBox('Name', 'YourNameHere', function(output)
    playeraircraft = game.Workspace[output]:GetChildren()
end)
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
                for c,blocks in pairs(playeraircraft) do
                    pcall(function()
                        if blocks.Name == "Seat" then
                            blocks.Seat.CFrame = game.Players[tostring(v.Owner.Value)].Character.HumanoidRootPart.CFrame
                            wait(0.5)
                            blocks.Seat.CFrame = CFrame.new(blocks.Seat.Position.x, (blocks.Seat.Position.y-5000), blocks.Seat.Position.z)
                        end
                    end)
                end
            end)
        end
    end
end)
