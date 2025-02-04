local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local OpenButton = Instance.new("TextButton")

-- Criando os botões laterais
local GeralButton = Instance.new("TextButton")
local ArmaButton = Instance.new("TextButton")
local JogadorButton = Instance.new("TextButton")
local ConfigButton = Instance.new("TextButton")

-- Criando os Submenus
local GeralFrame = Instance.new("Frame")
local ArmaFrame = Instance.new("Frame")
local JogadorFrame = Instance.new("Frame")
local ConfigFrame = Instance.new("Frame")

-- Configuração do ScreenGui
ScreenGui.Parent = game:GetService("CoreGui")

-- Configuração do botão para abrir o menu
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 100, 0, 50)
OpenButton.Position = UDim2.new(0, 10, 0.5, -25)
OpenButton.Text = "Abrir Menu"
OpenButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Configuração do menu principal
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Visible = false

-- Configuração dos botões laterais
local buttons = {GeralButton, ArmaButton, JogadorButton, ConfigButton}
local buttonNames = {"Geral", "Arma", "Jogador", "Config"}

for i, button in ipairs(buttons) do
    button.Parent = MainFrame
    button.Size = UDim2.new(0, 80, 0, 50)
    button.Position = UDim2.new(0, 10, 0, (i - 1) * 60 + 10)
    button.Text = buttonNames[i]
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end

-- Configuração dos Submenus
local submenus = {GeralFrame, ArmaFrame, JogadorFrame, ConfigFrame}

for i, frame in ipairs(submenus) do
    frame.Parent = MainFrame
    frame.Size = UDim2.new(0, 200, 0, 300)
    frame.Position = UDim2.new(0, 90, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    frame.Visible = false
end

-- Adicionando funções ao submenu Geral
local SpeedButton = Instance.new("TextButton")
SpeedButton.Parent = GeralFrame
SpeedButton.Size = UDim2.new(0, 180, 0, 50)
SpeedButton.Position = UDim2.new(0, 10, 0, 10)
SpeedButton.Text = "Velocidade X2"
SpeedButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

SpeedButton.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
end)

-- Adicionando funções ao submenu Arma
local AimbotButton = Instance.new("TextButton")
AimbotButton.Parent = ArmaFrame
AimbotButton.Size = UDim2.new(0, 180, 0, 50)
AimbotButton.Position = UDim2.new(0, 10, 0, 10)
AimbotButton.Text = "Ativar Aimbot"
AimbotButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

AimbotButton.MouseButton1Click:Connect(function()
    print("Aimbot ativado!") -- Aqui você pode adicionar o código real do Aimbot
end)

-- Adicionando funções ao submenu Jogador
local TeleportButton = Instance.new("TextButton")
TeleportButton.Parent = JogadorFrame
TeleportButton.Size = UDim2.new(0, 180, 0, 50)
TeleportButton.Position = UDim2.new(0, 10, 0, 10)
TeleportButton.Text = "Teleportar"
TeleportButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

TeleportButton.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, 100, 0))
end)

-- Adicionando funções ao submenu Configurações
local ColorButton = Instance.new("TextButton")
ColorButton.Parent = ConfigFrame
ColorButton.Size = UDim2.new(0, 180, 0, 50)
ColorButton.Position = UDim2.new(0, 10, 0, 10)
ColorButton.Text = "Mudar Cor"
ColorButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

ColorButton.MouseButton1Click:Connect(function()
    MainFrame.BackgroundColor3 = Color3.fromRGB(math.random(50, 255), math.random(50, 255), math.random(50, 255))
end)

-- Sistema para alternar entre os submenus
GeralButton.MouseButton1Click:Connect(function()
    for _, frame in ipairs(submenus) do frame.Visible = false end
    GeralFrame.Visible = true
end)

ArmaButton.MouseButton1Click:Connect(function()
    for _, frame in ipairs(submenus) do frame.Visible = false end
    ArmaFrame.Visible = true
end)

JogadorButton.MouseButton1Click:Connect(function()
    for _, frame in ipairs(submenus) do frame.Visible = false end
    JogadorFrame.Visible = true
end)

ConfigButton.MouseButton1Click:Connect(function()
    for _, frame in ipairs(submenus) do frame.Visible = false end
    ConfigFrame.Visible = true
end)

-- Botão para abrir e fechar o menu
OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)
