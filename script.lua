-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Criar Frame para o menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 300, 0, 400)
menuFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
menuFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
menuFrame.BorderSizePixel = 0
menuFrame.BackgroundTransparency = 0.5
menuFrame.Parent = screenGui

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

-- Função para criar caixas de marcar de trapaça
local function createCheatCheckbox(name, position, onChange)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 50)
    frame.Position = position
    frame.BackgroundTransparency = 1
    frame.Parent = menuFrame

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

-- Caixa de marcar para Aumentar Velocidade
createCheatCheckbox("Aumentar Velocidade", UDim2.new(0, 10, 0.1, 0), function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character.Humanoid.WalkSpeed = isEnabled and 100 or 16 -- Ativa/desativa a trapaça de velocidade
end)

-- Caixa de marcar para Pular Mais Alto
createCheatCheckbox("Pular Mais Alto", UDim2.new(0, 10, 0.2, 0), function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character.Humanoid.JumpPower = isEnabled and 150 or 50 -- Ativa/desativa a trapaça de pular alto
end)

-- Caixa de marcar para Invisibilidade
createCheatCheckbox("Invisibilidade", UDim2.new(0, 10, 0.3, 0), function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character.HumanoidRootPart.Transparency = isEnabled and 0.5 or 0 -- Ativa/desativa a trapaça de invisibilidade
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = isEnabled and 0.5 or 0
        end
    end
end)

-- Caixa de marcar para Cura Instantânea
createCheatCheckbox("Cura Instantânea", UDim2.new(0, 10, 0.4, 0), function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    if isEnabled then
        character.Humanoid.Health = character.Humanoid.MaxHealth -- Cura o jogador
    end
end)

-- Caixa de marcar para Voo
createCheatCheckbox("Voo", UDim2.new(0, 10, 0.5, 0), function(isEnabled)
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

-- Caixa de marcar para Super Força
createCheatCheckbox("Super Força", UDim2.new(0, 10, 0.6, 0), function(isEnabled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    if isEnabled then
        character.Humanoid.Strength = 100 -- Aumenta a força do jogador
    else
        character.Humanoid.Strength = 10 -- Define a força do jogador de volta ao normal
    end
end)
