-- Criação do ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Criação do Frame principal (menu)
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Draggable = true
MainFrame.Visible = false  -- Inicialmente o menu está oculto

-- Título do menu
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Mod Menu"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 24

-- Botão para abrir o menu
local MenuButton = Instance.new("TextButton")
MenuButton.Parent = ScreenGui
MenuButton.Size = UDim2.new(0, 100, 0, 50)
MenuButton.Position = UDim2.new(0, 10, 0.5, -25)
MenuButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MenuButton.Text = "Abrir Menu"
MenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MenuButton.Font = Enum.Font.SourceSans
MenuButton.TextSize = 18

-- Criação do menu lateral
local SideMenu = Instance.new("Frame")
SideMenu.Parent = MainFrame
SideMenu.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SideMenu.Size = UDim2.new(0, 100, 1, 0)

-- Botões laterais
local buttons = {}

-- Função para criar botões
local function createButton(parent, position, text)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18
    table.insert(buttons, button)
    return button
end

-- Criando os botões laterais
createButton(SideMenu, UDim2.new(0, 0, 0, 50), "Geral")
createButton(SideMenu, UDim2.new(0, 0, 0, 100), "Arma")
createButton(SideMenu, UDim2.new(0, 0, 0, 150), "Jogador")
createButton(SideMenu, UDim2.new(0, 0, 0, 200), "Veículos")
createButton(SideMenu, UDim2.new(0, 0, 0, 250), "Trolls")
createButton(SideMenu, UDim2.new(0, 0, 0, 300), "Configuração")

-- Submenus (inicialmente invisíveis)
local SubMenus = {}

-- Função para criar um submenu
local function createSubMenu(name)
    local frame = Instance.new("Frame")
    frame.Parent = MainFrame
    frame.Size = UDim2.new(0, 300, 0, 400)
    frame.Position = UDim2.new(0, 100, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.Visible = false  -- Inicialmente invisível
    SubMenus[name] = frame
end

-- Criando os submenus
createSubMenu("Geral")
createSubMenu("Arma")
createSubMenu("Jogador")
createSubMenu("Veículos")
createSubMenu("Trolls")
createSubMenu("Configuração")

-- Função para alternar visibilidade dos submenus
local function showSubMenu(name)
    for key, submenu in pairs(SubMenus) do
        submenu.Visible = (key == name)
    end
end

-- Função para criar uma caixinha de seleção (checkbox)
local function createCheckbox(parent, position, label, callback)
    local checkboxFrame = Instance.new("Frame")
    checkboxFrame.Parent = parent
    checkboxFrame.Size = UDim2.new(0, 250, 0, 30)
    checkboxFrame.Position = position
    checkboxFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local labelText = Instance.new("TextLabel")
    labelText.Parent = checkboxFrame
    labelText.Size = UDim2.new(0, 200, 0, 30)
    labelText.Position = UDim2.new(0, 0, 0, 0)
    labelText.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    labelText.Text = label
    labelText.TextColor3 = Color3.fromRGB(255, 255, 255)
    labelText.Font = Enum.Font.SourceSans
    labelText.TextSize = 18

    local checkbox = Instance.new("TextButton")
    checkbox.Parent = checkboxFrame
    checkbox.Size = UDim2.new(0, 30, 0, 30)
    checkbox.Position = UDim2.new(0, 200, 0, 0)
    checkbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    checkbox.Text = ""
    checkbox.TextColor3 = Color3.fromRGB(255, 255, 255)

    local isChecked = false
    checkbox.MouseButton1Click:Connect(function()
        isChecked = not isChecked
        checkbox.BackgroundColor3 = isChecked and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        callback(isChecked)
    end)
end

-- Funções para ativar/desativar as opções (representadas por checkboxes)
local function activateAimbot(isChecked)
    if isChecked then
        print("Aimbot Ativado")
        -- Coloque o código do Aimbot aqui
    else
        print("Aimbot Desativado")
    end
end

local function activateESP(isChecked)
    if isChecked then
        print("ESP Ativado")
        -- Coloque o código do ESP aqui
    else
        print("ESP Desativado")
    end
end

local function activateFly(isChecked)
    if isChecked then
        print("Fly Mode Ativado")
        -- Coloque o código de Fly Mode aqui
    else
        print("Fly Mode Desativado")
    end
end

local function activateSpeedBoost(isChecked)
    if isChecked then
        print("Speed Boost Ativado")
        -- Coloque o código de Speed Boost aqui
    else
        print("Speed Boost Desativado")
    end
end

local function activateNoClip(isChecked)
    if isChecked then
        print("NoClip Ativado")
        -- Coloque o código de NoClip aqui
    else
        print("NoClip Desativado")
    end
end

local function activateGodMode(isChecked)
    if isChecked then
        print("God Mode Ativado")
        -- Coloque o código de God Mode aqui
    else
        print("God Mode Desativado")
    end
end

local function activateInfiniteJump(isChecked)
    if isChecked then
        print("Infinite Jump Ativado")
        -- Coloque o código de Infinite Jump aqui
    else
        print("Infinite Jump Desativado")
    end
end

local function activateTeleport(isChecked)
    if isChecked then
        print("Teleport Ativado")
        -- Coloque o código de Teleport aqui
    else
        print("Teleport Desativado")
    end
end

local function activateWallHack(isChecked)
    if isChecked then
        print("WallHack Ativado")
        -- Coloque o código de WallHack aqui
    else
        print("WallHack Desativado")
    end
end

local function activateChams(isChecked)
    if isChecked then
        print("Chams Ativado")
        -- Coloque o código de Chams aqui
    else
        print("Chams Desativado")
    end
end

local function activateAntiKick(isChecked)
    if isChecked then
        print("Anti-Kick Ativado")
        -- Coloque o código de Anti-Kick aqui
    else
        print("Anti-Kick Desativado")
    end
end

local function activateAntiBan(isChecked)
    if isChecked then
        print("Anti-Ban Ativado")
        -- Coloque o código de Anti-Ban aqui
    else
        print("Anti-Ban Desativado")
    end
end

local function activateTroll(isChecked)
    if isChecked then
        print("Trolls Ativado")
        -- Coloque o código de Trolls aqui
    else
        print("Trolls Desativado")
    end
end

local function applyConfigurations(isChecked)
    if isChecked then
        print("Configurações Aplicadas")
        -- Coloque o código de Configurações aqui
    else
        print("Configurações Desfeitas")
    end
end

-- Submenu "Geral" com caixinhas de seleção
createCheckbox(SubMenus["Geral"], UDim2.new(0, 50, 0, 50), "Aimbot", activateAimbot)
createCheckbox(SubMenus["Geral"], UDim2.new(0, 50, 0, 100), "ESP", activateESP)

-- Submenu "Arma" com caixinhas de seleção
createCheckbox(SubMenus["Arma"], UDim2.new(0, 50, 0, 50), "Fly Mode", activateFly)
createCheckbox(SubMenus["Arma"], UDim2.new(0, 50, 0, 100), "Speed Boost", activateSpeedBoost)
createCheckbox(SubMenus["Arma"], UDim2.new(0, 50, 0, 150), "NoClip", activateNoClip)
createCheckbox(SubMenus["Arma"], UDim2.new(0, 50, 0, 200), "God Mode", activateGodMode)

-- Submenu "Jogador" com caixinhas de seleção
createCheckbox(SubMenus["Jogador"], UDim2.new(0, 50, 0, 50), "Infinite Jump", activateInfiniteJump)
createCheckbox(SubMenus["Jogador"], UDim2.new(0, 50, 0, 100), "Teleport", activateTeleport)
createCheckbox(SubMenus["Jogador"], UDim2.new(0, 50, 0, 150), "WallHack", activateWallHack)

-- Submenu "Veículos" com caixinhas de seleção
createCheckbox(SubMenus["Veículos"], UDim2.new(0, 50, 0, 50), "Chams", activateChams)

-- Submenu "Trolls" com caixinhas de seleção
createCheckbox(SubMenus["Trolls"], UDim2.new(0, 50, 0, 50), "Ativar Trolls", activateTroll)

-- Submenu "Configuração" com caixinhas de seleção
createCheckbox(SubMenus["Configuração"], UDim2.new(0, 50, 0, 50), "Aplicar Configurações", applyConfigurations)

-- Função para abrir e fechar o menu
MenuButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Conectando os botões laterais aos submenus
buttons[1].MouseButton1Click:Connect(function()
    showSubMenu("Geral")
end)
buttons[2].MouseButton1Click:Connect(function()
    showSubMenu("Arma")
end)
buttons[3].MouseButton1Click:Connect(function()
    showSubMenu("Jogador")
end)
buttons[4].MouseButton1Click:Connect(function()
    showSubMenu("Veículos")
end)
buttons[5].MouseButton1Click:Connect(function()
    showSubMenu("Trolls")
end)
buttons[6].MouseButton1Click:Connect(function()
    showSubMenu("Configuração")
end)
