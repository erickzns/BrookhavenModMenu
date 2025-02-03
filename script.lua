-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModMenuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Criar Frame para o menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 200, 0, 300) -- Reduzir o tamanho do menu
menuFrame.Position = UDim2.new(0, 10, 0.5, -150) -- Posicionar no meio do lado esquerdo
menuFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
menuFrame.BorderSizePixel = 0
menuFrame.BackgroundTransparency = 0.5
menuFrame.Parent = screenGui

-- Título do Menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
titleLabel.Text = "Menu de Mods"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 20
titleLabel.Parent = menuFrame

-- Função para criar caixas de marcar de trapaça
local function createCheatToggle(name, position, parent, isEnabled)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -20, 0, 30)
    frame.Position = position
    frame.BackgroundTransparency = 1
    frame.Parent = parent

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 18
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 60, 0, 20)
    toggle.Position = UDim2.new(1, -70, 0.5, -10)
    toggle.BackgroundColor3 = isEnabled and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
    toggle.Text = isEnabled and "On" or "Off"
    toggle.TextColor3 = Color3.new(1, 1, 1)
    toggle.Font = Enum.Font.SourceSansBold
    toggle.TextSize = 16
    toggle.Parent = frame

    toggle.MouseButton1Click:Connect(function()
        isEnabled = not isEnabled
        toggle.BackgroundColor3 = isEnabled and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
        toggle.Text = isEnabled and "On" or "Off"
    end)
end

-- Adicionar caixas de marcar para diferentes funções
createCheatToggle("Aumentar Velocidade", UDim2.new(0, 10, 0.1, 0), menuFrame, false)
createCheatToggle("Pular Mais Alto", UDim2.new(0, 10, 0.2, 0), menuFrame, false)
createCheatToggle("Invisibilidade", UDim2.new(0, 10, 0.3, 0), menuFrame, false)
createCheatToggle("Cura Instantânea", UDim2.new(0, 10, 0.4, 0), menuFrame, false)
createCheatToggle("Voo", UDim2.new(0, 10, 0.5, 0), menuFrame, false)
createCheatToggle("Super Força", UDim2.new(0, 10, 0.6, 0), menuFrame, false)
createCheatToggle("Visão Noturna", UDim2.new(0, 10, 0.7, 0), menuFrame, false)
createCheatToggle("Teletransporte", UDim2.new(0, 10, 0.8, 0), menuFrame, false)
createCheatToggle("Noclip", UDim2.new(0, 10, 0.9, 0), menuFrame, false)

-- Função para criar abas do menu
local function createMenuTab(name, position, parent, onSelect)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = position
    button.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    button.Text = name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.Parent = parent

    button.MouseButton1Click:Connect(onSelect)
end

-- Criar abas do menu
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(0, 200, 1, -40)
tabFrame.Position = UDim2.new(0, 0, 0, 40)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = menuFrame

createMenuTab("Principal", UDim2.new(0, 0, 0, 0), tabFrame, function() print("Aba Principal selecionada") end)
createMenuTab("Legit", UDim2.new(0, 0, 0.1, 0), tabFrame, function() print("Aba Legit selecionada") end)
createMenuTab("Zone Cast", UDim2.new(0, 0, 0.2, 0), tabFrame, function() print("Aba Zone Cast selecionada") end)
createMenuTab("Visuals", UDim2.new(0, 0, 0.3, 0), tabFrame, function() print("Aba Visuals selecionada") end)
createMenuTab("Itens", UDim2.new(0, 0, 0.4, 0), tabFrame, function() print("Aba Itens selecionada") end)
createMenuTab("Teletransporte", UDim2.new(0, 0, 0.5, 0), tabFrame, function() print("Aba Teletransporte selecionada") end)
createMenuTab("Misc", UDim2.new(0, 0, 0.6, 0), tabFrame, function() print("Aba Misc selecionada") end)
createMenuTab("Gifting", UDim2.new(0, 0, 0.7, 0), tabFrame, function() print("Aba Gifting selecionada") end)
createMenuTab("Webhook", UDim2.new(0, 0, 0.8, 0), tabFrame, function() print("Aba Webhook selecionada") end)
createMenuTab("Configurações", UDim2.new(0, 0, 0.9, 0), tabFrame, function() print("Aba Configurações selecionada") end)

-- Adicionar mais abas conforme necessário
