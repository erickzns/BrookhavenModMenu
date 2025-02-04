local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local OpenButton = Instance.new("TextButton")

-- Criando os botões laterais
local GeralButton = Instance.new("TextButton")
local AimbotButton = Instance.new("TextButton")
local ESPButton = Instance.new("TextButton")
local ExploitsButton = Instance.new("TextButton")

-- Criando as funções
local AimbotEnabled = false
local FlyEnabled = false
local SpeedEnabled = false

-- Função para ativar/desativar o Aimbot
local function ToggleAimbot()
    AimbotEnabled = not AimbotEnabled
    if AimbotEnabled then
        print("Aimbot ativado!")
        -- Coloque o código de Aimbot real aqui
    else
        print("Aimbot desativado!")
    end
end

-- Função para ativar/desativar o Fly Mode
local function ToggleFly()
    FlyEnabled = not FlyEnabled
    if FlyEnabled then
        print("Fly Mode ativado!")
        -- Coloque o código de Fly Mode real aqui
    else
        print("Fly Mode desativado!")
    end
end

-- Função para ativar/desativar Speed Hack
local function ToggleSpeed()
    SpeedEnabled = not SpeedEnabled
    if SpeedEnabled then
        print("Speed Hack ativado!")
        -- Coloque o código de Speed Hack real aqui
    else
        print("Speed Hack desativado!")
    end
end

-- Configuração do ScreenGui
ScreenGui.Parent = game:GetService("CoreGui")

-- Configuração do botão para abrir o menu
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 100, 0, 50)
OpenButton.Position = UDim2.new(0, 10, 0.5, -25)
OpenButton.Text = "Abrir Menu"
OpenButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Configuração do menu principal
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Visible = false

-- Configuração dos botões laterais
local buttons = {GeralButton, AimbotButton, ESPButton, ExploitsButton}
local buttonNames = {"Geral", "Aimbot", "ESP", "Exploits"}

for i, button in ipairs(buttons) do
    button.Parent = MainFrame
    button.Size = UDim2.new(0, 80, 0, 50)
    button.Position = UDim2.new(0, 10, 0, (i - 1) * 60 + 10)
    button.Text = buttonNames[i]
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Funções para os botões
    if buttonNames[i] == "Aimbot" then
        button.MouseButton1Click:Connect(ToggleAimbot)
    elseif buttonNames[i] == "Exploits" then
        button.MouseButton1Click:Connect(function()
            ToggleFly()
            ToggleSpeed()
        end)
    end
end

-- Função para abrir e fechar o menu
OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)
