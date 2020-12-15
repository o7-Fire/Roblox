-- execute this and then u can fly and noclip and stuff

--===========================
-- the script got patched f
--===========================

for i,v in pairs(getgc(true)) do
    if type(v) == 'function' and getfenv(v).script and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerGui["_L.Handler"].InventoryHandler then
        if table.find(getconstants(v),'NoclipChecking') then
            setconstant(v,69,'Horn')
            break
        end
    end
end
local GameMeta = getrawmetatable(game)
local Original = GameMeta.__namecall
setreadonly(GameMeta, false)
GameMeta.__namecall = newcclosure(function(...)
    if tostring(getnamecallmethod()) == "Kick" or tostring(getnamecallmethod()) == "kick" then
        return
    end
    if tostring(getnamecallmethod()) == 'FireServer' then
        Args = {...}
        if tostring(Args[1]) == 'FullRecoloring' and tostring(Args[2]) == 'B' then
            return    
        end
    end
    return Original(...)
end)
setreadonly(GameMeta, true)
