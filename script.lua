local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local SideBar = Instance.new("Frame")
local Buttons = {}

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
    CheckBoxText.TextColor3 = Color3.fromRGB(255, 255, 255) -- Tornando os nomes dos botões brancos
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

-- Funções de trapaças
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
    },
    ARMA = {
        {"Aimbot", activateAimbot},
        {"Hitbox Expander", function() print("Hitbox Expander ativado!") end},
        {"No Recoil", function() print("No Recoil ativado!") end},
        {"Weapon Hack", function() print("Weapon Hack ativado!") end},
        {"Super Aim", function() print("Super Aim ativado!") end},
    },
    JOGADORES = {
        {"ESP Wallhack", function() print("ESP Wallhack ativado!") end},
        {"Teleport", teleportToPlayer},
        {"Speed Hack", speedHack},
        {"NoClip", noClip},
        {"Invisibility", function() print("Invisibility ativado!") end},
        {"Freeze Player", function() print("Freeze Player ativado!") end},
    },
    VEICULO = {
        {"Boost Nitro", function() print("Boost Nitro ativado!") end},
        {"Carro Voador", function() print("Carro Voador ativado!") end},
        {"Anti-Crash", function() print("Anti-Crash ativado!") end},
        {"Spawn Motorcycle", function() spawnVehicle("Motorcycle") end},
        {"Spawn Tank", function() spawnVehicle("Tank") end},
    },
    TROLLS = {
        {"Explodir Jogador", function() print("Explodir Jogador ativado!") end},
        {"Loop Kill", function() print("Loop Kill ativado!") end},
        {"Spam Chat", chatSpammer},
        {"Trocar ID", function() print("ID trocado!") end},
    }
}

-- Função para criar botões na Sidebar
local function createButton(name, category)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 50)
    Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 18
    Button.TextStrokeTransparency = 0.5
    Button.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
    Button.Parent = SideBar

    Button.MouseButton1Click:Connect(function()
        clearSubMenu()
        for _, func in pairs(buttonFunctions[category]) do
            addCheckboxToMenu(func[1], func[2])
        end
    end)
end

-- Adicionando botões laterais
createButton("Geral", "GERAL")
createButton("Arma", "ARMA")
createButton("Jogadores", "JOGADORES")
createButton("Veículo", "VEICULO")
createButton("Trolls", "TROLLS")

-- Função para abrir e fechar o menu
local openKey = Enum.KeyCode.LeftControl
local closeKey = Enum.KeyCode.RightControl

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == openKey then
            MainFrame.Visible = true
        elseif input.KeyCode == closeKey then
            MainFrame.Visible = false
        end
    end
end)
