-- Configuração inicial no Roblox Studio
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 300, 0, 400)
mainMenu.Position = UDim2.new(0.5, -150, 0.5, -200)
mainMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainMenu.Parent = screenGui

-- Botões Laterais
local geralButton = Instance.new("TextButton")
geralButton.Size = UDim2.new(0, 100, 0, 50)
geralButton.Position = UDim2.new(0, 10, 0, 10)
geralButton.Text = "Geral"
geralButton.Parent = mainMenu

local jogadorButton = Instance.new("TextButton")
jogadorButton.Size = UDim2.new(0, 100, 0, 50)
jogadorButton.Position = UDim2.new(0, 10, 0, 70)
jogadorButton.Text = "Jogador"
jogadorButton.Parent = mainMenu

local configuracoesButton = Instance.new("TextButton")
configuracoesButton.Size = UDim2.new(0, 100, 0, 50)
configuracoesButton.Position = UDim2.new(0, 10, 0, 130)
configuracoesButton.Text = "Configurações"
configuracoesButton.Parent = mainMenu

-- Função para criar submenus com checkboxes
local function createSubMenu(button, options)
    local submenu = Instance.new("Frame")
    submenu.Size = UDim2.new(0, 180, 0, 300)
    submenu.Position = UDim2.new(0, 120, 0, 10)
    submenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    submenu.Visible = false
    submenu.Parent = mainMenu

    for i, option in ipairs(options) do
        local optionFrame = Instance.new("Frame")
        optionFrame.Size = UDim2.new(0, 160, 0, 40)
        optionFrame.Position = UDim2.new(0, 10, 0, (i-1) * 50)
        optionFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        optionFrame.Parent = submenu

        local optionText = Instance.new("TextLabel")
        optionText.Size = UDim2.new(0, 120, 0, 40)
        optionText.Position = UDim2.new(0, 10, 0, 0)
        optionText.Text = option.name
        optionText.TextColor3 = Color3.fromRGB(255, 255, 255)
        optionText.BackgroundTransparency = 1
        optionText.Parent = optionFrame

        local optionCheckbox = Instance.new("TextButton")
        optionCheckbox.Size = UDim2.new(0, 20, 0, 20)
        optionCheckbox.Position = UDim2.new(1, -30, 0.5, -10)
        optionCheckbox.Text = "Off"
        optionCheckbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        optionCheckbox.Parent = optionFrame

        -- Conectar função de ativar/desativar
        optionCheckbox.MouseButton1Click:Connect(function()
            if optionCheckbox.Text == "Off" then
                optionCheckbox.Text = "On"
                optionCheckbox.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                option.onActivate()
            else
                optionCheckbox.Text = "Off"
                optionCheckbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                option.onDeactivate()
            end
        end)
    end

    button.MouseButton1Click:Connect(function()
        submenu.Visible = not submenu.Visible
    end)
end

-- Funções simuladas para ativar/desativar
local function ativarModoInvencivel()
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
    game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
end

local function desativarModoInvencivel()
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 100
    game.Players.LocalPlayer.Character.Humanoid.Health = 100
end

local function aumentarVelocidade()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end

local function diminuirVelocidade()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end

local function ativarTeletransporte()
    local targetPosition = Vector3.new(0, 100, 0) -- Posição alvo fictícia
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
end

local function desativarTeletransporte()
    -- Função fictícia para desativar o teletransporte (não precisa fazer nada)
end

local function ativarVisaoRaioX()
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Transparency = 0.5
        end
    end
end

local function desativarVisaoRaioX()
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Transparency = 0
        end
    end
end

local function aumentarTamanho()
    local character = game.Players.LocalPlayer.Character
    character.HumanoidRootPart.Size = character.HumanoidRootPart.Size * 2
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Size = part.Size * 2
        end
    end
end

local function diminuirTamanho()
    local character = game.Players.LocalPlayer.Character
    character.HumanoidRootPart.Size = character.HumanoidRootPart.Size / 2
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Size = part.Size / 2
        end
    end
end

-- Criando submenus para cada botão
createSubMenu(geralButton, {
    {name = "Modo Invencível", onActivate = ativarModoInvencivel, onDeactivate = desativarModoInvencivel},
    {name = "Aumentar Velocidade", onActivate = aumentarVelocidade, onDeactivate = diminuirVelocidade}
})

createSubMenu(jogadorButton, {
    {name = "Teletransportar Jogador", onActivate = ativarTeletransporte, onDeactivate = desativarTeletransporte},
    {name = "Visão de Raio-X", onActivate = ativarVisaoRaioX, onDeactivate = desativarVisaoRaioX},
    {name = "Aumentar Tamanho", onActivate = aumentarTamanho, onDeactivate = diminuirTamanho}
})

createSubMenu(configuracoesButton, {
    {name = "Ativar Modo Noturno", onActivate = function() game.Lighting.Brightness = 0 end, onDeactivate = function() game.Lighting.Brightness = 2 end},
    {name = "Ajustar Gravidade", onActivate = function() game.Workspace.Gravity = 50 end, onDeactivate = function() game.Workspace.Gravity = 196.2 end},
    {name = "Multiplicar Pontos", onActivate = function() print("Pontos Multiplicados") end, onDeactivate = function() print("Pontos Normais") end}
})
