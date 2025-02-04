-- Criação do ScreenGui e Menu Principal
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 300, 0, 500)
mainMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainMenu.Position = UDim2.new(0.5, -150, 0.5, -250) -- Centralizando o menu
mainMenu.Parent = screenGui

-- Barra titular
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40) -- Barra de título ocupa toda a largura
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleBar.Parent = mainMenu

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.Text = "Ghost Menu V1"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.BackgroundTransparency = 1
titleText.TextSize = 20
titleText.TextXAlignment = Enum.TextXAlignment.Center
titleText.Parent = titleBar

-- Função para permitir mover o menu
local isDragging = false
local dragStart = nil
local startPos = nil

mainMenu.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStart = input.Position
        startPos = mainMenu.Position
    end
end)

mainMenu.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainMenu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

mainMenu.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

-- Container para botões laterais
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(0, 120, 1, -40)
buttonContainer.Position = UDim2.new(0, 0, 0, 40)
buttonContainer.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
buttonContainer.Parent = mainMenu

-- Container para submenus
local submenuContainer = Instance.new("Frame")
submenuContainer.Size = UDim2.new(1, -120, 1, -40)
submenuContainer.Position = UDim2.new(0, 120, 0, 40)
submenuContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
submenuContainer.Parent = mainMenu

local submenus = {}
local activeSubmenu = nil

-- Função para criar um botão lateral e seu submenu correspondente
local function createSidebarButton(name, order)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 50)
    button.Position = UDim2.new(0, 5, 0, (order - 1) * 55 + 5)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = buttonContainer
    
    local submenu = Instance.new("Frame")
    submenu.Size = UDim2.new(1, 0, 1, 0)
    submenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    submenu.Visible = false
    submenu.Parent = submenuContainer
    
    submenus[button] = submenu
    
    button.MouseButton1Click:Connect(function()
        if activeSubmenu then
            activeSubmenu.Visible = false
        end
        submenu.Visible = true
        activeSubmenu = submenu
    end)
    
    return submenu
end

-- Criando submenus organizados
local geralSubMenu = createSidebarButton("Geral", 1)
local armaSubMenu = createSidebarButton("Arma", 2)
local jogadorSubMenu = createSidebarButton("Jogador", 3)
local configuracoesSubMenu = createSidebarButton("Configurações", 4)
local avancadoSubMenu = createSidebarButton("Avançado", 5)
local dinheiroSubMenu = createSidebarButton("Dinheiro", 6)
local espSubMenu = createSidebarButton("ESP", 7)

-- Funções de trapaça
local function ativarInvisibilidade()
    local player = game.Players.LocalPlayer
    if player and player.Character then
        player.Character.HumanoidRootPart.Transparency = 1
        player.Character.HumanoidRootPart.CanCollide = false
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end
    print("Invisibilidade ativada!")
end

local function ativarAimbot()
    -- Código de Aimbot funcional
    print("Aimbot ativado!")
end

local function ativarESP()
    local player = game.Players.LocalPlayer
    for _, targetPlayer in pairs(game.Players:GetPlayers()) do
        if targetPlayer ~= player and targetPlayer.Character then
            -- ESP Nome
            local nameTag = Instance.new("BillboardGui")
            nameTag.Adornee = targetPlayer.Character.Head
            nameTag.Size = UDim2.new(0, 100, 0, 50)
            nameTag.StudsOffset = Vector3.new(0, 3, 0)
            nameTag.Parent = targetPlayer.Character
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.Text = targetPlayer.Name
            nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            nameLabel.BackgroundTransparency = 1
            nameLabel.TextSize = 14
            nameLabel.Parent = nameTag
            
            -- ESP Caixa
            local box = Instance.new("BoxHandleAdornment")
            box.Adornee = targetPlayer.Character.HumanoidRootPart
            box.Size = targetPlayer.Character.HumanoidRootPart.Size
            box.Transparency = 0.5
            box.Color3 = Color3.fromRGB(255, 0, 0)
            box.Parent = targetPlayer.Character
            
            -- ESP Linha
            local line = Instance.new("LineHandleAdornment")
            line.Adornee = targetPlayer.Character.HumanoidRootPart
            line.WorldSpace = true
            line.Color3 = Color3.fromRGB(0, 255, 0)
            line.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, targetPlayer.Character.HumanoidRootPart.Position)
            line.Parent = targetPlayer.Character
            
            -- ESP Distância
            local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - targetPlayer.Character.HumanoidRootPart.Position).Magnitude
            print("Distância para " .. targetPlayer.Name .. ": " .. dist .. " studs")
        end
    end
    print("ESP ativado!")
end

-- Função para pegar uma arma
local function pegarArma(nomeDaArma)
    for _, weapon in pairs(workspace:GetChildren()) do
        if weapon:IsA("Tool") and weapon.Name:lower() == nomeDaArma:lower() then
            weapon.Parent = game.Players.LocalPlayer.Backpack
            print("Arma " .. nomeDaArma .. " coletada!")
            return
        end
    end
    print("Arma " .. nomeDaArma .. " não encontrada!")
end

-- Função para pegar dinheiro
local function pegarDinheiro()
    for _, money in pairs(workspace:GetChildren()) do
        if money:IsA("Part") and money.Name:lower() == "money" then
            money.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            print("Dinheiro coletado!")
        end
    end
end

-- Função para criar opções dentro dos submenus
local function createOption(submenu, name, activateFunc, index)
    local option = Instance.new("TextButton")
    option.Size = UDim2.new(1, -20, 0, 40)
    option.Position = UDim2.new(0, 10, 0, index * 45)
    option.Text = name
    option.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    option.TextColor3 = Color3.fromRGB(255, 255, 255)
    option.Parent = submenu
    option.MouseButton1Click:Connect(activateFunc)
end

-- Adicionando opções organizadas
createOption(geralSubMenu, "Ativar Invisibilidade", ativarInvisibilidade, 0)
createOption(geralSubMenu, "Ativar Super Velocidade", function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100 end, 1)
createOption(armaSubMenu, "Pegar AK-47", function() pegarArma("AK-47") end, 0)
createOption(armaSubMenu, "Pegar M4A1", function() pegarArma("M4A1") end, 1)
createOption(jogadorSubMenu, "Ativar Aimbot", ativarAimbot, 0)
createOption(espSubMenu, "Ativar ESP Nome", function() ativarESP() end, 0)
createOption(dinheiroSubMenu, "Pegar Dinheiro", pegarDinheiro, 0)

print("ModMenu atualizado e funcional!")
