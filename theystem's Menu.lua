-- DO NOT STEAL THIS CODE UNLESS GIVEN PERMISSION BY THE CREATOR OF THIS CODE

local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Error!";
        Text = "The script couldn't be executed successfully. Please check your executor if it is able to run Rayfield scripts.";
        Duration = 5;
    })
    return
end

local Window = Rayfield:CreateWindow({
    Name = "theystem's Menu",
    LoadingTitle = "Script has been executed successfully!",
    LoadingSubtitle = "Script made by @theystem.",
    Theme = "AmberGlow",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Big Hub"
    },
    KeySystem = false
})

local UniversalTab = Window:CreateTab("Universal Mods (more mods are coming soon!)", 4483362458)
local Section = UniversalTab:CreateSection("(Mods are made with ChatGPT. Some mods may not work properly.)")

local function createButton(tab, name, callback)
    tab:CreateButton({
        Name = name,
        Callback = function()
            local success, err = pcall(callback)
            if not success then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Error!";
                    Text = "The script has failed to execute.";
                    Duration = 5;
                })
            end
        end
    })
end

createButton(UniversalTab, "Speed", function()
    local Player = game.Players.LocalPlayer
    if Player.Character then
        local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.WalkSpeed = 50
        end
    end
end)

createButton(UniversalTab, "Anti Knockback", function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local NetManaged = ReplicatedStorage:FindFirstChild("rbxts_include")
       and ReplicatedStorage.rbxts_include:FindFirstChild("node_modules")
       and ReplicatedStorage.rbxts_include.node_modules:FindFirstChild("@rbxts")
       and ReplicatedStorage.rbxts_include.node_modules["@rbxts"]:FindFirstChild("net")
       and ReplicatedStorage.rbxts_include.node_modules["@rbxts"].net:FindFirstChild("out")
       and ReplicatedStorage.rbxts_include.node_modules["@rbxts"].net.out:FindFirstChild("_NetManaged")

    if NetManaged then
        local AckKnockback = NetManaged:FindFirstChild("AckKnockback")
        if AckKnockback then
            AckKnockback:Destroy()
        end
    end
end)

createButton(UniversalTab, "God Mode", function()
    local Player = game.Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    Humanoid.Health = math.huge
end)

createButton(UniversalTab, "Jump Power", function()
    local Player = game.Players.LocalPlayer
    if Player.Character then
        local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.JumpHeight = 100
        end
    end
end)

createButton(UniversalTab, "Noclip", function()
    local Player = game.Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    local RootPart = Character:WaitForChild("HumanoidRootPart")
    
    local noclip = false

    local function toggleNoclip()
        noclip = not noclip
        while noclip do
            if Character and Character:FindFirstChild("HumanoidRootPart") then
                Character.HumanoidRootPart.CanCollide = false
            end
            wait(0.1)
        end
        if Character and Character:FindFirstChild("HumanoidRootPart") then
            Character.HumanoidRootPart.CanCollide = true
        end
    end

    toggleNoclip()
end)

task.wait(0.5)
Window:SelectTab(UniversalTab)
