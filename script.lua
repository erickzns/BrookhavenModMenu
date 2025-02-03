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
        -- Pega dinheiro de outro jogador (ou da sua conta, dependendo da lógica)
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local money = leaderstats:FindFirstChild("Dinheiro")
            if money then
                -- Subtrai 1000 de dinheiro
                if money.Value >= 1000 then
                    money.Value = money.Value - 1000 -- Pega 1000 de dinheiro
                else
                    print("Dinheiro insuficiente.")
                end
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

-- Função para ESP Caixa (contorno do personagem)
createCheckbox("Ativar ESP Caixa", 0.5, function(isChecked)
    if isChecked then
        -- Adicionar as caixas de ESP ao redor dos personagens
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                local character = otherPlayer.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    -- Criar a caixa ao redor do personagem
                    local box = character:FindFirstChild("ESP_Box")
                    if not box then
                        box = Instance.new("BoxHandleAdornment")
                        box.Name = "ESP_Box"
                        box.Adornee = humanoidRootPart
                        box.Size = humanoidRootPart.Size + Vector3.new(2, 5, 2) -- Ajustando o tamanho da caixa ao redor
                        box.Color3 = Color3.fromRGB(255, 255, 255)  -- Cor branca
                        box.Transparency = 0.5
                        box.ZIndex = 10
                        box.Parent = character
                    end
                end
            end
        end
    else
        -- Remover as caixas de ESP se desmarcado
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                local character = otherPlayer.Character
                local box = character:FindFirstChild("ESP_Box")
                if box then
                    box:Destroy()
                end
            end
        end
    end
end)

-- Funções de ESP adicionais (Nome, Linha e Distância)
createCheckbox("ESP Nome", 0.6, function(isChecked)
    if isChecked then
        -- Adiciona o nome ao redor do personagem
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                local character = otherPlayer.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    local nameLabel = character:FindFirstChild("ESP_Name")
                    if not nameLabel then
                        nameLabel = Instance.new("BillboardGui")
                        nameLabel.Name = "ESP_Name"
                        nameLabel.Adornee = humanoidRootPart
                        nameLabel.Size = UDim2.new(0, 100, 0, 50)
                        nameLabel.StudsOffset = Vector3.new(0, 2, 0)
                        nameLabel.AlwaysOnTop = true
                        nameLabel.Parent = character

                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.Text = otherPlayer.Name
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.fromRGB(255, 255, 255)
                        label.TextScaled = true
                        label.Parent = nameLabel
                    end
                end
            end
        end
    else
        -- Remover os nomes
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                local character = otherPlayer.Character
                local nameLabel = character:FindFirstChild("ESP_Name")
                if nameLabel then
                    nameLabel:Destroy()
                end
            end
        end
    end
end)

-- Função de ESP Linha (agora fica grudada no jogador e mais fina)
createCheckbox("ESP Linha", 0.7, function(isChecked)
    if isChecked then
        -- Adiciona a linha ao redor do personagem
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                local character = otherPlayer.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    -- Criar ou atualizar a linha
                    local line = player.Character:FindFirstChild("ESP_Line_" .. otherPlayer.Name)
                    if not line then
                        line = Instance.new("Part")
                        line.Name = "ESP_Line_" .. otherPlayer.Name
                        line.Size = Vector3.new(0.1, 0.1, 0.1) -- Inicialmente a linha é invisível
                        line.Anchored = true
                        line.CanCollide = false
                        line.Color = Color3.fromRGB(255, 255, 255)  -- Linha branca
                        line.Parent = game.Workspace
                    end
                    
                    -- Função para manter a linha atualizada
                    game:GetService("RunService").Heartbeat:Connect(function()
                        if isChecked and line then
                            -- Atualizando a posição e tamanho da linha
                            local startPos = player.Character.HumanoidRootPart.Position
                            local endPos = humanoidRootPart.Position
                            line.Position = (startPos + endPos) / 2  -- Posição da linha no meio dos dois personagens

                            -- Atualizando o tamanho e direção da linha
                            line.Size = Vector3.new(0.1, 0.1, (startPos - endPos).Magnitude)  -- Linha fina
                            line.CFrame = CFrame.new(startPos, endPos)  -- Orienta a linha para ir do seu personagem até o outro
                        end
                    end)
                end
            end
        end
    else
        -- Remover as linhas
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                local line = player.Character:FindFirstChild("ESP_Line_" .. otherPlayer.Name)
                if line then
                    line:Destroy()
                end
            end
        end
    end
end)

createCheckbox("ESP Distância", 0.8, function(isChecked)
    if isChecked then
        -- Adiciona a distância ao redor do personagem
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                local character = otherPlayer.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    local distanceLabel = character:FindFirstChild("ESP_Distance")
                    if not distanceLabel then
                        distanceLabel = Instance.new("BillboardGui")
                        distanceLabel.Name = "ESP_Distance"
                        distanceLabel.Adornee = humanoidRootPart
                        distanceLabel.Size = UDim2.new(0, 100, 0, 50)
                        distanceLabel.StudsOffset = Vector3.new(0, 2, 0)
                        distanceLabel.AlwaysOnTop = true
                        distanceLabel.Parent = character

                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.Text = string.format("%.0f studs", (player.Character.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude)
                        label.BackgroundTransparency = 1
                        label.TextColor3 = Color3.fromRGB(255, 255, 255)
                        label.TextScaled = true
                        label.Parent = distanceLabel
                    end
                end
            end
        end
    else
        -- Remover a distância
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                local character = otherPlayer.Character
                local distanceLabel = character:FindFirstChild("ESP_Distance")
                if distanceLabel then
                    distanceLabel:Destroy()
                end
            end
        end
    end
end)
