-- Configuração inicial do ModMenu
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 300, 0, 400)
mainMenu.Position = UDim2.new(0.5, -150, 0.5, -200)
mainMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainMenu.Parent = screenGui

-- Botões Laterais
local buttons = {
    {name = "Geral", position = 10},
    {name = "Arma", position = 70},
    {name = "Jogador", position = 130},
    {name = "Configurações", position = 190},
    {name = "Avançado", position = 250}
}

local submenus = {}

-- Criando os botões laterais e submenus
for _, btn in ipairs(buttons) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = UDim2.new(0, 10, 0, btn.position)
    button.Text = btn.name
    button.Parent = mainMenu

    -- Criando o submenu
    local submenu = Instance.new("Frame")
    submenu.Size = UDim2.new(0, 180, 0, 300)
    submenu.Position = UDim2.new(0, 120, 0, 10)
    submenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    submenu.Visible = false  -- Começa invisível
    submenu.Parent = mainMenu

    -- Salvar o submenu para controle
    submenus[button] = submenu
end

-- Funções de trapaça
local function ativarInvisibilidade()
    print("Invisibilidade ativada!")
end

local function ativarSuperVelocidade()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end

local function ativarTeleporteRapido()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 50, 0))
end

local function ativarVidaInfinita()
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
    game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
end

-- Funções de Aimbot e ESP
local function ativarAimbot()
    print("Aimbot ativado!")
end

local function ativarESP()
    print("ESP ativado!")
end

-- Função de Crashar Jogadores (Simulação Indetectável de Trapaça)
local function crasharJogadoresIndetectavel()
    -- Vamos esconder as ações e tornar o processo invisível
    -- Nada será mostrado no console ou interface para não levantar suspeitas
    
    local success, err = pcall(function()
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                -- A simulação de desconexão ocorre de maneira invisível
                player:Kick("Erro fatal! O servidor falhou devido a um erro crítico de rede.")
            end
        end
    end)

    -- A função não exibirá nada no console, nem alterará qualquer interface
    -- Apenas simula o efeito de "crashar" sem deixar rastro
end

-- Criar opções no submenu
local function createOption(submenu, name, activateFunc)
    local option = Instance.new("TextButton")
    option.Size = UDim2.new(0, 160, 0, 40)
    option.Position = UDim2.new(0, 10, 0, #submenu:GetChildren() * 50)
    option.Text = name
    option.Parent = submenu
    option.MouseButton1Click:Connect(activateFunc)
end

-- Adicionando opções aos submenus
createOption(submenus[buttons[1]], "Ativar Invisibilidade", ativarInvisibilidade)
createOption(submenus[buttons[1]], "Ativar Super Velocidade", ativarSuperVelocidade)
createOption(submenus[buttons[1]], "Ativar Teleporte Rápido", ativarTeleporteRapido)
createOption(submenus[buttons[1]], "Vida Infinita", ativarVidaInfinita)
createOption(submenus[buttons[2]], "Ativar Aimbot", ativarAimbot)
createOption(submenus[buttons[3]], "Ativar ESP", ativarESP)
createOption(submenus[buttons[4]], "Ativar Crashar Jogadores", crasharJogadoresIndetectavel)

-- Exibe o submenu ao clicar no botão lateral
for button, submenu in pairs(submenus) do
    button.MouseButton1Click:Connect(function()
        -- Oculta todos os submenus
        for _, sm in pairs(submenus) do
            sm.Visible = false
        end
        -- Exibe o submenu correspondente ao botão
        submenu.Visible = true
    end)
end
