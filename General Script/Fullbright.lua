--game.Lighting.Brightness = 10
--simple one ^ dont delete this 
print("gay")
local EnableFullbright = true

local function Normalize()
   game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
   game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
   game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
   game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
   game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
end

loacl function Fullbright()



game.Lighting.TimeOfDay = "14:00:00"
game.Lighting.FogEnd = 9999
game.Lighting.Brightness = 2
game.Lighting.GlobalShadows = false
game.Lighting.ColorCorrection.Brightness = 0.1
game.Lighting.ColorCorrection.Saturation = 0.1
game.Lighting.Bloom.Intensity = 0.1

end

if EnableFullbright == true then
   Fullbright()
elseif EnableFullbright == false then
   Normalize()
end
