local _a = game.Players.LocalPlayer
local _b = _a.PlayerGui

-- Criar o ScreenGui do Mod Menu
local _c = Instance.new("ScreenGui")
_c.Name = "ModMenu"
_c.Parent = _b

-- Criar o Frame do menu (organizado e estilizado)
local _d = Instance.new("Frame")
_d.Size = UDim2.new(0, 300, 0, 450)  -- Tamanho ajustado
_d.Position = UDim2.new(0.5, -150, 0.5, -225)  -- Posição inicial centralizada
_d.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Cor de fundo mais suave
_d.BackgroundTransparency = 0.2  -- Tornando o fundo mais transparente
_d.BorderSizePixel = 0  -- Sem borda visível
_d.Parent = _c

-- Adicionar bordas arredondadas e sombra
local _corner = Instance.new("UICorner")
_corner.CornerRadius = UDim.new(0, 10)  -- Bordas arredondadas
_corner.Parent = _d

local _shadow = Instance.new("ImageLabel")
_shadow.Size = UDim2.new(1, 10, 1, 10)
_shadow.Position = UDim2.new(0, -5, 0, -5)
_shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_shadow.BackgroundTransparency = 0.5
_shadow.Image = "rbxassetid://4155801252"  -- Sombra leve
_shadow.ImageTransparency = 0.8
_shadow.Parent = _d

-- Função para fechar o menu
local function _e()
    _c:Destroy()  -- Fecha o menu
end

-- Botão de Fechar Menu
local _f = Instance.new("TextButton")
_f.Size = UDim2.new(0, 100, 0, 40)
_f.Position = UDim2.new(0.5, -50, 0, -190)
_f.Text = "Fechar"
_f.Parent = _d
_f.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
_f.TextColor3 = Color3.fromRGB(255, 255, 255)
_f.TextSize = 16
_f.Font = Enum.Font.Gotham
_f.BorderSizePixel = 0
_f.AutoButtonColor = false  -- Mantém a cor mesmo ao passar o mouse
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

-- Botão de ESP
local _g = Instance.new("TextButton")
_g.Size = UDim2.new(0, 250, 0, 50)
_g.Position = UDim2.new(0.5, -125, 0, 50)
_g.Text = "Ativar ESP"
_g.Parent = _d
_g.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
_g.TextColor3 = Color3.fromRGB(255, 255, 255)
_g.TextSize = 16
_g.Font = Enum.Font.Gotham
_g.BorderSizePixel = 0
_g.AutoButtonColor = false

local _h = false

_g.MouseButton1Click:Connect(function()
    _h = not _h  -- Alterna entre ativar e desativar o ESP

    if _h then
        _g.Text = "Desativar ESP"
        -- Ativar ESP para mostrar caixas e linhas em volta dos jogadores
        for _, _i in ipairs(game.Players:GetPlayers()) do
            if _i ~= _a then
                -- Criar caixa ao redor do jogador
                local _box = Instance.new("Frame")
                _box.Size = UDim2.new(0, 200, 0, 200)
                _box.BackgroundTransparency = 0.5
                _box.BorderColor3 = Color3.fromRGB(255, 0, 0)
                _box.BorderSizePixel = 5
                _box.Parent = _b
                _box.Visible = false  -- Começa invisível

                -- Criar linha conectando o jogador
                local _line = Instance.new("Frame")
                _line.Size = UDim2.new(0, 5, 0, 200)
                _line.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                _line.Parent = _b
                _line.Visible = false  -- Começa invisível

                -- Atualizar a posição da caixa e linha
                game:GetService("RunService").Heartbeat:Connect(function()
                    if _i.Character and _i.Character:FindFirstChild("HumanoidRootPart") then
                        local screenPos, onScreen = game.Workspace.CurrentCamera:WorldToScreenPoint(_i.Character.HumanoidRootPart.Position)
                        if onScreen then
                            -- Tornar a caixa e linha visíveis quando o jogador estiver na tela
                            _box.Visible = true
                            _line.Visible = true

                            -- Posiciona a caixa em torno do jogador
                            _box.Position = UDim2.new(0, screenPos.X - 100, 0, screenPos.Y - 100)
                            -- Posiciona a linha conectando o jogador
                            _line.Position = UDim2.new(0, screenPos.X - 2, 0, screenPos.Y)
                        else
                            -- Se o jogador sair da tela, esconda a caixa e linha
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
        -- Desativar o ESP (remover as caixas e linhas)
        for _, _k in ipairs(_b:GetChildren()) do
            if _k:IsA("Frame") and _k.BorderSizePixel == 5 then
                _k:Destroy()
            end
        end
    end
end)

-- Função de Teleportação
local _i = Instance.new("TextButton")
_i.Size = UDim2.new(0, 250, 0, 50)
_i.Position = UDim2.new(0.5, -125, 0, 150)
_i.Text = "Teleportar para Local X"
_i.Parent = _d
_i.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
_i.TextColor3 = Color3.fromRGB(255, 255, 255)
_i.TextSize = 16
_i.Font = Enum.Font.Gotham
_i.BorderSizePixel = 0
_i.AutoButtonColor = false

_i.MouseButton1Click:Connect(function()
    -- Exemplo de teleportação para um local específico no Brookhaven (ex: para uma casa)
    local targetPosition = CFrame.new(10, 0, 10)  -- Exemplo de coordenadas
    _a.Character:SetPrimaryPartCFrame(targetPosition)
end)
