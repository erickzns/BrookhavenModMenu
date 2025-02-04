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

-- Funções antigas e novas
local function ESP()
    print("ESP ativado")
end

local function GodMode()
    print("God Mode ativado")
end

local function FlyHack()
    print("Fly Hack ativado")
end

local function InfiniteJump()
    print("Infinite Jump ativado")
end

local function TeleportPlayer()
    print("Teleport para Player ativado")
end

local function SpeedBoost()
    print("Speed Boost ativado")
end

local function Aimbot()
    print("Aimbot ativado")
end

local function NoClip()
    print("NoClip ativado")
end

local function AntiKickBan()
    print("Anti-Kick e Anti-Ban ativado")
end

-- Funções para adicionar os botões aos submenus
local function AddButtonToFrame(frame, text, func)
    local button = Instance.new("TextButton")
    button.Parent = frame
    button.Size = UDim2.new(0, 180, 0, 50)
    button.Position = UDim2.new(0, 10, 0, 10)
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.MouseButton1Click:Connect(func)
end

-- Adicionando os botões aos submenus com as funções antigas e novas
AddButtonToFrame(GeralFrame, "ESP", ESP)
AddButtonToFrame(ArmaFrame, "God Mode", GodMode)
AddButtonToFrame(JogadorFrame, "Fly Hack", FlyHack)
AddButtonToFrame(ConfigFrame, "Infinite Jump", InfiniteJump)
AddButtonToFrame(GeralFrame, "Teleport Player", TeleportPlayer)
AddButtonToFrame(JogadorFrame, "Speed Boost", SpeedBoost)
AddButtonToFrame(ArmaFrame, "Aimbot", Aimbot)
AddButtonToFrame(JogadorFrame, "NoClip", NoClip)
AddButtonToFrame(ConfigFrame, "Anti-Kick/Ban", AntiKickBan)

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
