local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local SideBar = Instance.new("Frame")
local Buttons = {}
local cheatStates = {} -- Tabela para armazenar o estado das trapaças

-- Configuração da interface
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0.5
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Visible = false

-- Título do Menu
Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Ghost Menu V1"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.Gotham
Title.TextSize = 28
Title.TextStrokeTransparency = 0.5
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Configuração do ScrollingFrame (sub-menu rolável)
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, -120, 0, 420)
ScrollingFrame.Position = UDim2.new(0, 120, 0.1, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 10

-- Layout do ScrollingFrame
UIListLayout.Parent = ScrollingFrame
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Função para limpar o submenu antes de adicionar novas opções
local function clearSubMenu()
    for _, child in pairs(ScrollingFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
end

-- Função para adicionar funções ao submenu com checkboxes
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

    -- Verificar o estado armazenado ou definir como desativado
    local isChecked = cheatStates[functionName] or false
    Checkbox.BackgroundColor3 = isChecked and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

    Checkbox.MouseButton1Click:Connect(function()
        isChecked = not isChecked
        Checkbox.BackgroundColor3 = isChecked and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

        -- Armazenar o estado da trapaça
        cheatStates[functionName] = isChecked

        if isChecked then
            cheatFunction()
        end
        print(functionName .. " " .. (isChecked and "Ativado" or "Desativado"))
    end)
end

-- Funções de trapaças (Adicionadas novas funções)
local function activateGodMode()
    -- Adicionando God Mode
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health = math.huge
end

local function activateAimbot()
    -- Código básico para ativar o Aimbot (só um exemplo)
    print("Aimbot ativado!")
    -- Implementar a lógica de aimbot real aqui
end

local function teleportToPlayer()
    -- Teleporta para o jogador selecionado
    local player = game.Players.LocalPlayer
    local targetPlayer = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
    player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
end

local function speedHack()
    -- Aumenta a velocidade do jogador
    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 100
end

local function noClip()
    -- Ativa o NoClip (Passar através das paredes)
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.PlatformStand = true
    player.Character.HumanoidRootPart.CanCollide = false
end

local function infiniteJump()
    -- Permite pular infinitamente
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.JumpHeight = 100
end

local function spawnItem(itemName)
    -- Spawna um item específico
    print("Item " .. itemName .. " spawnado!")
    -- Adicionar lógica de spawn de item aqui
end

-- Funções extras e trolls
local function explodePlayer(player)
    -- Explodir um jogador
    player.Character:BreakJoints()
end

local function chatSpammer()
    -- Spam de mensagens no chat
    while true do
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Spam!", "All")
        wait(0.5)
    end
end

local function fakeBan()
    -- Enviar uma falsa mensagem de banimento
    print("Você foi banido do servidor!")
end

local function teleportToRandom()
    -- Teleportar para um local aleatório no mapa
    local randomPos = Vector3.new(math.random(-100, 100), 50, math.random(-100, 100))
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(randomPos)
end

local function spawnVehicle(vehicleType)
    -- Função de spawn de veículos (personalizar conforme necessário)
    print(vehicleType .. " spawnado!")
end

-- Barra Lateral (SideBar)
SideBar.Parent = MainFrame
SideBar.Size = UDim2.new(0, 120, 1, -50)
SideBar.Position = UDim2.new(0, 0, 0, 50)
SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SideBar.BackgroundTransparency = 0.7
SideBar.BorderSizePixel = 0

-- Função para adicionar botões laterais e carregar funções específicas
local buttonFunctions = {
    GERAL = {
        {"AutoClick", function() print("AutoClick ativado") end},
        {"God Mode", activateGodMode},
        {"Bypass Anti-Cheat", function() print("Anti-Cheat Bypass ativado!") end},
        {"Infinitive Jump", infiniteJump},
        {"Speed Hack", speedHack},
        {"Spawn Item - Carro", function() spawnItem("Carro") end},
        {"Teleport To Player", teleportToPlayer},
        {"Explode Player", explodePlayer},
        {"Teleport To Random Position", teleportToRandom},
        {"Chat Spammer", chatSpammer},
        {"Fake Ban", fakeBan},
        {"Fake Admin", function() print("Você agora é um Fake Admin!") end},
        {"Unlock All Items", function() print("Todos os itens desbloqueados!") end},
        {"Unlock All Levels", function() print("Todos os níveis desbloqueados!") end},
        {"Disable Anti-AFK", function() print("Anti-AFK desativado!") end},
        {"Change Time of Day", function() print("Tempo do dia alterado!") end},
        {"Enable Stealth Mode", function() print("Modo Stealth ativado!") end},
        {"Force Save", function() print("Forçando salvamento!") end},
        {"No Fog", function() print("Neblina desativada!") end},
        {"Unlimited Ammo", function() print("Munição infinita ativada!") end},
        {"Super Jump", function() print("Super Jump ativado!") end},
        {"Disable Gravity", function() print("Gravidade desativada!") end},
        {"Zoom Hack", function() print("Zoom Hack ativado!") end},
        {"Random Weather", function() print("Clima aleatório ativado!") end},
    },
    ARMA = {
        {"Aimbot", activateAimbot},
        {"Hitbox Expander", function() print("Hitbox Expander ativado!") end},
        {"No Recoil", function() print("No Recoil ativado!") end},
        {"Weapon Hack", function() print("Weapon Hack ativado!") end},
        {"Super Aim", function() print("Super Aim ativado!") end},
        {"Auto Fire", function() print("Auto Fire ativado!") end},
        {"Rapid Fire", function() print("Rapid Fire ativado!") end},
        {"Explosive Ammo", function() print("Munição explosiva ativada!") end},
        {"Sniper Zoom", function() print("Zoom de sniper ativado!") end},
        {"Laser Sight", function() print("Laser Sight ativado!") end},
    },
    JOGADORES = {
        {"ESP Wallhack", function() print("ESP Wallhack ativado!") end},
        {"Teleport", teleportToPlayer},
        {"Speed Hack", speedHack},
        {"NoClip", noClip},
        {"Invisibility", function() print("Invisibility ativado!") end},
        {"Freeze Player", function() print("Freeze Player ativado!") end},
        {"Player Tagging", function() print("Player Tagging ativado!") end},
        {"Player ESP", function() print("Player ESP ativado!") end},
        {"Player Info", function() print("Informações do jogador exibidas!") end},
        {"Change Player Speed", function() print("Velocidade do jogador alterada!") end},
        {"Kill Player", function() print("Jogador morto!") end},
    },
    VEICULO = {
        {"Boost Nitro", function() print("Boost Nitro ativado!") end},
        {"Carro Voador", function() print("Carro Voador ativado!") end},
        {"Anti-Crash", function() print("Anti-Crash ativado!") end},
        {"Spawn Motorcycle", function() spawnVehicle("Motorcycle") end},
        {"Spawn Tank", function() spawnVehicle("Tank") end},
        {"Spawn Helicopter", function() spawnVehicle("Helicopter") end},
        {"Carro Turbo", function() print("Carro Turbo ativado!") end},
        {"Super Boost", function() print("Super Boost ativado!") end},
        {"Fly Mode", function() print("Modo Voo ativado!") end},
        {"Spawn Plane", function() print("Avião spawnado!") end},
    },
    TROLLS = {
        {"Explodir Jogador", function() print("Explodir Jogador ativado!") end},
        {"Loop Kill", function() print("Loop Kill ativado!") end},
        {"Chat Spammer", function() print("Chat Spammer ativado!") end},
        {"Send Fake Message", function() print("Mensagem falsa enviada!") end},
        {"Destroy Server", function() print("Server destruído!") end},
        {"Freeze Server", function() print("Servidor congelado!") end},
        {"Kick All Players", function() print("Todos os jogadores foram expulsos!") end},
        {"Lag Server", function() print("Servidor lagado!") end},
        {"Send Fake Ban", function() print("Banimento falso enviado!") end},
    },
    CONFIGURACOES = {
        {"Mudar Tema", function() print("Tema alterado!") end},
        {"Ativar Modo Stealth", function() print("Modo Stealth ativado!") end},
        {"Personalizar Teclas", function() print("Teclas personalizadas!") end},
    },
}

-- Inicializando botões
for category, functions in pairs(buttonFunctions) do
    -- Adiciona botões de categoria
    local CategoryButton = Instance.new("TextButton")
    CategoryButton.Size = UDim2.new(1, 0, 0, 50)
    CategoryButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    CategoryButton.Text = category
    CategoryButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CategoryButton.Font = Enum.Font.SourceSans
    CategoryButton.TextSize = 20
    CategoryButton.Parent = SideBar

    CategoryButton.MouseButton1Click:Connect(function()
        clearSubMenu()
        for _, func in ipairs(functions) do
            addCheckboxToMenu(func[1], func[2])
        end
    end)
end
