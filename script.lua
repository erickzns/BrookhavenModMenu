local _a = game.Players.LocalPlayer
local _b = _a.PlayerGui

-- Criando o ScreenGui do Mod Menu
local _c = Instance.new("ScreenGui")
_c.Name = "ModMenu"
_c.Parent = _b

-- Criando o Frame do menu
local _d = Instance.new("Frame")
_d.Size = UDim2.new(0, 400, 0, 550)
_d.Position = UDim2.new(0.5, -200, 0.5, -250)
_d.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
_d.BackgroundTransparency = 0.5
_d.Parent = _c

-- Função para fechar o menu
local function _e()
    _c:Destroy()  -- Fecha o menu
end

-- Botão de Fechar Menu
local _f = Instance.new("TextButton")
_f.Size = UDim2.new(0, 100, 0, 50)
_f.Position = UDim2.new(0.5, -50, 0, -200)
_f.Text = "Fechar Menu"
_f.Parent = _d
_f.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

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
_g.Size = UDim2.new(0, 200, 0, 50)
_g.Position = UDim2.new(0.5, -100, 0, 50)
_g.Text = "Ativar ESP"
_g.Parent = _d
_g.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

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
                _box.Position = UDim2.new(0, 100, 0, 100)
                _box.BackgroundTransparency = 0.5
                _box.BorderColor3 = Color3.fromRGB(255, 0, 0)
                _box.BorderSizePixel = 5
                _box.Parent = _b
                
                -- Criar linhas conectando o jogador
                local _line = Instance.new("Frame")
                _line.Size = UDim2.new(0, 5, 0, 200)
                _line.Position = UDim2.new(0.5, -2, 0, 100)
                _line.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                _line.Parent = _b
                
                -- Atualizar a posição da caixa e linha
                game:GetService("RunService").Heartbeat:Connect(function()
                    if _i.Character and _i.Character:FindFirstChild("HumanoidRootPart") then
                        local screenPos, onScreen = game.Workspace.CurrentCamera:WorldToScreenPoint(_i.Character.HumanoidRootPart.Position)
                        if onScreen then
                            -- Posiciona a caixa
                            _box.Position = UDim2.new(0, screenPos.X - 100, 0, screenPos.Y - 100)
                            -- Posiciona a linha
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
            if _k:IsA("Frame") then
                _k:Destroy()
            end
        end
    end
end)

-- Função de Teleportação
local _i = Instance.new("TextButton")
_i.Size = UDim2.new(0, 200, 0, 50)
_i.Position = UDim2.new(0.5, -100, 0, 150)
_i.Text = "Teleportar para Local X"
_i.Parent = _d
_i.BackgroundColor3 = Color3.fromRGB(0, 0, 255)

_i.MouseButton1Click:Connect(function()
    -- Exemplo de teleportação para um local específico no Brookhaven (ex: para uma casa)
    local targetPosition = CFrame.new(10, 0, 10)  -- Exemplo de coordenadas
    _a.Character:SetPrimaryPartCFrame(targetPosition)
end)
