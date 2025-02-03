local _a = game.Players.LocalPlayer
local _b = _a.PlayerGui

-- Criação do ScreenGui para o Mod Menu
local modMenuGui = Instance.new("ScreenGui")
modMenuGui.Name = "ModMenu"
modMenuGui.Parent = _b
modMenuGui.ZIndex = 1000

-- Função para criar botões com aparência profissional
local function createButton(text, position, size, callback, parent)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = position
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.SourceSans
    button.TextSize = 20
    button.Parent = parent

    button.MouseButton1Click:Connect(callback)

    return button
end

-- Função para criar o Mod Menu
local function createMenu()
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0, 400, 0, 500)
    menuFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    menuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    menuFrame.BackgroundTransparency = 0.7
    menuFrame.Parent = modMenuGui
    menuFrame.Active = true
    menuFrame.Draggable = true  -- Permite que o menu seja movido

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "Mod Menu"
    title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 24
    title.Font = Enum.Font.SourceSans
    title.TextAlign = Enum.TextXAlignment.Center
    title.Parent = menuFrame

    return menuFrame
end

local modMenu = createMenu()

-- Função para fechar o menu
local function closeMenu()
    modMenu:Destroy()
end

-- Criar o botão de Fechar Menu
createButton("Fechar Menu", UDim2.new(0.5, -50, 0, 450), UDim2.new(0, 100, 0, 50), closeMenu, modMenu)

-- Função para ativar/desativar o ESP
local function toggleESP()
    local espEnabled = false
    local espObjects = {}

    -- Função para ativar/desativar ESP
    local function updateESP()
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= _a then
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local hrp = character.HumanoidRootPart
                    local screenPos, onScreen = game.Workspace.CurrentCamera:WorldToScreenPoint(hrp.Position)
                    local box = espObjects[player.UserId]

                    if espEnabled then
                        if not box then
                            -- Criar nova caixa para o ESP
                            box = Instance.new("Frame")
                            box.Size = UDim2.new(0, 100, 0, 100)
                            box.Position = UDim2.new(0, screenPos.X - 50, 0, screenPos.Y - 50)
                            box.BackgroundTransparency = 0
                            box.BorderColor3 = Color3.fromRGB(255, 0, 0)
                            box.BorderSizePixel = 2
                            box.Parent = _b
                            espObjects[player.UserId] = box
                        else
                            box.Position = UDim2.new(0, screenPos.X - 50, 0, screenPos.Y - 50)
                        end
                    elseif box then
                        box:Destroy()
                        espObjects[player.UserId] = nil
                    end
                end
            end
        end
    end

    -- Alternar entre ativar e desativar o ESP
    espEnabled = not espEnabled
    if espEnabled then
        createButton("Desativar ESP", UDim2.new(0.5, -100, 0, 100), UDim2.new(0, 200, 0, 50), toggleESP, modMenu)
    else
        createButton("Ativar ESP", UDim2.new(0.5, -100, 0, 100), UDim2.new(0, 200, 0, 50), toggleESP, modMenu)
    end

    -- Atualizar o ESP a cada frame
    game:GetService("RunService").Heartbeat:Connect(updateESP)
end

-- Criar o botão de Ativar/Desativar ESP
createButton("Ativar ESP", UDim2.new(0.5, -100, 0, 100), UDim2.new(0, 200, 0, 50), toggleESP, modMenu)

-- Função para teleportar o jogador para uma localização específica
local function teleportToLocation()
    local targetPosition = CFrame.new(10, 10, 10)  -- Modificar para a coordenada desejada
    _a.Character:SetPrimaryPartCFrame(targetPosition)
end

-- Criar o botão de Teleportar
createButton("Teleportar para Local X", UDim2.new(0.5, -100, 0, 200), UDim2.new(0, 200, 0, 50), teleportToLocation, modMenu)

-- Função para mudar a cor do personagem
local function changeCharacterColor()
    _a.Character.HumanoidRootPart.BrickColor = BrickColor.Random()  -- Altera a cor do personagem
end

-- Criar o botão de Mudar Cor
createButton("Mudar Cor do Personagem", UDim2.new(0.5, -100, 0, 300), UDim2.new(0, 200, 0, 50), changeCharacterColor, modMenu)
