ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local SideBar = Instance.new("Frame")
local Buttons = {}
local cheatStates = {} -- Tabela para armazenar o estado das trapaças
local checkboxes = {}  -- Tabela para armazenar as checkboxes

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
    checkboxes = {} -- Resetar checkboxes para atualizar corretamente
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
    CheckBoxText.TextSize = 18
    CheckBoxText.TextXAlignment = Enum.TextXAlignment.Left
    CheckBoxText.Parent = Frame

    local Checkbox = Instance.new("TextButton")
    Checkbox.Size = UDim2.new(0, 20, 0, 20)
    Checkbox.Position = UDim2.new(1, -30, 0.5, -10)
    Checkbox.BackgroundColor3 = cheatStates[functionName] and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    Checkbox.Text = ""
    Checkbox.Parent = Frame

    checkboxes[functionName] = Checkbox

    Checkbox.MouseButton1Click:Connect(function()
        cheatStates[functionName] = not cheatStates[functionName]
        Checkbox.BackgroundColor3 = cheatStates[functionName] and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

        if cheatStates[functionName] then
            cheatFunction()
        end
        print(functionName .. " " .. (cheatStates[functionName] and "Ativado" or "Desativado"))
    end)
end

-- Atualizar as checkboxes quando o submenu for aberto novamente
local function updateCheckboxes()
    for functionName, checkbox in pairs(checkboxes) do
        if cheatStates[functionName] then
            checkbox.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        else
            checkbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        end
    end
end

-- Definição das categorias e funções
local buttonFunctions = {
    GERAL = {
        {"AutoClick", function() print("AutoClick ativado") end},
        {"God Mode", function() print("God Mode ativado!") end},
        {"Bypass Anti-Cheat", function() print("Anti-Cheat Bypass ativado!") end},
        {"Infinitive Jump", function() print("Jump infinito ativado!") end},
        {"Speed Hack", function() print("Speed Hack ativado!") end},
        {"Spawn Item - Carro", function() print("Carro spawnado!") end},
        {"Teleport To Player", function() print("Teleportando para jogador!") end},
    },
    ARMA = {
        {"Aimbot", function() print("Aimbot ativado!") end},
        {"Hitbox Expander", function() print("Hitbox Expander ativado!") end},
        {"No Recoil", function() print("No Recoil ativado!") end},
        {"Weapon Hack", function() print("Weapon Hack ativado!") end},
    },
    JOGADORES = {
        {"ESP Wallhack", function() print("ESP Wallhack ativado!") end},
        {"Teleport", function() print("Teleport ativado!") end},
        {"Speed Hack", function() print("Speed Hack ativado!") end},
        {"NoClip", function() print("NoClip ativado!") end},
    },
    VEICULO = {
        {"Boost Nitro", function() print("Boost Nitro ativado!") end},
        {"Carro Voador", function() print("Carro Voador ativado!") end},
        {"Spawn Tank", function() print("Tank spawnado!") end},
    },
    TROLLS = {
        {"Explodir Jogador", function() print("Explodir Jogador ativado!") end},
        {"Loop Kill", function() print("Loop Kill ativado!") end},
        {"Chat Spammer", function() print("Chat Spammer ativado!") end},
    },
    CONFIGURACOES = {
        {"Mudar Tema", function() print("Tema alterado!") end},
        {"Ativar Modo Stealth", function() print("Modo Stealth ativado!") end},
    }
}

-- Barra Lateral (SideBar)
SideBar.Parent = MainFrame
SideBar.Size = UDim2.new(0, 120, 1, -50)
SideBar.Position = UDim2.new(0, 0, 0, 50)
SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SideBar.BackgroundTransparency = 0.7
SideBar.BorderSizePixel = 0

-- Adicionando botões para as categorias
for category, functions in pairs(buttonFunctions) do
    local CategoryButton = Instance.new("TextButton")
    CategoryButton.Size = UDim2.new(1, 0, 0, 50)
    CategoryButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    CategoryButton.Text = category
    CategoryButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CategoryButton.Font = Enum.Font.SourceSans
    CategoryButton.TextSize = 20
    CategoryButton.Parent = SideBar

    CategoryButton.MouseButton1Click:Connect(function()
        clearSubMenu()
        for _, func in ipairs(functions) do
            addCheckboxToMenu(func[1], func[2])
        end
        updateCheckboxes()
    end)
end
