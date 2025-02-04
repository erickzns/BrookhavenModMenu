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

local inventarioButton = Instance.new("TextButton")
inventarioButton.Size = UDim2.new(0, 100, 0, 50)
inventarioButton.Position = UDim2.new(0, 10, 0, 130)
inventarioButton.Text = "Inventário"
inventarioButton.Parent = mainMenu

local configuracoesButton = Instance.new("TextButton")
configuracoesButton.Size = UDim2.new(0, 100, 0, 50)
configuracoesButton.Position = UDim2.new(0, 10, 0, 190)
configuracoesButton.Text = "Configurações"
configuracoesButton.Parent = mainMenu

-- Função para criar submenus
local function createSubMenu(button, options)
    local submenu = Instance.new("Frame")
    submenu.Size = UDim2.new(0, 180, 0, 300)
    submenu.Position = UDim2.new(0, 120, 0, 10)
    submenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    submenu.Visible = false
    submenu.Parent = mainMenu

    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Size = UDim2.new(0, 160, 0, 40)
        optionButton.Position = UDim2.new(0, 10, 0, (i-1) * 50)
        optionButton.Text = option
        optionButton.Parent = submenu

        -- Exemplo de funcionalidade fictícia para cada botão
        optionButton.MouseButton1Click:Connect(function()
            print("Função " .. option .. " ativada")
            -- Aqui você pode adicionar efeitos fictícios, como partículas ou sons, para simular a trapaça
        end)
    end

    button.MouseButton1Click:Connect(function()
        submenu.Visible = not submenu.Visible
    end)
end

-- Criando submenus para cada botão
createSubMenu(geralButton, {"Ativar Modo Invencível", "Aumentar Velocidade", "Habilidades Ilimitadas"})
createSubMenu(jogadorButton, {"Teletransportar Jogador", "Visão de Raio-X"})
createSubMenu(inventarioButton, {"Adicionar Item Raro", "Duplicar Itens", "Inventário Ilimitado"})
createSubMenu(configuracoesButton, {"Ativar Modo Noturno", "Ajustar Gravidade"})
