local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Criando o menu flutuante
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 300, 0, 400)
menu.Position = UDim2.new(0.5, -150, 0.5, -200)
menu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
menu.Parent = screenGui

-- Criando a barra de rolagem
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.Position = UDim2.new(0, 0, 0, 40)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 500)
scrollingFrame.ScrollBarThickness = 10
scrollingFrame.Parent = menu

-- Título do Menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Text = "Menu de Trapaças"
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Parent = menu

-- Função para aumentar a velocidade
local speedCheckbox = Instance.new("TextButton")
speedCheckbox.Size = UDim2.new(1, 0, 0, 40)
speedCheckbox.Position = UDim2.new(0, 0, 0.1, 0)
speedCheckbox.Text = "Aumentar Velocidade"
speedCheckbox.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
speedCheckbox.TextColor3 = Color3.fromRGB(255, 255, 255)
speedCheckbox.Parent = scrollingFrame

local speedActive = false
speedCheckbox.MouseButton1Click:Connect(function()
    speedActive = not speedActive
    if speedActive then
        player.Character.Humanoid.WalkSpeed = 100
    else
        player.Character.Humanoid.WalkSpeed = 16 -- Valor padrão de velocidade
    end
end)

-- Função para teleportar
local teleportCheckbox = Instance.new("TextButton")
teleportCheckbox.Size = UDim2.new(1, 0, 0, 40)
teleportCheckbox.Position = UDim2.new(0, 0, 0.2, 0)
teleportCheckbox.Text = "Teletransportar"
teleportCheckbox.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
teleportCheckbox.TextColor3 = Color3.fromRGB(0, 0, 0)
teleportCheckbox.Parent = scrollingFrame

local teleportActive = false
teleportCheckbox.MouseButton1Click:Connect(function()
    teleportActive = not teleportActive
    if teleportActive then
        -- Teletransporta para a posição do mouse
        local targetPosition = mouse.Hit.p
        player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
    end
end)

-- Função para dar dinheiro
local moneyCheckbox = Instance.new("TextButton")
moneyCheckbox.Size = UDim2.new(1, 0, 0, 40)
moneyCheckbox.Position = UDim2.new(0, 0, 0.3, 0)
moneyCheckbox.Text = "Dar Dinheiro"
moneyCheckbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
moneyCheckbox.TextColor3 = Color3.fromRGB(255, 255, 255)
moneyCheckbox.Parent = scrollingFrame

local moneyActive = false
moneyCheckbox.MouseButton1Click:Connect(function()
    moneyActive = not moneyActive
    if moneyActive then
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local money = leaderstats:FindFirstChild("Dinheiro")
            if money then
                money.Value = money.Value + 1000 -- Dá 1000 de dinheiro
            end
        end
    end
end)

-- Função para dar vidas extras
local healthCheckbox = Instance.new("TextButton")
healthCheckbox.Size = UDim2.new(1, 0, 0, 40)
healthCheckbox.Position = UDim2.new(0, 0, 0.4, 0)
healthCheckbox.Text = "Dar Vidas Extras"
healthCheckbox.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
healthCheckbox.TextColor3 = Color3.fromRGB(0, 0, 0)
healthCheckbox.Parent = scrollingFrame

local healthActive = false
healthCheckbox.MouseButton1Click:Connect(function()
    healthActive = not healthActive
    if healthActive then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = humanoid.MaxHealth -- Restabelece toda a vida
        end
    end
end)

-- Função para ESP (ver jogadores através das paredes)
local espCheckbox = Instance.new("TextButton")
espCheckbox.Size = UDim2.new(1, 0, 0, 40)
espCheckbox.Position = UDim2.new(0, 0, 0.5, 0)
espCheckbox.Text = "Ativar ESP"
espCheckbox.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
espCheckbox.TextColor3 = Color3.fromRGB(0, 0, 0)
espCheckbox.Parent = scrollingFrame

local espActive = false
espCheckbox.MouseButton1Click:Connect(function()
    espActive = not espActive
    if espActive then
        espCheckbox.Text = "Desativar ESP"
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
        espCheckbox.Text = "Ativar ESP"
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
