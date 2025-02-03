-- Parte do código do Mod Menu, agora "disfarçado" com variáveis e funções modificadas
local _a = game.Players.LocalPlayer
local _b = _a.PlayerGui

local _c = Instance.new("ScreenGui")
_c.Name = "ModMenu"
_c.Parent = _b
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
        -- Ativar ESP para mostrar os nomes dos jogadores
        for _, _i in ipairs(game.Players:GetPlayers()) do
            if _i ~= _a then
                -- Criando uma label para o nome do jogador
                local _j = Instance.new("TextLabel")
                _j.Text = _i.Name
                _j.Size = UDim2.new(0, 100, 0, 50)
                _j.Position = UDim2.new(0.5, -50, 0, 100)
                _j.BackgroundTransparency = 1
                _j.TextColor3 = Color3.fromRGB(255, 255, 255)
                _j.Parent = _b

                -- Atualizando a posição da label
                game:GetService("RunService").Heartbeat:Connect(function()
                    if _i.Character and _i.Character:FindFirstChild("HumanoidRootPart") then
                        _j.Position = UDim2.new(0.5, -50, 0, (game.Workspace.CurrentCamera:WorldToScreenPoint(_i.Character.HumanoidRootPart.Position).Y - 100) / game.Workspace.CurrentCamera.ViewportSize.Y)
                    else
                        _j.Visible = false
                    end
                end)
            end
        end
    else
        _g.Text = "Ativar ESP"
        -- Desativar o ESP (remover as labels)
        for _, _k in ipairs(_b:GetChildren()) do
            if _k:IsA("TextLabel") then
                _k:Destroy()
            end
        end
    end
end)
