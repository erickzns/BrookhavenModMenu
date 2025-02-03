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

-- Botão para fechar (minimizar) o menu
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = menu

closeButton.MouseButton1Click:Connect(function()
    menu.Visible = false  -- Fecha o menu quando clicar no X
    mouse.Icon = ""  -- Remove o cursor do mouse ao fechar o menu
end)

-- Função fictícia de Bypass para manipular erros e evitar detecção
local function bypassDetection()
    -- Manipulando os logs de erro (apenas ficcional)
    pcall(function()
        -- Simula um erro mas ele nunca é detectado
        local simulatedError = "Erro não detectado!"
        error(simulatedError)
    end)

    -- Simula uma comunicação segura com o servidor
    game:GetService("ReplicatedStorage").RequestFire:FireServer("safeDataHere")
end

-- Funções de Trapaça
createCheckbox("Aumentar Velocidade", 0.1, function(isChecked)
    if isChecked then
        player.Character.Humanoid.WalkSpeed = 100
    else
        player.Character.Humanoid.WalkSpeed = 16 -- Valor padrão de velocidade
    end
end)

createCheckbox("Teletransportar", 0.2, function(isChecked)
    if isChecked then
        -- Teletransporta para a posição do mouse
        local targetPosition = mouse.Hit.p
        player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
    end
end)

createCheckbox("Pegar Dinheiro", 0.3, function(isChecked)
    if isChecked then
        -- Adiciona dinheiro ao jogador
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local money = leaderstats:FindFirstChild("Dinheiro")
            if money then
                money.Value = money.Value + 1000 -- Adiciona 1000 de dinheiro
            end
        end
    end
end)

createCheckbox("Godmode (Imortal)", 0.4, function(isChecked)
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    
    if isChecked then
        if humanoid then
            -- Ativa o Godmode (imortalidade)
            humanoid.Health = humanoid.MaxHealth  -- Restaura a saúde para o máximo
            humanoid.MaxHealth = math.huge  -- Define a saúde máxima como infinita
            humanoid.HealthChanged:Connect(function()
                if humanoid.Health < humanoid.MaxHealth then
                    humanoid.Health = humanoid.MaxHealth  -- Sempre restaura a saúde para o máximo
                end
            end)
        end
    else
        if humanoid then
            humanoid.MaxHealth = 100 -- Restaura a saúde máxima para um valor padrão
            humanoid.Health = humanoid.MaxHealth -- Restaura a saúde para o valor original
        end
    end
end)

-- Simulando a ativação do Bypass para quando há erro ou falha detectada
bypassDetection()  -- Chamando a função fictícia de bypass

-- Ação ao mostrar o menu: Mostrar cursor
menu.MouseEnter:Connect(function()
    mouse.Icon = "rbxassetid://6031078444"  -- Exibe o cursor ao passar o mouse sobre o menu
end)

menu.MouseLeave:Connect(function()
    mouse.Icon = ""  -- Remove o cursor ao sair do menu
end)

-- Tornar o cursor visível ao abrir o menu
menu.Visible = true
mouse.Icon = "rbxassetid://6031078444"  -- Exibe o cursor padrão ao mostrar o menu
