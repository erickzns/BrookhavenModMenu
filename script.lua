local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Criando o menu flutuante
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 300, 0, 200)
menu.Position = UDim2.new(0.5, -150, 0.5, -100)
menu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
menu.Parent = screenGui

-- Título do Menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Text = "Menu de Trapaças"
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Parent = menu

-- Função para aumentar a velocidade
local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(1, 0, 0, 40)
speedButton.Position = UDim2.new(0, 0, 0.2, 0)
speedButton.Text = "Aumentar Velocidade"
speedButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
speedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
speedButton.Parent = menu

speedButton.MouseButton1Click:Connect(function()
    player.Character.Humanoid.WalkSpeed = 100
end)

-- Função para teleportar
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(1, 0, 0, 40)
teleportButton.Position = UDim2.new(0, 0, 0.4, 0)
teleportButton.Text = "Teletransportar"
teleportButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
teleportButton.TextColor3 = Color3.fromRGB(0, 0, 0)
teleportButton.Parent = menu

teleportButton.MouseButton1Click:Connect(function()
    -- Teletransporta para a posição do mouse
    local targetPosition = mouse.Hit.p
    player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
end)

-- Função para dar dinheiro
local moneyButton = Instance.new("TextButton")
moneyButton.Size = UDim2.new(1, 0, 0, 40)
moneyButton.Position = UDim2.new(0, 0, 0.6, 0)
moneyButton.Text = "Dar Dinheiro"
moneyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
moneyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
moneyButton.Parent = menu

moneyButton.MouseButton1Click:Connect(function()
    -- Aumenta a quantidade de dinheiro (presumindo que você tenha uma variável de dinheiro)
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local money = leaderstats:FindFirstChild("Dinheiro")
        if money then
            money.Value = money.Value + 1000 -- Dá 1000 de dinheiro
        end
    end
end)

-- Função para dar vidas extras
local healthButton = Instance.new("TextButton")
healthButton.Size = UDim2.new(1, 0, 0, 40)
healthButton.Position = UDim2.new(0, 0, 0.8, 0)
healthButton.Text = "Dar Vidas Extras"
healthButton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
healthButton.TextColor3 = Color3.fromRGB(0, 0, 0)
healthButton.Parent = menu

healthButton.MouseButton1Click:Connect(function()
    -- Dá mais vida ao jogador
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Health = humanoid.MaxHealth -- Restabelece toda a vida
    end
end)

-- Adiciona um botão de fechar
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 100, 0, 40)
closeButton.Position = UDim2.new(1, -110, 0, -50)
closeButton.Text = "Fechar"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = menu

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy() -- Fecha o menu
end)
