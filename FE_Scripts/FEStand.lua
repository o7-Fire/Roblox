--[[
leaked by the people
So this is the list of hats you need to be wearing (they are all free to get) :
https://www.roblox.com/catalog/451220849/Lavender-Updo
https://www.roblox.com/catalog/63690008/Pal-Hair
https://www.roblox.com/catalog/48474294/ROBLOX-Girl-Hair (this one is in a bundle) - https://www.roblox.com/bundles/282/ROBLOX-Girl 	
https://www.roblox.com/catalog/48474313/Red-Roblox-Cap
https://www.roblox.com/catalog/62234425/Brown-Hair
https://www.roblox.com/catalog/62724852/Chestnut-Bun (this one is in a bundle) - https://www.roblox.com/bundles/239/Woman
https://www.roblox.com/catalog/4819740796/Robox
also the last hat is the head of the stand]]--
 
 --[[Controls:
 Q - Summon/Unsummon
 E - Barrage - Throws Punches
 R - Mech Legs Walk - (when you spam the key) press "Q" to reset the stand
 T - Blackhole - Sucks people and things in a blackhole
 F - Arm Teleport - Your arm goes forward and teleports you
 G - Long Neck - Makes your neck very long
 H - Cape - Stand transforms into a cape and makes you quicker
 J - Dance - The stand starts dancing next to you
 Z - Stand Idle 1 - The stand stays at the same pose
 X - Stand Idle 2 - You walk very slow on top of the stand
 C - Dash Forward - The stand gives you a massive push and boost you forward
 V - Throne - The stand transforms into a throne for you
 B - Stand Idle 3 - The stand stands with its arms crossed behind you
 Those are pretty much the moves of the Fe Stand...]]--


for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
if v:IsA("Accessory") then
print(v)
end
end
    
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("Accessory") and v.Handle:FindFirstChild("SpecialMesh") then
    ag = v.Handle:FindFirstChild("SpecialMesh")
    ag:Destroy()
    end
    end
    
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("Accessory") and v.Handle:FindFirstChild("Mesh") then
    ag = v.Handle:FindFirstChild("Mesh")
    ag:Destroy()
    end
    end

    wait()
    
    for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v:IsA("Accessory") then
		    v.Handle.Transparency = 1
            v.Handle.Parent = workspace
			v.Parent = workspace
		end
    end

    wait(0.1)
    
    game.Players.LocalPlayer.Character:BreakJoints()
    
    wait(7)
    
local unanchoredparts = {}
local movers = {}
 local tog = true
 local move = false
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local mov = {};
local mov2 = {};

local Head = "MeshPartAccessory" --press f9 and find the hat that looks like a heads name and put it here
local x = -2   --Edit Position for head
local y = 2.8   --Edit Position for head x2
local z = 3 --Edit Position for head x3


local Hats = {rightarm = Character:WaitForChild("Hat1"),
             leftarm  = Character:WaitForChild("Pal Hair"),
             rightleg = Character:WaitForChild("LavanderHair"),
             leftleg  = Character:WaitForChild("Pink Hair"),
              torso1   = Character:WaitForChild("Robloxclassicred"),
             torso2   = Character:WaitForChild("Kate Hair"),
             
}

for i,v in next, Hats do
v.Handle.AccessoryWeld:Remove()
for _,mesh in next, v:GetDescendants() do
if mesh:IsA("Mesh") or mesh:IsA("SpecialMesh") then
mesh:Remove()
end
end
end
local Network = coroutine.create(function()
while true do
game:GetService("RunService").Heartbeat:Wait()
settings().Physics.AllowSleep = false
game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)*math.huge
game:GetService("Players").LocalPlayer.SimulationRadius = math.pow(math.huge,math.huge)*math.huge
end
end)
coroutine.resume(Network)

function ftp(str)
    local pt = {};
    if str ~= 'me' and str ~= 'random' then
        for i, v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():find(str:lower()) then
                table.insert(pt, v);
            end
        end
    elseif str == 'me' then
        table.insert(pt, plr);
	elseif str == 'random' then
		table.insert(pt, game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]);
    end
    return pt;
end

Character.Head.Transparency = 0
Character.Head.face:Remove()
Character.Torso.Transparency = 0
Character["Right Arm"].Transparency = 0
Character["Left Arm"].Transparency = 0
Character["Right Leg"].Transparency = 0
Character["Left Leg"].Transparency = 0
local function align(i,v)
local att0 = Instance.new("Attachment", i)
att0.Position = Vector3.new(0,0,0)
local att1 = Instance.new("Attachment", v)
att1.Position = Vector3.new(0,0,0)
local AP = Instance.new("AlignPosition", i)
AP.Attachment0 = att0
AP.Attachment1 = att1
AP.RigidityEnabled = false
AP.ReactionForceEnabled = false
AP.ApplyAtCenterOfMass = true
AP.MaxForce = 9999999
AP.MaxVelocity = math.huge
AP.Responsiveness = 65
local AO = Instance.new("AlignOrientation", i)
AO.Attachment0 = att0
AO.Attachment1 = att1
AO.ReactionTorqueEnabled = true
AO.PrimaryAxisOnly = false
AO.MaxTorque = 9999999
AO.MaxAngularVelocity = math.huge
AO.Responsiveness = 50
end
align(Hats.torso1.Handle, Character["Torso"])
align(Hats.torso2.Handle, Character["Torso"])
align(Hats.rightarm.Handle, Character["Torso"])
align(Hats.leftarm.Handle, Character["Torso"])
align(Hats.rightleg.Handle, Character["Torso"])
align(Hats.leftleg.Handle, Character["Torso"])
Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)

Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment1"
Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment2"
Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment3"
Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment4"
Character:WaitForChild("Torso"):FindFirstChild("Attachment").Name = "Attachment5"

Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

Character:WaitForChild(Head).Handle.AccessoryWeld:Remove()
local alignpos = Instance.new("AlignPosition", Character)
local alignorien = Instance.new("AlignOrientation", Character)
local att1 = Instance.new("Attachment", Character:WaitForChild(Head).Handle)
local att2 = Instance.new("Attachment", Character:WaitForChild("Head"))
alignpos.Attachment0 = att1
alignpos.Attachment1 = att2
alignpos.RigidityEnabled = false
alignpos.ReactionForceEnabled = false
alignpos.ApplyAtCenterOfMass = true
alignpos.MaxForce = 99999999
alignpos.MaxVelocity = math.huge
alignpos.Responsiveness = 65
alignorien.Attachment0 = att1
alignorien.Attachment1 = att2
alignorien.ReactionTorqueEnabled = true
alignorien.PrimaryAxisOnly = false
alignorien.MaxTorque = 99999999
alignorien.MaxAngularVelocity = math.huge
alignorien.Responsiveness = 50
att2.Position = Vector3.new(x,y,z)






game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "z" then
     if toggle == false then
         
         Character.Humanoid.WalkSpeed = 16
         
         Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
            Character.Humanoid.HipHeight = 0
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                
                
                
                att2.Position = Vector3.new(x,y,z)
           toggle = true
 else
            Character.Humanoid.HipHeight = 0
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.1,1.9,-0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,1.9,0.7)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-2.9,2.2,-1)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,1.9,0.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.1,0.1,0)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,-0.1,0.7)
            
            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(95,50,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(70,0,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(90,50,10)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,50,20)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(95,50,0)
                
           
 
	    

                
            att2.Position = Vector3.new(-1.7,y,0.3)
            toggle = false
        end
    end
end)


game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "x" then
     if toggle == false then
         

          
         Character.Humanoid.WalkSpeed = 16
         
         Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
            Character.Humanoid.HipHeight = 0
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                
                
                
                att2.Position = Vector3.new(x,y,z)
           toggle = true
 else
     
       
     Character.Humanoid.WalkSpeed = 5
            Character.Humanoid.HipHeight = 6
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,-5.9,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,-5.9,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,-3.9,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.2,-3.9,-0.3)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-7.9,-0.3)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-7.9,0)
            
            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(70,0,20)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(70,0,-20)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                
                
           
 
	    

                
            att2.Position = Vector3.new(0,-5.5,0)
            toggle = false
        end
    end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "c" then
     if tog == true then
         
         tog = false
         
         Character.Humanoid.HipHeight = 0
         
         att2.Position = Vector3.new(0,0.5,1)
         
          Character.Humanoid.WalkSpeed = 16
          
           Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
         Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,1.5)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,1.5)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,0.6,0.5)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,0.6,0.5)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-0.5,3.2)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-0.5,3.2)
            
            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(-35,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(-10,0,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(-10,0,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(0,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(10,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(-35,0,0)
                
    wait(0.5)

                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,1.5)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,1.5)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,0.6,1)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,0.6,1)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-0.5,3.2)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-0.5,3.2)
                
    wait(0.1)
    
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,1.5)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,1.5)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,0.6,2)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,0.6,2)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-0.5,3.2)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-0.5,3.2)
            
            wait(0.1)
            
            Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,1.5)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,0.6,0.5)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,0.6,0.5)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-0.5,3.2)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-0.5,3.2)
            
            wait(0.1)
            
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector*300
            
                wait(0.5)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                
                att2.Position = Vector3.new(x,y,z)
                wait(1)
            tog = true
        end
    end
end)


game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "q" then
     if toggle == false then
         
         Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
         Character.Humanoid.WalkSpeed = 16
         
            Character.Humanoid.HipHeight = 0
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                
                
                
                att2.Position = Vector3.new(x,y,z)
           toggle = true
 else
     Character.Humanoid.WalkSpeed = 16
     Character.Humanoid.HipHeight = 0
            Character.Humanoid.HipHeight = 0
          Character:WaitForChild("Torso").Attachment.Position = Vector3.new(500,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(500,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(500,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(500,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(200,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(500,0,3)
            
            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(-35,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(-10,0,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(-10,0,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(0,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(10,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(-35,0,0)
                
                
           
 
	    

                
            att2.Position = Vector3.new(500,0.5,1)
            toggle = false
        end
    end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "v" then
     if toggle == false then
         
         Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
            Character.Humanoid.HipHeight = 0
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                
                
                
                att2.Position = Vector3.new(x,y,z)
           toggle = true
 else
           
            
            Character.Humanoid.HipHeight = 1.8
            
            wait(0.2)
            
            
            Character.Humanoid.Sit = true
            
            Character.Torso.Anchored = true
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,1)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,1)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,-0.5,-0.5)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,-0.5,-0.5)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-1)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-1)
            
            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,0,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,0,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(0,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(0,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                
                
           
 
	    

                
            att2.Position = Vector3.new(0,-5,-1)
            toggle = false
        end
    end
end)


game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "e" then
     if tog == true then
         
         Character.Humanoid.HipHeight = 0
         
         Character.Humanoid.WalkSpeed = 5
         
         Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
         att2.Position = Vector3.new(0,0.6,-3.3)
         
         tog = false
         

    

           Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,0.5,-2)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,0.5,-6)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-3)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-3)

		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,20,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-40,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                
            wait(.06)
            
            att2.Position = Vector3.new(0.3,0.6,-3.3)
            
                
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,0.5,-2)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
            
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,15,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-40,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
            
            wait(.08)
            
            att2.Position = Vector3.new(-0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,0.5,-2)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
            
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,15,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,20,0)
            
             wait(.08)
             
             att2.Position = Vector3.new(0.5,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,0.5,-2)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,40,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-15,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
                
            wait(.08)
            
            att2.Position = Vector3.new(-0.3,0.6,-3.3)
            
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,0.5,-2)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,20,0)
            

             wait(.08)
             
             att2.Position = Vector3.new(0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,0.5,-2)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                                        Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
            
         
            wait(.07)
            
            att2.Position = Vector3.new(-0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,0.5,-2)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,20,0)
            
             wait(.07)
             
             att2.Position = Vector3.new(0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,0.5,-2)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                                        Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
            
            wait(.07)
            
            att2.Position = Vector3.new(-0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,0.5,-2)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,20,0)
            
             wait(.07)
             
             att2.Position = Vector3.new(0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,0.5,-2)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                                        Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
            
            wait(.07)
            
            att2.Position = Vector3.new(-0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,0.5,-1.5)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,20,0)
            
             wait(.07)
             
             att2.Position = Vector3.new(0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,0.5,-2)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                                        Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
            
            wait(.07)
            
            att2.Position = Vector3.new(-0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,0.5,-2)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,20,0)
            
             wait(.07)
             
             att2.Position = Vector3.new(0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,0.5,-2)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                                        Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
            
            wait(.07)
            
            att2.Position = Vector3.new(-0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,0.5,-2)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
                            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                            
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,20,0)
            
             wait(.06)
             
             att2.Position = Vector3.new(0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,0.5,-2)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                                        Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
            
            wait(.06)
            
            att2.Position = Vector3.new(-0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,0.5,-2)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                
             wait(.06)
             
             att2.Position = Vector3.new(0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,0.5,-2)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                                        Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
            
            wait(.06)
            
            att2.Position = Vector3.new(-0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,0.5,-2)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5) 
            
                            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,20,0)
            
            wait(.06)
            
            att2.Position = Vector3.new(0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1,0.5,-2)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)
            
                                        Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,-20,0)
            
            wait(.06)
            
            att2.Position = Vector3.new(-0.3,0.6,-3.3)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1,0.5,-2)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.8,0.5,-8)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2.5)    
            
                            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,30,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-30,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(110,20,0)
                
                wait(0.1)
               
               att2.Position = Vector3.new(0.3,0.6,-2.5)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-2.7)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-2.5)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,0,-2.5)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,0,-2.5)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-2)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-2)    
            
                            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,5,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(65,-2,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(130,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(130,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,5,0)
                
                wait(0.3)
                
                               att2.Position = Vector3.new(0,3.6,-3.5)
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,3,-3.6)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,3,-3.5)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,3,-3.5)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,3.7,-4.6)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,1,-3.5)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,1,-3.5)    
            
                            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,5,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(70,0,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(-55,-2,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,5,0)
                
                
               wait(1)
            
            
         wait()
           
             
          Character.Humanoid.Sit = false
         
         Player.Character.Humanoid.WalkSpeed = 16
         
         Character.Torso.Anchored = false
         
         att2.Position = Vector3.new(x,y,z)
         
            Character.Humanoid.HipHeight = 0
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                
                
            wait(1)
            tog = true
                
        end
    end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "f" then
     if tog == true then
         
         Character.Humanoid.WalkSpeed = 4
         
         Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
        toggle = false
                
                att2.Position = Vector3.new(x,y,z)
                
           
             Character.Humanoid.HipHeight = 0
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
                wait(0.1)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                
                wait()
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                
                 Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2.5,2.5)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)
           
           wait(1)
           
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2.5,-50)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)
            
            wait(0.1)
 
	    
	    
	    Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)
            
            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)


                 Character:SetPrimaryPartCFrame(Character:GetPrimaryPartCFrame()*CFrame.new(0, 0, -50))
                 
                 Character.Humanoid.WalkSpeed = 16
         
                 
            att2.Position = Vector3.new(x,y,z)
            wait(1)
            tog = true
        end
    end
end)




game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "h" then
     if toggle == false then
         
         Character.Humanoid.WalkSpeed = 16
         
         Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
            Character.Humanoid.HipHeight = 0
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                
                
                
                att2.Position = Vector3.new(x,y,z)
           toggle = true
 else
     
      Character.Humanoid.WalkSpeed = 30
            Character.Humanoid.HipHeight = 0
          Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,1.5)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,1.5)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.5,-2.2,5.4)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.5,-2.2,5.4)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-1.5,3.2)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-1.5,3.2)
            
            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(-50,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(-10,0,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(-10,0,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(-30,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(-30,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(-50,0,0)
                
                
           
 
	    

                
            att2.Position = Vector3.new(0,-20,1)
            toggle = false
        end
    end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "g" then
     if toggle == false then
         
         Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
            Character.Humanoid.HipHeight = 0
             Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)


		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                
                
                
                att2.Position = Vector3.new(x,y,z)
           toggle = true
 else
           
            
            Character.Humanoid.HipHeight = 0
            
            wait(0.2)
            
            
            Character.Humanoid.Sit = false
            
            Character.Torso.Anchored = false
            
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(0,2,0)
            Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0,4,0)
            Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(0,6,0)
            Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0,8,0)
            Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(0,10,0)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0,12,0)
            
            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                
                
           
 
	    

                
            att2.Position = Vector3.new(0,12.8,0)
            toggle = false
        end
    end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "b" then
     if toggle == false then
         
         Character.Humanoid.WalkSpeed = 16
         
         Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
            Character.Humanoid.HipHeight = 0
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

		      Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
            Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
            Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
            Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
            Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
            Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
           
                
                
                
                att2.Position = Vector3.new(x,y,z)
           toggle = true
 else
            Character.Humanoid.HipHeight = 0
            Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-0.4,2.3,2.6)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(0.5,2.3,2.5)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,0,3)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,0,2.7)
            
            
           
            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,90,20)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,80,-20)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,-10,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,0)
	    

                
            att2.Position = Vector3.new(0,2.8,3)
            toggle = false
        end
    end
end)


game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "r" then
     if toggle == false then
         Character.Humanoid.WalkSpeed = 0
          
          Character.Humanoid.HipHeight = 2.5
          
          att2.Position = Vector3.new(0,0.5,1)
          
Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-1.5,-5,0)
Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(1.5,-5,-1.5)
Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,-2,0)
Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,-2,-1)
Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-1.5,-3.5,0)
Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(1.5,-3.5,-1)
          
Hats.torso1.Handle.Attachment.Rotation = Vector3.new(0,0,0)
Hats.torso2.Handle.Attachment.Rotation = Vector3.new(40,0,0)
Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(65,0,0)
Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(160,0,0)
Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(140,0,0)
Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(0,0,0)

wait(.1)



Hats.torso1.Handle.Attachment.Rotation = Vector3.new(0,0,0)
Hats.torso2.Handle.Attachment.Rotation = Vector3.new(40,0,0)
Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(65,0,0)
Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(160,0,-0.5)
Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(140,0,0)
Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(0,0,0)

wait(.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector*100
Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-1.5,-5,-1.5)
Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(1.5,-5,0)
Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,-2,-1)
Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,-2,0)
Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-1.5,-3.5,-1)
Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(1.5,-3.5,0)
wait()
         
         
          Character.Humanoid.WalkSpeed = 0
          
          Character.Humanoid.HipHeight = 2.5
    

toggle = true

else

          
          att2.Position = Vector3.new(0,0.5,1)
          
 Character.Humanoid.WalkSpeed = 0
          
          Character.Humanoid.HipHeight = 2.5
    
wait()
att2.Position = Vector3.new(0,0.5,1)
Hats.torso1.Handle.Attachment.Rotation = Vector3.new(0,0,0)
Hats.torso2.Handle.Attachment.Rotation = Vector3.new(65,0,0)
Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(40,0,0)
Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(140,0,0)
Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(160,0,0)
Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(0,0,0)




Hats.torso1.Handle.Attachment.Rotation = Vector3.new(0,0,0)
Hats.torso2.Handle.Attachment.Rotation = Vector3.new(65,0,0)
Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(40,0,0)
Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(140,0,0)
Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(160,0,-0.5)
Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(0,0,0)


wait(.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector*100
Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-1.5,-5,0)
Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(1.5,-5,-1.5)
Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,-2,0)
Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,-2,-1)
Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-1.5,-3.5,0)
Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(1.5,-3.5,-1)
            toggle = false
        end
    end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "j" then
     if tog == true then
         
         toggle = false
         
         Character.Humanoid.HipHeight = 0
         
         att2.Position = Vector3.new(-5,0.5,0)
         
          Character.Humanoid.WalkSpeed = 16
          
           Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
         Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.5,0,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.5,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.5,0,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.5,-2,0)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.5,-2,0)

            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                
            wait(0.1)
            
            att2.Position = Vector3.new(-5,0.5,0)
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.4,0.1,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.5,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.5,0,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.5,-2,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.5,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,15)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,1.5)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,1)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                  att2.Position = Vector3.new(-4.7,0.5,0)
                  
                 wait(0.05)
                 
                 att2.Position = Vector3.new(-5,0.5,0)
                 
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.4,0.1,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.5,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.6,0.2,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.5,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.5,-2,0)
                    
                    
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,3)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,30)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,2.5)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,2)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                
                wait(0.03)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.4,0.1,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.5,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.7,0.4,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.5,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.5,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,1)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,45)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,3)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,2)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                
                wait(0.03)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.4,0.1,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.5,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.7,0.5,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.5,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.5,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-2)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,60)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,3.5)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,3)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                
                wait (0.02)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.4,0.1,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.5,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.7,0.6,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.5,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.5,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-4)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,75)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,5)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,4)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                
                wait(0.02)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.35,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.5,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.7,0.7,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.5,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.5,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,6.5)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-5)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,90)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,5)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,4)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,6.5)
                
                wait(0.02)
                
                att2.Position = Vector3.new(-5,0.5,0)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.35,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.5,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.7,1,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.55,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.55,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,6.5)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-6)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,110)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,5)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,4)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,6.5)
                
                wait(0.02)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.35,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.5,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.5,1.4,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.6,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.6,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,6.5)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-4)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,130)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,6)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,7)
                
                wait(0.02)
            
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.35,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.4,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.4,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.4,1.6,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.6,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.6,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,6.5)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-4)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,160)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,6)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,6.5)
                
                wait(0.02)
                
                att2.Position = Vector3.new(-4.8,0.5,0)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.3,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.3,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.2,1.8,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.55,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.55,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,7)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-6)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,200)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,6)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,7)
                
                wait(0.2)
                
                att2.Position = Vector3.new(-5,0.5,0)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.4,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.4,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.5,1.4,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.65,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.65,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-3)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,130)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,6)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                
                                wait(0.2)
                                
                                att2.Position = Vector3.new(-4.8,0.5,0)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.3,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.3,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.2,1.8,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.55,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.55,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,8)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-6)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,200)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,6)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,7)
                
                                wait(0.2)
                                
                                att2.Position = Vector3.new(-5,0.5,0)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.4,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.4,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.5,1.4,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.65,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.65,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-3)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,130)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,6)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                                                wait(0.2)
                                                
                                                att2.Position = Vector3.new(-4.8,0.5,0)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.3,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.3,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.2,1.8,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.55,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.55,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,7)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-6)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,200)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,6)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,7)
                
                                wait(0.2)
                                
                                att2.Position = Vector3.new(-5,0.5,0)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.4,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.4,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.5,1.4,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.65,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.65,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-3)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,130)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,6)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                                                wait(0.2)
                                                
                                                att2.Position = Vector3.new(-4.8,0.5,0)
                
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.3,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.3,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.2,1.8,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.55,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.55,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-6)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,200)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,6)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                
                                wait(0.2)
                att2.Position = Vector3.new(-5,0.5,0)
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.4,0.15,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.4,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.5,1.4,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.65,-1.9,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.65,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,-3)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,130)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,6)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,6)
                
                        wait(0.1)
                        
                        Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-5.4,0.1,0)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-4.5,0,0)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,0,0)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-6.5,0,0)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-5.5,-2,0)
                Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-4.5,-2,0)
                
                Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(95,0,1.5)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(90,0,1)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,5)
                  att2.Position = Vector3.new(-4.7,0.5,0)
                  
                  wait(0.5)
                  
                Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                att2.Position = Vector3.new(x,y,z)
                wait(1)
            tog = true
        end
    end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "t" then
     if tog == true then
         
         tog = false
         
         Character.Humanoid.HipHeight = 0
         
         att2.Position = Vector3.new(0,0.5,-6)
         
          Character.Humanoid.WalkSpeed = 0
          
           Character.Humanoid.Sit = false
         
         Character.Torso.Anchored = false
         
         Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-0.5,0,-6)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(0.5,0,-6)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-1.5,0.5,-6.5)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(1.5,0.5,-6.5)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-0.5,-2,-6)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(0.5,-2,-6)
            
            Hats.torso1.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(0,10,10)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(0,-10,-10)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(100,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(80,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(90,0,0)
                
                                         for index, part in pairs(workspace:GetDescendants()) do
    if part:IsA("Part") and part.Anchored == false and part:IsDescendantOf(Player.Character) == false then
        table.insert(unanchoredparts, part)
        part.Massless = true
        part.CanCollide = false
        part.Transparency = 0
        if part:FindFirstChildOfClass("BodyPosition") ~= nil then
            part:FindFirstChildOfClass("BodyPosition"):Destroy()
        end
    end
end
for index, part in pairs(unanchoredparts) do
    local mover = Instance.new("BodyPosition", part)
    table.insert(movers, mover)
    mover.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    local temp1 = Instance.new("BodyThrust", part)
    temp1.Location = Vector3.new(10,-3,-8)
    temp1.Force = Vector3.new(0,0,4000)

end
    for index, mover in pairs(movers) do
        mover.Position = Player.Character:FindFirstChild("HumanoidRootPart").CFrame:PointToWorldSpace(Vector3.new(0, 0, -10))
    end
               wait(4)
               
               Character.Humanoid.WalkSpeed = 16
               
               Character:WaitForChild("Torso").Attachment.Position = Vector3.new(-2.5,2,3)
                Character:WaitForChild("Torso").Attachment1.Position = Vector3.new(-1.5,2,3)
                Character:WaitForChild("Torso").Attachment2.Position = Vector3.new(-3.5,2,3)
                Character:WaitForChild("Torso").Attachment3.Position = Vector3.new(-0.7,2,2.7)
                Character:WaitForChild("Torso").Attachment4.Position = Vector3.new(-2.5,0.2,2.7)
            Character:WaitForChild("Torso").Attachment5.Position = Vector3.new(-1.5,0,3)

		       Hats.torso1.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                Hats.torso2.Handle.Attachment.Rotation = Vector3.new(90,10,0)
                Hats.rightarm.Handle.Attachment.Rotation = Vector3.new(80,-20,25)
                Hats.leftarm.Handle.Attachment.Rotation = Vector3.new(110,0,0)
                Hats.rightleg.Handle.Attachment.Rotation = Vector3.new(95,0,0)
                Hats.leftleg.Handle.Attachment.Rotation = Vector3.new(85,0,0)
                att2.Position = Vector3.new(x,y,z)
                
                wait(1)
   
            tog = true
        end
    end
end)

while true do
    Hats.CanCollide = true
    wait(0.5)
    end
