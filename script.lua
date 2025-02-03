local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Criando o menu flutuante
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 300, 0, 300)
menu.Position = UDim2.new(0.5, -150, 0.5, -150)
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
speedButton.Position = UDim2.new(0, 0, 0.1, 0)
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
teleportButton.Position = UDim2.new(0, 0, 0.2, 0)
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
moneyButton.Position = UDim2.new(0, 0, 0.3, 0)
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
healthButton.Position = UDim2.new(0, 0, 0.4, 0)
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

-- Função para ESP (ver jogadores através das paredes)
local espButton = Instance.new("TextButton")
espButton.Size = UDim2.new(1, 0, 0, 40)
espButton.Position = UDim2.new(0, 0, 0.5, 0)
espButton.Text = "Ativar ESP"
espButton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
espButton.TextColor3 = Color3.fromRGB(0, 0, 0)
espButton.Parent = menu

local espActive = false

espButton.MouseButton1Click:Connect(function()
    espActive = not espActive
    if espActive then
        espButton.Text = "Desativar ESP"
        -- Ativar ESP
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local box = Instance.new("BillboardGui")
                box.Adornee = otherPlayer.Character
                box.Size = UDim2.new(0, 100, 0, 100)
                box.StudsOffset = Vector3.new(0, 5, 0)
                box.AlwaysOnTop = true
                box.Parent = otherPlayer.Character

                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                frame.Parent = box
            end
        end
    else
        espButton.Text = "Ativar ESP"
        -- Desativar ESP
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local character = otherPlayer.Character
                if character then
                    local box = character:FindFirstChildOfClass("BillboardGui")
                    if box then
                        box:Destroy()
                    end
                end
            end
        end
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
