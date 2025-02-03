-- Mod Menu Completo para Roblox
-- Certifique-se de usar scripts em conformidade com os Termos de Serviço do Roblox.

-- Interface de Usuário
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")

-- Adicionando Botões para cada função
local buttons = {
    {name = "Ativar Velocidade", position = UDim2.new(0, 10, 0, 10), action = function()
        local Player = game.Players.LocalPlayer
        Player.Character.Humanoid.WalkSpeed = 50 -- Mude o valor conforme desejado
    end},
    {name = "Ativar Super Salto", position = UDim2.new(0, 10, 0, 50), action = function()
        local Player = game.Players.LocalPlayer
        Player.Character.Humanoid.JumpPower = 100 -- Mude o valor conforme desejado
    end},
    {name = "Ativar Gravidade Zero", position = UDim2.new(0, 10, 0, 90), action = function()
        game.Workspace.Gravity = 50 -- Mude o valor conforme desejado
    end},
    {name = "Ativar Invencibilidade", position = UDim2.new(0, 10, 0, 130), action = function()
        local Player = game.Players.LocalPlayer
        Player.Character.Humanoid.MaxHealth = math.huge
        Player.Character.Humanoid.Health = math.huge
    end},
    {name = "Ativar Voo", position = UDim2.new(0, 10, 0, 170), action = function()
        local Player = game.Players.LocalPlayer
        local Humanoid = Player.Character.Humanoid
        Humanoid.PlatformStand = true
        Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    end},
    {name = "Abrir Editor de Aparência", position = UDim2.new(0, 10, 0, 210), action = function()
        -- Adicione a lógica para abrir o editor de aparência
    end},
    {name = "Alterar Cores", position = UDim2.new(0, 10, 0, 250), action = function()
        -- Adicione a lógica para alterar cores
    end},
    {name = "Alterar Céu", position = UDim2.new(0, 10, 0, 290), action = function()
        -- Adicione a lógica para alterar o céu
    end},
    {name = "Ativar Efeitos Visuais", position = UDim2.new(0, 10, 0, 330), action = function()
        -- Adicione a lógica para ativar efeitos visuais
    end},
    {name = "Ativar Máxima Performance", position = UDim2.new(0, 10, 0, 370), action = function()
        -- Adicione a lógica para ativar máxima performance
    end},
    {name = "Ativar FPS Boost", position = UDim2.new(0, 10, 0, 410), action = function()
        -- Adicione a lógica para ativar FPS Boost
    end},
    {name = "Ativar Modo de Construção", position = UDim2.new(0, 10, 0, 450), action = function()
        -- Adicione a lógica para ativar modo de construção
    end},
    {name = "Manipular Objetos", position = UDim2.new(0, 10, 0, 490), action = function()
        -- Adicione a lógica para manipular objetos
    end},
    {name = "Teletransportar", position = UDim2.new(0, 10, 0, 530), action = function()
        -- Adicione a lógica para teletransportar
    end},
    {name = "Ativar Modo Espectador", position = UDim2.new(0, 10, 0, 570), action = function()
        -- Adicione a lógica para ativar modo espectador
    end},
    {name = "Mostrar/Ocultar Jogadores", position = UDim2.new(0, 10, 0, 610), action = function()
        -- Adicione a lógica para mostrar/ocultar jogadores
    end},
    {name = "Ativar Modo Noturno", position = UDim2.new(0, 10, 0, 650), action = function()
        -- Adicione a lógica para ativar modo noturno
    end},
    {name = "Ativar Coleta Automática", position = UDim2.new(0, 10, 0, 690), action = function()
        -- Adicione a lógica para ativar coleta automática
    end},
    {name = "Ativar Auto Play", position = UDim2.new(0, 10, 0, 730), action = function()
        -- Adicione a lógica para ativar auto play
    end},
    {name = "Personalizar HUD", position = UDim2.new(0, 10, 0, 770), action = function()
        -- Adicione a lógica para personalizar HUD
    end},
    {name = "Ativar Comandos de Chat", position = UDim2.new(0, 10, 0, 810), action = function()
        -- Adicione a lógica para ativar comandos de chat
    end},
}

-- Propriedades da Interface
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0, 50, 0, 50)
Frame.Size = UDim2.new(0, 220, 0, 850)
UICorner.Parent = Frame

-- Função para criar botões
local function createButton(name, position, action)
    local button = Instance.new("TextButton")
    button.Parent = Frame
    button.Text = name
    button.Size = UDim2.new(0, 200, 0, 30)
    button.Position = position
    button.MouseButton1Click:Connect(action)
end

-- Criar todos os botões
for _, btn in pairs(buttons) do
    createButton(btn.name, btn.position, btn.action)
end

-- Mostrar o GUI
ScreenGui.Enabled = true
