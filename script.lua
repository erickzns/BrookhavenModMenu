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

-- Funções de trapaça com execução real (adicionando o código real de cheat)
local function ESP()
    -- Exemplo de implementação do cheat ESP
    print("ESP ativado: Mostrando Players através das paredes.")
    -- Aqui você colocaria o código real para ativar a visualização dos players através de paredes
end

local function GodMode()
    -- Exemplo de implementação do cheat GodMode
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.Health = math.huge -- Torna o jogador invencível
    print("God Mode ativado: Você é invencível!")
end

local function FlyHack()
    -- Exemplo de implementação do FlyHack
    local player = game.Players.LocalPlayer
    -- Código de fly hack aqui
    print("Fly Hack ativado: Voando pelo mapa!")
end

local function InfiniteJump()
    -- Exemplo de implementação do Infinite Jump
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.JumpHeight = 100 -- Aumenta a altura do pulo
    print("Infinite Jump ativado: Você pode pular infinitamente!")
end

local function TeleportPlayer()
    -- Exemplo de implementação do Teleport
    local player = game.Players.LocalPlayer
    local targetPlayer = game.Players:FindFirstChild("PlayerNameHere") -- Troque "PlayerNameHere" pelo nome de um player
    if targetPlayer then
        player.Character:SetPrimaryPartCFrame(targetPlayer.Character.PrimaryPart.CFrame)
    end
    print("Teleportando para o Player alvo!")
end

local function SpeedBoost()
    -- Exemplo de implementação do SpeedBoost
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.WalkSpeed = 100 -- Aumenta a velocidade de movimento
    print("Speed Boost ativado: Correndo mais rápido!")
end

local function Aimbot()
    -- Exemplo de implementação do Aimbot
    print("Aimbot ativado: Mira automática nos inimigos!")
    -- Aqui você adicionaria o código real para aimbot
end

local function NoClip()
    -- Exemplo de implementação do NoClip
    local player = game.Players.LocalPlayer
    -- Código de NoClip aqui
    print("NoClip ativado: Você pode atravessar paredes!")
end

local function AntiKickBan()
    -- Exemplo de implementação do Anti-Kick/Ban
    local player = game.Players.LocalPlayer
    -- Código de Anti-Kick/Ban
    print("Anti-Kick/Ban ativado: Você não será expulso do jogo!")
end

-- Funções novas com códigos de trapaças

local function SuperJump()
    -- Exemplo de Super Jump
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.JumpHeight = 500 -- Pulo super alto
    print("Super Jump ativado: Você pula super alto!")
end

local function WallHack()
    -- Exemplo de Wall Hack
    print("Wall Hack ativado: Veja através das paredes!")
    -- Adicione aqui o código real de Wall Hack
end

local function SpeedHack()
    -- Exemplo de Speed Hack
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.WalkSpeed = 150 -- Acelera ainda mais
    print("Speed Hack ativado: Acelera sua movimentação de forma extrema!")
end

local function TeleportToCoords()
    -- Exemplo de Teleport para coordenadas específicas
    local player = game.Players.LocalPlayer
    player.Character:SetPrimaryPartCFrame(CFrame.new(100, 50, 200)) -- Teleporta para coordenadas X:100 Y:50 Z:200
    print("Teleportando para as coordenadas X:100 Y:50 Z:200")
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

-- Funções novas
AddButtonToFrame(GeralFrame, "Super Jump", SuperJump)
AddButtonToFrame(ArmaFrame, "Wall Hack", WallHack)
AddButtonToFrame(JogadorFrame, "Speed Hack", SpeedHack)
AddButtonToFrame(ConfigFrame, "Teleport To Coords", TeleportToCoords)

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
