-- Configuração da Interface
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

-- Barra lateral
local Sidebar = Instance.new("Frame")
local GERALButton = Instance.new("TextButton")
local ARMAButton = Instance.new("TextButton")
local JOGADORButton = Instance.new("TextButton")
local VEICULOSButton = Instance.new("TextButton")
local TROLLSButton = Instance.new("TextButton")
local CONFIGURACAOButton = Instance.new("TextButton")

-- Configuração da interface
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui

-- Main frame do Mod Menu
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Draggable = true
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.2

-- Título do Mod Menu
Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Mod Menu"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 24
Title.TextStrokeTransparency = 0.8

-- Barra lateral
Sidebar.Parent = ScreenGui
Sidebar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Sidebar.Size = UDim2.new(0, 60, 1, 0)
Sidebar.Position = UDim2.new(0, 0, 0, 0)

-- Função para criar os botões laterais
local function createSidebarButton(text, positionY)
    local button = Instance.new("TextButton")
    button.Parent = Sidebar
    button.Size = UDim2.new(0, 60, 0, 50)
    button.Position = UDim2.new(0, 0, positionY, 0)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18
    button.TextStrokeTransparency = 0.5
    button.BackgroundTransparency = 0.1
    button.AutoButtonColor = true
    
    -- Efeito de hover (quando o mouse passa sobre o botão)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end)
    
    return button
end

-- Criar os botões laterais com suas posições
GERALButton = createSidebarButton("Geral", 0.1)
ARMAButton = createSidebarButton("Arma", 0.2)
JOGADORButton = createSidebarButton("Jogador", 0.3)
VEICULOSButton = createSidebarButton("Veículos", 0.4)
TROLLSButton = createSidebarButton("Trolls", 0.5)
CONFIGURACAOButton = createSidebarButton("Configuração", 0.6)

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
