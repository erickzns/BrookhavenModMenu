-- Configuração inicial no Roblox Studio
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 300, 0, 500)
mainMenu.Position = UDim2.new(0.5, -150, 0.5, -250)
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
    local targetPosition = character.HumanoidRootPart.Position + Vector3.new(0, 10, 0)
    character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
end

local teleporteButton = Instance.new("TextButton")
teleporteButton.Size = UDim2.new(0, 100, 0, 50)
teleporteButton.Position = UDim2.new(0, 10, 0, 430)
teleporteButton.Text = "Teleporte Rápido"
teleporteButton.Parent = mainMenu

teleporteButton.MouseButton1Click:Connect(ativarTeleporteRapido)
