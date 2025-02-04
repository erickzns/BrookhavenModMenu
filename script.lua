-- Criação do ScreenGui e componentes principais
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local OpenButton = Instance.new("TextButton")
local SidebarFrame = Instance.new("Frame")

-- Funções de Trapaça (status de ativação)
local AimbotEnabled = false
local FlyEnabled = false
local SpeedEnabled = false
local ESPEnabled = false
local GodModeEnabled = false

-- Funções de Trapaça (Lógica)
local function ActivateAimbot()
    -- Implementar lógica do Aimbot
    print("Aimbot Ativado!")
end

local function DeactivateAimbot()
    -- Lógica para desativar Aimbot
    print("Aimbot Desativado!")
end

local function ActivateFlyMode()
    -- Implementar lógica do Fly Mode
    print("Fly Mode Ativado!")
end

local function DeactivateFlyMode()
    -- Lógica para desativar Fly Mode
    print("Fly Mode Desativado!")
end

local function ActivateSpeedHack()
    -- Implementar lógica do Speed Hack
    print("Speed Hack Ativado!")
end

local function DeactivateSpeedHack()
    -- Lógica para desativar Speed Hack
    print("Speed Hack Desativado!")
end

local function ActivateESP()
    -- Implementar lógica do ESP
    print("ESP Ativado!")
end

local function DeactivateESP()
    -- Lógica para desativar ESP
    print("ESP Desativado!")
end

local function ActivateGodMode()
    -- Implementar lógica do God Mode
    print("God Mode Ativado!")
end

local function DeactivateGodMode()
    -- Lógica para desativar God Mode
    print("God Mode Desativado!")
end

-- Função para criar os botões de ativar/desativar
local function CreateButton(name, posY, category)
    local button = Instance.new("TextButton")
    button.Parent = SidebarFrame
    button.Size = UDim2.new(0, 100, 0, 40)
    button.Position = UDim2.new(0, 0, 0, posY)
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)

    button.MouseButton1Click:Connect(function()
        if category == "Aimbot" then
            AimbotEnabled = not AimbotEnabled
            if AimbotEnabled then
                ActivateAimbot()
            else
                DeactivateAimbot()
            end
        elseif category == "Fly" then
            FlyEnabled = not FlyEnabled
            if FlyEnabled then
                ActivateFlyMode()
            else
                DeactivateFlyMode()
            end
        elseif category == "Speed" then
            SpeedEnabled = not SpeedEnabled
            if SpeedEnabled then
                ActivateSpeedHack()
            else
                DeactivateSpeedHack()
            end
        elseif category == "ESP" then
            ESPEnabled = not ESPEnabled
            if ESPEnabled then
                ActivateESP()
            else
                DeactivateESP()
            end
        elseif category == "GodMode" then
            GodModeEnabled = not GodModeEnabled
            if GodModeEnabled then
                ActivateGodMode()
            else
                DeactivateGodMode()
            end
        end
    end)

    return button
end

-- Configuração do ScreenGui
ScreenGui.Parent = game:GetService("CoreGui")

-- Botão para abrir o menu
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 120, 0, 50)
OpenButton.Position = UDim2.new(0, 10, 0.5, -25)
OpenButton.Text = "Abrir Menu"
OpenButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Frame principal do menu
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Visible = false

-- Frame lateral (Sidebar) com botões
SidebarFrame.Parent = MainFrame
SidebarFrame.Size = UDim2.new(0, 100, 1, 0)
SidebarFrame.Position = UDim2.new(0, 0, 0, 0)
SidebarFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- Criando os botões
local buttonNames = {"Aimbot", "Fly Mode", "Speed Hack", "ESP", "God Mode"}
local posY = 0
for _, name in ipairs(buttonNames) do
    CreateButton(name, posY, name)
    posY = posY + 50
end

-- Função para abrir/fechar o menu
OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Monitorando as mudanças
game:GetService("RunService").Heartbeat:Connect(function()
    -- Monitorar as funções de trapaça continuamente
    if AimbotEnabled then ActivateAimbot() end
    if FlyEnabled then ActivateFlyMode() end
    if SpeedEnabled then ActivateSpeedHack() end
    if ESPEnabled then ActivateESP() end
    if GodModeEnabled then ActivateGodMode() end
end)
