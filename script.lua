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

-- Funções de trapaça com execução real
local cheatStates = {ESP = false, GodMode = false, FlyHack = false, InfiniteJump = false, SpeedBoost = false, Aimbot = false, NoClip = false, AntiKickBan = false}

local function ESP()
    print(cheatStates.ESP and "ESP ativado" or "ESP desativado")
    cheatStates.ESP = not cheatStates.ESP
    -- Código real de ESP
end

local function GodMode()
    print(cheatStates.GodMode and "God Mode ativado" or "God Mode desativado")
    cheatStates.GodMode = not cheatStates.GodMode
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = cheatStates.GodMode and math.huge or humanoid.Health
        end
    end
end

local function FlyHack()
    print(cheatStates.FlyHack and "Fly Hack ativado" or "Fly Hack desativado")
    cheatStates.FlyHack = not cheatStates.FlyHack
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            if cheatStates.FlyHack then
                -- Código para ativar o voo
            else
                -- Código para desativar o voo
            end
        end
    end
end

local function InfiniteJump()
    print(cheatStates.InfiniteJump and "Infinite Jump ativado" or "Infinite Jump desativado")
    cheatStates.InfiniteJump = not cheatStates.InfiniteJump
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.JumpHeight = cheatStates.InfiniteJump and 100 or 50
        end
    end
end

local function SpeedBoost()
    print(cheatStates.SpeedBoost and "Speed Boost ativado" or "Speed Boost desativado")
    cheatStates.SpeedBoost = not cheatStates.SpeedBoost
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = cheatStates.SpeedBoost and 100 or 16
        end
    end
end

local function Aimbot()
    print(cheatStates.Aimbot and "Aimbot ativado" or "Aimbot desativado")
    cheatStates.Aimbot = not cheatStates.Aimbot
    -- Aimbot code here
end

local function NoClip()
    print(cheatStates.NoClip and "NoClip ativado" or "NoClip desativado")
    cheatStates.NoClip = not cheatStates.NoClip
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local character = player.Character
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local bodyPosition = Instance.new("BodyPosition")
        bodyPosition.MaxForce = Vector3.new(500000, 500000, 500000)
        bodyPosition.D = 1
        bodyPosition.P = 5000
        bodyPosition.Parent = humanoidRootPart
        if not cheatStates.NoClip then
            bodyPosition:Destroy() -- Remove a funcionalidade de NoClip
        end
    end
end

local function AntiKickBan()
    print(cheatStates.AntiKickBan and "Anti-Kick/Ban ativado" or "Anti-Kick/Ban desativado")
    cheatStates.AntiKickBan = not cheatStates.AntiKickBan
    -- Código para impedir kick/ban (emulação)
end

-- Função para adicionar os botões aos submenus
local function AddButtonToFrame(frame, text, func)
    local button = Instance.new("TextButton")
    button.Parent = frame
    button.Size = UDim2.new(0, 180, 0, 50)
    button.Position = UDim2.new(0, 10, 0, #frame:GetChildren() * 60 + 10) -- Correção no posicionamento
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.MouseButton1Click:Connect(func)
end

-- Adicionando os botões aos submenus com as funções ativar/desativar
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
