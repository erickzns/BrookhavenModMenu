-- Configuração inicial do ModMenu
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 300, 0, 400)
mainMenu.Position = UDim2.new(0.5, -150, 0.5, -200)
mainMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
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

-- Barra de rolagem
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

-- Movimentação do menu
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

-- Botões Laterais
local buttons = {
    {name = "Geral", position = 10},
    {name = "Arma", position = 70},
    {name = "Jogador", position = 130},
    {name = "Configurações", position = 190},
    {name = "Avançado", position = 250},
    {name = "Dinheiro", position = 310}
}

local submenus = {}

for _, btn in ipairs(buttons) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = UDim2.new(0, 10, 0, btn.position)
    button.Text = btn.name
    button.Parent = mainMenu
    
    local submenu = Instance.new("Frame")
    submenu.Size = UDim2.new(0, 180, 0, 300)
    submenu.Position = UDim2.new(0, 120, 0, 10)
    submenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    submenu.Visible = false
    submenu.Parent = mainMenu
    submenus[button] = submenu
    
    button.MouseButton1Click:Connect(function()
        for _, sm in pairs(submenus) do sm.Visible = false end
        submenu.Visible = true
    end)
end

-- Funções de Trapaça
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

-- Funções Avançadas
local function crasharJogadores()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            player:Kick("Erro fatal no servidor!")
        end
    end
    print("Jogadores crashados!")
end

-- Funções Dinheiro
local function pegarDinheiro()
    local player = game.Players.LocalPlayer
    local money = player.leaderstats and player.leaderstats.Money or nil
    if money then
        money.Value = money.Value + 1000000
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

-- Criando as opções dentro dos submenus
createOption(submenus[buttons[1]], "Ativar Invisibilidade", ativarInvisibilidade)
createOption(submenus[buttons[1]], "Ativar Super Velocidade", ativarSuperVelocidade)
createOption(submenus[buttons[1]], "Ativar Teleporte Rápido", ativarTeleporteRapido)
createOption(submenus[buttons[1]], "Vida Infinita", ativarVidaInfinita)
createOption(submenus[buttons[2]], "Ativar Aimbot", ativarAimbot)
createOption(submenus[buttons[3]], "Ativar ESP", ativarESP)
createOption(submenus[buttons[4]], "Invocar Objeto", crasharJogadores)
createOption(submenus[buttons[5]], "Pegar Dinheiro", pegarDinheiro)

print("Ghost Menu V1 Carregado com Sucesso!")
