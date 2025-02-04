-- Criação do ScreenGui e Menu Principal
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 300, 0, 400)
mainMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainMenu.Position = UDim2.new(0.5, -150, 0.5, -200) -- Centralizando o menu
mainMenu.Parent = screenGui

-- Barra titular
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40) -- Barra de título ocupa toda a largura
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleBar.Parent = mainMenu

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.Text = "Ghost Menu V1"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.BackgroundTransparency = 1
titleText.TextSize = 20
titleText.TextXAlignment = Enum.TextXAlignment.Center
titleText.Parent = titleBar

-- Função para permitir mover o menu
local isDragging = false
local dragStart = nil
local startPos = nil

mainMenu.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStart = input.Position
        startPos = mainMenu.Position
    end
end)

mainMenu.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainMenu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

mainMenu.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

-- Container para botões laterais
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(0, 110, 1, -40)
buttonContainer.Position = UDim2.new(0, 0, 0, 40)
buttonContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
buttonContainer.Parent = mainMenu

-- Container para submenus
local submenuContainer = Instance.new("Frame")
submenuContainer.Size = UDim2.new(1, -110, 1, -40)
submenuContainer.Position = UDim2.new(0, 110, 0, 40)
submenuContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
submenuContainer.Parent = mainMenu

local submenus = {}
local activeSubmenu = nil

-- Função para criar um botão lateral e seu submenu correspondente
local function createSidebarButton(name, order)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 50)
    button.Position = UDim2.new(0, 5, 0, (order - 1) * 55 + 5)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = buttonContainer
    
    local submenu = Instance.new("Frame")
    submenu.Size = UDim2.new(1, 0, 1, 0)
    submenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    submenu.Visible = false
    submenu.Parent = submenuContainer
    
    submenus[button] = submenu
    
    button.MouseButton1Click:Connect(function()
        if activeSubmenu then
            activeSubmenu.Visible = false
        end
        submenu.Visible = true
        activeSubmenu = submenu
    end)
    
    return submenu
end

-- Criando submenus organizados
local geralSubMenu = createSidebarButton("Geral", 1)
local armaSubMenu = createSidebarButton("Arma", 2)
local jogadorSubMenu = createSidebarButton("Jogador", 3)
local configuracoesSubMenu = createSidebarButton("Configurações", 4)
local avancadoSubMenu = createSidebarButton("Avançado", 5)
local dinheiroSubMenu = createSidebarButton("Dinheiro", 6)

-- Funções de trapaça
local function ativarInvisibilidade()
    local player = game.Players.LocalPlayer
    if player and player.Character then
        player.Character.HumanoidRootPart.Transparency = 1
        player.Character.HumanoidRootPart.CanCollide = false
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end
    print("Invisibilidade ativada!")
end

local function ativarAimbot()
    local player = game.Players.LocalPlayer
    local closestPlayer = nil
    local shortestDistance = math.huge

    -- Encontrar o jogador mais próximo
    for _, targetPlayer in pairs(game.Players:GetPlayers()) do
        if targetPlayer ~= player and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - targetPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = targetPlayer
            end
        end
    end

    -- Mirar no jogador mais próximo
    if closestPlayer then
        local character = closestPlayer.Character
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            game:GetService("TweenService"):Create(player.Character.HumanoidRootPart, TweenInfo.new(0.1), {CFrame = CFrame.new(humanoidRootPart.Position)}):Play()
        end
    end
    print("Aimbot ativado!")
end

local function ativarESP()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            -- Exibir a caixa ao redor do jogador
            local box = Instance.new("BoxHandleAdornment")
            box.Adornee = player.Character.HumanoidRootPart
            box.Size = player.Character.HumanoidRootPart.Size
            box.Transparency = 0.5
            box.Color3 = Color3.fromRGB(255, 0, 0)
            box.Parent = player.Character

            -- Exibir o nome do jogador
            local label = Instance.new("BillboardGui")
            label.Adornee = player.Character.Head
            label.Size = UDim2.new(0, 100, 0, 50)
            label.StudsOffset = Vector3.new(0, 3, 0)
            label.Parent = player.Character

            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.Text = player.Name
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            textLabel.BackgroundTransparency = 1
            textLabel.TextSize = 14
            textLabel.Parent = label
        end
    end
    print("ESP ativado!")
end

local function pegarDinheiro()
    for _, money in pairs(workspace:GetChildren()) do
        if money:IsA("Part") and money.Name == "Money" then
            money.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
    print("Dinheiro coletado!")
end

-- Função para criar opções dentro dos submenus
local function createOption(submenu, name, activateFunc, index)
    local option = Instance.new("TextButton")
    option.Size = UDim2.new(1, -20, 0, 40)
    option.Position = UDim2.new(0, 10, 0, index * 45)
    option.Text = name
    option.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    option.TextColor3 = Color3.fromRGB(255, 255, 255)
    option.Parent = submenu
    option.MouseButton1Click:Connect(activateFunc)
end

-- Adicionando opções organizadas
createOption(geralSubMenu, "Ativar Invisibilidade", ativarInvisibilidade, 0)
createOption(geralSubMenu, "Ativar Super Velocidade", function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100 end, 1)
createOption(armaSubMenu, "Ativar Aimbot", ativarAimbot, 0)
createOption(jogadorSubMenu, "Ativar ESP", ativarESP, 0)
createOption(dinheiroSubMenu, "Pegar Dinheiro", pegarDinheiro, 0)

print("ModMenu atualizado e funcional!")
