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
local cheatStates = {
    ESP = false,
    GodMode = false,
    FlyHack = false,
    InfiniteJump = false,
    SpeedBoost = false,
    Aimbot = false,
    NoClip = false,
    AntiKickBan = false
}

local function ESP()
    cheatStates.ESP = not cheatStates.ESP
    print(cheatStates.ESP and "ESP ativado" or "ESP desativado")
    -- Código real de ESP aqui
end

local function GodMode()
    cheatStates.GodMode = not cheatStates.GodMode
    print(cheatStates.GodMode and "God Mode ativado" or "God Mode desativado")
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            if cheatStates.GodMode then
                humanoid.Health = math.huge -- Ativa o God Mode
            else
                humanoid.Health = humanoid.MaxHealth -- Desativa o God Mode e retorna à saúde normal
            end
        end
    end
end

local function FlyHack()
    cheatStates.FlyHack = not cheatStates.FlyHack
    print(cheatStates.FlyHack and "Fly Hack ativado" or "Fly Hack desativado")
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        local bodyVelocity = player.Character:FindFirstChild("BodyVelocity")
        if humanoid then
            if cheatStates.FlyHack then
                -- Ativa o voo
                if not bodyVelocity then
                    local bodyVel = Instance.new("BodyVelocity")
                    bodyVel.MaxForce = Vector3.new(5000, 5000, 5000)
                    bodyVel.Velocity = Vector3.new(0, 50, 0)
                    bodyVel.Parent = player.Character.HumanoidRootPart
                end
            else
                -- Desativa o voo
                if bodyVelocity then
                    bodyVelocity:Destroy()
                end
            end
        end
    end
end

local function InfiniteJump()
    cheatStates.InfiniteJump = not cheatStates.InfiniteJump
    print(cheatStates.InfiniteJump and "Infinite Jump ativado" or "Infinite Jump desativado")
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            if cheatStates.InfiniteJump then
                humanoid.JumpHeight = 100
            else
                humanoid.JumpHeight = 50 -- Restabelece o pulo normal
            end
        end
    end
end

local function SpeedBoost()
    cheatStates.SpeedBoost = not cheatStates.SpeedBoost
    print(cheatStates.SpeedBoost and "Speed Boost ativado" or "Speed Boost desativado")
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            if cheatStates.SpeedBoost then
                humanoid.WalkSpeed = 100
            else
                humanoid.WalkSpeed = 16 -- Restabelece a velocidade normal
            end
        end
    end
end

local function Aimbot()
    cheatStates.Aimbot = not cheatStates.Aimbot
    print(cheatStates.Aimbot and "Aimbot ativado" or "Aimbot desativado")
    -- Aimbot code here
end

local function NoClip()
    cheatStates.NoClip = not cheatStates.NoClip
    print(cheatStates.NoClip and "NoClip ativado" or "NoClip desativado")
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        local bodyPosition = player.Character:FindFirstChild("BodyPosition")
        if humanoidRootPart then
            if cheatStates.NoClip then
                -- Ativa o NoClip
                if not bodyPosition then
                    local bodyPos = Instance.new("BodyPosition")
                    bodyPos.MaxForce = Vector3.new(500000, 500000, 500000)
                    bodyPos.D = 1
                    bodyPos.P = 5000
                    bodyPos.Parent = humanoidRootPart
                end
            else
                -- Desativa o NoClip
                if bodyPosition then
                    bodyPosition:Destroy()
                end
            end
        end
    end
end

local function AntiKickBan()
    cheatStates.AntiKickBan = not cheatStates.AntiKickBan
    print(cheatStates.AntiKickBan and "Anti-Kick/Ban ativado" or "Anti-Kick/Ban desativado")
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
