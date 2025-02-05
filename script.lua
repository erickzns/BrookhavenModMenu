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

-- Função para adicionar funções ao submenu com botões de alternar
local function addTogglerButtonToMenu(functionName, cheatFunction)
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

    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 60, 0, 30)
    ToggleButton.Position = UDim2.new(1, -70, 0.5, -15)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    ToggleButton.Text = "Desativado"
    ToggleButton.Parent = Frame

    local isActive = false  -- Inicialmente a função está desativada

    ToggleButton.MouseButton1Click:Connect(function()
        isActive = not isActive
        ToggleButton.BackgroundColor3 = isActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        ToggleButton.Text = isActive and "Ativado" or "Desativado"
        cheatFunction(isActive)
        print(functionName .. " " .. (isActive and "Ativado" or "Desativado"))
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
local function toggleSpeedHack(isActive)
    for _, player in ipairs(game.Players:GetChildren()) do
        if player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = isActive and 100 or 16  -- Aumento de velocidade
            end
        end
    end
end

local function toggleNoClip(isActive)
    local character = game.Players.LocalPlayer.Character
    if character then
        character.HumanoidRootPart.Anchored = isActive
    end
end

local function toggleFly(isActive)
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = isActive
        end
    end
end

-- ARMA
local function toggleInfiniteAmmo(isActive)
    -- Código para ativar ou desativar a munição infinita
end

local function toggleNoRecoil(isActive)
    -- Código para ativar ou desativar o recoil
end

local function toggleRapidFire(isActive)
    -- Código para ativar ou desativar o disparo rápido
end

-- JOGADORES
local function toggleFreezePlayer(isActive)
    local player = game.Players.LocalPlayer
    if player.Character then
        player.Character.HumanoidRootPart.Anchored = isActive
    end
end

-- VEICULO
local function toggleVehicleInvincibility(isActive)
    -- Código para ativar ou desativar a invencibilidade do veículo
end

-- TROLLS
local function toggleGravity(isActive)
    -- Código para ativar ou desativar a gravidade
end

local function toggleBomb(isActive)
    -- Código para ativar ou desativar bombas
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
            addTogglerButtonToMenu("Ativar Speed Hack", toggleSpeedHack)
            addTogglerButtonToMenu("Ativar No-Clip", toggleNoClip)
            addTogglerButtonToMenu("Ativar Voar", toggleFly)
        elseif name == "ARMA" then
            addTogglerButtonToMenu("Ativar Munição Infinita", toggleInfiniteAmmo)
            addTogglerButtonToMenu("Ativar Sem Recoil", toggleNoRecoil)
            addTogglerButtonToMenu("Ativar Disparo Rápido", toggleRapidFire)
        elseif name == "JOGADORES" then
            addTogglerButtonToMenu("Congelar Jogador", toggleFreezePlayer)
        elseif name == "VEICULO" then
            addTogglerButtonToMenu("Ativar Invencibilidade no Veículo", toggleVehicleInvincibility)
        elseif name == "TROLLS" then
            addTogglerButtonToMenu("Ativar Bombas", toggleBomb)
            addTogglerButtonToMenu("Ativar Gravidade", toggleGravity)
        end
    end)
end

--- Adicionando botões laterais
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
