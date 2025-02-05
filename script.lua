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
MainFrame.Visible = false

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

-- ScrollingFrame (submenu)
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, -120, 0, 420)
ScrollingFrame.Position = UDim2.new(0, 120, 0.1, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 10

UIListLayout.Parent = ScrollingFrame
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Função para limpar submenu
local function clearSubMenu()
    for _, child in pairs(ScrollingFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
end

-- Função para adicionar botão no menu
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

    local isActive = false
    ToggleButton.MouseButton1Click:Connect(function()
        isActive = not isActive
        ToggleButton.BackgroundColor3 = isActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        ToggleButton.Text = isActive and "Ativado" or "Desativado"
        cheatFunction(isActive)
    end)
end

-- Botões Laterais
SideBar.Parent = MainFrame
SideBar.Size = UDim2.new(0, 120, 1, -50)
SideBar.Position = UDim2.new(0, 0, 0, 50)
SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SideBar.BackgroundTransparency = 0.7

local function addSideButton(name, functions)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 120, 0, 50)
    Button.Position = UDim2.new(0, 0, 0, #Buttons * 50)
    Button.Text = name
    Button.Parent = SideBar
    table.insert(Buttons, Button)

    Button.MouseButton1Click:Connect(function()
        clearSubMenu()
        for funcName, func in pairs(functions) do
            addTogglerButtonToMenu(funcName, func)
        end
    end)
end

-- Funções de Cheats do Mad City
local functionsGeral = {
    ["Speed Hack"] = function(isActive) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = isActive and 100 or 16 end,
    ["No Clip"] = function(isActive) game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = not isActive end,
    ["Fly Hack"] = function(isActive) game.Players.LocalPlayer.Character.Humanoid.PlatformStand = isActive end,
}

local functionsArma = {
    ["Munição Infinita"] = function(isActive) print("Munição infinita ativada: " .. tostring(isActive)) end,
    ["No Recoil"] = function(isActive) print("Sem recoil: " .. tostring(isActive)) end,
    ["Disparo Rápido"] = function(isActive) print("Disparo rápido ativado: " .. tostring(isActive)) end,
}

local functionsJogadores = {
    ["Congelar Jogador"] = function(isActive) game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = isActive end,
    ["God Mode"] = function(isActive) print("God Mode: " .. tostring(isActive)) end,
}

local functionsVeiculo = {
    ["Invencibilidade no Veículo"] = function(isActive) print("Veículo Invencível: " .. tostring(isActive)) end,
}

local functionsTrolls = {
    ["Ativar Gravidade"] = function(isActive) print("Gravidade alterada: " .. tostring(isActive)) end,
    ["Spawnar Dinheiro"] = function(isActive) print("Dinheiro infinito ativado: " .. tostring(isActive)) end,
}

addSideButton("GERAL", functionsGeral)
addSideButton("ARMA", functionsArma)
addSideButton("JOGADORES", functionsJogadores)
addSideButton("VEICULO", functionsVeiculo)
addSideButton("TROLLS", functionsTrolls)

-- Botão de abrir/fechar menu
toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 60, 0, 60)
toggleButton.Position = UDim2.new(0, 0, 0, 0)
toggleButton.Text = "+"
toggleButton.Parent = ScreenGui
toggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    toggleButton.Text = MainFrame.Visible and "-" or "+"
end)
