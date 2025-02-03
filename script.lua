-- Mod Menu Avançado para Roblox

-- Função principal
local function createModMenu()
    -- Criando a ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CheatMenu"
    screenGui.Parent = game.CoreGui

    -- Criando o Frame do Menu
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0, 200, 0, 400)
    menuFrame.Position = UDim2.new(0, 10, 0, 10)
    menuFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    menuFrame.BackgroundTransparency = 0.5
    menuFrame.Parent = screenGui

    -- Criando o Título do Menu
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Text = "Mod Menu"
    titleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.TextScaled = true
    titleLabel.Parent = menuFrame

    -- Criando o Botão de Speed Hack
    local speedHackButton = Instance.new("TextButton")
    speedHackButton.Size = UDim2.new(1, -20, 0, 50)
    speedHackButton.Position = UDim2.new(0, 10, 0, 60)
    speedHackButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    speedHackButton.Text = "Ativar Speed Hack"
    speedHackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedHackButton.TextScaled = true
    speedHackButton.Parent = menuFrame

    -- Variável para controlar o estado do Speed Hack
    local speedHackActive = false

    -- Função para ativar/desativar o Speed Hack
    local function toggleSpeedHack()
        local player = game.Players.LocalPlayer
        if speedHackActive then
            player.Character.Humanoid.WalkSpeed = 16 -- Velocidade padrão
            speedHackButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            speedHackButton.Text = "Ativar Speed Hack"
        else
            player.Character.Humanoid.WalkSpeed = 50 -- Velocidade aumentada
            speedHackButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            speedHackButton.Text = "Desativar Speed Hack"
        end
        speedHackActive = not speedHackActive
    end

    -- Conectando a função ao clique do botão
    speedHackButton.MouseButton1Click:Connect(toggleSpeedHack)

    -- Criando o Botão de Super Salto
    local superJumpButton = Instance.new("TextButton")
    superJumpButton.Size = UDim2.new(1, -20, 0, 50)
    superJumpButton.Position = UDim2.new(0, 10, 0, 120)
    superJumpButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    superJumpButton.Text = "Ativar Super Salto"
    superJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    superJumpButton.TextScaled = true
    superJumpButton.Parent = menuFrame

    -- Variável para controlar o estado do Super Salto
    local superJumpActive = false

    -- Função para ativar/desativar o Super Salto
    local function toggleSuperJump()
        local player = game.Players.LocalPlayer
        if superJumpActive then
            player.Character.Humanoid.JumpPower = 50 -- Altura de salto padrão
            superJumpButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            superJumpButton.Text = "Ativar Super Salto"
        else
            player.Character.Humanoid.JumpPower = 100 -- Altura de salto aumentada
            superJumpButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            superJumpButton.Text = "Desativar Super Salto"
        end
        superJumpActive = not superJumpActive
    end

    -- Conectando a função ao clique do botão
    superJumpButton.MouseButton1Click:Connect(toggleSuperJump)

    -- Criando o Botão de Gravidade Zero
    local lowGravityButton = Instance.new("TextButton")
    lowGravityButton.Size = UDim2.new(1, -20, 0, 50)
    lowGravityButton.Position = UDim2.new(0, 10, 0, 180)
    lowGravityButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    lowGravityButton.Text = "Ativar Gravidade Zero"
    lowGravityButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    lowGravityButton.TextScaled = true
    lowGravityButton.Parent = menuFrame

    -- Variável para controlar o estado da Gravidade Zero
    local lowGravityActive = false

    -- Função para ativar/desativar a Gravidade Zero
    local function toggleLowGravity()
        local player = game.Players.LocalPlayer
        if lowGravityActive then
            game.Workspace.Gravity = 196.2 -- Gravidade padrão
            lowGravityButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            lowGravityButton.Text = "Ativar Gravidade Zero"
        else
            game.Workspace.Gravity = 50 -- Gravidade reduzida
            lowGravityButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            lowGravityButton.Text = "Desativar Gravidade Zero"
        end
        lowGravityActive = not lowGravityActive
    end

    -- Conectando a função ao clique do botão
    lowGravityButton.MouseButton1Click:Connect(toggleLowGravity)
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
