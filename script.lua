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

-- Tabela para armazenar submenus
local submenus = {}

-- Função para criar submenus com checkboxes
local function createSubMenu(button, options)
    local submenu = Instance.new("Frame")
    submenu.Size = UDim2.new(0, 180, 0, 300)
    submenu.Position = UDim2.new(0, 120, 0, 10)
    submenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    submenu.Visible = false
    submenu.Parent = mainMenu
    submenus[button] = submenu

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
            end)
        end)
    end

    button.MouseButton1Click:Connect(function()
        submenu.Visible = not submenu.Visible
    end)
end

-- Garantir que todos os submenus sejam ocultados quando outro for aberto
for button, submenu in pairs(submenus) do
    button.MouseButton1Click:Connect(function()
        for _, sub in pairs(submenus) do
            sub.Visible = false
        end
        submenu.Visible = true
    end)
end

-- Adicionar os códigos de trapaça ao submenu de "Geral"
createSubMenu(geralButton, {
    {name = "Ativar Invisibilidade", onActivate = ativarInvisibilidade, onDeactivate = desativarInvisibilidade},
    {name = "Ativar Super Velocidade", onActivate = ativarSuperVelocidade, onDeactivate = desativarSuperVelocidade},
    {name = "Ativar Teleporte Rápido", onActivate = ativarTeleporteRapido, onDeactivate = function() end},
    {name = "Vida Infinita", onActivate = ativarVidaInfinita, onDeactivate = desativarVidaInfinita},
    {name = "Munição Infinita", onActivate = ativarMunicaoInfinita, onDeactivate = desativarMunicaoInfinita}
})

-- Exemplo de funções que seriam usadas para ativar/desativar trapaças
function ativarInvisibilidade()
    -- código para ativar invisibilidade
    game.Players.LocalPlayer.Character.HumanoidRootPart.Transparency = 1
    game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
end

function desativarInvisibilidade()
    -- código para desativar invisibilidade
    game.Players.LocalPlayer.Character.HumanoidRootPart.Transparency = 0
    game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
end

function ativarSuperVelocidade()
    -- código para ativar super velocidade
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end

function desativarSuperVelocidade()
    -- código para desativar super velocidade
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end

function ativarTeleporteRapido()
    -- código para ativar teleporte rápido
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
end

function ativarVidaInfinita()
    -- código para ativar vida infinita
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
    game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
end

function desativarVidaInfinita()
    -- código para desativar vida infinita
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 100
    game.Players.LocalPlayer.Character.Humanoid.Health = 100
end

function ativarMunicaoInfinita()
    -- código para ativar munição infinita
    -- código específico do jogo
end

function desativarMunicaoInfinita()
    -- código para desativar munição infinita
    -- código específico do jogo
end
