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

-- Função para criar botões de trapaça
local function createCheatButton(text, position, onClick)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 20
    button.Parent = menuFrame
    button.MouseButton1Click:Connect(onClick)
end

-- Botão de Aumentar Velocidade
createCheatButton("Aumentar Velocidade", UDim2.new(0.5, -100, 0.2, -25), function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character.Humanoid.WalkSpeed = 100 -- Aumenta a velocidade de caminhada
end)

-- Botão de Pular Mais Alto
createCheatButton("Pular Mais Alto", UDim2.new(0.5, -100, 0.4, -25), function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character.Humanoid.JumpPower = 150 -- Aumenta a altura do pulo
end)

-- Botão de Invisibilidade
createCheatButton("Invisibilidade", UDim2.new(0.5, -100, 0.6, -25), function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character.HumanoidRootPart.Transparency = 0.5 -- Torna o jogador meio invisível
end)

-- Botão de Cura Instantânea
createCheatButton("Cura Instantânea", UDim2.new(0.5, -100, 0.8, -25), function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    character.Humanoid.Health = character.Humanoid.MaxHealth -- Cura o jogador completamente
end)
