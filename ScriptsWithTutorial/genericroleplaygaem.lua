-- this script generates 100 cash every minute
-- how it works is:
-- you make a vip server (its free) and you automatically become leader
-- you execute this script and it will teleport you to vote for a law
-- every time you vote for a law, you get 100 cash, you can vote every 1 minute
while wait(5) do
    pcall(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(331.79, 61, 427.05) + Vector3.new(1, 0, 0)
    end)
end
