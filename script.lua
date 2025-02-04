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
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)

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
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
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

-- Função para abrir e fechar o menu
OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Função para alternar entre os submenus
local function ToggleFrame(frame)
    for _, submenu in ipairs(submenus) do
        submenu.Visible = false
    end
    frame.Visible = true
end

-- Funções adicionais
local function ESP()
    print("ESP ativado") -- Adicionar código real aqui
end

local function GodMode()
    print("God Mode ativado") -- Adicionar código real aqui
end

local function FlyHack()
    print("Fly Hack ativado") -- Adicionar código real aqui
end

local function InfiniteJump()
    print("Infinite Jump ativado") -- Adicionar código real aqui
end

local function TeleportPlayer()
    print("Teleport para Player ativado") -- Adicionar código real aqui
end

local function SpeedBoost()
    print("Speed Boost ativado") -- Adicionar código real aqui
end

local function Aimbot()
    print("Aimbot ativado") -- Adicionar código real aqui
end

local function NoClip()
    print("NoClip ativado") -- Adicionar código real aqui
end

local function AntiKickBan()
    print("Anti-Kick e Anti-Ban ativado") -- Adicionar código real aqui
end

-- Ações dos botões para abrir os submenus
GeralButton.MouseButton1Click:Connect(function()
    ToggleFrame(GeralFrame)
end)

ArmaButton.MouseButton1Click:Connect(function()
    ToggleFrame(ArmaFrame)
end)

JogadorButton.MouseButton1Click:Connect(function()
    ToggleFrame(JogadorFrame)
end)

ConfigButton.MouseButton1Click:Connect(function()
    ToggleFrame(ConfigFrame)
end)

-- Submenu Geral
local ESPButton = Instance.new("TextButton")
ESPButton.Parent = GeralFrame
ESPButton.Size = UDim2.new(0, 180, 0, 50)
ESPButton.Position = UDim2.new(0, 10, 0, 10)
ESPButton.Text = "ESP"
ESPButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)

ESPButton.MouseButton1Click:Connect(ESP)

-- Submenu Arma
local GodModeButton = Instance.new("TextButton")
GodModeButton.Parent = ArmaFrame
GodModeButton.Size = UDim2.new(0, 180, 0, 50)
GodModeButton.Position = UDim2.new(0, 10, 0, 10)
GodModeButton.Text = "God Mode"
GodModeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GodModeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

GodModeButton.MouseButton1Click:Connect(GodMode)

-- Submenu Jogador
local FlyHackButton = Instance.new("TextButton")
FlyHackButton.Parent = JogadorFrame
FlyHackButton.Size = UDim2.new(0, 180, 0, 50)
FlyHackButton.Position = UDim2.new(0, 10, 0, 10)
FlyHackButton.Text = "Fly Hack"
FlyHackButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FlyHackButton.TextColor3 = Color3.fromRGB(255, 255, 255)

FlyHackButton.MouseButton1Click:Connect(FlyHack)

-- Submenu Config
local InfiniteJumpButton = Instance.new("TextButton")
InfiniteJumpButton.Parent = ConfigFrame
InfiniteJumpButton.Size = UDim2.new(0, 180, 0, 50)
InfiniteJumpButton.Position = UDim2.new(0, 10, 0, 10)
InfiniteJumpButton.Text = "Infinite Jump"
InfiniteJumpButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
InfiniteJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)

InfiniteJumpButton.MouseButton1Click:Connect(InfiniteJump)

-- Você pode adicionar mais botões para as funções de TeleportPlayer, SpeedBoost, Aimbot, NoClip e AntiKickBan.
