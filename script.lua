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

-- Funções de trapaça (exemplo)
local function activateSpeedHack()
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

local function teleportToRandom()
    local randomPos = CFrame.new(math.random(-500, 500), math.random(50, 100), math.random(-500, 500))
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(randomPos)
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
            addCheckboxToMenu("Speed Hack", activateSpeedHack)
            addCheckboxToMenu("Teleport to Random Position", teleportToRandom)
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
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextSize = 28
toggleButton.Parent = MainFrame

toggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible  -- Alterna a visibilidade do menu
    toggleButton.Text = MainFrame.Visible and "-" or "+"  -- Alterna o texto do botão
end)
