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
titleBar.Position = UDim2.new(0, 0, 0, 0)
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

-- Criação dos Botões Laterais
local buttons = {
    {name = "Geral", position = 60},
    {name = "Arma", position = 120},
    {name = "Jogador", position = 180},
    {name = "Configurações", position = 240},
    {name = "Avançado", position = 300},
    {name = "Dinheiro", position = 360}
}

local submenus = {}

-- Função para criar um submenu
local function createSubMenu(name, buttonPosition)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = UDim2.new(0, 10, 0, buttonPosition)
    button.Text = name
    button.Parent = mainMenu
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
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
local geralSubMenu = createSubMenu("Geral", 60)
local armaSubMenu = createSubMenu("Arma", 120)
local jogadorSubMenu = createSubMenu("Jogador", 180)
local configuracoesSubMenu = createSubMenu("Configurações", 240)
local avancadoSubMenu = createSubMenu("Avançado", 300)
local dinheiroSubMenu = createSubMenu("Dinheiro", 360)

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

local function pegarDinheiro()
    -- Simula pegar dinheiro infinito
    local player = game.Players.LocalPlayer
    -- Aqui você pode adicionar o código para adicionar uma quantidade de dinheiro
    print("Dinheiro pego com sucesso!")
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
createOption(jogadorSubMenu, "Teletransportar Outro Jogador", teleportarOutroJogador)
createOption(avancadoSubMenu, "Invocar Objeto", invocarObjeto)
createOption(avancadoSubMenu, "Crashar Jogadores", crasharJogadoresIndetectavel)
createOption(dinheiroSubMenu, "Pegar Dinheiro", pegarDinheiro)

-- Função de inicialização e conclusão
print("ModMenu iniciado com sucesso!")
