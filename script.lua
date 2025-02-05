-- Inicialização do ScreenGui
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

-- Configuração do menu (ScreenGui, MainFrame, etc.)

-- Variáveis de controle para saber se a trapaça está ativa ou não
local speedHackActive = false
local noClipActive = false
local flyActive = false
local infiniteAmmoActive = false
local noRecoilActive = false
local rapidFireActive = false
local freezePlayerActive = false
local vehicleInvincibilityActive = false
local gravityActive = false
local bombActive = false

-- Funções de trapaça (exemplo)
-- GERAL
local function toggleSpeedHack()
    if speedHackActive then
        print("Speed Hack desativado!")
        for _, player in ipairs(game.Players:GetChildren()) do
            if player.Character then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 16  -- Volta para a velocidade normal
                end
            end
        end
    else
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
    speedHackActive = not speedHackActive
end

local function toggleNoClip()
    if noClipActive then
        print("No-Clip desativado!")
        local character = game.Players.LocalPlayer.Character
        if character then
            character.HumanoidRootPart.Anchored = false
        end
    else
        print("No-Clip ativado!")
        local character = game.Players.LocalPlayer.Character
        if character then
            character.HumanoidRootPart.Anchored = true
        end
    end
    noClipActive = not noClipActive
end

local function toggleFly()
    if flyActive then
        print("Voar desativado!")
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
    else
        print("Voar ativado!")
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = true
            end
        end
    end
    flyActive = not flyActive
end

-- ARMA
local function toggleInfiniteAmmo()
    if infiniteAmmoActive then
        print("Munição infinita desativada!")
        -- Código para desativar a munição infinita
    else
        print("Munição infinita ativada!")
        -- Código para ativar a munição infinita
    end
    infiniteAmmoActive = not infiniteAmmoActive
end

local function toggleNoRecoil()
    if noRecoilActive then
        print("Recoil ativado!")
        -- Código para reverter o recoil
    else
        print("Recoil desativado!")
        -- Código para remover o recoil
    end
    noRecoilActive = not noRecoilActive
end

local function toggleRapidFire()
    if rapidFireActive then
        print("Disparo rápido desativado!")
        -- Código para desativar o disparo rápido
    else
        print("Disparo rápido ativado!")
        -- Código para disparos rápidos
    end
    rapidFireActive = not rapidFireActive
end

-- JOGADORES
local function toggleFreezePlayer()
    if freezePlayerActive then
        print("Descongelando jogador!")
        local player = game.Players.LocalPlayer
        if player.Character then
            player.Character.HumanoidRootPart.Anchored = false
        end
    else
        print("Congelando jogador!")
        local player = game.Players.LocalPlayer
        if player.Character then
            player.Character.HumanoidRootPart.Anchored = true
        end
    end
    freezePlayerActive = not freezePlayerActive
end

-- VEICULO
local function toggleVehicleInvincibility()
    if vehicleInvincibilityActive then
        print("Invencibilidade do veículo desativada!")
        -- Código para desativar a invencibilidade do veículo
    else
        print("Invencibilidade do veículo ativada!")
        -- Código para ativar a invencibilidade do veículo
    end
    vehicleInvincibilityActive = not vehicleInvincibilityActive
end

-- TROLLS
local function toggleGravity()
    if gravityActive then
        print("Gravidade desativada!")
        -- Código para desativar a gravidade
    else
        print("Gravidade ativada!")
        -- Código para ativar a gravidade
    end
    gravityActive = not gravityActive
end

local function toggleBomb()
    if bombActive then
        print("Bombas desativadas!")
        -- Código para desativar bombas
    else
        print("Bombas ativadas!")
        -- Código para ativar bombas
    end
    bombActive = not bombActive
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
            addCheckboxToMenu("Ativar Speed Hack", toggleSpeedHack)
            addCheckboxToMenu("Ativar No-Clip", toggleNoClip)
            addCheckboxToMenu("Ativar Voar", toggleFly)
        elseif name == "ARMA" then
            addCheckboxToMenu("Ativar Munição Infinita", toggleInfiniteAmmo)
            addCheckboxToMenu("Ativar Sem Recoil", toggleNoRecoil)
            addCheckboxToMenu("Ativar Disparo Rápido", toggleRapidFire)
        elseif name == "JOGADORES" then
            addCheckboxToMenu("Congelar Jogador", toggleFreezePlayer)
        elseif name == "VEICULO" then
            addCheckboxToMenu("Ativar Invencibilidade no Veículo", toggleVehicleInvincibility)
        elseif name == "TROLLS" then
            addCheckboxToMenu("Ativar Bombas", toggleBomb)
            addCheckboxToMenu("Ativar Gravidade", toggleGravity)
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
toggleButton.Font = Enum.Font.SourceSans
toggleButton.TextSize = 36
toggleButton.Parent = ScreenGui

toggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    toggleButton.Text = MainFrame.Visible and "-" or "+"
end)
