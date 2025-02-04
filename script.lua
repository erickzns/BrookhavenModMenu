-- Criando a Interface
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

-- Funções de teleporte
local TeleportButton = Instance.new("TextButton")

-- Função de alterar velocidade
local SpeedButton = Instance.new("TextButton")

-- Configuração do GUI
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Mod Menu - Ilha Bela"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 24

-- Botão de Teleporte
TeleportButton.Parent = MainFrame
TeleportButton.Size = UDim2.new(0, 200, 0, 50)
TeleportButton.Position = UDim2.new(0.5, -100, 0.3, -25)
TeleportButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TeleportButton.Text = "Teletransportar"
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.Font = Enum.Font.SourceSans
TeleportButton.TextSize = 18

-- Botão de Alterar Velocidade
SpeedButton.Parent = MainFrame
SpeedButton.Size = UDim2.new(0, 200, 0, 50)
SpeedButton.Position = UDim2.new(0.5, -100, 0.5, -25)
SpeedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SpeedButton.Text = "Alterar Velocidade"
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.Font = Enum.Font.SourceSans
SpeedButton.TextSize = 18

-- Função para Teletransportar
TeleportButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- Aqui você pode adicionar os pontos de teleporte para o seu mapa
    -- Exemplo de teleporte para uma posição fixa
    local teleportPosition = Vector3.new(0, 10, 0) -- Altere para uma posição válida no seu mapa
    humanoidRootPart.CFrame = CFrame.new(teleportPosition)
    print("Teletransportado para a posição!")
end)

-- Função para Alterar Velocidade
SpeedButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Aumenta a velocidade de movimento do personagem
    humanoid.WalkSpeed = 50 -- Aumente para um valor maior
    print("Velocidade alterada para: " .. humanoid.WalkSpeed)
end)

-- Você pode adicionar mais botões e funções aqui, como voar, mudar a cor do personagem, etc.
