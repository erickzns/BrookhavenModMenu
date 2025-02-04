-- Configuração da Interface
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

-- Botões Laterais
local GERALButton = Instance.new("TextButton")
local ARMAButton = Instance.new("TextButton")
local JOGADORButton = Instance.new("TextButton")
local VEICULOSButton = Instance.new("TextButton")
local TROLLSButton = Instance.new("TextButton")
local CONFIGURACAOButton = Instance.new("TextButton")

-- Configuração da interface
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
Title.Text = "Mod Menu"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 24

-- Função para configurar os botões laterais
local function createButton(text, positionY, parent)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0, 0, positionY, 0)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18
    return button
end

-- Criar os botões laterais com suas posições
GERALButton = createButton("Geral", 0.1, MainFrame)
ARMAButton = createButton("Arma", 0.2, MainFrame)
JOGADORButton = createButton("Jogador", 0.3, MainFrame)
VEICULOSButton = createButton("Veículos", 0.4, MainFrame)
TROLLSButton = createButton("Trolls", 0.5, MainFrame)
CONFIGURACAOButton = createButton("Configuração", 0.6, MainFrame)

-- Funções para ativar as opções
GERALButton.MouseButton1Click:Connect(function()
    print("Geral Menu Ativado")
end)

ARMAButton.MouseButton1Click:Connect(function()
    print("Menu de Armas Ativado")
end)

JOGADORButton.MouseButton1Click:Connect(function()
    print("Menu de Jogador Ativado")
end)

VEICULOSButton.MouseButton1Click:Connect(function()
    print("Menu de Veículos Ativado")
end)

TROLLSButton.MouseButton1Click:Connect(function()
    print("Menu de Trolls Ativado")
end)

CONFIGURACAOButton.MouseButton1Click:Connect(function()
    print("Menu de Configuração Ativado")
end)
