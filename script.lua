-- Funções globais para ativar/desativar
local ativado = {}

-- Funções de trapaça (com ativação/desativação)
local function ativarInvisibilidade(ativar)
    local character = game.Players.LocalPlayer.Character
    if ativar then
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.Transparency = 1
            character.HumanoidRootPart.CanCollide = false
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Transparency = 1
                end
            end
        end
        print("Invisibilidade ativada!")
    else
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.Transparency = 0
            character.HumanoidRootPart.CanCollide = true
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Transparency = 0
                end
            end
        end
        print("Invisibilidade desativada!")
    end
end

local function ativarAimbot(ativar)
    -- Implemente a ativação e desativação do aimbot aqui
    if ativar then
        print("Aimbot ativado!")
    else
        print("Aimbot desativado!")
    end
end

local function ativarESP(ativar, tipo)
    if ativar then
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local highlight = Instance.new("Highlight", player.Character)
                highlight.FillColor = tipo == "box" and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        end
        print("ESP ativado! Tipo: " .. tipo)
    else
        -- Desativar ESP aqui
        print("ESP desativado!")
    end
end

local function pegarArma(armaNome)
    local arma = game.ServerStorage:FindFirstChild(armaNome)
    if arma then
        local cloneArma = arma:Clone()
        cloneArma.Parent = game.Players.LocalPlayer.Backpack
        print("Arma " .. armaNome .. " adquirida!")
    else
        print("Arma não encontrada!")
    end
end

local function pegarDinheiro(ativar)
    if ativar then
        for _, money in pairs(workspace:GetChildren()) do
            if money:IsA("Part") and money.Name == "Money" then
                money.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
        print("Dinheiro coletado!")
    else
        print("Dinheiro desativado!")
    end
end

local function ativarModoDeus(ativar)
    local player = game.Players.LocalPlayer
    if ativar then
        player.Character.Humanoid.Health = math.huge
        player.Character.Humanoid.MaxHealth = math.huge
        print("Modo Deus ativado!")
    else
        player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
        print("Modo Deus desativado!")
    end
end

-- Adicionando novas funções para esp, armas, dinheiro, etc.

local function ativarSuperVelocidade(ativar)
    local character = game.Players.LocalPlayer.Character
    if ativar then
        character.Humanoid.WalkSpeed = 100
        print("Velocidade aumentada!")
    else
        character.Humanoid.WalkSpeed = 16
        print("Velocidade normalizada!")
    end
end

local function ativarInvencibilidade(ativar)
    local player = game.Players.LocalPlayer
    if ativar then
        player.Character.Humanoid.Health = math.huge
        print("Invencibilidade ativada!")
    else
        player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
        print("Invencibilidade desativada!")
    end
end

local function teleporteParaOutroJogador(jogador)
    local player = game.Players.LocalPlayer
    local target = game.Players:FindFirstChild(jogador)
    if target and target.Character then
        player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
        print("Teletransportado para " .. jogador)
    else
        print("Jogador não encontrado!")
    end
end

local function mudarGravidade(valor)
    workspace.Gravity = valor
    print("Gravidade alterada para: " .. valor)
end

local function pegarArmaRifle()
    pegarArma("Rifle")
end

local function pegarArmaShotgun()
    pegarArma("Shotgun")
end

local function pegarArmaPistola()
    pegarArma("Pistola")
end

local function ativarDanoInfinito(ativar)
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid then
        if ativar then
            humanoid.HealthChanged:Connect(function()
                humanoid.Health = humanoid.MaxHealth
            end)
            print("Dano infinito ativado!")
        else
            print("Dano infinito desativado!")
        end
    end
end

-- Função para criar as opções no menu
local function createOption(submenu, name, funcao, chave, index, args)
    local option = Instance.new("TextButton")
    option.Size = UDim2.new(1, -20, 0, 45)
    option.Position = UDim2.new(0, 10, 0, index * 50)
    option.Text = name
    option.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    option.TextColor3 = Color3.fromRGB(255, 255, 255)
    option.TextSize = 18
    option.Font = Enum.Font.Gotham
    option.TextXAlignment = Enum.TextXAlignment.Center
    option.Parent = submenu
    option.BorderRadius = UDim.new(0, 5)

    -- Efeito ao passar o mouse
    option.MouseEnter:Connect(function()
        option.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
    end)

    option.MouseLeave:Connect(function()
        option.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end)

    option.MouseButton1Click:Connect(function()
        if args then
            funcao(table.unpack(args))
        else
            ativarDesativar(funcao, chave)
        end
    end)
end

-- Criar o menu e opções
local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 350, 0, 600)
mainMenu.Position = UDim2.new(0.5, -175, 0.5, -300)
mainMenu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainMenu.Parent = screenGui
mainMenu.BorderRadius = UDim.new(0, 10)

-- Barra de título
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleBar.Parent = mainMenu
titleBar.BorderRadius = UDim.new(0, 10)

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.Text = "Ghost Menu V2"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.BackgroundTransparency = 1
titleText.TextSize = 24
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Center
titleText.TextYAlignment = Enum.TextYAlignment.Center
titleText.Parent = titleBar

-- Submenus (Geral, Armas, Jogador, Avançado, etc.)

-- Geral
local geralSubMenu = Instance.new("Frame")
geralSubMenu.Size = UDim2.new(1, 0, 1, 0)
geralSubMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
geralSubMenu.Parent = mainMenu

createOption(geralSubMenu, "Ativar Invisibilidade", ativarInvisibilidade, "invisibilidade", 0)
createOption(geralSubMenu, "Ativar Aimbot", ativarAimbot, "aimbot", 1)
createOption(geralSubMenu, "Ativar ESP", ativarESP, "esp", 2, {"box"})
createOption(geralSubMenu, "Ativar Super Velocidade", ativarSuperVelocidade, "superVelocidade", 3)
createOption(geralSubMenu, "Ativar Invencibilidade", ativarInvencibilidade, "invencibilidade", 4)

-- Armas
local armaSubMenu = Instance.new("Frame")
armaSubMenu.Size = UDim2.new(1, 0, 1, 0)
armaSubMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
armaSubMenu.Parent = mainMenu

createOption(armaSubMenu, "Pegar Arma Rifle", pegarArmaRifle, "rifle", 0)
createOption(armaSubMenu, "Pegar Arma Shotgun", pegarArmaShotgun, "shotgun", 1)
createOption(armaSubMenu, "Pegar Arma Pistola", pegarArmaPistola, "pistola", 2)

-- Mais opções avançadas, configurações, modos...
-- Continue a adicionar submenus conforme necessário
