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

-- Nova funcionalidade: Invisibilidade
local function ativarInvisibilidade()
    local character = game.Players.LocalPlayer.Character
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = 1
        end
    end
end

local function desativarInvisibilidade()
    local character = game.Players.LocalPlayer.Character
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Transparency = 0
        end
    end
end

local invisibilidadeButton = Instance.new("TextButton")
invisibilidadeButton.Size = UDim2.new(0, 100, 0, 50)
invisibilidadeButton.Position = UDim2.new(0, 10, 0, 310)
invisibilidadeButton.Text = "Invisibilidade"
invisibilidadeButton.Parent = mainMenu

createSubMenu(invisibilidadeButton, {
    {name = "Ativar Invisibilidade", onActivate = ativarInvisibilidade, onDeactivate = desativarInvisibilidade}
})

-- Nova funcionalidade: Super Velocidade
local function ativarSuperVelocidade()
    local character = game.Players.LocalPlayer.Character
    character.Humanoid.WalkSpeed = 200
end

local function desativarSuperVelocidade()
    local character = game.Players.LocalPlayer.Character
    character.Humanoid.WalkSpeed = 16
end

local superVelocidadeButton = Instance.new("TextButton")
superVelocidadeButton.Size = UDim2.new(0, 100, 0, 50)
superVelocidadeButton.Position = UDim2.new(0, 10, 0, 370)
superVelocidadeButton.Text = "Super Velocidade"
superVelocidadeButton.Parent = mainMenu

createSubMenu(superVelocidadeButton, {
    {name = "Ativar Super Velocidade", onActivate = ativarSuperVelocidade, onDeactivate = desativarSuperVelocidade}
})

-- Nova funcionalidade: Teleporte Rápido
local function ativarTeleporteRapido()
    local character = game.Players.LocalPlayer.Character
    character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame + Vector3.new(0, 10, 0))
end

local teleporteRapidoButton = Instance.new("TextButton")
teleporteRapidoButton.Size = UDim2.new(0, 100, 0, 50)
teleporteRapidoButton.Position = UDim2.new(0, 10, 0, 430)
teleporteRapidoButton.Text = "Teleporte Rápido"
teleporteRapidoButton.Parent = mainMenu

teleporteRapidoButton.MouseButton1Click:Connect(ativarTeleporteRapido)
