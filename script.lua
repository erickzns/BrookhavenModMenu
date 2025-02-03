-- Mod Menu com GUI para Roblox

-- Criando a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CheatMenu"
screenGui.Parent = game.CoreGui

-- Criando o Frame do Menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 200, 0, 300)
menuFrame.Position = UDim2.new(0, 10, 0, 10)
menuFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuFrame.BackgroundTransparency = 0.5
menuFrame.Parent = screenGui

-- Criando o Título do Menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Text = "Mod Menu"
titleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.TextScaled = true
titleLabel.Parent = menuFrame

-- Criando o Botão de Speed Hack
local speedHackButton = Instance.new("TextButton")
speedHackButton.Size = UDim2.new(1, -20, 0, 50)
speedHackButton.Position = UDim2.new(0, 10, 0, 60)
speedHackButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
speedHackButton.Text = "Ativar Speed Hack"
speedHackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
speedHackButton.TextScaled = true
speedHackButton.Parent = menuFrame

-- Variável para controlar o estado do Speed Hack
local speedHackActive = false

-- Função para ativar/desativar o Speed Hack
local function toggleSpeedHack()
    local player = game.Players.LocalPlayer
    if speedHackActive then
        player.Character.Humanoid.WalkSpeed = 16 -- Velocidade padrão
        speedHackButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        speedHackButton.Text = "Ativar Speed Hack"
    else
        player.Character.Humanoid.WalkSpeed = 50 -- Velocidade aumentada
        speedHackButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        speedHackButton.Text = "Desativar Speed Hack"
    end
    speedHackActive = not speedHackActive
end

-- Conectando a função ao clique do botão
speedHackButton.MouseButton1Click:Connect(toggleSpeedHack)

print("Menu criado e botão de Speed Hack configurado")
