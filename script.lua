-- GUI Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 600)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -300)
MainFrame.Draggable = true

-- Barra de Título
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Mod Menu - Ilha Bela"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 24

-- Menu Lateral
local Sidebar = Instance.new("Frame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Sidebar.Size = UDim2.new(0, 100, 1, 0)

-- Botões Laterais
local GeralButton = Instance.new("TextButton")
GeralButton.Parent = Sidebar
GeralButton.Size = UDim2.new(0, 100, 0, 50)
GeralButton.Position = UDim2.new(0, 0, 0, 0)
GeralButton.Text = "Geral"
GeralButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GeralButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
GeralButton.Font = Enum.Font.SourceSans
GeralButton.TextSize = 18

local ArmaButton = Instance.new("TextButton")
ArmaButton.Parent = Sidebar
ArmaButton.Size = UDim2.new(0, 100, 0, 50)
ArmaButton.Position = UDim2.new(0, 0, 0.1, 0)
ArmaButton.Text = "Arma"
ArmaButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ArmaButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ArmaButton.Font = Enum.Font.SourceSans
ArmaButton.TextSize = 18

local JogadorButton = Instance.new("TextButton")
JogadorButton.Parent = Sidebar
JogadorButton.Size = UDim2.new(0, 100, 0, 50)
JogadorButton.Position = UDim2.new(0, 0, 0.2, 0)
JogadorButton.Text = "Jogador"
JogadorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JogadorButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
JogadorButton.Font = Enum.Font.SourceSans
JogadorButton.TextSize = 18

local ConfigButton = Instance.new("TextButton")
ConfigButton.Parent = Sidebar
ConfigButton.Size = UDim2.new(0, 100, 0, 50)
ConfigButton.Position = UDim2.new(0, 0, 0.3, 0)
ConfigButton.Text = "Configuração"
ConfigButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfigButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ConfigButton.Font = Enum.Font.SourceSans
ConfigButton.TextSize = 18

-- Submenu Geral
local GeralFrame = Instance.new("Frame")
GeralFrame.Parent = MainFrame
GeralFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
GeralFrame.Size = UDim2.new(0, 300, 0, 300)
GeralFrame.Position = UDim2.new(0, 100, 0, 50)
GeralFrame.Visible = false

-- Funções do Submenu Geral
local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Parent = GeralFrame
SpeedToggle.Size = UDim2.new(0, 280, 0, 50)
SpeedToggle.Position = UDim2.new(0, 10, 0, 0)
SpeedToggle.Text = "Alterar Velocidade"
SpeedToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SpeedToggle.Font = Enum.Font.SourceSans
SpeedToggle.TextSize = 18

local TeleportToggle = Instance.new("TextButton")
TeleportToggle.Parent = GeralFrame
TeleportToggle.Size = UDim2.new(0, 280, 0, 50)
TeleportToggle.Position = UDim2.new(0, 10, 0, 60)
TeleportToggle.Text = "Teletransportar"
TeleportToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TeleportToggle.Font = Enum.Font.SourceSans
TeleportToggle.TextSize = 18

-- Submenu Arma
local ArmaFrame = Instance.new("Frame")
ArmaFrame.Parent = MainFrame
ArmaFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ArmaFrame.Size = UDim2.new(0, 300, 0, 300)
ArmaFrame.Position = UDim2.new(0, 100, 0, 50)
ArmaFrame.Visible = false

-- Funções do Submenu Arma
local AimbotToggle = Instance.new("TextButton")
AimbotToggle.Parent = ArmaFrame
AimbotToggle.Size = UDim2.new(0, 280, 0, 50)
AimbotToggle.Position = UDim2.new(0, 10, 0, 0)
AimbotToggle.Text = "Ativar Aimbot"
AimbotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AimbotToggle.Font = Enum.Font.SourceSans
AimbotToggle.TextSize = 18

-- Submenu Jogador
local JogadorFrame = Instance.new("Frame")
JogadorFrame.Parent = MainFrame
JogadorFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
JogadorFrame.Size = UDim2.new(0, 300, 0, 300)
JogadorFrame.Position = UDim2.new(0, 100, 0, 50)
JogadorFrame.Visible = false

-- Funções do Submenu Jogador
local ESPToggle = Instance.new("TextButton")
ESPToggle.Parent = JogadorFrame
ESPToggle.Size = UDim2.new(0, 280, 0, 50)
ESPToggle.Position = UDim2.new(0, 10, 0, 0)
ESPToggle.Text = "Ativar ESP"
ESPToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ESPToggle.Font = Enum.Font.SourceSans
ESPToggle.TextSize = 18

-- Função para Exibir e Ocultar Submenus
GeralButton.MouseButton1Click:Connect(function()
    GeralFrame.Visible = not GeralFrame.Visible
    ArmaFrame.Visible = false
    JogadorFrame.Visible = false
end)

ArmaButton.MouseButton1Click:Connect(function()
    ArmaFrame.Visible = not ArmaFrame.Visible
    GeralFrame.Visible = false
    JogadorFrame.Visible = false
end)

JogadorButton.MouseButton1Click:Connect(function()
    JogadorFrame.Visible = not JogadorFrame.Visible
    GeralFrame.Visible = false
    ArmaFrame.Visible = false
end)

ConfigButton.MouseButton1Click:Connect(function()
    print("Configurações ainda não implementadas.")
end)

-- Funções de Trapaça
SpeedToggle.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 50
    print("Velocidade alterada!")
end)

TeleportToggle.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local teleportPosition = Vector3.new(0, 10, 0) -- Posição para teleportar
    humanoidRootPart.CFrame = CFrame.new(teleportPosition)
    print("Teletransportado!")
end)

AimbotToggle.MouseButton1Click:Connect(function()
    print("Aimbot ativado!")
    -- Aqui você pode adicionar o código do Aimbot.
end)

ESPToggle.MouseButton1Click:Connect(function()
    print("ESP ativado!")
    -- Aqui você pode adicionar o código do ESP.
end)
