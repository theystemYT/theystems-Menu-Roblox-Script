-- DO NOT STEAL THIS CODE WITHOUT PERMISSION BY THE CREATOR.

local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Error!",
        Text = "The script couldn't be executed successfully. Check your executor to see if it is able to run Rayfield.",
        Duration = 5
    })
    return
end

local Window = Rayfield:CreateWindow({
    Name = "theystem's Menu (more mods coming soon!)",
    LoadingTitle = "Menu has been loaded successfully!",
    LoadingSubtitle = "Menu made by @theystem.",
    Theme = "AmberGlow",
    ConfigurationSaving = {Enabled = true, FolderName = "RayfieldScripts", FileName = "theystem_menu"},
    KeySystem = true,
    KeySettings = {
        Title = "Key System",
        Subtitle = "Please type in the key to access the menu.",
        Note = "theystem's Menu is the key.",
        Key = "theystem's Menu",
        Callback = function(success)
            if not success then
                Rayfield:Notify({
                    Title = "Access Denied",
                    Content = "Incorrect key. Please try again.",
                    Duration = 3
                })
            end
        end
    }
})

local Tabs = {
    Universal = Window:CreateTab("Universal Mods"),
    Gun = Window:CreateTab("Gun Mods"),
    Vehicle = Window:CreateTab("Vehicle Mods"),
    Visual = Window:CreateTab("Visual Mods"),
    ESP = Window:CreateTab("ESP Mods"),
    Lights = Window:CreateTab("Lighting Mods"),
    Movement = Window:CreateTab("Movement Mods"),
    Combat = Window:CreateTab("Combat Mods"),
    Utility = Window:CreateTab("Utility Mods")
}

Tabs.Universal:CreateSection("(These mods are made with ChatGPT. These mods may not work properly.)")

local noclipEnabled = false
local invincibilityEnabled = false
local speedBoostEnabled = false

Tabs.Universal:CreateButton({
    Name = "Toggle Speed Boost",
    Callback = function()
        local Player = game.Players.LocalPlayer
        if Player.Character then
            local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
            if Humanoid then
                speedBoostEnabled = not speedBoostEnabled
                if speedBoostEnabled then
                    Humanoid.WalkSpeed = 50
                    Humanoid.JumpHeight = 50
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Speed Boost Enabled",
                        Text = "Your speed boost is now active.",
                        Duration = 5
                    })
                else
                    Humanoid.WalkSpeed = 16
                    Humanoid.JumpHeight = 7
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Speed Boost Disabled",
                        Text = "Your speed boost is now inactive.",
                        Duration = 5
                    })
                end
            end
        end
    end
})

Tabs.Universal:CreateButton({
    Name = "Noclip",
    Callback = function()
        local Character = game.Players.LocalPlayer.Character
        if Character then
            noclipEnabled = not noclipEnabled
            if noclipEnabled then
                for _, part in ipairs(Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Noclip Enabled",
                    Text = "You can now pass through walls.",
                    Duration = 5
                })
            else
                for _, part in ipairs(Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Noclip Disabled",
                    Text = "You can no longer pass through walls.",
                    Duration = 5
                })
            end
        end
    end
})

Tabs.Universal:CreateButton({
    Name = "Invincibility",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            invincibilityEnabled = not invincibilityEnabled
            if invincibilityEnabled then
                Humanoid.HealthChanged:Connect(function()
                    if Humanoid.Health < Humanoid.MaxHealth then
                        Humanoid.Health = Humanoid.MaxHealth
                    end
                end)
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Invincibility Enabled",
                    Text = "You are now invincible.",
                    Duration = 5
                })
            else
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Invincibility Disabled",
                    Text = "You are no longer invincible.",
                    Duration = 5
                })
            end
        end
    end
})

game:GetService("RunService").Heartbeat:Connect(function()
    if noclipEnabled then
        local Character = game.Players.LocalPlayer.Character
        if Character then
            for _, part in ipairs(Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

Window:SelectTab(Tabs.Universal)
