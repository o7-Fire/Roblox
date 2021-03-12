-- no, this is not a copy script
-- its just for fun. it doesnt ruin other people's experience
-- made by Nexity#2106

-- this one is with more a fancy UI

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lolpoppyus/Roblox-Lua/master/Pop%20UI%20Lib", true))()

local nouse = library:Tab(".")
local nouse2 = library:Tab(".")
local nouse3 = library:Tab(".")
local Tab = library:Tab("Tab 1")

Tab:Label("Plane Crazy o7")

Tab:Button("Ocean Map", function()
    local region = Region3.new(Vector3.new(-3750,-100,-2050), Vector3.new(2500,43,2700))
    region = region:ExpandToGrid(4)
    game.Workspace.Terrain:FillRegion(region, 4, Enum.Material.Water)
end)

Tab:Button("Gravity Gun", function()
    loadstring(game:HttpGet(('https://pastebin.com/raw/6cfa5Wxa'),true))()
end)

Tab:Button("Infinite Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Tab:Slider("Change Horn Pitch", 0, 100, function(arg)
    for i,v in pairs(game.Workspace[tostring(game.Players.LocalPlayer) .. 'Aircraft']:GetChildren()) do
        if v.Name == "Horn" then
            v.Configuration.Pitch.Value = arg / 10
        end
    end
end)

Tab:Textbox2("Teleport to Base", "Player", function(arg)
   local plr = game.Players.LocalPlayer.Character.HumanoidRootPart
   for i,v in pairs(game.Workspace.BuildingZones:GetChildren()) do
      if tostring(v.Owner.Value) == arg then
         plr.CFrame = CFrame.new(v.Position.x, v.Position.y, v.Position.z - 75)
      end
   end
end)

Tab:Textbox2("Kill with Seats", "Player", function(arg)
   for c,blocks in pairs(game.Workspace[tostring(game.Players.LocalPlayer) .. 'Aircraft']:GetChildren()) do
        pcall(function()
            if blocks.Name == "Seat" then
                blocks.Seat.CFrame = game.Players[arg].Character.HumanoidRootPart.CFrame
                wait(0.5)
                blocks.Seat.CFrame = CFrame.new(blocks.Seat.Position.x, (blocks.Seat.Position.y-5000), blocks.Seat.Position.z)
            end
        end)
    end
end)

local Tab2 = library:Tab("Credits")

Tab2:Textstring2("Created by - Nexity")

Tab2:Textstring("Discord", "Nexity#2106")
