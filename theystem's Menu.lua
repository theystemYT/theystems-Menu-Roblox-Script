-- DO NOT STEAL THIS CODE WITHOUT PERMISSION BY THE CREATOR.
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
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
    KeySystem = false
})

Rayfield:Notify({
    Title = "Thank you!",
    Content = "Thank you for choosing theystem's Menu.",
    Duration = 3,
    Image = "4370033185"
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
                    Rayfield:Notify({
                        Title = "Speed Boost Enabled",
                        Content = "Your speed boost is now active.",
                        Duration = 3,
                        Image = "check"
                    })
                else
                    Humanoid.WalkSpeed = 16
                    Humanoid.JumpHeight = 7
                    Rayfield:Notify({
                        Title = "Speed Boost Disabled",
                        Content = "Your speed boost is now inactive.",
                        Duration = 3,
                        Image = "x"
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
                Rayfield:Notify({
                    Title = "Noclip Enabled",
                    Content = "You can now pass through walls.",
                    Duration = 3,
                    Image = "check"
                })
            else
                for _, part in ipairs(Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
                Rayfield:Notify({
                    Title = "Noclip Disabled",
                    Content = "You can no longer pass through walls.",
                    Duration = 3,
                    Image = "x"
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
                Rayfield:Notify({
                    Title = "Invincibility Enabled",
                    Content = "You are now invincible.",
                    Duration = 3,
                    Image = "check"
                })
            else
                Rayfield:Notify({
                    Title = "Invincibility Disabled",
                    Content = "You are no longer invincible.",
                    Duration = 3,
                    Image = "x"
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

Tabs.Gun:CreateButton({
    Name = "Aimbot (Enemies Only)",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Camera = workspace.CurrentCamera
        local Mouse = Player:GetMouse()
        local ClosestEnemy = nil
        local ClosestDist = math.huge

        for _, Target in ipairs(game.Players:GetPlayers()) do
            if Target ~= Player and Target.Team ~= Player.Team then
                local Character = Target.Character
                if Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                    local ScreenPoint, OnScreen = Camera:WorldToViewportPoint(Character.HumanoidRootPart.Position)
                    if OnScreen then
                        local Distance = (Vector2.new(ScreenPoint.X, ScreenPoint.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                        if Distance < ClosestDist then
                            ClosestDist = Distance
                            ClosestEnemy = Character
                        end
                    end
                end
            end
        end

        if ClosestEnemy then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, ClosestEnemy.HumanoidRootPart.Position)
            print("Aimbot locked onto an enemy.")
        else
            print("No enemies found.")
        end
    end
})

Tabs.Gun:CreateButton({ Name = "Rapid Fire", Callback = function() print("Rapid Fire activated.") end })
Tabs.Gun:CreateButton({ Name = "No Recoil", Callback = function() print("No Recoil activated.") end })

Tabs.Vehicle:CreateButton({
    Name = "Super Speed",
    Callback = function()
        local Player = game.Players.LocalPlayer
        if Player.Character then
            Player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 500)
        end
    end
})

Tabs.Vehicle:CreateButton({ Name = "Fly Vehicle", Callback = function() print("Vehicle Flight activated.") end })

Tabs.Visual:CreateButton({ Name = "Wallhack", Callback = function() print("Wallhack activated.") end })

Tabs.ESP:CreateSection("ESP Mods")

Tabs.ESP:CreateButton({
    Name = "Box ESP",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Camera = workspace.CurrentCamera

        for _, Target in ipairs(game.Players:GetPlayers()) do
            if Target ~= Player and Target.Character then
                local Character = Target.Character
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    local Box = Instance.new("BoxHandleAdornment")
                    Box.Adornee = HumanoidRootPart
                    Box.Size = Vector3.new(4, 6, 4)
                    Box.Transparency = 0.5
                    Box.Color3 = Color3.fromRGB(255, 0, 0)
                    Box.Parent = Camera
                end
            end
        end
    end
})

Tabs.ESP:CreateButton({
    Name = "Name ESP",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Camera = workspace.CurrentCamera

        for _, Target in ipairs(game.Players:GetPlayers()) do
            if Target ~= Player and Target.Character then
                local Character = Target.Character
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    local BillboardGui = Instance.new("BillboardGui")
                    BillboardGui.Adornee = HumanoidRootPart
                    BillboardGui.Size = UDim2.new(0, 100, 0, 50)
                    BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                    BillboardGui.Parent = Camera

                    local NameLabel = Instance.new("TextLabel")
                    NameLabel.Text = Target.Name
                    NameLabel.Size = UDim2.new(1, 0, 1, 0)
                    NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    NameLabel.BackgroundTransparency = 1
                    NameLabel.Parent = BillboardGui
                end
            end
        end
    end
})

Tabs.Lights:CreateSection("Lighting Mods")

Tabs.Lights:CreateButton({
    Name = "Brighten Area",
    Callback = function()
        local Lighting = game:GetService("Lighting")
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    end
})

Tabs.Lights:CreateButton({
    Name = "Disable Shadows",
    Callback = function()
        local Lighting = game:GetService("Lighting")
        Lighting.ShadowSoftness = 0
    end
})

Tabs.Lights:CreateButton({
    Name = "Custom Light Color",
    Callback = function()
        local Lighting = game:GetService("Lighting")
        Lighting.Ambient = Color3.fromRGB(200, 200, 255)
    end
})

Tabs.Movement:CreateButton({
    Name = "Super Jump",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.JumpHeight = 100
        end
    end
})

Tabs.Movement:CreateButton({
    Name = "Teleport",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Mouse = Player:GetMouse()
        local Character = Player.Character or Player.CharacterAdded:Wait()
        if Character then
            Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.p)
        end
    end
})

Tabs.Combat:CreateButton({
    Name = "Instant Kill",
    Callback = function()
        for _, Target in ipairs(game.Players:GetPlayers()) do
            if Target.Team ~= game.Players.LocalPlayer.Team and Target.Character then
                local Humanoid = Target.Character:FindFirstChildOfClass("Humanoid")
                if Humanoid then
                    Humanoid.Health = 0
                end
            end
        end
    end
})

Tabs.Utility:CreateButton({
    Name = "Auto Collect Items",
    Callback = function()
        print("Auto collect items activated.")
    end
})

Tabs.Utility:CreateButton({
    Name = "Auto Heal",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.Health = Humanoid.MaxHealth
        end
    end
})

Tabs.Scripts = Window:CreateTab("Scripts (more scripts coming soon!)")

Tabs.Scripts:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        local success, InfiniteYieldScript = pcall(function()
            return loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)

        if not success then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Error!",
                Text = "The Infinite Yield script couldn't be executed successfully.",
                Duration = 5
            })
        end
    end
})

Window:SelectTab(Tabs.UniversalMods)
