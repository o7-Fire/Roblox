-- https://v3rmillion.net/showthread.php?tid=1100822
-- Instructions:
-- Have 100$ or more
-- Get to barbarian team
-- Equip the "steal food" tool
-- Execute


wait(5)
local Noclip = false
local LP = game.Players.LocalPlayer

-- vvv Credits to CharWar for this server hop vvv
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false

local File = pcall(function()
   AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)

if not File then
   table.insert(AllIDs, actualHour)
   writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end

function TPReturner()
   local Site;
   if foundAnything == "" then
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
   else
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
   end
   local ID = ""
   if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
       foundAnything = Site.nextPageCursor
   end
   local num = 0;
   for i,v in pairs(Site.data) do
       local Possible = true
       ID = tostring(v.id)
       if tonumber(v.maxPlayers) > tonumber(v.playing) then
           for _,Existing in pairs(AllIDs) do
               if num ~= 0 then
                   if ID == tostring(Existing) then
                       Possible = false
                   end
               else
                   if tonumber(actualHour) ~= tonumber(Existing) then
                       local delFile = pcall(function()
                           delfile("NotSameServers.json")
                           AllIDs = {}
                           table.insert(AllIDs, actualHour)
                       end)
                   end
               end
               num = num + 1
           end
           if Possible == true then
               table.insert(AllIDs, ID)
               wait()
               pcall(function()
                   writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                   wait()
                   game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
               end)
               wait(4)
           end
       end
   end
end

function Teleport()
   while wait() do
       pcall(function()
           TPReturner()
           if foundAnything ~= "" then
               TPReturner()
           end
       end)
   end
end
-- ^^^ Credits to CharWar for this server hop ^^^

game:GetService('RunService').RenderStepped:Connect(
function()
     LP.Character.Humanoid:ChangeState(11)
end
)

function Flood()
if game.Workspace.Water.Position == Vector3.new(0,-30,0) then
   return false
else
   return true
end
end

function Barb()
if LP.Backpack:FindFirstChild('steal food') then
   LP.Character.Humanoid:EquipTool(LP.Backpack['steal food'])
else
   if LP.Character:FindFirstChild('steal food') then
     return true
   else
     LP.Character.Humanoid:MoveTo(game:GetService("Workspace").SpawnArea.BarbarianSpawnArea.BarbarianTP.Position)
     wait(3)
     keypress(0x45)
     wait(2)
     keyrelease(0x45)
     LP.Character.Humanoid:EquipTool(LP.Backpack['steal food'])
     LP.Character["steal food"].Handle.Size = Vector3.new(0.05,0.05,100)
   end
   return true
end
end

function Food()
local CAmount = game:GetService("Workspace").FoodSupplies.TownSupply.Sign.SurfaceGui.ActualSupply.Text:split('/')
local BAmount = game:GetService("Workspace").FoodSupplies.BarbSupply.Sign.SurfaceGui.ActualSupply.Text:split('/')
if tonumber(CAmount[1]) >= 10 and tonumber(BAmount[1]) < 190 then
   return true
   else
   Teleport()
end
end

while Food() and Barb() do
if not Flood() then
   for count = 1,300 do
     LP.Character.HumanoidRootPart.CFrame = CFrame.new(-10.5, 10, 298.299988, 0, 1, -1, -1, 0, 0, -20, 0, 1)
     wait()
     LP.Character["steal food"]:Activate()
   end
   wait()
   LP.Character.HumanoidRootPart.CFrame = CFrame.new(60.0011673, -7.00991821289, -1000.52881, 0, 1, -1, -1, 0, 0, -20, 0, 1)
   wait(2)
else
   wait()
   LP.Character.HumanoidRootPart.CFrame = CFrame.new(58, 100, -1004, 0, 1, -1, -1, 0, 0, -20, 0, 1)
end
end
