-- Tela Principal do Menu
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local OpenButton = Instance.new("TextButton")
local SidebarFrame = Instance.new("Frame")

-- Funções de Trapaça
local AimbotEnabled = false
local FlyEnabled = false
local SpeedEnabled = false

-- Criando os botões de cada função
local buttons = {}
local buttonNames = {"Aimbot", "Fly Mode", "Speed Hack", "ESP", "Exploits"}

-- Função para configurar botões do Menu
local function CreateButton(name, posY)
    local button = Instance.new("TextButton")
    button.Parent = SidebarFrame
    button.Size = UDim2.new(0, 100, 0, 40)
    button.Position = UDim2.new(0, 0, 0, posY)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.MouseButton1Click:Connect(function()
        -- Ações quando o botão for clicado
        if name == "Aimbot" then
            AimbotEnabled = not AimbotEnabled
            print(AimbotEnabled and "Aimbot Ativado" or "Aimbot Desativado")
        elseif name == "Fly Mode" then
            FlyEnabled = not FlyEnabled
            print(FlyEnabled and "Fly Mode Ativado" or "Fly Mode Desativado")
        elseif name == "Speed Hack" then
            SpeedEnabled = not SpeedEnabled
            print(SpeedEnabled and "Speed Hack Ativado" or "Speed Hack Desativado")
        end
    end)
    return button
end

-- Configuração do ScreenGui
ScreenGui.Parent = game:GetService("CoreGui")

-- Configuração do botão para abrir o menu
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 120, 0, 50)
OpenButton.Position = UDim2.new(0, 10, 0.5, -25)
OpenButton.Text = "Abrir Menu"
OpenButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Configuração do Menu Principal (Frame)
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Visible = false

-- Configuração da Barra Lateral (Sidebar)
SidebarFrame.Parent = MainFrame
SidebarFrame.Size = UDim2.new(0, 100, 1, 0)
SidebarFrame.Position = UDim2.new(0, 0, 0, 0)
SidebarFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- Criando os botões na barra lateral
local posY = 0
for _, name in ipairs(buttonNames) do
    buttons[name] = CreateButton(name, posY)
    posY = posY + 50
end

-- Funções de Trapaça (Aimbot, Fly Mode, Speed Hack) -- Funções que precisam ser chamadas para realizar as ações
local function ExecuteAimbot()
    -- Implementação real do Aimbot aqui
    print("Aimbot Ativado!")
end

local function ExecuteFlyMode()
    -- Implementação real do Fly Mode aqui
    print("Fly Mode Ativado!")
end

local function ExecuteSpeedHack()
    -- Implementação real do Speed Hack aqui
    print("Speed Hack Ativado!")
end

-- Atualizações contínuas (usadas para ativar/desativar as funções enquanto o jogador está no jogo)
game:GetService("RunService").Heartbeat:Connect(function()
    if AimbotEnabled then
        ExecuteAimbot()
    end
    if FlyEnabled then
        ExecuteFlyMode()
    end
    if SpeedEnabled then
        ExecuteSpeedHack()
    end
end)
