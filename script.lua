-- Mod Menu Completo para Roblox com rolagem e caixas de seleção
-- Certifique-se de usar scripts em conformidade com os Termos de Serviço do Roblox.

-- Interface de Usuário
local ScreenGui = Instance.new("ScreenGui")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- Adicionando caixas de seleção para cada função
local functions = {
    {name = "Velocidade Extra (Speed Hack)", action = function(value)
        local Player = game.Players.LocalPlayer
        Player.Character.Humanoid.WalkSpeed = value and 50 or 16 -- 16 é o valor padrão
    end},
    {name = "Super Salto (Super Jump)", action = function(value)
        local Player = game.Players.LocalPlayer
        Player.Character.Humanoid.JumpPower = value and 100 or 50 -- 50 é o valor padrão
    end},
    {name = "Gravidade Zero (Low Gravity)", action = function(value)
        game.Workspace.Gravity = value and 50 or 196.2 -- 196.2 é o valor padrão
    end},
    {name = "Invencibilidade (God Mode)", action = function(value)
        local Player = game.Players.LocalPlayer
        Player.Character.Humanoid.MaxHealth = value and math.huge or 100
        Player.Character.Humanoid.Health = value and math.huge or 100
    end},
    {name = "Voo (Fly)", action = function(value)
        local Player = game.Players.LocalPlayer
        local Humanoid = Player.Character.Humanoid
        Humanoid.PlatformStand = value
        Humanoid:ChangeState(value and Enum.HumanoidStateType.Physics or Enum.HumanoidStateType.Running)
    end},
    {name = "Mudar Aparência (Character Customization)", action = function(value)
        -- Adicione a lógica para abrir o editor de aparência
    end},
    {name = "Mudar Cores (Color Swap)", action = function(value)
        -- Adicione a lógica para alterar cores
    end},
    {name = "Mudar o Céu (Skybox)", action = function(value)
        -- Adicione a lógica para alterar o céu
    end},
    {name = "Efeitos Visuais (Visual Effects)", action = function(value)
        -- Adicione a lógica para ativar efeitos visuais
    end},
    {name = "Desempenho Máximo (Max Performance)", action = function(value)
        -- Adicione a lógica para ativar máxima performance
    end},
    {name = "FPS Boost", action = function(value)
        -- Adicione a lógica para ativar FPS Boost
    end},
    {name = "Modo de Construção (Build Mode)", action = function(value)
        -- Adicione a lógica para ativar modo de construção
    end},
    {name = "Manipular Objetos (Object Manipulation)", action = function(value)
        -- Adicione a lógica para manipular objetos
    end},
    {name = "Teleportar (Teleportation)", action = function(value)
        -- Adicione a lógica para teletransportar
    end},
    {name = "Modo de Espectador (Spectator Mode)", action = function(value)
        -- Adicione a lógica para ativar modo espectador
    end},
    {name = "Mostrar/Ocultar Jogadores (Show/Hide Players)", action = function(value)
        -- Adicione a lógica para mostrar/ocultar jogadores
    end},
    {name = "Modo Noturno (Night Mode)", action = function(value)
        -- Adicione a lógica para ativar modo noturno
    end},
    {name = "Recompensas Automáticas (Auto Collect)", action = function(value)
        -- Adicione a lógica para ativar coleta automática
    end},
    {name = "Auto Play (Auto Play Mode)", action = function(value)
        -- Adicione a lógica para ativar auto play
    end},
    {name = "HUD Personalizável (Customizable HUD)", action = function(value)
        -- Adicione a lógica para personalizar HUD
    end},
    {name = "Comandos de Chat", action = function(value)
        -- Adicione a lógica para ativar comandos de chat
    end},
}

-- Propriedades da Interface
ScreenGui.Parent = game.CoreGui

ScrollingFrame.Parent = ScreenGui
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ScrollingFrame.Position = UDim2.new(0, 50, 0, 50)
ScrollingFrame.Size = UDim2.new(0, 300, 0, 300) -- Altura ajustada para 300
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #functions * 40)
ScrollingFrame.ScrollBarThickness = 10

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Função para criar caixas de seleção
local function createCheckbox(name, action)
    local checkbox = Instance.new("TextButton")
    checkbox.Parent = ScrollingFrame
    checkbox.Text = "[ ] " .. name
    checkbox.Size = UDim2.new(0, 280, 0, 30)
    checkbox
