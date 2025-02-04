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

-- Funções fictícias para ativar/desativar
local function ativarModoInvencivel()
    print("Modo Invencível Ativado")
    -- Código para ativar invencibilidade aqui
end

local function desativarModoInvencivel()
    print("Modo Invencível Desativado")
    -- Código para desativar invencibilidade aqui
end

local function aumentarVelocidade()
    print("Velocidade Aumentada")
    -- Código para aumentar velocidade aqui
end

local function diminuirVelocidade()
    print("Velocidade Reduzida")
    -- Código para reduzir velocidade aqui
end

-- Criando submenus para cada botão
createSubMenu(geralButton, {
    {name = "Modo Invencível", onActivate = ativarModoInvencivel, onDeactivate = desativarModoInvencivel},
    {name = "Aumentar Velocidade", onActivate = aumentarVelocidade, onDeactivate = diminuirVelocidade}
})

createSubMenu(jogadorButton, {
    {name = "Teletransportar Jogador", onActivate = function() print("Teletransporte Ativado") end, onDeactivate = function() print("Teletransporte Desativado") end},
    {name = "Visão de Raio-X", onActivate = function() print("Visão de Raio-X Ativada") end, onDeactivate = function() print("Visão de Raio-X Desativada") end}
})

createSubMenu(configuracoesButton, {
    {name = "Ativar Modo Noturno", onActivate = function() print("Modo Noturno Ativado") end, onDeactivate = function() print("Modo Noturno Desativado") end},
    {name = "Ajustar Gravidade", onActivate = function() print("Gravidade Ajustada") end, onDeactivate = function() print("Gravidade Padrão") end}
})
