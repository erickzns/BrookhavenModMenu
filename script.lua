-- Configuração inicial
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 350, 0, 600)
mainMenu.Position = UDim2.new(0.5, -175, 0.5, -300)
mainMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainMenu.Parent = screenGui
mainMenu.BorderRadius = UDim.new(0, 10)

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

-- Função para criar opções no menu
local function createOption(parent, text, callback, yPos)
    local option = Instance.new("TextButton")
    option.Size = UDim2.new(1, -20, 0, 45)
    option.Position = UDim2.new(0, 10, 0, yPos)
    option.Text = text
    option.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    option.TextColor3 = Color3.fromRGB(255, 255, 255)
    option.TextSize = 18
    option.Font = Enum.Font.Gotham
    option.TextXAlignment = Enum.TextXAlignment.Center
    option.Parent = parent
    option.BorderRadius = UDim.new(0, 5)

    option.MouseEnter:Connect(function()
        option.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
    end)

    option.MouseLeave:Connect(function()
        option.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end)

    option.MouseButton1Click:Connect(function()
        callback()
    end)
end

-- Funções de trapaça
local function ativarInvisibilidade()
    local character = game.Players.LocalPlayer.Character
    if character then
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
                part.CanCollide = false
            end
        end
    end
    print("Invisibilidade ativada!")
end

local function desativarInvisibilidade()
    local character = game.Players.LocalPlayer.Character
    if character then
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
                part.CanCollide = true
            end
        end
    end
    print("Invisibilidade desativada!")
end

local function ativarAimbot()
    -- Implemente a ativação do aimbot aqui
    print("Aimbot ativado!")
end

local function desativarAimbot()
    -- Implemente a desativação do aimbot aqui
    print("Aimbot desativado!")
end

local function ativarESP()
    -- Implemente a ativação do ESP aqui
    print("ESP ativado!")
end

local function desativarESP()
    -- Implemente a desativação do ESP aqui
    print("ESP desativado!")
end

local function ativarModoDeus()
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.Health = math.huge
    print("Modo Deus ativado!")
end

local function desativarModoDeus()
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
    print("Modo Deus desativado!")
end

-- Criar as opções do menu
local geralSubMenu = Instance.new("Frame")
geralSubMenu.Size = UDim2.new(1, 0, 1, 0)
geralSubMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
geralSubMenu.Parent = mainMenu

createOption(geralSubMenu, "Ativar Invisibilidade", ativarInvisibilidade, 50)
createOption(geralSubMenu, "Desativar Invisibilidade", desativarInvisibilidade, 100)
createOption(geralSubMenu, "Ativar Aimbot", ativarAimbot, 150)
createOption(geralSubMenu, "Desativar Aimbot", desativarAimbot, 200)
createOption(geralSubMenu, "Ativar ESP", ativarESP, 250)
createOption(geralSubMenu, "Desativar ESP", desativarESP, 300)
createOption(geralSubMenu, "Ativar Modo Deus", ativarModoDeus, 350)
createOption(geralSubMenu, "Desativar Modo Deus", desativarModoDeus, 400)
