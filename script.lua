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
MainFrame.Visible = false  -- O menu começa invisível

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
local checkboxStates = {}  -- Tabela para armazenar o estado dos checkboxes

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

    local isChecked = checkboxStates[functionName] or false  -- Verifica o estado salvo
    Checkbox.BackgroundColor3 = isChecked and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

    Checkbox.MouseButton1Click:Connect(function()
        isChecked = not isChecked
        Checkbox.BackgroundColor3 = isChecked and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        checkboxStates[functionName] = isChecked  -- Armazenando o estado
        if isChecked then
            cheatFunction()
        end
        print(functionName .. " " .. (isChecked and "Ativado" or "Desativado"))
    end)
end

-- Funções de trapaça (exemplo)

-- GERAL
local function activateSpeedHack()
    print("Speed Hack ativado!")
    for _, player in ipairs(game.Players:GetChildren()) do
        if player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 100  -- Aumento de velocidade
            end
        end
    end
end

local function teleportToRandom()
    local randomPos = CFrame.new(math.random(-500, 500), math.random(50, 100), math.random(-500, 500))
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(randomPos)
end

local function activateNoClip()
    local character = game.Players.LocalPlayer.Character
    if character then
        character.HumanoidRootPart.Anchored = true
    end
end

local function toggleFly(enable)
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = enable
        end
    end
end

-- ARMA
local function infiniteAmmo()
    print("Munição infinita ativada!")
    -- Código para implementar a munição infinita
end

local function noRecoil()
    print("Recoil desativado!")
    -- Código para remover o recoil
end

local function rapidFire()
    print("Disparo rápido ativado!")
    -- Código para disparos rápidos
end

local function autoAim()
    print("Auto-Aim ativado!")
    -- Código para implementar Auto-Aim
end

local function removeWeaponCooldown()
    print("Cooldown de arma removido!")
    -- Código para remover o cooldown de arma
end

-- JOGADORES
local function teleportToPlayer()
    local targetPlayer = game.Players.LocalPlayer
    if targetPlayer.Character then
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(targetPlayer.Character.PrimaryPart.CFrame)
    end
end

local function killPlayer()
    print("Matando jogador alvo!")
    -- Código para matar o jogador alvo
end

local function freezePlayer()
    local player = game.Players.LocalPlayer
    if player.Character then
        player.Character.HumanoidRootPart.Anchored = true
    end
end

local function unfrozenPlayer()
    local player = game.Players.LocalPlayer
    if player.Character then
        player.Character.HumanoidRootPart.Anchored = false
    end
end

-- DINHEIRO
local function addMoney()
    local player = game.Players.LocalPlayer
    player.leaderstats.Money.Value = player.leaderstats.Money.Value + 1000
end

local function removeMoney()
    local player = game.Players.LocalPlayer
    player.leaderstats.Money.Value = player.leaderstats.Money.Value - 1000
end

local function setMoney(value)
    local player = game.Players.LocalPlayer
    player.leaderstats.Money.Value = value
end

-- VEICULO
local function spawnVehicle(vehicleType)
    print("Gerando veículo: " .. vehicleType)
    -- Código para gerar o veículo
end

local function giveVehicleKeys()
    print("Chaves de veículo dadas!")
    -- Código para dar as chaves do veículo ao jogador
end

local function toggleVehicleInvincibility(enable)
    if enable then
        print("Veículo invencível ativado!")
    else
        print("Veículo invencível desativado!")
    end
end

-- TROLLS
local function spawnBomb()
    print("Bombas ativadas!")
    -- Código para gerar uma bomba
end

local function toggleGravity(enable)
    if enable then
        print("Gravidade ativada!")
    else
        print("Gravidade desativada!")
    end
end

local function spawnFakePlayer()
    print("Jogador falso gerado!")
    -- Código para gerar um jogador falso
end

local function spawnConfetti()
    print("Confete ativado!")
    -- Código para gerar confetes
end

-- CONFIGURAÇÕES
local function setPlayerSpeed(speed)
    print("Ajustando a velocidade do jogador para: " .. speed)
end

local function setGravity(gravity)
    print("Ajustando a gravidade para: " .. gravity)
end

local function setJumpHeight(height)
    print("Ajustando a altura do pulo para: " .. height)
end

local function setWalkSpeed(speed)
    print("Ajustando a velocidade de caminhada para: " .. speed)
end

local function enableAntiCheat()
    print("Anti-Cheat ativado!")
end

-- Barra Lateral (SideBar)
SideBar.Parent = MainFrame
SideBar.Size = UDim2.new(0, 120, 1, -50)
SideBar.Position = UDim2.new(0, 0, 0, 50)
SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SideBar.BackgroundTransparency = 0.7
SideBar.BorderSizePixel = 0

-- Função para adicionar botões laterais e carregar funções específicas
local function addSideButton(name, positionY)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 120, 0, 50)
    Button.Position = UDim2.new(0, 0, 0, positionY)
    Button.Text = name
    Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Button.TextColor3 = Color3.fromRGB(255, 0, 0)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 18
    Button.Parent = SideBar

    Button.MouseButton1Click:Connect(function()
        clearSubMenu()
        -- Dependendo do nome do botão, adicionar funções diferentes
        if name == "GERAL" then
            addCheckboxToMenu("Ativar Speed Hack", activateSpeedHack)
            addCheckboxToMenu("Teleportar para Aleatório", teleportToRandom)
            addCheckboxToMenu("Ativar No-Clip", activateNoClip)
            addCheckboxToMenu("Ativar Voar", toggleFly)
        elseif name == "ARMA" then
            addCheckboxToMenu("Ativar Munição Infinita", infiniteAmmo)
            addCheckboxToMenu("Ativar Sem Recoil", noRecoil)
            addCheckboxToMenu("Ativar Disparo Rápido", rapidFire)
            addCheckboxToMenu("Ativar Auto-Aim", autoAim)
            addCheckboxToMenu("Remover Cooldown de Arma", removeWeaponCooldown)
        elseif name == "JOGADORES" then
            addCheckboxToMenu("Teleportar para Jogador", teleportToPlayer)
            addCheckboxToMenu("Matar Jogador", killPlayer)
            addCheckboxToMenu("Congelar Jogador", freezePlayer)
            addCheckboxToMenu("Descongelar Jogador", unfrozenPlayer)
        elseif name == "DINHEIRO" then
            addCheckboxToMenu("Adicionar Dinheiro", addMoney)
            addCheckboxToMenu("Remover Dinheiro", removeMoney)
            addCheckboxToMenu("Definir Dinheiro", setMoney)
        elseif name == "VEICULO" then
            addCheckboxToMenu("Gerar Veículo", spawnVehicle)
            addCheckboxToMenu("Dar Chaves de Veículo", giveVehicleKeys)
            addCheckboxToMenu("Ativar Invencibilidade no Veículo", toggleVehicleInvincibility)
        elseif name == "TROLLS" then
            addCheckboxToMenu("Ativar Bombas", spawnBomb)
            addCheckboxToMenu("Ativar Gravidade", toggleGravity)
            addCheckboxToMenu("Gerar Jogador Falso", spawnFakePlayer)
            addCheckboxToMenu("Gerar Confete", spawnConfetti)
        end
    end)
end

-- Adicionando botões laterais
local buttonNames = {"GERAL", "ARMA", "JOGADORES", "VEICULO", "TROLLS"}
for i, name in ipairs(buttonNames) do
    addSideButton(name, (i - 1) * 50)
end

-- Botão de abrir/fechar o menu
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 60, 0, 60)
toggleButton.Position = UDim2.new(0, 0, 0, 0)
toggleButton.Text = "+"
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextSize = 28
toggleButton.Parent = MainFrame

toggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible  -- Alterna a visibilidade do menu
    toggleButton.Text = MainFrame.Visible and "-" or "+"  -- Alterna o texto do botão
end)
