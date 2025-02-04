-- Configuração da Interface
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

-- Configuração do Menu Flutuante
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui

-- Configuração do MainFrame
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 200)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
MainFrame.Draggable = true
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.2

-- Título do Menu
Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Ghost Menu V1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Cor branca
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

-- Tornar o menu arrastável
local dragging, dragInput, dragStart, startPos
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
