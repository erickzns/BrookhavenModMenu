-- Configuração da Interface
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local SideBar = Instance.new("Frame")
local Buttons = {}

-- Configuração do Menu Flutuante
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui

-- Configuração do MainFrame (Menu Principal)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.Gotham
Title.TextSize = 28
Title.TextStrokeTransparency = 0.5
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Configuração do ScrollingFrame (Submenu Rolável)
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, -120, 0, 400)  -- Submenu ocupa a largura total, exceto a barra lateral
ScrollingFrame.Position = UDim2.new(0, 120, 0.1, 0)  -- Posicionamento do submenu à direita da barra lateral
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

-- Layout do ScrollingFrame (organiza os itens do submenu)
UIListLayout.Parent = ScrollingFrame
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)  -- Espaçamento entre os botões

-- Adicionando padding ao ScrollingFrame
UIPadding.Parent = ScrollingFrame
UIPadding.PaddingTop = UDim.new(0, 10)

-- Função para adicionar um item com checkbox ao submenu
local function addCheckboxToMenu(functionName)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 380, 0, 50)
    Frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScrollingFrame

    -- Texto da função
    local CheckBoxText = Instance.new("TextLabel")
    CheckBoxText.Size = UDim2.new(0, 300, 0, 50)
    CheckBoxText.Position = UDim2.new(0, 10, 0, 0)
    CheckBoxText.Text = functionName
    CheckBoxText.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckBoxText.BackgroundTransparency = 1
    CheckBoxText.Font = Enum.Font.SourceSans
    CheckBoxText.TextSize = 18
    CheckBoxText.TextXAlignment = Enum.TextXAlignment.Left
    CheckBoxText.Parent = Frame

    -- Caixa de Seleção (Checkbox)
    local Checkbox = Instance.new("TextButton")
    Checkbox.Size = UDim2.new(0, 20, 0, 20)
    Checkbox.Position = UDim2.new(1, -30, 0.5, -10)
    Checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Checkbox.Text = ""
    Checkbox.Parent = Frame

    -- Função para alternar o checkbox
    local isChecked = false
    Checkbox.MouseButton1Click:Connect(function()
        isChecked = not isChecked
        if isChecked then
            Checkbox.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Cor verde para ativado
        else
            Checkbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Cor vermelha para desativado
        end
        print(functionName .. " " .. (isChecked and "Ativado" or "Desativado"))
    end)
end

-- Função para tornar o menu arrastável
local dragging = false
local dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Consumed = true
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Função para adicionar um botão lateral
local function addSideButton(name, yPosition)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 120, 0, 40)
    Button.Position = UDim2.new(0, 0, 0, yPosition)
    Button.Text = name
    Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 18
    Button.Parent = SideBar

    Button.MouseButton1Click:Connect(function()
        print(name .. " clicado!")
        -- Aqui você pode adicionar funcionalidades específicas para cada botão
    end)

    table.insert(Buttons, Button)  -- Adiciona o botão à lista para referência futura
end

-- Configuração da barra lateral (SideBar)
SideBar.Parent = MainFrame
SideBar.Size = UDim2.new(0, 120, 1, 0)  -- Barra lateral com largura fixa de 120px
SideBar.Position = UDim2.new(0, 0, 0, 50)  -- Alinha a barra lateral à esquerda do menu
SideBar.BackgroundTransparency = 0  -- Removendo a transparência da barra lateral
SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Cor sólida para a barra lateral

-- Adicionando os botões laterais
local buttonNames = {"GERAL", "ARMA", "JOGADORES", "VEICULO", "TROLLS", "CONFIGURACOES"}
for i, name in ipairs(buttonNames) do
    addSideButton(name, (i - 1) * 50)  -- Ajusta a posição dos botões na barra lateral
end

-- Adicionando várias opções com checkbox ao submenu
for i = 1, 20 do  -- Ajuste o número conforme necessário
    addCheckboxToMenu("Função " .. i)
end
