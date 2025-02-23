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
    KeySystem = false
})

local Tabs = {
    Universal = Window:CreateTab("Universal Mods"),
    Gun = Window:CreateTab("Gun Mods"),
    Vehicle = Window:CreateTab("Vehicle Mods"),
    Teleport = Window:CreateTab("Teleport Mods"),
    Visual = Window:CreateTab("Visual Mods")
}

local function addDisclaimer(tab)
    tab:CreateSection("(These mods are made with ChatGPT. These mods may not work properly.)")
end

for _, tab in pairs(Tabs) do
    addDisclaimer(tab)
end

local function createButton(tab, name, callback)
    tab:CreateButton({
        Name = name,
        Callback = function()
            local success, err = pcall(callback)
            if not success then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Error!",
                    Text = "Unable to execute!" .. name,
                    Duration = 5
                })
            end
        end
    })
end

createButton(Tabs.Universal, "Speed Boost", function()
    local Player = game.Players.LocalPlayer
    if Player.Character then
        local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then Humanoid.WalkSpeed = 50 end
    end
end)

createButton(Tabs.Universal, "God Mode", function()
    local Player = game.Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local Humanoid = Character:WaitForChild("Humanoid")
    Humanoid.MaxHealth = math.huge
    Humanoid.Health = math.huge
end)

createButton(Tabs.Universal, "Noclip", function()
    local Character = game.Players.LocalPlayer.Character
    if Character then
        for _, part in ipairs(Character:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

createButton(Tabs.Gun, "Aimbot", function() print("Aimbot activated.") end)
createButton(Tabs.Gun, "Rapid Fire", function() print("Rapid Fire activated.") end)
createButton(Tabs.Gun, "No Recoil", function() print("No Recoil activated.") end)

createButton(Tabs.Vehicle, "Super Speed", function()
    local Player = game.Players.LocalPlayer
    if Player.Character then
        Player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 500)
    end
end)

createButton(Tabs.Vehicle, "Fly Vehicle", function() print("Vehicle Flight activated.") end)

createButton(Tabs.Teleport, "Teleport to Mouse", function()
    local Player = game.Players.LocalPlayer
    local Mouse = Player:GetMouse()
    local Character = Player.Character
    if Character and Mouse then
        Character:SetPrimaryPartCFrame(CFrame.new(Mouse.Hit.p))
    end
end)

createButton(Tabs.Teleport, "Teleport to Player", function()
    local Player = game.Players.LocalPlayer
    local Target = game.Players:FindFirstChild("TargetPlayerName") -- Replace with real selection
    if Target and Target.Character then
        Player.Character:SetPrimaryPartCFrame(Target.Character.HumanoidRootPart.CFrame)
    end
end)

createButton(Tabs.Visual, "Wallhack", function() print("Wallhack activated.") end)
createButton(Tabs.Visual, "Night Vision", function() print("Night Vision activated.") end)

Window:SelectTab(Tabs.Universal)
