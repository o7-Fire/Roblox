-- Keybinds
_G.UnReanimateKey = "q" -- The keybind for unreanimating.
_G.ReanimateKey = "e" -- The keybind for reanimating.
_G.R6ToggleKey = "r" -- The keybind for toggling R15 to R6.
_G.GodmodeToggleKey = "t" -- The keybind for toggling godmode.
-- Options
_G.CharacterBug = false -- Set to true if your uppertorso floats when you use godmode with R15.
_G.GodMode = true -- Set to true if you want godmode.
_G.R6 = false -- Set to true if you wanna enable R15 to R6 when your R15.
_G.FastLoading = true -- Set to true if you want godmode to load faster.
_G.AutoReanimate = true -- Set to true if you want to auto reanimate and disable keybinds after executing.

loadstring(game:HttpGet("https://paste.ee/r/e4oZ2/0"))()

repeat wait() until _G.MSG.Text == ""
wait(0.5)
local head = game:GetService("Players").LocalPlayer.Character.Head
head.Archivable = true
local headc = head:Clone()
headc.Parent = game:GetService("Players").LocalPlayer.Character
head:Destroy()
local w = Instance.new("Weld", headc)
w.Part0 = headc
w.Part1 = game:GetService("Players").LocalPlayer.Character["NullwareReanim"]
              .Head
headc.Transparency = 1
if headc:FindFirstChildOfClass("Decal") then
    headc:FindFirstChildOfClass("Decal").Texture = "rbxassetid://000000000"
end
