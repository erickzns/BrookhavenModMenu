local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui  -- Garantir que o ScreenGui esteja na PlayerGui

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

-- Botão para fechar o menu
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = menu

closeButton.MouseButton1Click:Connect(function()
    menu.Visible = false  -- Fecha o menu quando clicar no X
    mouse.Icon = ""  -- Remove o cursor ao fechar o menu
end)

-- Função para criar uma caixinha de marcação
local function createCheckbox(labelText, positionY, callback)
    local checkboxFrame = Instance.new("Frame")
    checkboxFrame.Size = UDim2.new(1, 0, 0, 30)
    checkboxFrame.Position = UDim2.new(0, 0, positionY, 0)
    checkboxFrame.BackgroundTransparency = 1
    checkboxFrame.Parent = scrollingFrame

    -- Caixinha de marcação
    local checkbox = Instance.new("TextButton")
    checkbox.Size = UDim2.new(0, 20, 0, 20)
    checkbox.Position = UDim2.new(0, 0, 0.5, -10)
    checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    checkbox.BorderSizePixel = 1
    checkbox.Text = ""
    checkbox.Parent = checkboxFrame

    -- Nome da função
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -30, 1, 0)
    label.Position = UDim2.new(0, 30, 0, 0)
    label.Text = labelText
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = checkboxFrame

    -- Variável para controlar o estado da caixa de marcação
    local isChecked = false

    -- Função para lidar com a marcação
    checkbox.MouseButton1Click:Connect(function()
        isChecked = not isChecked
        if isChecked then
            checkbox.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Cor verde quando marcado
            callback(true)
        else
            checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- Cor branca quando desmarcado
            callback(false)
        end
    end)

    return checkboxFrame
end

-- Funções de Trapaça

-- Aumentar Velocidade
createCheckbox("Aumentar Velocidade", 0.1, function(isChecked)
    if isChecked then
        player.Character.Humanoid.WalkSpeed = 100
    else
        player.Character.Humanoid.WalkSpeed = 16 -- Valor padrão de velocidade
    end
end)

-- Teleportar
createCheckbox("Teletransportar", 0.2, function(isChecked)
    if isChecked then
        -- Teletransporta para a posição do mouse
        local targetPosition = mouse.Hit.p
        player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
    end
end)

-- Pegar Dinheiro
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

-- Godmode (Imortal)
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

-- Aimbot (Mirar no inimigo mais próximo)
createCheckbox("Aimbot", 0.5, function(isChecked)
    if isChecked then
        local function aimbot()
            local closestTarget = nil
            local closestDistance = math.huge
            for _, enemy in pairs(game.Players:GetPlayers()) do
                if enemy ~= player and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
                    local targetPosition = enemy.Character.HumanoidRootPart.Position
                    local distance = (player.Character.HumanoidRootPart.Position - targetPosition).Magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestTarget = enemy.Character.HumanoidRootPart
                    end
                end
            end

            -- Mira no alvo mais próximo
            if closestTarget then
                local direction = (closestTarget.Position - mouse.Hit.p).unit
                local newCFrame = CFrame.new(player.Character.HumanoidRootPart.Position, closestTarget.Position)
                player.Character.HumanoidRootPart.CFrame = newCFrame
            end
        end

        -- Ativa o aimbot a cada quadro
        game:GetService("RunService").Heartbeat:Connect(function()
            if isChecked then
                aimbot()
            end
        end)
    end
end)

-- ESP para destacar jogadores
createCheckbox("ESP", 0.6, function(isChecked)
    if isChecked then
        game:GetService("RunService").Heartbeat:Connect(function()
            for _, target in pairs(game.Players:GetPlayers()) do
                if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    -- Criação da caixa de ESP (borda ao redor do personagem)
                    local box = Instance.new("BoxHandleAdornment")
                    box.Adornee = target.Character.HumanoidRootPart
                    box.Size = target.Character.HumanoidRootPart.Size + Vector3.new(1, 2, 1)  -- Ajuste de tamanho para se ajustar ao personagem
                    box.Color3 = Color3.fromRGB(255, 255, 255)  -- Cor branca
                    box.Transparency = 0.5  -- Um pouco transparente
                    box.Parent = game.Workspace
                    -- Remover a caixa quando o alvo sair de cena
                    target.Character:Destroying:Connect(function()
                        box:Destroy()
                    end)
                end
            end
        end)
    end
end)

-- ESP Nome
createCheckbox("ESP Nome", 0.7, function(isChecked)
    if isChecked then
        game:GetService("RunService").Heartbeat:Connect(function()
            for _, target in pairs(game.Players:GetPlayers()) do
                if target ~= player and target.Character and target.Character:FindFirstChild("Head") then
                    -- Exibir o nome acima do personagem
                    local nameTag = Instance.new("BillboardGui")
                    nameTag.Adornee = target.Character.Head
                    nameTag.Size = UDim2.new(0, 100, 0, 50)
                    nameTag.StudsOffset = Vector3.new(0, 2, 0)
                    nameTag.Parent = target.Character.Head

                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.BackgroundTransparency = 1
                    label.Text = target.Name
                    label.TextColor3 = Color3.fromRGB(255, 255, 255)
                    label.TextStrokeTransparency = 0.7
                    label.Parent = nameTag
                end
            end
        end)
    end
end)

-- ESP Linha (corrigido)
createCheckbox("ESP Linha", 0.8, function(isChecked)
    if isChecked then
        -- Criação da linha de ESP (apenas entre jogador e alvo)
        game:GetService("RunService").Heartbeat:Connect(function()
            -- Remover as linhas antigas para evitar que fiquem persistindo
            for _, line in pairs(workspace:GetChildren()) do
                if line:IsA("Part") and line.Name == "ESP_Line" then
                    line:Destroy()  -- Apaga as linhas antigas antes de desenhar novas
                end
            end

            -- Agora só desenha as linhas entre você e os inimigos
            for _, target in pairs(game.Players:GetPlayers()) do
                if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    -- Cria a linha somente entre você e os inimigos
                    local line = Instance.new("Part")
                    line.Name = "ESP_Line"
                    line.Size = Vector3.new(0.05, 0.05, (player.Character.HumanoidRootPart.Position - target.Character.HumanoidRootPart.Position).Magnitude)
                    line.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position, target.Character.HumanoidRootPart.Position)
                    line.Anchored = true
                    line.CanCollide = false
                    line.Color = Color3.fromRGB(255, 255, 255)  -- Linha branca e mais fina
                    line.Parent = workspace
                    line.ZIndex = 10  -- Assegura que a linha fique visível por cima dos outros elementos
                end
            end
        end)
    else
        -- Desativa as linhas de ESP quando desmarcado
        for _, line in pairs(workspace:GetChildren()) do
            if line:IsA("Part") and line.Name == "ESP_Line" then
                line:Destroy()  -- Remove todas as linhas quando a opção é desativada
            end
        end
    end
end)

-- Garantir que o menu esteja visível
menu.Visible = true  -- Garantir que o menu esteja visível ao ser carregado

-- Mostrar o cursor quando passar o mouse no menu
menu.MouseEnter:Connect(function()
    mouse.Icon = "rbxassetid://6031078444"  -- Exibe o cursor ao passar o mouse sobre o menu
end)

menu.MouseLeave:Connect(function()
    mouse.Icon = ""  -- Remove o cursor ao sair do menu
end)

-- Mostrar o cursor ao abrir o menu
mouse.Icon = "rbxassetid://6031078444"  -- Exibe o cursor padrão ao mostrar o menu
