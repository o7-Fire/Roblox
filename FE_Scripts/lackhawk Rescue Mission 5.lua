loadstring(game:HttpGet(
               "https://raw.githubusercontent.com/o7-Fire/Roblox/master/BlackhawkRescueMission5.lua"))()
loadstring(game:HttpGet(
               "https://raw.githubusercontent.com/o7-Fire/Roblox/master/TPpoint.lua"))()
game.Lighting.Changed:connect(function()
    game.Lighting.TimeOfDay = "14:00:00"
    game.Lighting.FogEnd = 9999
    game.Lighting.Brightness = 2
    game.Lighting.ColorCorrection.Brightness = 0.1
    game.Lighting.ColorCorrection.Saturation = 0.1
    game.Lighting.Bloom.Intensity = 0.1
end)
