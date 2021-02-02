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
   game:GetService("Lighting").Brightness = 1
   game:GetService("Lighting").FogEnd = 786543
   game:GetService("Lighting").GlobalShadows = false
   game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
end

if EnableFullbright == true then
   Fullbright()
elseif EnableFullbright == false then
   Normalize()
end
