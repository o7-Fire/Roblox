local Victim = 'Username'
local A = Instance.new 'Animation'
A.AnimationId = 'rbxassetid://148840371'
local P = game:GetService 'Players'.LocalPlayer
local C = P.Character or P.CharacterAdded:Wait()
local H = C:WaitForChild 'Humanoid':LoadAnimation(A)
H:Play()
H:AdjustSpeed(2.5)
game:GetService 'RunService'.Stepped:Connect(
    function()
        C:WaitForChild 'HumanoidRootPart'.CFrame =
            game:GetService 'Players':FindFirstChild(Victim).Character:WaitForChild 'HumanoidRootPart'
                .CFrame * CFrame.new(Vector3.new(0, 0, 1))
    end)
