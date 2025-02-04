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

-- Configuração do menu principal
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0.5  -- Fundo semi-transparente
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(50, 50, 50)

-- Título do Menu
Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Ghost Menu V1"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Texto vermelho
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
local function addCheckboxToMenu(functionName)
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
        print(functionName .. " " .. (isChecked and "Ativado" or "Desativado"))
    end)
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
    GERAL = {"AutoClick", "God Mode", "Bypass Anti-Cheat"},
    ARMA = {"Aimbot", "Hitbox Expander", "No Recoil"},
    JOGADORES = {"ESP Wallhack", "Teleport", "Speed Hack"},
    VEICULO = {"Boost Nitro", "Carro Voador", "Anti-Crash"},
    TROLLS = {"Explodir Jogador", "Loop Kill", "Chat Spammer"},
    CONFIGURACOES = {"Mudar Tema", "Ativar Modo Stealth", "Personalizar Teclas"}
}

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
        for _, func in ipairs(buttonFunctions[name] or {}) do
            addCheckboxToMenu(func)
        end
    end)

    table.insert(Buttons, Button)
end

-- Adicionando botões laterais
local buttonNames = {"GERAL", "ARMA", "JOGADORES", "VEICULO", "TROLLS", "CONFIGURACOES"}
for i, name in ipairs(buttonNames) do
    addSideButton(name, (i - 1) * 50)
end

-- Função para tornar o menu arrastável sem limites e corrigir o bug
local dragging, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        local newPos = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
        
        -- Corrige a movimentação para não ultrapassar limites invisíveis
        if newPos.X.Offset >= 0 and newPos.X.Offset + MainFrame.Size.X.Offset <= game:GetService("Workspace").CurrentCamera.ViewportSize.X then
            MainFrame.Position = newPos
        end
        if newPos.Y.Offset >= 0 and newPos.Y.Offset + MainFrame.Size.Y.Offset <= game:GetService("Workspace").CurrentCamera.ViewportSize.Y then
            MainFrame.Position = newPos
        end
    end
end)

MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
