-- im not homophobic
-- this script gives you a sword
-- https://v3rmillion.net/showthread.php?tid=1102648
-- game: https://www.roblox.com/games/5373028495/LGBTQ-Hangout
for i,v in pairs(workspace.ArenaFolder.Doors:GetChildren()) do
if v.Name == "ArenaLeave" then
v:Remove()
end
end
workspace.ArenaFolder.Doors.ArenaEnter.CanCollide = false
workspace.ArenaFolder.Doors.ArenaEnter.Size = Vector3.new(2048,2048,2048)
