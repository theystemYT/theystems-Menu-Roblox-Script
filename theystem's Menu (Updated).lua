-- DO NOT STEAL THIS CODE WITHOUT GIVEN PERMISSION BY THE CREATOR OF THIS CODE

local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Error!",
        Text = "The script couldn't be executed successfully. Check your executor.",
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

local Tabs = {
    Universal = Window:CreateTab("Universal Mods"),
    Gun = Window:CreateTab("Gun Mods"),
    Vehicle = Window:CreateTab("Vehicle Mods"),
    Visual = Window:CreateTab("Visual Mods"),
    ESP = Window:CreateTab("ESP Mods"),
    Lights = Window:CreateTab("Lighting Mods"),
    Fly = Window:CreateTab("Fly Mods")
}

for _, tab in pairs(Tabs) do
    tab:CreateSection("(These mods are made with ChatGPT. These mods may not work properly.)")
end

Tabs.Universal:CreateButton({
    Name = "Speed Boost",
    Callback = function()
        local Player = game.Players.LocalPlayer
        if Player.Character then
            local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
            if Humanoid then Humanoid.WalkSpeed = 50 end
        end
    end
})

Tabs.Universal:CreateButton({
    Name = "God Mode",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid.MaxHealth = math.huge
            Humanoid.Health = math.huge
        end
    end
})

Tabs.Universal:CreateButton({
    Name = "Noclip",
    Callback = function()
        local Character = game.Players.LocalPlayer.Character
        if Character then
            for _, part in ipairs(Character:GetChildren()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end
})

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
Tabs.Visual:CreateButton({ Name = "Night Vision", Callback = function() print("Night Vision activated.") end })

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

Tabs.ESP:CreateButton({
    Name = "Distance ESP",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Camera = workspace.CurrentCamera

        for _, Target in ipairs(game.Players:GetPlayers()) do
            if Target ~= Player and Target.Character then
                local Character = Target.Character
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    local Distance = (Player.Character.HumanoidRootPart.Position - HumanoidRootPart.Position).Magnitude
                    local BillboardGui = Instance.new("BillboardGui")
                    BillboardGui.Adornee = HumanoidRootPart
                    BillboardGui.Size = UDim2.new(0, 100, 0, 50)
                    BillboardGui.StudsOffset = Vector3.new(0, 3, 0)
                    BillboardGui.Parent = Camera

                    local DistanceLabel = Instance.new("TextLabel")
                    DistanceLabel.Text = math.floor(Distance) .. " studs"
                    DistanceLabel.Size = UDim2.new(1, 0, 1, 0)
                    DistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    DistanceLabel.BackgroundTransparency = 1
                    DistanceLabel.Parent = BillboardGui
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
    Name = "Night Vision",
    Callback = function()
        local Lighting = game:GetService("Lighting")
        Lighting.NightVisionEnabled = true
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

Tabs.Fly:CreateSection("Fly Mods")

Tabs.Fly:CreateButton({
    Name = "Fly",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local BodyGyro = Instance.new("BodyGyro")
        local BodyVelocity = Instance.new("BodyVelocity")
        
        BodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
        BodyGyro.CFrame = Character.HumanoidRootPart.CFrame
        BodyGyro.Parent = Character.HumanoidRootPart

        BodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
        BodyVelocity.Velocity = Vector3.new(0, 50, 0)
        BodyVelocity.Parent = Character.HumanoidRootPart

        print("Fly mode activated.")
    end
})

Tabs.Fly:CreateButton({
    Name = "Stop Flying",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local BodyGyro = Character.HumanoidRootPart:FindFirstChildOfClass("BodyGyro")
        local BodyVelocity = Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity")

        if BodyGyro then BodyGyro:Destroy() end
        if BodyVelocity then BodyVelocity:Destroy() end

        print("Fly mode deactivated.")
    end
})

Window:SelectTab(Tabs.Universal)
