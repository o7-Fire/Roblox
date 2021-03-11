-- no, this is not a copy script
-- its just for fun. it doesnt ruin other people's experience

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
Tab1:Label('Made by Nexity#2106')

local Tab2 = Library:CreateTab('Tab 2')
Tab2:Label('Change All Horn Pitch')
Tab2:Label('name example: Assbeater420Aircraft')
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
