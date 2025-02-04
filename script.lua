-- Criação do ScreenGui e Menu Principal
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 300, 0, 400)
mainMenu.Position = UDim2.new(0, 10, 0.5, -200)  -- Posição ajustada para o canto esquerdo da tela
mainMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainMenu.Parent = screenGui

-- Criação dos Botões Laterais
local buttons = {
    {name = "Geral", position = 10},
    {name = "Arma", position = 70},
    {name = "Jogador", position = 130},
    {name = "Configurações", position = 190},
    {name = "Avançado", position = 250}
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

-- Funções de Aimbot e ESP (apenas exemplo básico de implementação)
local function ativarAimbot()
    print("Aimbot ativado!")
end

local function ativarESP()
    print("ESP ativado!")
end

-- Função para crashar jogadores (com efeito indetectável)
local function crasharJogadoresIndetectavel()
    -- Simulação de desconexão
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            -- Simula a desconexão de forma indetectável
            player:Kick("Erro fatal no servidor!")
        end
    end
    print("Jogadores crashados!")
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
createOption(armaSubMenu, "Ativar Aimbot", ativarAimbot)
createOption(jogadorSubMenu, "Ativar ESP", ativarESP)
createOption(avancadoSubMenu, "Crashar Jogadores", crasharJogadoresIndetectavel)

-- Função de inicialização e conclusão
print("ModMenu iniciado com sucesso!")
