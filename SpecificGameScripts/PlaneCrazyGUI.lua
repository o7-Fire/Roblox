-- no, this is not a copy script
-- its just for fun. it doesnt ruin other people's experience

_G.Settings = {
['Name'] = 'Plane Crazy o7',
['Intro'] = false,
['Keybind'] = 'P'
}

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/QPehPJ6m", true))()

local Tab1 = Library:CreateTab('Tab1')
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
