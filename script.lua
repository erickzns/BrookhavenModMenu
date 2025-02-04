-- Variáveis globais
local player = game.Players.LocalPlayer
local playerCharacter = player.Character
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Funções globais para ativar/desativar
local ativado = {}

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

-- Funções de trapaça
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
    if ativar then
        print("Aimbot ativado!")
    else
        print("Aimbot desativado!")
    end
end

local function ativarESP(ativar)
    if ativar then
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer then
                local highlight = Instance.new("Highlight", plr.Character)
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        end
        print("ESP ativado!")
    else
        print("ESP desativado!")
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

createOption(geralSubMenu, "Ativar Invisibilidade", ativarInvisibilidade, "invisibilidade", 0)
createOption(geralSubMenu, "Ativar Aimbot", ativarAimbot, "aimbot", 1)
createOption(geralSubMenu, "Ativar ESP", ativarESP, "esp", 2)

-- Função para movimentação do menu
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

-- Ajustar a exibição do menu
geralSubMenu.Visible = true
