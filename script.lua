local _a = game.Players.LocalPlayer
local _b = _a.PlayerGui

-- Criando o ScreenGui para o Mod Menu
local _c = Instance.new("ScreenGui")
_c.Name = "ModMenu"
_c.Parent = _b

-- Criando o Frame para o menu
local _d = Instance.new("Frame")
_d.Size = UDim2.new(0, 350, 0, 500)
_d.Position = UDim2.new(0.5, -175, 0.5, -250)
_d.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_d.BackgroundTransparency = 0.1
_d.BorderSizePixel = 0
_d.Parent = _c

local _corner = Instance.new("UICorner")
_corner.CornerRadius = UDim.new(0, 10)
_corner.Parent = _d

-- Criar sombra no menu
local _shadow = Instance.new("ImageLabel")
_shadow.Size = UDim2.new(1, 12, 1, 12)
_shadow.Position = UDim2.new(0, -6, 0, -6)
_shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_shadow.BackgroundTransparency = 0.5
_shadow.Image = "rbxassetid://4155801252"
_shadow.ImageTransparency = 0.7
_shadow.Parent = _d

-- Função para fechar o menu
local function _e()
    _c:Destroy()
end

-- Botão para fechar o menu
local _f = Instance.new("TextButton")
_f.Size = UDim2.new(0, 100, 0, 40)
_f.Position = UDim2.new(0.5, -50, 0, -220)
_f.Text = "Fechar"
_f.Parent = _d
_f.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
_f.TextColor3 = Color3.fromRGB(255, 255, 255)
_f.TextSize = 18
_f.Font = Enum.Font.GothamBold
_f.BorderSizePixel = 0
_f.AutoButtonColor = false
_f.MouseButton1Click:Connect(_e)

-- Função para mover o menu
local dragStart, dragInput, dragPos
local function update(input)
    local delta = input.Position - dragStart
    _d.Position = UDim2.new(_d.Position.X.Scale, _d.Position.X.Offset + delta.X, _d.Position.Y.Scale, _d.Position.Y.Offset + delta.Y)
end

local function onInputBegan(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragStart = input.Position
        dragInput = input.InputChanged:Connect(update)
    end
end

local function onInputEnded(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragInput then
            dragInput:Disconnect()
        end
    end
end

_d.InputBegan:Connect(onInputBegan)
_d.InputEnded:Connect(onInputEnded)

-- Função de ESP
local _h = false
local _g = Instance.new("TextButton")
_g.Size = UDim2.new(0, 250, 0, 50)
_g.Position = UDim2.new(0.5, -125, 0, 50)
_g.Text = "Ativar ESP"
_g.Parent = _d
_g.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
_g.TextColor3 = Color3.fromRGB(255, 255, 255)
_g.TextSize = 18
_g.Font = Enum.Font.GothamBold
_g.BorderSizePixel = 0
_g.AutoButtonColor = false

_g.MouseButton1Click:Connect(function()
    _h = not _h
    if _h then
        _g.Text = "Desativar ESP"
        -- Ativar ESP para mostrar caixas e linhas
        for _, _j in ipairs(game.Players:GetPlayers()) do
            if _j ~= _a then
                -- Criar caixa ao redor do jogador
                local _box = Instance.new("Frame")
                _box.Size = UDim2.new(0, 200, 0, 200)
                _box.BackgroundTransparency = 0.5
                _box.BorderColor3 = Color3.fromRGB(255, 0, 0)
                _box.BorderSizePixel = 5
                _box.Parent = _b
                _box.Visible = false

                -- Criar linha conectando o jogador
                local _line = Instance.new("Frame")
                _line.Size = UDim2.new(0, 5, 0, 200)
                _line.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                _line.Parent = _b
                _line.Visible = false

                -- Atualizar a posição da caixa e linha
                game:GetService("RunService").Heartbeat:Connect(function()
                    if _j.Character and _j.Character:FindFirstChild("HumanoidRootPart") then
                        local screenPos, onScreen = game.Workspace.CurrentCamera:WorldToScreenPoint(_j.Character.HumanoidRootPart.Position)
                        if onScreen then
                            _box.Visible = true
                            _line.Visible = true
                            _box.Position = UDim2.new(0, screenPos.X - 100, 0, screenPos.Y - 100)
                            _line.Position = UDim2.new(0, screenPos.X - 2, 0, screenPos.Y)
                        else
                            _box.Visible = false
                            _line.Visible = false
                        end
                    else
                        _box.Visible = false
                        _line.Visible = false
                    end
                end)
            end
        end
    else
        _g.Text = "Ativar ESP"
        -- Desativar o ESP
        for _, _k in ipairs(_b:GetChildren()) do
            if _k:IsA("Frame") and _k.BorderSizePixel == 5 then
                _k:Destroy()
            end
        end
    end
end)

-- Função para Voar
local _i = Instance.new("TextButton")
_i.Size = UDim2.new(0, 250, 0, 50)
_i.Position = UDim2.new(0.5, -125, 0, 120)
_i.Text = "Ativar Voar"
_i.Parent = _d
_i.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
_i.TextColor3 = Color3.fromRGB(255, 255, 255)
_i.TextSize = 18
_i.Font = Enum.Font.GothamBold
_i.BorderSizePixel = 0
_i.AutoButtonColor = false

local flying = false
local bodyGyro, bodyVelocity

_i.MouseButton1Click:Connect(function()
    flying = not flying
    if flying then
        _i.Text = "Desativar Voar"
        -- Iniciar o voo
        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
        bodyGyro.CFrame = _a.Character.HumanoidRootPart.CFrame
        bodyGyro.Parent = _a.Character.HumanoidRootPart

        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
        bodyVelocity.Velocity = Vector3.new(0, 100, 0)  -- Velocidade para o voo
        bodyVelocity.Parent = _a.Character.HumanoidRootPart
    else
        _i.Text = "Ativar Voar"
        -- Parar de voar
        if bodyGyro then bodyGyro:Destroy() end
        if bodyVelocity then bodyVelocity:Destroy() end
    end
end)

-- Função para Copiar Personagem (ao clicar no nome de outro jogador)
local _j = Instance.new("TextButton")
_j.Size = UDim2.new(0, 250, 0, 50)
_j.Position = UDim2.new(0.5, -125, 0, 190)
_j.Text = "Copiar Personagem"
_j.Parent = _d
_j.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
_j.TextColor3 = Color3.fromRGB(255, 255, 255)
_j.TextSize = 18
_j.Font = Enum.Font.GothamBold
_j.BorderSizePixel = 0
_j.AutoButtonColor = false

_j.MouseButton1Click:Connect(function()
    -- Aqui você pode escolher o jogador que deseja copiar
    local playerName = "Nome do Jogador"
    local targetPlayer = game.Players:FindFirstChild(playerName)

    if targetPlayer and targetPlayer.Character then
        local targetCharacter = targetPlayer.Character:Clone()
        targetCharacter.Parent = workspace
        _a.Character = targetCharacter
    end
end)
