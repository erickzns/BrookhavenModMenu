-- Configuração da Interface
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local MenuButton = Instance.new("TextButton")  -- Botão para abrir/fechar o menu
local SideMenu = Instance.new("Frame")  -- Menu lateral com botões
local GeneralButton = Instance.new("TextButton")  -- Botão Geral
local WeaponButton = Instance.new("TextButton")  -- Botão Arma
local PlayerButton = Instance.new("TextButton")  -- Botão Jogador
local VehicleButton = Instance.new("TextButton")  -- Botão Veículos
local TrollButton = Instance.new("TextButton")  -- Botão Trolls
local ConfigButton = Instance.new("TextButton")  -- Botão Configuração

-- Adiciona o ScreenGui ao PlayerGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Criação do Frame principal (menu)
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Draggable = true
MainFrame.Visible = false  -- Inicialmente o menu está oculto

-- Criação do botão para abrir o menu
MenuButton.Parent = ScreenGui
MenuButton.Size = UDim2.new(0, 100, 0, 50)
MenuButton.Position = UDim2.new(0, 10, 0.5, -25)
MenuButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MenuButton.Text = "Abrir Menu"
MenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MenuButton.Font = Enum.Font.SourceSans
MenuButton.TextSize = 18

-- Criação do título no menu
Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Mod Menu"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 24

-- Criação do menu lateral
SideMenu.Parent = MainFrame
SideMenu.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SideMenu.Size = UDim2.new(0, 100, 1, 0)

-- Botões laterais para abrir submenus
GeneralButton.Parent = SideMenu
GeneralButton.Size = UDim2.new(0, 100, 0, 50)
GeneralButton.Position = UDim2.new(0, 0, 0, 50)
GeneralButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
GeneralButton.Text = "Geral"
GeneralButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GeneralButton.Font = Enum.Font.SourceSans
GeneralButton.TextSize = 18

WeaponButton.Parent = SideMenu
WeaponButton.Size = UDim2.new(0, 100, 0, 50)
WeaponButton.Position = UDim2.new(0, 0, 0, 100)
WeaponButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
WeaponButton.Text = "Arma"
WeaponButton.TextColor3 = Color3.fromRGB(255, 255, 255)
WeaponButton.Font = Enum.Font.SourceSans
WeaponButton.TextSize = 18

PlayerButton.Parent = SideMenu
PlayerButton.Size = UDim2.new(0, 100, 0, 50)
PlayerButton.Position = UDim2.new(0, 0, 0, 150)
PlayerButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
PlayerButton.Text = "Jogador"
PlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerButton.Font = Enum.Font.SourceSans
PlayerButton.TextSize = 18

VehicleButton.Parent = SideMenu
VehicleButton.Size = UDim2.new(0, 100, 0, 50)
VehicleButton.Position = UDim2.new(0, 0, 0, 200)
VehicleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
VehicleButton.Text = "Veículos"
VehicleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VehicleButton.Font = Enum.Font.SourceSans
VehicleButton.TextSize = 18

TrollButton.Parent = SideMenu
TrollButton.Size = UDim2.new(0, 100, 0, 50)
TrollButton.Position = UDim2.new(0, 0, 0, 250)
TrollButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TrollButton.Text = "Trolls"
TrollButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TrollButton.Font = Enum.Font.SourceSans
TrollButton.TextSize = 18

ConfigButton.Parent = SideMenu
ConfigButton.Size = UDim2.new(0, 100, 0, 50)
ConfigButton.Position = UDim2.new(0, 0, 0, 300)
ConfigButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ConfigButton.Text = "Configuração"
ConfigButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfigButton.Font = Enum.Font.SourceSans
ConfigButton.TextSize = 18

-- Função para abrir e fechar o menu
MenuButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Função para abrir submenus quando o botão é pressionado
GeneralButton.MouseButton1Click:Connect(function()
    print("Abrindo submenu Geral")
    -- Adicione as opções do submenu Geral aqui
end)

WeaponButton.MouseButton1Click:Connect(function()
    print("Abrindo submenu Arma")
    -- Adicione as opções do submenu Arma aqui
end)

PlayerButton.MouseButton1Click:Connect(function()
    print("Abrindo submenu Jogador")
    -- Adicione as opções do submenu Jogador aqui
end)

VehicleButton.MouseButton1Click:Connect(function()
    print("Abrindo submenu Veículos")
    -- Adicione as opções do submenu Veículos aqui
end)

TrollButton.MouseButton1Click:Connect(function()
    print("Abrindo submenu Trolls")
    -- Adicione as opções do submenu Trolls aqui
end)

ConfigButton.MouseButton1Click:Connect(function()
    print("Abrindo submenu Configuração")
    -- Adicione as opções do submenu Configuração aqui
end)

-- Funções de Aimbot, ESP, Fly, etc.
-- Aqui você pode manter as funções anteriores de Aimbot, ESP e Fly.

