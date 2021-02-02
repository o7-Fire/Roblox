print("gay")
game:GetService("Lighting").Brightness = 1
game:GetService("Lighting").FogEnd = 786543
game:GetService("Lighting").GlobalShadows = false
game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
function disable():
   game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
   game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
   game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
   game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
   game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
end
//disable()
//uncomment above to disable
