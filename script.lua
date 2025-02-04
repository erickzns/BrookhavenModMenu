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
    frame.Visible = false
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

-- Função para ativar o Aimbot
local function activateAimbot()
    print("Aimbot Ativado")
    -- Implementar lógica do Aimbot aqui
end

-- Função para ativar o ESP
local function activateESP()
    print("ESP Ativado")
    -- Implementar lógica do ESP aqui
end

-- Função para ativar o Fly
local function activateFly()
    print("Fly Mode Ativado")
    -- Implementar lógica do Fly Mode aqui
end

-- Função para ativar o God Mode
local function activateGodMode()
    print("God Mode Ativado")
    -- Implementar lógica do God Mode aqui
end

-- Função para ativar o Speed Boost
local function activateSpeedBoost()
    print("Speed Boost Ativado")
    -- Implementar lógica do Speed Boost aqui
end

-- Função para ativar o NoClip
local function activateNoClip()
    print("NoClip Ativado")
    -- Implementar lógica do NoClip aqui
end

-- Função para ativar o Teleport para Player
local function activateTeleportToPlayer()
    print("Teleport para Player Ativado")
    -- Implementar lógica do Teleport para Player aqui
end

-- Função para ativar o Trolls (exemplo)
local function activateTroll()
    print("Função Troll Ativada")
    -- Implementar lógica dos trolls aqui
end

-- Função para aplicar configurações (exemplo)
local function applyConfigurations()
    print("Configurações Aplicadas")
    -- Implementar lógica de configurações aqui
end

-- Criando os botões dentro dos submenus
local function createSubMenuButton(parent, position, text, callback)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Size = UDim2.new(0, 200, 0, 40)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18
    button.MouseButton1Click:Connect(callback)
end

-- Submenu "Geral"
createSubMenuButton(SubMenus["Geral"], UDim2.new(0, 50, 0, 50), "Ativar Aimbot", activateAimbot)
createSubMenuButton(SubMenus["Geral"], UDim2.new(0, 50, 0, 100), "Ativar ESP", activateESP)

-- Submenu "Arma"
createSubMenuButton(SubMenus["Arma"], UDim2.new(0, 50, 0, 50), "Ativar Fly", activateFly)
createSubMenuButton(SubMenus["Arma"], UDim2.new(0, 50, 0, 100), "Ativar God Mode", activateGodMode)

-- Submenu "Jogador"
createSubMenuButton(SubMenus["Jogador"], UDim2.new(0, 50, 0, 50), "Ativar Speed Boost", activateSpeedBoost)
createSubMenuButton(SubMenus["Jogador"], UDim2.new(0, 50, 0, 100), "Ativar NoClip", activateNoClip)

-- Submenu "Veículos"
createSubMenuButton(SubMenus["Veículos"], UDim2.new(0, 50, 0, 50), "Teleport para Player", activateTeleportToPlayer)

-- Submenu "Trolls"
createSubMenuButton(SubMenus["Trolls"], UDim2.new(0, 50, 0, 50), "Ativar Troll", activateTroll)

-- Submenu "Configuração"
createSubMenuButton(SubMenus["Configuração"], UDim2.new(0, 50, 0, 50), "Aplicar Configurações", applyConfigurations)

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
