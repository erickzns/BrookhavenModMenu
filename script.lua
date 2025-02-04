-- Variáveis globais
local player = game.Players.LocalPlayer
local playerCharacter = player.Character
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Funções globais para ativar/desativar
local ativado = {}
local currentSubMenu = nil

-- Funções de trapaça (com ativação/desativação)
local function ativarDesativar(funcao, chave)
    if ativado[chave] then
        funcao(false)
        ativado[chave] = false
    else
        funcao(true)
        ativado[chave] = true
    end
end

-- Função para criar as opções no menu
local function createOption(submenu, name, funcao, chave, index)
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
        ativarDesativar(funcao, chave)
    end)
end

-- Função para exibir o submenu (alternar entre submenus)
local function showSubMenu(submenu)
    if currentSubMenu then
        currentSubMenu.Visible = false
    end
    submenu.Visible = true
    currentSubMenu = submenu
end

-- Criar o menu e opções
local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 350, 0, 450)
mainMenu.Position = UDim2.new(0.5, -175, 0.5, -225)
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
titleText.Text = "Ghost Menu V1"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.BackgroundTransparency = 1
titleText.TextSize = 24
titleText.Font = Enum.Font.GothamBold
titleText.TextXAlignment = Enum.TextXAlignment.Center
titleText.TextYAlignment = Enum.TextYAlignment.Center
titleText.Parent = titleBar

-- Criar submenus e suas opções
local geralSubMenu = Instance.new("Frame")
geralSubMenu.Size = UDim2.new(1, 0, 1, 0)
geralSubMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
geralSubMenu.Parent = mainMenu
geralSubMenu.Visible = false  -- Inicialmente invisível

createOption(geralSubMenu, "Ativar Invisibilidade", ativarInvisibilidade, "invisibilidade", 0)
createOption(geralSubMenu, "Ativar Aimbot", ativarAimbot, "aimbot", 1)
createOption(geralSubMenu, "Ativar ESP", ativarESP, "esp", 2)
createOption(geralSubMenu, "Coletar Dinheiro", pegarDinheiro, "dinheiro", 3)

-- Criar mais opções de armas
local armaSubMenu = Instance.new("Frame")
armaSubMenu.Size = UDim2.new(1, 0, 1, 0)
armaSubMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
armaSubMenu.Parent = mainMenu
armaSubMenu.Visible = false  -- Inicialmente invisível

createOption(armaSubMenu, "Pegar Arma Rifle", function() pegarArma("Rifle") end, "rifle", 0)
createOption(armaSubMenu, "Pegar Arma Shotgun", function() pegarArma("Shotgun") end, "shotgun", 1)

-- Criar mais opções de modo
local modoSubMenu = Instance.new("Frame")
modoSubMenu.Size = UDim2.new(1, 0, 1, 0)
modoSubMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
modoSubMenu.Parent = mainMenu
modoSubMenu.Visible = false  -- Inicialmente invisível

createOption(modoSubMenu, "Ativar Modo Deus", ativarModoDeus, "modoDeus", 0)
createOption(modoSubMenu, "Alterar Tamanho Jogador", mudarTamanhoJogador, "tamanho", 1)
createOption(modoSubMenu, "Teleporte para Spawn", teleporteParaSpawn, "teleporte", 2)
createOption(modoSubMenu, "Alterar Gravidade", function() mudarGravidade(196) end, "gravidade", 3)
createOption(modoSubMenu, "Ativar Dano Infinito", ativarDanoInfinito, "danoInfinito", 4)

-- Exibir o primeiro submenu
showSubMenu(geralSubMenu)

-- Movimentação do ModMenu
local dragSpeed = 5
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    mainMenu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainMenu.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainMenu.Position
        input.Consumed = true
    end
end)

mainMenu.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        update(input)
    end
end)

mainMenu.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
