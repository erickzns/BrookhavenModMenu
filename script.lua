-- Mod Menu Completo para Roblox com rolagem e caixas de seleção
-- Certifique-se de usar scripts em conformidade com os Termos de Serviço do Roblox.

-- Interface de Usuário
local ScreenGui = Instance.new("ScreenGui")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UICorner = Instance.new("UICorner")

-- Adicionando caixas de seleção para cada função
local functions = {
    {name = "Velocidade Extra (Speed Hack)", position = UDim2.new(0, 10, 0, 10), action = function(value)
        local Player = game.Players.LocalPlayer
        Player.Character.Humanoid.WalkSpeed = value and 50 or 16 -- 16 é o valor padrão
    end},
    {name = "Super Salto (Super Jump)", position = UDim2.new(0, 10, 0, 50), action = function(value)
        local Player = game.Players.LocalPlayer
        Player.Character.Humanoid.JumpPower = value and 100 or 50 -- 50 é o valor padrão
    end},
    {name = "Gravidade Zero (Low Gravity)", position = UDim2.new(0, 10, 0, 90), action = function(value)
        game.Workspace.Gravity = value and 50 or 196.2 -- 196.2 é o valor padrão
    end},
    {name = "Invencibilidade (God Mode)", position = UDim2.new(0, 10, 0, 130), action = function(value)
        local Player = game.Players.LocalPlayer
        Player.Character.Humanoid.MaxHealth = value and math.huge or 100
        Player.Character.Humanoid.Health = value and math.huge or 100
    end},
    {name = "Voo (Fly)", position = UDim2.new(0, 10, 0, 170), action = function(value)
        local Player = game.Players.LocalPlayer
        local Humanoid = Player.Character.Humanoid
        Humanoid.PlatformStand = value
        Humanoid:ChangeState(value and Enum.HumanoidStateType.Physics or Enum.HumanoidStateType.Running)
    end},
    {name = "Mudar Aparência (Character Customization)", position = UDim2.new(0, 10, 0, 210), action = function(value)
        -- Adicione a lógica para abrir o editor de aparência
    end},
    {name = "Mudar Cores (Color Swap)", position = UDim2.new(0, 10, 0, 250), action = function(value)
        -- Adicione a lógica para alterar cores
    end},
    {name = "Mudar o Céu (Skybox)", position = UDim2.new(0, 10, 0, 290), action = function(value)
        -- Adicione a lógica para alterar o céu
    end},
    {name = "Efeitos Visuais (Visual Effects)", position = UDim2.new(0, 10, 0, 330), action = function(value)
        -- Adicione a lógica para ativar efeitos visuais
    end},
    {name = "Desempenho Máximo (Max Performance)", position = UDim2.new(0, 10, 0, 370), action = function(value)
        -- Adicione a lógica para ativar máxima performance
    end},
    {name = "FPS Boost", position = UDim2.new(0, 10, 0, 410), action = function(value)
        -- Adicione a lógica para ativar FPS Boost
    end},
    {name = "Modo de Construção (Build Mode)", position = UDim2.new(0, 10, 0, 450), action = function(value)
        -- Adicione a lógica para ativar modo de construção
    end},
    {name = "Manipular Objetos (Object Manipulation)", position = UDim2.new(0, 10, 0, 490), action = function(value)
        -- Adicione a lógica para manipular objetos
    end},
    {name = "Teleportar (Teleportation)", position = UDim2.new(0, 10, 0, 530), action = function(value)
        -- Adicione a lógica para teletransportar
    end},
    {name = "Modo de Espectador (Spectator Mode)", position = UDim2.new(0, 10, 0, 570), action = function(value)
        -- Adicione a lógica para ativar modo espectador
    end},
    {name = "Mostrar/Ocultar Jogadores (Show/Hide Players)", position = UDim2.new(0, 10, 0, 610), action = function(value)
        -- Adicione a lógica para mostrar/ocultar jogadores
    end},
    {name = "Modo Noturno (Night Mode)", position = UDim2.new(0, 10, 0, 650), action = function(value)
        -- Adicione a lógica para ativar modo noturno
    end},
    {name = "Recompensas Automáticas (Auto Collect)", position = UDim2.new(0, 10, 0, 690), action = function(value)
        -- Adicione a lógica para ativar coleta automática
    end},
    {name = "Auto Play (Auto Play Mode)", position = UDim2.new(0, 10, 0, 730), action = function(value)
        -- Adicione a lógica para ativar auto play
    end},
    {name = "HUD Personalizável (Customizable HUD)", position = UDim2.new(0, 10, 0, 770), action = function(value)
        -- Adicione a lógica para personalizar HUD
    end},
    {name = "Comandos de Chat", position = UDim2.new(0, 10, 0, 810), action = function(value)
        -- Adicione a lógica para ativar comandos de chat
    end},
}

-- Propriedades da Interface
ScreenGui.Parent = game.CoreGui

ScrollingFrame.Parent = ScreenGui
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ScrollingFrame.Position = UDim2.new(0, 50, 0, 50)
ScrollingFrame.Size = UDim2.new(0, 220, 0, 400)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #functions * 40 + 10)
ScrollingFrame.ScrollBarThickness = 10

UICorner.Parent = ScrollingFrame

-- Função para criar caixas de seleção
local function createCheckbox(name, position, action)
    local checkbox = Instance.new("TextButton")
    checkbox.Parent = ScrollingFrame
    checkbox.Text = "[ ] " .. name
    checkbox.Size = UDim2.new(0, 200, 0, 30)
    checkbox.Position = position
    checkbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    checkbox.MouseButton1Click:Connect(function()
        local isActive = checkbox.Text:sub(1, 3) == "[x]"
        checkbox.Text = isActive and "[ ] " .. name or "[x] " .. name
        action(not isActive)
    end)
end

-- Criar todas as caixas de seleção
for _, func in pairs(functions) do
    createCheckbox(func.name, func.position, func.action)
end

-- Mostrar o GUI
ScreenGui.Enabled = true
