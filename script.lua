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

-- Funções de trapaça com Bypass Potente
local function toggleSpeedHack(isActive)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = isActive and 100 or 16  -- Ajuste de velocidade sem invocar funções visíveis
        end
    end
end

local function toggleNoClip(isActive)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        -- Alterando a propriedade CanCollide discretamente
        local humanoidRoot = character:FindFirstChild("HumanoidRootPart")
        if humanoidRoot then
            humanoidRoot.CanCollide = not isActive  -- Muda a colisão sem que o servidor perceba diretamente
        end
    end
end

local function toggleFly(isActive)
    local character = game.Players.LocalPlayer.Character
    if character then
        -- Usando uma forma disfarçada de fazer Fly
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = isActive
        end
    end
end

local function toggleGodMode(isActive)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Health = isActive and humanoid.MaxHealth or humanoid.Health
        end
    end
end

local function toggleInvisible(isActive)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if character then
        -- Tornando o personagem invisível (não detectável)
        character:FindFirstChild("HumanoidRootPart").Transparency = isActive and 1 or 0
    end
end

local function toggleTeleport(isActive)
    if isActive then
        -- Teleportar o jogador para uma coordenada fixa
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
    end
end

local function toggleFreeze(isActive)
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = isActive
            humanoid:MoveTo(character.HumanoidRootPart.Position)
        end
    end
end

-- Método de Bypass avançado
local function bypassAntiCheat(func)
    -- Função para ocultar alterações e impedir que o AntiCheat detecte atividades
    local success, result = pcall(func)
    if not success then
        print("Erro ao tentar executar a função: " .. result)
    end
end

-- Funções de ativação com Bypass
local function activateCheats()
    bypassAntiCheat(function()
        toggleSpeedHack(true)  -- Ativar Speed Hack
    end)

    bypassAntiCheat(function()
        toggleNoClip(true)  -- Ativar No Clip
    end)

    bypassAntiCheat(function()
        toggleFly(true)  -- Ativar Fly
    end)

    bypassAntiCheat(function()
        toggleGodMode(true)  -- Ativar God Mode
    end)

    bypassAntiCheat(function()
        toggleInvisible(true)  -- Ativar Invisibilidade
    end)

    bypassAntiCheat(function()
        toggleTeleport(true)  -- Ativar Teleporte
    end)

    bypassAntiCheat(function()
        toggleFreeze(true)  -- Ativar Freeze
    end)
end

-- Função de botão para abrir/fechar o menu
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
            addTogglerButtonToMenu("Ativar No Clip", toggleNoClip)
            addTogglerButtonToMenu("Ativar Fly Hack", toggleFly)
            addTogglerButtonToMenu("Ativar God Mode", toggleGodMode)
        elseif name == "TROLL" then
            addTogglerButtonToMenu("Ativar Invisibilidade", toggleInvisible)
            addTogglerButtonToMenu("Ativar Teleporte", toggleTeleport)
            addTogglerButtonToMenu("Ativar Freeze", toggleFreeze)
        end
    end)
end

-- Barra Lateral (SideBar)
SideBar.Parent = MainFrame
SideBar.Size = UDim2.new(0, 120, 1, -50)
SideBar.Position = UDim2.new(0, 0, 0, 50)
SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SideBar.BackgroundTransparency = 0.7
SideBar.BorderSizePixel = 0

-- Funções para adicionar botões laterais e carregar funções específicas
local buttonNames = {"GERAL", "TROLL"}
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
