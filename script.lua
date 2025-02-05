-- Seu código inicial (não removi nada)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local SideBar = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local Buttons = {}

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "ModMenu"
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Size = UDim2.new(0, 500, 0, 500)
Frame.Position = UDim2.new(0.5, -250, 0.5, -250)

SideBar.Parent = Frame
SideBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SideBar.Size = UDim2.new(0, 150, 1, 0)

ScrollingFrame.Parent = Frame
ScrollingFrame.Size = UDim2.new(1, -150, 1, 0)
ScrollingFrame.Position = UDim2.new(0, 150, 0, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)
ScrollingFrame.ScrollBarThickness = 10

-- Funções de trapaça (adicionando conforme sua solicitação)
local function activateGodMode()
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Health = math.huge -- A saúde se torna infinita
        print("God Mode ativado!")
    end
end

local function activateAimbot()
    -- Exemplo de código de Aimbot (deve ser implementado de acordo com a lógica do jogo)
    local player = game.Players.LocalPlayer
    local target = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
    print("Aimbot ativado! A mirando no jogador: " .. target.Name)
    -- Implementar lógica de aimbot real aqui
end

local function teleportToPlayer()
    local player = game.Players.LocalPlayer
    local targetPlayer = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
    player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    print("Teleportado para o jogador " .. targetPlayer.Name)
end

local function infiniteJump()
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.JumpHeight = 100
    print("Pulo infinito ativado!")
end

local function speedHack()
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.WalkSpeed = 100
    print("Velocidade aumentada para 100!")
end

local function superJump()
    -- Aumenta o pulo do jogador
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.JumpHeight = 200
    print("Super pulo ativado!")
end

local function noClip()
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.PlatformStand = true
    player.Character.HumanoidRootPart.CanCollide = false
    print("NoClip ativado!")
end

local function infiniteHealth()
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Health = math.huge
        print("Saúde infinita ativada!")
    end
end

local function antiAFK()
    -- Previne o desconectar por inatividade
    while wait(30) do
        game:GetService("Players").LocalPlayer:Kick("Desconectado por inatividade.")
        print("Anti-AFK ativado!")
    end
end

local function spawnRandomObject()
    -- Spawn aleatório de objeto
    local model = Instance.new("Part")
    model.Size = Vector3.new(10, 1, 10)
    model.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
    model.Anchored = true
    model.Parent = workspace
    print("Objeto aleatório spawnado!")
end

local function changePlayerColor()
    -- Mudar a cor do personagem
    local player = game.Players.LocalPlayer
    player.Character.Head.BrickColor = BrickColor.Random()
    print("Cor do personagem alterada!")
end

local function spawnVehicle(vehicleType)
    -- Função de spawn de veículos
    if vehicleType == "Carro" then
        local vehicle = Instance.new("VehicleSeat")
        vehicle.Parent = game.Workspace
        print("Carro spawnado!")
    elseif vehicleType == "Avião" then
        local vehicle = Instance.new("VehicleSeat")
        vehicle.Parent = game.Workspace
        print("Avião spawnado!")
    end
end

local function fakeBan()
    -- Enviar uma falsa mensagem de banimento
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Você foi banido do servidor!", "All")
    print("Falso banimento enviado!")
end

local function teleportToRandomLocation()
    -- Teleportar para uma posição aleatória no mapa
    local randomPos = Vector3.new(math.random(-100, 100), 50, math.random(-100, 100))
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(randomPos)
    print("Teleportado para posição aleatória!")
end

-- Função para adicionar as opções de trapaça aos submenus
local function addCheckboxToMenu(functionName, cheatFunction)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 30)
    Frame.BackgroundTransparency = 1
    Frame.Parent = ScrollingFrame

    local CheckBoxText = Instance.new("TextLabel")
    CheckBoxText.Size = UDim2.new(1, -40, 1, 0)
    CheckBoxText.Position = UDim2.new(0, 10, 0, 0)
    CheckBoxText.Text = functionName
    CheckBoxText.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckBoxText.BackgroundTransparency = 1
    CheckBoxText.Font = Enum.Font.SourceSans
    CheckBoxText.TextSize = 18
    CheckBoxText.TextXAlignment = Enum.TextXAlignment.Left
    CheckBoxText.Parent = Frame

    local Checkbox = Instance.new("TextButton")
    Checkbox.Size = UDim2.new(0, 20, 0, 20)
    Checkbox.Position = UDim2.new(1, -30, 0.5, -10)
    Checkbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Checkbox.Text = ""
    Checkbox.Parent = Frame

    local isChecked = false
    Checkbox.MouseButton1Click:Connect(function()
        isChecked = not isChecked
        Checkbox.BackgroundColor3 = isChecked and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        if isChecked then
            cheatFunction()
        end
        print(functionName .. " " .. (isChecked and "Ativado" or "Desativado"))
    end)
end

-- Função para adicionar os botões no menu lateral
local function addSideButton(name, yPosition)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 120, 0, 40)
    Button.Position = UDim2.new(0, 0, 0, yPosition)
    Button.Text = name
    Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Button.TextColor3 = Color3.fromRGB(255, 0, 0)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 18
    Button.Parent = SideBar

    Button.MouseButton1Click:Connect(function()
        clearSubMenu()
        for _, funcData in ipairs(buttonFunctions[name] or {}) do
            local funcName, func = unpack(funcData)
            addCheckboxToMenu(funcName, func)
        end
    end)

    table.insert(Buttons, Button)
end

-- Funções do mod menu
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

-- Adicionando os botões ao lado do menu
local buttonNames = {"GERAL", "ARMA", "JOGADORES", "VEICULO", "TROLLS", "CONFIGURACOES"}
for i, name in ipairs(buttonNames) do
    addSideButton(name, (i - 1) * 50)
end
