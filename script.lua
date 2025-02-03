local _a = game.Players.LocalPlayer
local _b = _a.PlayerGui

local _c = Instance.new("ScreenGui")
_c.Name = "ModMenu"
_c.Parent = _b
_c.ZIndex = 1000

-- Função para criar um botão com aparência elegante
local function createButton(text, position, size, callback, parent)
    local btn = Instance.new("TextButton")
    btn.Size = size
    btn.Position = position
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 20
    btn.Parent = parent

    btn.MouseButton1Click:Connect(callback)

    return btn
end

-- Função para criar a interface
local function createMenu()
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0, 400, 0, 500)
    menuFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    menuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    menuFrame.BackgroundTransparency = 0.7
    menuFrame.Parent = _c
    menuFrame.Active = true
    menuFrame.Draggable = true

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

-- Criar botão para fechar o menu
createButton("Fechar Menu", UDim2.new(0.5, -50, 0, 450), UDim2.new(0, 100, 0, 50), closeMenu, modMenu)

-- Função para o ESP
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

    -- Alterna entre ativar e desativar o ESP
    espEnabled = not espEnabled
    if espEnabled then
        createButton("Desativar ESP", UDim2.new(0.5, -100, 0, 100), UDim2.new(0, 200, 0, 50), toggleESP, modMenu)
    else
        createButton("Ativar ESP", UDim2.new(0.5, -100, 0, 100), UDim2.new(0, 200, 0, 50), toggleESP, modMenu)
    end

    -- Atualizar o ESP a cada frame
    game:GetService("RunService").Heartbeat:Connect(updateESP)
end

-- Criar botão para ativar/desativar o ESP
createButton("Ativar ESP", UDim2.new(0.5, -100, 0, 100), UDim2.new(0, 200, 0, 50), toggleESP, modMenu)

-- Função para teleportar o jogador para uma localização específica
local function teleportToLocation()
    local targetPosition = CFrame.new(10, 10, 10)  -- Exemplo de coordenadas (modificar conforme necessário)
    _a.Character:SetPrimaryPartCFrame(targetPosition)
end

-- Criar botão para teleportar
createButton("Teleportar para Local X", UDim2.new(0.5, -100, 0, 200), UDim2.new(0, 200, 0, 50), teleportToLocation, modMenu)

-- Função para mudar a cor do personagem
local function changeCharacterColor()
    _a.Character.HumanoidRootPart.BrickColor = BrickColor.Random() -- Altera a cor do personagem
end

-- Criar botão para mudar a cor do personagem
createButton("Mudar Cor do Personagem", UDim2.new(0.5, -100, 0, 300), UDim2.new(0, 200, 0, 50), changeCharacterColor, modMenu)
