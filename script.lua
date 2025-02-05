local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local SideBar = Instance.new("Frame")
local Buttons = {}

-- Configurações de Personalização
local config = {
    BackgroundColor = Color3.fromRGB(0, 0, 0), -- Cor do fundo
    TitleColor = Color3.fromRGB(255, 0, 0), -- Cor do título
    TitleFont = Enum.Font.Gotham, -- Fonte do título
    TitleFontSize = 28, -- Tamanho da fonte do título
    ButtonColor = Color3.fromRGB(255, 255, 255), -- Cor dos botões
    ButtonFont = Enum.Font.SourceSans, -- Fonte dos botões
    ButtonFontSize = 18, -- Tamanho da fonte dos botões
    ButtonHoverColor = Color3.fromRGB(0, 255, 0), -- Cor do botão quando hover
    ButtonClickColor = Color3.fromRGB(255, 0, 0), -- Cor do botão quando clicado
    Transparency = 0.5, -- Transparência do fundo
    ScrollBarThickness = 10, -- Espessura da barra de rolagem
    MenuWidth = 400, -- Largura do menu
    MenuHeight = 500, -- Altura do menu
    MenuPosX = 0.5, -- Posição X do menu (proporcional)
    MenuPosY = 0.5, -- Posição Y do menu (proporcional)
    SubMenuSpacing = 5, -- Espaçamento entre os botões do submenu
}

-- Função de configuração da interface
local function configureUI()
    -- Configuração do menu principal
    MainFrame.BackgroundColor3 = config.BackgroundColor
    MainFrame.BackgroundTransparency = config.Transparency
    MainFrame.Size = UDim2.new(0, config.MenuWidth, 0, config.MenuHeight)
    MainFrame.Position = UDim2.new(config.MenuPosX, -config.MenuWidth / 2, config.MenuPosY, -config.MenuHeight / 2)

    -- Configuração do título
    Title.TextColor3 = config.TitleColor
    Title.Font = config.TitleFont
    Title.TextSize = config.TitleFontSize
    Title.TextStrokeTransparency = 0.5
    Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    -- Configuração da barra lateral
    SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    SideBar.BackgroundTransparency = 0.7
    SideBar.BorderSizePixel = 0

    -- Configuração do ScrollingFrame
    ScrollingFrame.ScrollBarThickness = config.ScrollBarThickness
end

-- Inicializando a interface
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
Title.Parent = MainFrame
ScrollingFrame.Parent = MainFrame
SideBar.Parent = MainFrame

Title.Size = UDim2.new(0, config.MenuWidth, 0, 50)
ScrollingFrame.Size = UDim2.new(1, -120, 0, config.MenuHeight - 50)
ScrollingFrame.Position = UDim2.new(0, 120, 0.1, 0)

UIListLayout.Parent = ScrollingFrame
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, config.SubMenuSpacing)

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
    CheckBoxText.TextSize = config.ButtonFontSize
    CheckBoxText.TextXAlignment = Enum.TextXAlignment.Left
    CheckBoxText.Parent = Frame

    local Checkbox = Instance.new("TextButton")
    Checkbox.Size = UDim2.new(0, 20, 0, 20)
    Checkbox.Position = UDim2.new(1, -30, 0.5, -10)
    Checkbox.BackgroundColor3 = config.ButtonClickColor
    Checkbox.Text = ""
    Checkbox.Parent = Frame

    local isChecked = false
    Checkbox.MouseButton1Click:Connect(function()
        isChecked = not isChecked
        Checkbox.BackgroundColor3 = isChecked and Color3.fromRGB(0, 255, 0) or config.ButtonClickColor
        if isChecked then
            cheatFunction()
        end
        print(functionName .. " " .. (isChecked and "Ativado" or "Desativado"))
    end)
end

-- Funções de trapaças (de exemplo)
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

-- Barra Lateral (SideBar)
SideBar.Size = UDim2.new(0, 120, 1, -50)
SideBar.Position = UDim2.new(0, 0, 0, 50)

-- Função para adicionar botões na Sidebar
local function createButton(name, category)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 50)
    Button.BackgroundColor3 = config.ButtonColor
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = config.ButtonFont
    Button.TextSize = config.ButtonFontSize
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

-- Função para criar o botão de configurações
local function createSettingsButton()
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 50)
    Button.BackgroundColor3 = config.ButtonColor
    Button.Text = "Configurações"
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = config.ButtonFont
    Button.TextSize = config.ButtonFontSize
    Button.TextStrokeTransparency = 0.5
    Button.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
    Button.Parent = SideBar

    Button.MouseButton1Click:Connect(function()
        clearSubMenu()
        -- Adicionar as opções de configurações
        addCheckboxToMenu("Alterar Cor de Fundo", function()
            config.BackgroundColor = Color3.fromRGB(255, 255, 255) -- Exemplo de alteração de cor
            configureUI() -- Reconfigura a interface
        end)
        addCheckboxToMenu("Alterar Cor do Título", function()
            config.TitleColor = Color3.fromRGB(0, 255, 0) -- Exemplo de alteração de cor
            configureUI() -- Reconfigura a interface
        end)
        -- Mais opções de configuração podem ser adicionadas aqui
    end)
end

-- Adicionando botões laterais
createButton("Geral", "GERAL")
createButton("Arma", "ARMA")
createButton("Jogadores", "JOGADORES")
createButton("Veículo", "VEICULO")
createButton("Trolls", "TROLLS")
createSettingsButton() -- Botão de configurações

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

-- Chama a função de configuração da interface
configureUI()
