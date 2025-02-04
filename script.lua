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
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.Gotham
Title.TextSize = 28
Title.TextStrokeTransparency = 0.5
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Sombra no título (opcional para efeito visual mais profissional)
local shadow = Instance.new("TextLabel")
shadow.Parent = Title
shadow.Size = UDim2.new(1, 0, 1, 0)
shadow.Position = UDim2.new(0, 2, 0, 2)
shadow.BackgroundTransparency = 1
shadow.Text = Title.Text
shadow.TextColor3 = Color3.fromRGB(0, 0, 0)
shadow.TextSize = Title.TextSize
shadow.TextStrokeTransparency = Title.TextStrokeTransparency
shadow.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Função para animar a opacidade do menu (efeito de fade-in)
MainFrame.BackgroundTransparency = 1
game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2}):Play()

-- Função para animar a opacidade do título (efeito de fade-in)
Title.TextTransparency = 1
game:GetService("TweenService"):Create(Title, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
