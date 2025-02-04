-- Layout Básico do Mod Menu Flutuante para Roblox

-- Função principal
local function createModMenu()
    -- Criando a ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CheatMenu"
    screenGui.Parent = game.CoreGui

    -- Criando o Frame do Menu
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0, 300, 0, 600)
    menuFrame.Position = UDim2.new(0, 10, 0, 10)
    menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    menuFrame.BackgroundTransparency = 0.5
    menuFrame.BorderSizePixel = 0
    menuFrame.Parent = screenGui

    -- Criando o Título do Menu
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 40)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
    titleLabel.Text = "Ghost Menu"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextScaled = true
    titleLabel.Parent = menuFrame
end

-- Garantir que a função seja executada após o jogador carregar
game.Players.PlayerAdded:Connect(function(player)
    if player == game.Players.LocalPlayer then
        player.CharacterAdded:Connect(createModMenu)
    end
end)

-- Executar a função se o jogador já estiver no jogo
if game.Players.LocalPlayer then
    createModMenu()
end
