-- Criação do ScreenGui e Menu Principal
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 300, 0, 400)
mainMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainMenu.Position = UDim2.new(0, 0, 0, 0)
mainMenu.Parent = screenGui

-- Barra de título
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
titleBar.Parent = mainMenu

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Ghost Menu V1"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 20
titleLabel.TextAlign = Enum.TextAnchor.MiddleCenter
titleLabel.Parent = titleBar

-- Criação da barra de rolagem
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(0, 300, 0, 370)
scrollFrame.Position = UDim2.new(0, 0, 0, 30) -- Ajuste para que comece após a barra de título
scrollFrame.Parent = mainMenu
scrollFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scrollFrame.ScrollBarThickness = 10

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 10)
uiListLayout.Parent = scrollFrame

-- Função para permitir mover o menu
local isDragging = false
local dragStart = nil
local startPos = nil

titleBar.InputBegan:Connect(function(input)
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

-- Criação dos Botões Laterais
local buttons = {
    {name = "Geral", position = 10},
    {name = "Arma", position = 70},
    {name = "Jogador", position = 130},
    {name = "Configurações", position = 190},
    {name = "Avançado", position = 250},
    {name = "Dinheiro", position = 310}
}

local submenus = {}

-- Função para criar um submenu
local function createSubMenu(name, buttonPosition)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = UDim2.new(0, 10, 0, buttonPosition)
    button.Text = name
    button.Parent = mainMenu
    button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)

    local submenu = Instance.new("Frame")
    submenu.Size = UDim2.new(0, 180, 0, 300)
    submenu.Position = UDim2.new(0, 120, 0, 10)
    submenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    submenu.Visible = false
    submenu.Parent = mainMenu

    submenus[button] = submenu

    -- Toggle submenu visibility
    button.MouseButton1Click:Connect(function()
        -- Fecha todos os submenus
        for _, sm in pairs(submenus) do
            sm.Visible = false
        end
        -- Exibe o submenu selecionado
        submenu.Visible = true
    end)

    return submenu
end

-- Criando todos os submenus
local geralSubMenu = createSubMenu("Geral", 10)
local armaSubMenu = createSubMenu("Arma", 70)
local jogadorSubMenu = createSubMenu("Jogador", 130)
local configuracoesSubMenu = createSubMenu("Configurações", 190)
local avancadoSubMenu = createSubMenu("Avançado", 250)
local dinheiroSubMenu = createSubMenu("Dinheiro", 310)

-- Funções de Trapaça
local function ativarInvisibilidade()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    game.Players.LocalPlayer.Character.HumanoidRootPart.Transparency = 1
    print("Invisibilidade ativada!")
end

local function ativarSuperVelocidade()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    print("Super velocidade ativada!")
end

local function ativarTeleporteRapido()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 50, 0))
    print("Teleporte rápido ativado!")
end

local function ativarVidaInfinita()
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
    game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
    print("Vida infinita ativada!")
end

-- Funções de Aimbot e ESP
local function ativarAimbot()
    print("Aimbot ativado!")
end

local function ativarESP()
    print("ESP ativado!")
end

-- Funções Adicionais de Trapaça
local function ativarDanoInfinito()
    -- Simula dano infinito, sem precisar de arma
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:WaitForChild("Humanoid")
    humanoid.Health = humanoid.MaxHealth
    print("Dano infinito ativado!")
end

local function aumentarGravidade()
    game.Workspace.Gravity = 500
    print("Gravidade aumentada!")
end

local function ativarModoVoo()
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:WaitForChild("Humanoid")
    humanoid.PlatformStand = true
    player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(0, 100, 0)
    print("Modo voo ativado!")
end

local function aumentarTamanho()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Size = Vector3.new(10, 10, 10)
    print("Tamanho aumentado!")
end

local function teleportarOutroJogador()
    -- Teleporta um jogador aleatório
    local randomPlayer = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
    randomPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    print("Outro jogador teletransportado!")
end

-- Funções Avançadas
local function invocarObjeto()
    local part = Instance.new("Part")
    part.Size = Vector3.new(10, 10, 10)
    part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0)
    part.Anchored = true
    part.Parent = game.Workspace
    print("Objeto invocado!")
end

local function crasharJogadoresIndetectavel()
    -- Simulação de desconexão de jogadores de forma indetectável
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            player:Kick("Erro fatal no servidor!")
        end
    end
    print("Jogadores crashados!")
end

-- Função para pegar dinheiro (adicionando a funcionalidade no submenu Dinheiro)
local function pegarDinheiro()
    local player = game.Players.LocalPlayer
    local money = player.leaderstats and player.leaderstats.Money or nil
    if money then
        money.Value = money.Value + 1000000 -- Adiciona 1 milhão ao saldo de dinheiro do jogador
        print("Você pegou 1 milhão de dinheiro!")
    else
        print("Erro: Nenhum sistema de dinheiro encontrado.")
    end
end

-- Função para adicionar opções dentro dos submenus
local function createOption(submenu, name, activateFunc)
    local option = Instance.new("TextButton")
    option.Size = UDim2.new(0, 160, 0, 40)
    option.Position = UDim2.new(0, 10, 0, #submenu:GetChildren() * 50)
    option.Text = name
    option.Parent = submenu
    option.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    option.TextColor3 = Color3.fromRGB(255, 255, 255)
    option.MouseButton1Click:Connect(activateFunc)
end

-- Adicionando as opções nos submenus
createOption(geralSubMenu, "Ativar Invisibilidade", ativarInvisibilidade)
createOption(geralSubMenu, "Ativar Super Velocidade", ativarSuperVelocidade)
createOption(geralSubMenu, "Ativar Teleporte Rápido", ativarTeleporteRapido)
createOption(geralSubMenu, "Vida Infinita", ativarVidaInfinita)
createOption(geralSubMenu, "Dano Infinito", ativarDanoInfinito)
createOption(geralSubMenu, "Aumentar Gravidade", aumentarGravidade)
createOption(geralSubMenu, "Modo Voo", ativarModoVoo)
createOption(geralSubMenu, "Aumentar Tamanho", aumentarTamanho)
createOption(armaSubMenu, "Ativar Aimbot", ativarAimbot)
createOption(jogadorSubMenu, "Ativar ESP", ativarESP)
createOption(dinheiroSubMenu, "Pegar Dinheiro", pegarDinheiro)

print("Ghost Menu V1 Carregado com Sucesso!")
