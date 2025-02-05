-- Início do código
-- Criar o Mod Menu (Flutuante) para Roblox

local Gui = Instance.new("ScreenGui")
Gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Gui.Name = "ModMenu"

local frame = Instance.new("Frame")
frame.Parent = Gui
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0

local closeButton = Instance.new("TextButton")
closeButton.Parent = frame
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

closeButton.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

local titleBar = Instance.new("Frame")
titleBar.Parent = frame
titleBar.Size = UDim2.new(1, 0, 0, 50)
titleBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = titleBar
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Mod Menu"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true

local sideMenu = Instance.new("Frame")
sideMenu.Parent = frame
sideMenu.Size = UDim2.new(0, 75, 1, 0)
sideMenu.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local menuButton1 = Instance.new("TextButton")
menuButton1.Parent = sideMenu
menuButton1.Size = UDim2.new(1, 0, 0, 50)
menuButton1.Position = UDim2.new(0, 0, 0, 0)
menuButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuButton1.Text = "Geral"
menuButton1.TextColor3 = Color3.fromRGB(255, 255, 255)

local menuButton2 = Instance.new("TextButton")
menuButton2.Parent = sideMenu
menuButton2.Size = UDim2.new(1, 0, 0, 50)
menuButton2.Position = UDim2.new(0, 0, 0, 50)
menuButton2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuButton2.Text = "Arma"
menuButton2.TextColor3 = Color3.fromRGB(255, 255, 255)

local menuButton3 = Instance.new("TextButton")
menuButton3.Parent = sideMenu
menuButton3.Size = UDim2.new(1, 0, 0, 50)
menuButton3.Position = UDim2.new(0, 0, 0, 100)
menuButton3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuButton3.Text = "Jogador"
menuButton3.TextColor3 = Color3.fromRGB(255, 255, 255)

local menuButton4 = Instance.new("TextButton")
menuButton4.Parent = sideMenu
menuButton4.Size = UDim2.new(1, 0, 0, 50)
menuButton4.Position = UDim2.new(0, 0, 0, 150)
menuButton4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuButton4.Text = "Veículo"
menuButton4.TextColor3 = Color3.fromRGB(255, 255, 255)

local menuButton5 = Instance.new("TextButton")
menuButton5.Parent = sideMenu
menuButton5.Size = UDim2.new(1, 0, 0, 50)
menuButton5.Position = UDim2.new(0, 0, 0, 200)
menuButton5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuButton5.Text = "Trolls"
menuButton5.TextColor3 = Color3.fromRGB(255, 255, 255)

local menuButton6 = Instance.new("TextButton")
menuButton6.Parent = sideMenu
menuButton6.Size = UDim2.new(1, 0, 0, 50)
menuButton6.Position = UDim2.new(0, 0, 0, 250)
menuButton6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuButton6.Text = "Configurações"
menuButton6.TextColor3 = Color3.fromRGB(255, 255, 255)

local menuFrame = Instance.new("Frame")
menuFrame.Parent = frame
menuFrame.Size = UDim2.new(0, 225, 1, 0)
menuFrame.Position = UDim2.new(0, 75, 0, 0)
menuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
menuFrame.Visible = false

local submenuTitle = Instance.new("TextLabel")
submenuTitle.Parent = menuFrame
submenuTitle.Size = UDim2.new(1, 0, 0, 50)
submenuTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
submenuTitle.Text = "Submenu"
submenuTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
submenuTitle.TextScaled = true

-- Funções de trapaças adicionais
local function activateGodMode()
    -- Código para ativar o God Mode
    print("God Mode ativado!")
end

local function speedHack()
    -- Código para ativar Speed Hack
    print("Speed Hack ativado!")
end

local function infiniteHealth()
    -- Código para ativar Infinite Health
    print("Infinite Health ativado!")
end

local function antiAFK()
    -- Código para ativar Anti-AFK
    print("Anti-AFK ativado!")
end

local function superJump()
    -- Código para ativar Super Jump
    print("Super Jump ativado!")
end

local function spawnRandomObject()
    -- Código para spawnar objetos aleatórios
    print("Objeto aleatório spawnado!")
end

local function teleportToRandomLocation()
    -- Código para teleportar para uma localização aleatória
    print("Teleportado para uma localização aleatória!")
end

local function fakeBan()
    -- Código para fazer Fake Ban
    print("Fake Ban ativado!")
end

local function activateAimbot()
    -- Código para ativar o Aimbot
    print("Aimbot ativado!")
end

local function teleportToPlayer(player)
    -- Código para teleportar para o jogador
    print("Teleportado para " .. player.Name)
end

local function noClip()
    -- Código para ativar o NoClip
    print("NoClip ativado!")
end

local function spawnVehicle(vehicleType)
    -- Código para spawnar veículos
    print(vehicleType .. " spawnado!")
end

local function changePlayerColor(color)
    -- Código para mudar a cor do personagem
    print("Cor do personagem alterada para " .. color)
end

-- Função de exibição de submenu
menuButton1.MouseButton1Click:Connect(function()
    menuFrame.Visible = true
    submenuTitle.Text = "Geral"
    -- Adicionar funções aqui para o submenu Geral
end)

menuButton2.MouseButton1Click:Connect(function()
    menuFrame.Visible = true
    submenuTitle.Text = "Arma"
    -- Adicionar funções aqui para o submenu Arma
end)

menuButton3.MouseButton1Click:Connect(function()
    menuFrame.Visible = true
    submenuTitle.Text = "Jogador"
    -- Adicionar funções aqui para o submenu Jogador
end)

menuButton4.MouseButton1Click:Connect(function()
    menuFrame.Visible = true
    submenuTitle.Text = "Veículo"
    -- Adicionar funções aqui para o submenu Veículo
end)

menuButton5.MouseButton1Click:Connect(function()
    menuFrame.Visible = true
    submenuTitle.Text = "Trolls"
    -- Adicionar funções aqui para o submenu Trolls
end)

menuButton6.MouseButton1Click:Connect(function()
    menuFrame.Visible = true
    submenuTitle.Text = "Configurações"
    -- Adicionar funções aqui para o submenu Configurações
end)

-- Adicionando as funções nos submenus
local buttonFunctions = {
    GERAL = {
        {"God Mode", activateGodMode},
        {"Speed Hack", speedHack},
        {"Infinite Health", infiniteHealth},
        {"Anti-AFK", antiAFK},
        {"Super Jump", superJump},
        {"Spawn Random Object", spawnRandomObject},
        {"Teleport To Random", teleportToRandomLocation},
        {"Fake Ban", fakeBan},
    },
    ARMA = {
        {"Aimbot", activateAimbot},
        {"No Recoil", function() print("No Recoil ativado!") end},
        {"Hitbox Expander", function() print("Hitbox Expander ativado!") end},
        {"Super Aim", function() print("Super Aim ativado!") end},
    },
    JOGADORES = {
        {"ESP Wallhack", function() print("ESP Wallhack ativado!") end},
        {"Teleport to Player", teleportToPlayer},
        {"Speed Hack", speedHack},
        {"NoClip", noClip},
        {"Invisibility", function() print("Invisibility ativado!") end},
    },
    VEICULO = {
        {"Spawn Car", function() spawnVehicle("Carro") end},
        {"Spawn Plane", function() spawnVehicle("Avião") end},
    },
    TROLLS = {
        {"Explode Player", function() print("Explode Player ativado!") end},
        {"Chat Spammer", function() print("Chat Spammer ativado!") end},
        {"Destroy Server", function() print("Server destruído!") end},
    },
    CONFIGURACOES = {
        {"Mudar Cor do Personagem", changePlayerColor},
        {"Alterar Tema", function() print("Tema alterado!") end},
        {"Personalizar Teclas", function() print("Teclas personalizadas!") end},
    }
}
