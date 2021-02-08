-- who deleted this
-- https://v3rmillion.net/showthread.php?tid=1084292
function pog()
    for i, v in pairs(
                    game:GetService("ReplicatedStorage").GunModules:GetChildren()) do
        if v:IsA("ModuleScript") then
            require(v).magsize = 42069
            require(v).sparerounds = 42069
            require(v).firerate = 1200
            require(v).aimcamkickspeed = 0
            require(v).zoom = 4
            require(v).aimspeed = 100
            require(v).equipspeed = 100
        end
    end
end

pog()
