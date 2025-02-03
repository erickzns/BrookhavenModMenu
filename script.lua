local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui  -- Garantir que o ScreenGui esteja na PlayerGui

-- Criando o menu flutuante
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 300, 0, 600)  -- Aumentei o tamanho para que o menu tenha espaço suficiente
menu.Position = UDim2.new(0.5, -150, 0.5, -250)
menu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
menu.Parent = screenGui

-- Criando a barra de rolagem
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.Position = UDim2.new(0, 0, 0, 40)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 800)  -- Aumentei o tamanho do Canvas para ajustar as novas funções
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

-- Bypass de sistema de segurança para impedir bloqueios do Anticheat (sutil)
local function bypassAnticheat()
    local oldCFrame = player.Character:FindFirstChild("HumanoidRootPart").CFrame
    local randomShift = CFrame.new(math.random(-10, 10), 0, math.random(-10, 10))
    player.Character:FindFirstChild("HumanoidRootPart").CFrame = oldCFrame * randomShift
end

-- Aumentar Velocidade
createCheckbox("Aumentar Velocidade", 0.1, function(isChecked)
    if isChecked then
        player.Character.Humanoid.WalkSpeed = 100
    else
        player.Character.Humanoid.WalkSpeed = 16 -- Valor padrão de velocidade
    end
end)

-- Teletransportar
createCheckbox("Teletransportar", 0.2, function(isChecked)
    if isChecked then
        -- Bypass Anticheat antes de teletransportar
        bypassAnticheat()

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

-- ESP (Caixa, Nome, Linha)
createCheckbox("ESP Caixa", 0.6, function(isChecked)
    if isChecked then
        game:GetService("RunService").Heartbeat:Connect(function()
            for _, target in pairs(game.Players:GetPlayers()) do
                if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    -- Criação da caixa de ESP (borda ao redor do personagem)
                    local box = Instance.new("BoxHandleAdornment")
                    box.Adornee = target.Character.HumanoidRootPart
                    box.Size = target.Character.HumanoidRootPart.Size + Vector3.new(1, 2, 1)
                    box.Color3 = Color3.fromRGB(255, 255, 255)  -- Caixa branca
                    box.Parent = target.Character
                    box.ZIndex = 10

                    -- Tornar o personagem visível dentro da caixa
                    for _, part in pairs(target.Character:GetChildren()) do
                        if part:IsA("MeshPart") or part:IsA("Part") then
                            part.Transparency = 0  -- Garante que o personagem seja totalmente visível dentro da caixa
                        end
                    end
                end
            end
        end)
    end
end)

createCheckbox("ESP Nome", 0.7, function(isChecked)
    if isChecked then
        game:GetService("RunService").Heartbeat:Connect(function()
            for _, target in pairs(game.Players:GetPlayers()) do
                if target ~= player and target.Character and target.Character:FindFirstChild("Head") then
                    -- Exibe o nome acima da cabeça do jogador
                    local nameLabel = Instance.new("BillboardGui")
                    nameLabel.Adornee = target.Character.Head
                    nameLabel.Size = UDim2.new(0, 100, 0, 50)
                    nameLabel.StudsOffset = Vector3.new(0, 3, 0)
                    nameLabel.Parent = target.Character.Head

                    local label = Instance.new("TextLabel")
                    label.Text = target.Name
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.TextColor3 = Color3.fromRGB(255, 255, 255)
                    label.BackgroundTransparency = 1
                    label.Parent = nameLabel
                end
            end
        end)
    end
end)

createCheckbox("ESP Linha", 0.8, function(isChecked)
    if isChecked then
        game:GetService("RunService").Heartbeat:Connect(function()
            for _, target in pairs(game.Players:GetPlayers()) do
                if target ~= player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    -- Criação da linha de ESP (linha entre jogador e alvo)
                    local line = Instance.new("Part")
                    line.Size = Vector3.new(0.05, 0.05, (player.Character.HumanoidRootPart.Position - target.Character.HumanoidRootPart.Position).Magnitude)
                    line.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position, target.Character.HumanoidRootPart.Position)
                    line.Anchored = true
                    line.CanCollide = false
                    line.Color = Color3.fromRGB(255, 255, 255)  -- Linha branca e mais fina
                    line.Parent = workspace
                end
            end
        end)
    end
end)

-- Outras funções novas

-- Voar
createCheckbox("Voar", 0.9, function(isChecked)
    local flying = false
    if isChecked then
        flying = true
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(50000, 50000, 50000)
        bodyVelocity.Velocity = Vector3.new(0, 50, 0)
        bodyVelocity.Parent = player.Character.HumanoidRootPart
    else
        flying = false
        -- Remover o BodyVelocity para parar o voo
        player.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity"):Destroy()
    end
end)

-- Aumentar dano
createCheckbox("Aumentar Dano", 1.0, function(isChecked)
    if isChecked then
        -- Modificando o dano causado pelo jogador
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Damage = 100  -- Aumenta o dano para 100
        end
    else
        -- Retorna ao valor padrão de dano
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Damage = 10  -- Valor padrão de dano
        end
    end
end)
