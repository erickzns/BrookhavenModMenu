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

-- Configuração do MainFrame
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.2

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

-- Função para animar a opacidade do menu (efeito de fade-in)
MainFrame.BackgroundTransparency = 1
game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2}):Play()

-- Função para animar a opacidade do título (efeito de fade-in)
Title.TextTransparency = 1
game:GetService("TweenService"):Create(Title, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

-- Configuração do ScrollingFrame (para o submenu rolável)
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, 0, 0, 400)  -- Submenu ocupa 400px de altura
ScrollingFrame.Position = UDim2.new(0, 0, 0.1, 0)  -- Posicionamento logo abaixo do título
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

-- Configuração do layout do ScrollingFrame (organizar botões no submenu)
UIListLayout.Parent = ScrollingFrame
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)  -- Espaçamento entre os botões

-- Adicionando padding para o conteúdo no ScrollingFrame
UIPadding.Parent = ScrollingFrame
UIPadding.PaddingTop = UDim.new(0, 10)

-- Função para tornar o menu arrastável
local dragging = false
local dragInput, dragStart, startPos

-- Função para iniciar o arraste
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Consumed = true
    end
end)

-- Função para mover o menu enquanto arrasta
MainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Função para finalizar o arraste
MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Função para adicionar um item com checkbox
local function addCheckboxToMenu(functionName)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 380, 0, 50)
    Frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScrollingFrame

    -- Texto da função
    local CheckBoxText = Instance.new("TextLabel")
    CheckBoxText.Size = UDim2.new(0, 300, 0, 50)  -- Ajustado para caber o texto
    CheckBoxText.Position = UDim2.new(0, 10, 0, 0)  -- Posiciona o texto do nome da função
    CheckBoxText.Text = functionName
    CheckBoxText.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckBoxText.BackgroundTransparency = 1
    CheckBoxText.Font = Enum.Font.SourceSans
    CheckBoxText.TextSize = 18
    CheckBoxText.TextXAlignment = Enum.TextXAlignment.Left  -- Alinha o texto à esquerda
    CheckBoxText.Parent = Frame
    
    -- Caixa de Seleção (Checkbox)
    local Checkbox = Instance.new("TextButton")
    Checkbox.Size = UDim2.new(0, 20, 0, 20)
    Checkbox.Position = UDim2.new(1, -30, 0.5, -10)  -- Posiciona à direita, um pouco afastado
    Checkbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Checkbox.Text = ""
    Checkbox.Parent = Frame
    
    -- Função para alternar o checkbox (ativar/desativar)
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

-- Função para adicionar botões laterais
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
        -- Por exemplo, exibir submenus ou filtrar funções do menu
    end)
    
    table.insert(Buttons, Button)  -- Adiciona o botão à lista para referência futura
end

-- Função para adicionar um slider
local function addSliderToMenu()
    -- Slider Container
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(0, 380, 0, 50)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = MainFrame
    SliderFrame.Position = UDim2.new(0, 10, 0, 60)  -- Coloca o slider logo abaixo do título

    -- Texto do Slider
    local SliderText = Instance.new("TextLabel")
    SliderText.Size = UDim2.new(0, 300, 0, 50)
    SliderText.Position = UDim2.new(0, 10, 0, 0)
    SliderText.Text = "Slider Exemplo"
    SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderText.BackgroundTransparency = 1
    SliderText.Font = Enum.Font.SourceSans
    SliderText.TextSize = 18
    SliderText.TextXAlignment = Enum.TextXAlignment.Left
    SliderText.Parent = SliderFrame

    -- Slider
    local Slider = Instance.new("Frame")
    Slider.Size = UDim2.new(0, 300, 0, 10)
    Slider.Position = UDim2.new(0, 10, 0, 30)
    Slider.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
    Slider.Parent = SliderFrame

    local SliderButton = Instance.new("Frame")
    SliderButton.Size = UDim2.new(0, 50, 1, 0)
    SliderButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    SliderButton.Parent = Slider

    -- Lógica do Slider
    local draggingSlider = false
    SliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSlider = true
        end
    end)

    SliderButton.InputChanged:Connect(function(input)
        if draggingSlider and input.UserInputType == Enum.UserInputType.MouseMovement then
            local newX = math.clamp(input.Position.X - Slider.AbsolutePosition.X, 0, Slider.AbsoluteSize.X - SliderButton.AbsoluteSize.X)
            SliderButton.Position = UDim2.new(0, newX, 0, 0)
        end
    end)

    SliderButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSlider = false
        end
    end)
end

-- Configuração da SideBar (barra lateral com botões)
SideBar.Parent = MainFrame
SideBar.Size = UDim2.new(0, 120, 1, 0)  -- A largura foi corrigida para 120px
SideBar.Position = UDim2.new(0, -120, 0, 90)  -- Barra lateral agora um pouco mais para baixo

-- Adicionando os botões laterais
local buttonNames = {"GERAL", "ARMA", "JOGADORES", "VEICULO", "TROLLS", "CONFIGURACOES"}
for i, name in ipairs(buttonNames) do
    addSideButton(name, (i - 1) * 50)  -- Ajuste o espaçamento entre os botões
end

-- Adicionando o Slider à parte superior do menu
addSliderToMenu()

-- Adicionando várias opções com checkbox ao submenu
for i = 1, 50 do  -- Ajuste o número conforme necessário
    addCheckboxToMenu("Função " .. i)
end
