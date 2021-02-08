loadstring(game:HttpGet("https://pastebin.com/raw/6GrAQY9r"))()
local s = Instance.new("PointLight", game.Players.LocalPlayer.Character.Head)
s.Brightness = .3
s.Range = 100

game.Lighting.Changed:connect(function()
    game.Lighting.TimeOfDay = "14:00:00"
    game.Lighting.FogEnd = 9999
    game.Lighting.Brightness = 2
    game.Lighting.ColorCorrection.Brightness = 0.1
    game.Lighting.ColorCorrection.Saturation = 0.1
    game.Lighting.Bloom.Intensity = 0.1
end)
