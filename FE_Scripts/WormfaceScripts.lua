---------------------------
-- made by nexity
-- teleports you to food
---------------------------
while wait(0.1) do
    pcall(function()
        game:GetService("Workspace").Characters.MrBlobFish13.HumanoidRootPart
            .Weld:Destroy()
    end)
    -- removes weld so you become invisible
    theitem = game.Workspace.Items.Gem.Part.Position
    game.Players.LocalPlayer.Character:MoveTo(
        Vector3.new(theitem.x, theitem.y, theitem.z))
    -- teleports you to the fruits
end

--------------------------
-- changes your walkspeed
--------------------------

while wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100 end
