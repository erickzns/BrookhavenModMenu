-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModMenuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Criar a bolinha para abrir/minimizar o menu
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 10, 0.5, -25)
toggleButton.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
toggleButton.Text = "O"
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 24
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Parent = screenGui

-- Criar Frame para o menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 400, 0, 600)
menuFrame.Position = UDim2.new(0.5, -200, 0.5, -300)
menuFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
menuFrame.BorderSizePixel = 0
menuFrame.BackgroundTransparency = 0.5
menuFrame.Visible = false -- Iniciar com o menu minimizado
menuFrame.Parent = screenGui

-- Função para abrir e fechar o menu
local isMenuOpen = false
toggleButton.MouseButton1Click:Connect(function()
    isMenuOpen = not isMenuOpen
    menuFrame.Visible = isMenuOpen
end)

-- Título do Menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
titleLabel.Text = "Menu de Mods"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 24
titleLabel.Parent = menuFrame

-- Criar aba principal
local mainTab = Instance.new("Frame")
mainTab.Size = UDim2.new(1, 0, 1, -50)
mainTab.Position = UDim2.new(0, 0, 0, 50)
mainTab.BackgroundTransparency = 1
mainTab.Visible = true
mainTab.Parent = menuFrame

-- Função para criar caixas de marcar de trapaça
local function createCheatCheckbox(name, position, parent, onChange)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 40)
    frame.Position = position
    frame.BackgroundTransparency = 1
    frame.Parent = parent

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 20
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local checkbox = Instance.new("TextButton")
    checkbox.Size = UDim2.new(0, 25, 0, 25)
    checkbox.Position = UDim2.new(1, -30, 0.5, -12.5)
    checkbox.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    checkbox.Text = ""
    checkbox.Parent = frame

    checkbox.MouseButton1Click:Connect(function()
        checkbox.BackgroundColor3 = checkbox.BackgroundColor3 == Color3.new(0.1, 0.1, 0.1) and Color3.new(0, 1, 0) or Color3.new(0.1, 0.1, 0.1)
        onChange(checkbox.BackgroundColor3 == Color3.new(0, 1, 0))
    end)
end

-- Adicionar caixas de marcar para diferentes funções
createCheatCheckbox("Aumentar Velocidade", UDim2.new(0, 10, 0.1, 0), mainTab, function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character.Humanoid.WalkSpeed = isEnabled and 100 or 16
end)

createCheatCheckbox("Pular Mais Alto", UDim2.new(0, 10, 0.2, 0), mainTab, function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character.Humanoid.JumpPower = isEnabled and 150 or 50
end)

createCheatCheckbox("Invisibilidade", UDim2.new(0, 10, 0.3, 0), mainTab, function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character.HumanoidRootPart.Transparency = isEnabled and 0.5 or 0
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = isEnabled and 0.5 or 0
        end
    end
end)

createCheatCheckbox("Cura Instantânea", UDim2.new(0, 10, 0.4, 0), mainTab, function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    if isEnabled then
        character.Humanoid.Health = character.Humanoid.MaxHealth
    end
end)

createCheatCheckbox("Voo", UDim2.new(0, 10, 0.5, 0), mainTab, function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    if isEnabled then
        character.Humanoid.PlatformStand = true
        local bodyGyro = Instance.new("BodyGyro")
        bodyGyro.P = 9e4
        bodyGyro.Parent = character.HumanoidRootPart
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(9e4, 9e4, 9e4)
        bodyVelocity.Parent = character.HumanoidRootPart
        character.HumanoidRootPart.BodyGyro = bodyGyro
        character.HumanoidRootPart.BodyVelocity = bodyVelocity
    else
        character.Humanoid.PlatformStand = false
        if character.HumanoidRootPart:FindFirstChild("BodyGyro") then
            character.HumanoidRootPart.BodyGyro:Destroy()
        end
        if character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            character.HumanoidRootPart.BodyVelocity:Destroy()
        end
    end
end)

createCheatCheckbox("Super Força", UDim2.new(0, 10, 0.6, 0), mainTab, function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    if isEnabled then
        character.Humanoid.Strength = 100
    else
        character.Humanoid.Strength = 10
    end
end)

createCheatCheckbox("Visão Noturna", UDim2.new(0, 10, 0.7, 0), mainTab, function(isEnabled)
    local player = game.Players.LocalPlayer
    local lighting = game.Lighting
    if isEnabled then
        lighting.Brightness = 2
        lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    else
        lighting.Brightness = 1
        lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
    end
end)

createCheatCheckbox("Teletransporte", UDim2.new(0, 10, 0.8, 0), mainTab, function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    if isEnabled then
        character:SetPrimaryPartCFrame(CFrame.new(0, 100, 0))
    end
end)

createCheatCheckbox("Noclip", UDim2.new(0, 10, 0.9, 0), mainTab, function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local noclipConnection
    if isEnabled then
        noc
