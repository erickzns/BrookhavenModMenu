-- Configuração da Interface
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local GERALButton = Instance.new("TextButton")
local ARMAButton = Instance.new("TextButton")
local JOGADORButton = Instance.new("TextButton")
local VEICULOButton = Instance.new("TextButton")
local TROLLSButton = Instance.new("TextButton")
local CONFIGURACAOButton = Instance.new("TextButton")
local SliderFrame = Instance.new("Frame")

-- Configuração do layout principal
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Ghost Menu V1"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 24

-- Configuração da barra lateral dos botões
SliderFrame.Parent = MainFrame
SliderFrame.BackgroundTransparency = 0.6
SliderFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SliderFrame.Size = UDim2.new(0, 50, 1, 0)

GERALButton.Parent = SliderFrame
GERALButton.Size = UDim2.new(0, 50, 0, 50)
GERALButton.Position = UDim2.new(0, 0, 0, 0)
GERALButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
GERALButton.Text = "GERAL"
GERALButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GERALButton.Font = Enum.Font.SourceSans
GERALButton.TextSize = 18

ARMAButton.Parent = SliderFrame
ARMAButton.Size = UDim2.new(0, 50, 0, 50)
ARMAButton.Position = UDim2.new(0, 0, 0.2, 0)
ARMAButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ARMAButton.Text = "ARMA"
ARMAButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ARMAButton.Font = Enum.Font.SourceSans
ARMAButton.TextSize = 18

JOGADORButton.Parent = SliderFrame
JOGADORButton.Size = UDim2.new(0, 50, 0, 50)
JOGADORButton.Position = UDim2.new(0, 0, 0.4, 0)
JOGADORButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
JOGADORButton.Text = "JOGADOR"
JOGADORButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JOGADORButton.Font = Enum.Font.SourceSans
JOGADORButton.TextSize = 18

VEICULOButton.Parent = SliderFrame
VEICULOButton.Size = UDim2.new(0, 50, 0, 50)
VEICULOButton.Position = UDim2.new(0, 0, 0.6, 0)
VEICULOButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
VEICULOButton.Text = "VEÍCULO"
VEICULOButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VEICULOButton.Font = Enum.Font.SourceSans
VEICULOButton.TextSize = 18

TROLLSButton.Parent = SliderFrame
TROLLSButton.Size = UDim2.new(0, 50, 0, 50)
TROLLSButton.Position = UDim2.new(0, 0, 0.8, 0)
TROLLSButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TROLLSButton.Text = "TROLLS"
TROLLSButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TROLLSButton.Font = Enum.Font.SourceSans
TROLLSButton.TextSize = 18

CONFIGURACAOButton.Parent = SliderFrame
CONFIGURACAOButton.Size = UDim2.new(0, 50, 0, 50)
CONFIGURACAOButton.Position = UDim2.new(0, 0, 1, 0)
CONFIGURACAOButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CONFIGURACAOButton.Text = "CONFIG"
CONFIGURACAOButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CONFIGURACAOButton.Font = Enum.Font.SourceSans
CONFIGURACAOButton.TextSize = 18

-- Funções do submenu (exemplo)
local function ShowGeralMenu()
    print("Funções Gerais Ativadas")
    -- Aqui você pode adicionar as funções para o menu Geral
end

local function ShowArmaMenu()
    print("Funções de Arma Ativadas")
    -- Aqui você pode adicionar as funções para o menu de Armas
end

local function ShowJogadorMenu()
    print("Funções de Jogadores Ativadas")
    -- Aqui você pode adicionar as funções para o menu de Jogadores
end

local function ShowVeiculoMenu()
    print("Funções de Veículos Ativadas")
    -- Aqui você pode adicionar as funções para o menu de Veículos
end

local function ShowTrollsMenu()
    print("Funções de Trolls Ativadas")
    -- Aqui você pode adicionar as funções para o menu de Trolls
end

local function ShowConfiguracoesMenu()
    print("Funções de Configuração Ativadas")
    -- Aqui você pode adicionar as funções para o menu de Configurações
end

-- Conectar os botões com as funções
GERALButton.MouseButton1Click:Connect(ShowGeralMenu)
ARMAButton.MouseButton1Click:Connect(ShowArmaMenu)
JOGADORButton.MouseButton1Click:Connect(ShowJogadorMenu)
VEICULOButton.MouseButton1Click:Connect(ShowVeiculoMenu)
TROLLSButton.MouseButton1Click:Connect(ShowTrollsMenu)
CONFIGURACAOButton.MouseButton1Click:Connect(ShowConfiguracoesMenu)
