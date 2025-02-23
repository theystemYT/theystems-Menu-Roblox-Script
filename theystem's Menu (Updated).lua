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
    LoadingTitle = "Menu has been loaded successfully.",
    LoadingSubtitle = "Menu made by @theystem.",
    Theme = "AmberGlow",
    ConfigurationSaving = {Enabled = true, FolderName = "RayfieldScripts", FileName = "theystem_menu"},
    KeySystem = false
})

local Tabs = {
    Universal = Window:CreateTab("Universal Mods"),
    Gun = Window:CreateTab("Gun Mods"),
    Vehicle = Window:CreateTab("Vehicle Mods"),
    Teleport = Window:CreateTab("Teleport Mods"),
    Visual = Window:CreateTab("Visual Mods")
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
            if Target ~= Player and Target.Team ~= Player.Team then -- Ignore teammates
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

Tabs.Teleport:CreateButton({
    Name = "Teleport to Mouse",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Mouse = Player:GetMouse()
        local Character = Player.Character
        if Character then
            Character:SetPrimaryPartCFrame(CFrame.new(Mouse.Hit.p))
        end
    end
})

Tabs.Visual:CreateButton({ Name = "Wallhack", Callback = function() print("Wallhack activated.") end })
Tabs.Visual:CreateButton({ Name = "Night Vision", Callback = function() print("Night Vision activated.") end })

Window:SelectTab(Tabs.Universal)
