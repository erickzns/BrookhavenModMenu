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
            if optionCheckbox.Text == "Off" então
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
    local character = game.Players.LocalPlayer.Character
    character.Humanoid.MaxHealth = math.huge
    character.Humanoid.Health = math.huge
end

local function desativarModoInvencivel()
    local character = game.Players.LocalPlayer.Character
    character.Humanoid.MaxHealth = 100
    character.Humanoid.Health = 100
end

local function aumentarVelocidade()
    local character = game.Players.LocalPlayer.Character
    character.Humanoid.WalkSpeed = 100
end

local function diminuirVelocidade()
    local character = game.Players.LocalPlayer.Character
    character.Humanoid.WalkSpeed = 16
end

local function ativarTeletransporte()
    local targetPosition = Vector3.new(0, 100, 0) -- Posição alvo fictícia
    local character = game.Players.LocalPlayer.Character
    character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
end

local function desativarTeletransporte()
    -- Função fictícia para desativar o teletransporte (não precisa fazer nada)
end

local function ativarVisaoRaioX()
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("BasePart") então
            obj.Transparency = 0.5
        end
    end
end

local function desativarVisaoRaioX()
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("BasePart") então
            obj.Transparency = 0
        end
    end
end

local function aumentarTamanho()
    local character = game.Players.LocalPlayer.Character
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") então
            part.Size = part.Size * 2
        end
    end
    character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, 0) -- Evita sobreposição
end

local function diminuirTamanho()
    local character = game.Players.LocalPlayer.Character
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") então
            part.Size = part.Size / 2
        end
    end
    character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, 0) -- Evita sobreposição
end

local function ativarVoo()
    local character = game.Players.LocalPlayer.Character
    local bp = Instance.new("BodyPosition", character.HumanoidRootPart)
    bp.D = 1000
    bp.P = 10000
    bp.MaxForce = Vector3.new(0, math.huge, 0)
    bp.Position = character.HumanoidRootPart.Position + Vector3.new(0, 50, 0)
end

local function desativarVoo()
    local character = game.Players.LocalPlayer.Character
    for _, obj in pairs(character.HumanoidRootPart:GetChildren()) do
        if obj:IsA("BodyPosition") então
            obj:Destroy()
        end
    end
end

-- Super Salto
local function ativarSuperSalto()
    local character = game.Players.LocalPlayer.Character
    character.Humanoid.JumpPower = 200
end

local function desativarSuperSalto()
    local character = game.Players.LocalPlayer.Character
    character.Humanoid.JumpPower = 50
end

local superSaltoButton = Instance.new("TextButton")
superSaltoButton.Size = UDim2.new(0, 100, 0, 50)
superSaltoButton.Position = UDim2.new(0, 10, 0, 190)
superSaltoButton.Text = "Super Salto"
superSaltoButton.Parent = mainMenu

createSubMenu(superSaltoButton, {
    {name = "Ativar Super Salto", onActivate = ativarSuperSalto, onDeactivate = desativarSuperSalto}
})

-- Modo Fantasma
local function ativarModoFantasma()
    local character = game.Players.LocalPlayer.Character
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") então
            part.CanCollide = false
        end
    end
end

local function desativarModoFantasma()
    local character = game.Players.LocalPlayer.Character
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") então
            part.CanCollide = true
        end
    end
end

local modoFantasmaButton = Instance.new("TextButton")
modoFantasmaButton.Size = UDim2.new(0, 100, 0, 50)
modoFantasmaButton.Position = UDim2.new(0, 10, 0, 250)
modoFantasmaButton.Text = "Modo Fantasma"
modoFantasmaButton.Parent = mainMenu

createSubMenu(modoFantasmaButton, {
    {name = "Ativar Modo Fantasma", onActivate = ativarModoFantasma, onDeactivate = desativarModoFantasma}
})
