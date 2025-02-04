-- Mod Menu Flutuante para Roblox

print("Script iniciado")

-- Função principal
local function createModMenu()
    print("Criando o menu")

    -- Criando a ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CheatMenu"
    screenGui.Parent = game.CoreGui

    print("ScreenGui criada")

    -- Criando o Frame do Menu
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0, 300, 0, 600)
    menuFrame.Position = UDim2.new(0, 10, 0, 10)
    menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    menuFrame.BackgroundTransparency = 0.5
    menuFrame.BorderSizePixel = 0
    menuFrame.Parent = screenGui

    print("Frame do menu criado")

    -- Criando o Título do Menu
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 40)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
    titleLabel.Text = "Ghos Menu"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextScaled = true
    titleLabel.Parent = menuFrame

    print("Título do menu criado")

    -- Função para criar um botão de alternância
    local function createToggleButton(parent, position, text, toggleFunction)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -20, 0, 30)
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        button.Text = text
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextScaled = true
        button.BorderSizePixel = 0
        button.Parent = parent

        local active = false

        button.MouseButton1Click:Connect(function()
            active = not active
            if active then
                button.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
                toggleFunction(true)
            else
                button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
                toggleFunction(false)
            end
        end)

        return button
    end

    -- Função para criar um slider
    local function createSlider(parent, position, min, max, callback)
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(1, -20, 0, 30)
        sliderFrame.Position = position
        sliderFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        sliderFrame.BorderSizePixel = 0
        sliderFrame.Parent = parent

        local slider = Instance.new("TextButton")
        slider.Size = UDim2.new(0, 20, 1, 0)
        slider.Position = UDim2.new(0, 0, 0, 0)
        slider.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
        slider.BorderSizePixel = 0
        slider.Parent = sliderFrame

        local dragging = false

        slider.MouseButton1Down:Connect(function()
            dragging = true
        end)

        game:GetService("UserInputService").InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)

        sliderFrame.MouseMoved:Connect(function(x, y)
            if dragging then
                local scale = math.clamp((x - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1)
                slider.Position = UDim2.new(scale, 0, 0, 0)
                local value = min + (max - min) * scale
                callback(value)
            end
        end)
    end

    -- Funções de trapaça
    local player = game.Players.LocalPlayer

    -- Velocidade Extra (Speed Hack)
    createToggleButton(menuFrame, UDim2.new(0, 10, 0, 50), "Ativar Velocidade", function(active)
        if active then
            player.Character.Humanoid.WalkSpeed = 50
        else
            player.Character.Humanoid.WalkSpeed = 16
        end
    end)

    createSlider(menuFrame, UDim2.new(0, 10, 0, 90), 1, 10, function(value)
        if player.Character.Humanoid.WalkSpeed > 16 then
            player.Character.Humanoid.WalkSpeed = 16 * value
        end
    end)

    -- Super Salto (Super Jump)
    createToggleButton(menuFrame, UDim2.new(0, 10, 0, 130), "Ativar Super Salto", function(active)
        if active então
            player.Character.Humanoid.JumpPower = 100
        else
            player.Character.Humanoid.JumpPower = 50
        end
    end)

    createSlider(menuFrame, UDim2.new(0, 10, 0, 170), 1, 10, function(value)
        if player.Character.Humanoid.JumpPower > 50 então
            player.Character.Humanoid.JumpPower = 50 * value
        end
    end)

    -- Gravidade Zero (Low Gravity)
    createToggleButton(menuFrame, UDim2.new(0, 10, 0, 210), "Ativar Gravidade Zero", function(active)
        if active então
            game.Workspace.Gravity = 50
        else
            game.Workspace.Gravity = 196.2
        end
    end)

    createSlider(menuFrame, UDim2.new(0, 10, 0, 250), 0, 1, function(value)
        if game.Workspace.Gravity < 196.2 então
            game.Workspace.Gravity = 196.2 * (1 - value)
        end
    end)
end

-- Garantir que a função seja executada após o jogador carregar
game.Players.PlayerAdded:Connect(function(player)
    if player == game.Players.LocalPlayer então
        player.CharacterAdded:Connect(createModMenu)
    end
end)

-- Executar a função se o jogador já estiver no jogo
if game.Players.LocalPlayer então
    createModMenu()
end

print("Script finalizado")
