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
    Icon: app-window
    LoadingTitle = "Menu has been loaded successfully!",
    LoadingSubtitle = "Menu made by @theystem.",
    Theme = "AmberGlow",
    ConfigurationSaving = {Enabled = true, FolderName = "theystem's Menu Configuration Saving", FileName = "theystem's Menu"}
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
    Utility = Window:CreateTab("Utility Mods"),
    Scripts = Window:CreateTab("Scripts (more scripts coming soon!)"),
    Cameras = Window:CreateTab("Cameras")
}

Tabs.Universal:CreateSection("(These mods are made with ChatGPT. These mods may not work properly.)")

local toggles = {
    SpeedBoost = false,
    Noclip = false,
    FreezeCamera = false
}

Tabs.Universal:CreateToggle({
    Name = "Speed Boost",
    CurrentValue = toggles.SpeedBoost,
    Callback = function(value)
        toggles.SpeedBoost = value
        local Player = game.Players.LocalPlayer
        if Player.Character then
            local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
            if Humanoid then
                if value then
                    Humanoid.WalkSpeed = 50
                    Humanoid.JumpHeight = 50
                else
                    Humanoid.WalkSpeed = 16
                    Humanoid.JumpHeight = 7
                end
                Rayfield:Notify({
                    Title = "Speed Boost " .. (value and "Enabled" or "Disabled"),
                    Content = "Your speed boost is now " .. (value and "active." or "inactive."),
                    Duration = 3,
                    Image = value and "check" or "x"
                })
            end
        end
    end
})

Tabs.Universal:CreateToggle({
    Name = "Noclip",
    CurrentValue = toggles.Noclip,
    Callback = function(value)
        toggles.Noclip = value
        local Character = game.Players.LocalPlayer.Character
        if Character then
            for _, part in ipairs(Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = not value
                end
            end
        end
        Rayfield:Notify({
            Title = "Noclip " .. (value and "Enabled" or "Disabled"),
            Content = "You can " .. (value and "now pass through walls." or "no longer pass through walls."),
            Duration = 3,
            Image = value and "check" or "x"
        })
    end
})

game:GetService("RunService").Heartbeat:Connect(function()
    if toggles.Noclip then
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

Tabs.Gun:CreateButton({ Name = "Aimbot (Enemies Only)", Callback = function() print("Aimbot activated.") end })
Tabs.Gun:CreateButton({ Name = "Rapid Fire", Callback = function() print("Rapid Fire activated.") end })
Tabs.Gun:CreateButton({ Name = "No Recoil", Callback = function() print("No Recoil activated.") end })

Tabs.Vehicle:CreateButton({ Name = "Super Speed", Callback = function() print("Super Speed activated.") end })
Tabs.Vehicle:CreateButton({ Name = "Fly Vehicle", Callback = function() print("Vehicle Flight activated.") end })

Tabs.Visual:CreateButton({ Name = "Wallhack", Callback = function() print("Wallhack activated.") end })

Tabs.ESP:CreateButton({ Name = "Box ESP", Callback = function() print("Box ESP activated.") end })
Tabs.ESP:CreateButton({ Name = "Name ESP", Callback = function() print("Name ESP activated.") end })

Tabs.Lights:CreateButton({ Name = "Brighten Area", Callback = function() print("Brighten Area activated.") end })
Tabs.Lights:CreateButton({ Name = "Disable Shadows", Callback = function() print("Disable Shadows activated.") end })
Tabs.Lights:CreateButton({ Name = "Custom Light Color", Callback = function() print("Custom Light Color activated.") end })

Tabs.Movement:CreateButton({ Name = "Super Jump", Callback = function() print("Super Jump activated.") end })
Tabs.Movement:CreateButton({ Name = "Teleport", Callback = function() print("Teleport activated.") end })

Tabs.Combat:CreateButton({ Name = "Instant Kill", Callback = function() print("Instant Kill activated.") end })

Tabs.Utility:CreateButton({ Name = "Auto Collect Items", Callback = function() print("Auto collect items activated.") end })
Tabs.Utility:CreateButton({ Name = "Auto Heal", Callback = function() print("Auto Heal activated.") end })

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

Tabs.Cameras:CreateToggle({
    Name = "Freeze Camera (a little bit broken)",
    CurrentValue = toggles.FreezeCamera,
    Callback = function(value)
        toggles.FreezeCamera = value
        local camera = game.Workspace.CurrentCamera
        local Player = game.Players.LocalPlayer
        if value then
            local frozenCFrame = camera.CFrame
            game:GetService("RunService").RenderStepped:Connect(function()
                if toggles.FreezeCamera then
                    camera.CFrame = frozenCFrame
                end
            end)
            frozenCFrame = camera.CFrame
        else
        end

        if value then
            local character = Player.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.CameraOffset = Vector3.new(0, 0, 0)
                end
            end
        else
            local character = Player.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.CameraOffset = Vector3.new(0, 0, 0)
                end
            end
        end
        
        Rayfield:Notify({
            Title = "Freeze Camera " .. (value and "Enabled" or "Disabled"),
            Content = "Your camera is now " .. (value and "frozen." or "unfrozen."),
            Duration = 3,
            Image = value and "check" or "x"
        })
    end
})

Window:SelectTab(Tabs.Universal)
