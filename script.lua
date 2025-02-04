local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local SideBar = Instance.new("Frame")
local Buttons = {}

ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0.5
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)

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

ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, -120, 0, 420)
ScrollingFrame.Position = UDim2.new(0, 120, 0.1, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 10

UIListLayout.Parent = ScrollingFrame
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

SideBar.Parent = MainFrame
SideBar.Size = UDim2.new(0, 120, 1, -50)
SideBar.Position = UDim2.new(0, 0, 0, 50)
SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SideBar.BackgroundTransparency = 0.7
SideBar.BorderSizePixel = 0

local buttonFunctions = {
    GERAL = {"AutoClick", "God Mode", "Bypass Anti-Cheat", "Infinite Jump", "Speed Hack", "Chat Spammer", "Fly Mode", "Crash Server", "NoClip"},
    ARMA = {"Aimbot", "Hitbox Expander", "No Recoil", "Rapid Fire", "Triggerbot"},
    JOGADORES = {"ESP Wallhack", "Teleport", "Speed Hack", "Aimbot", "Wallhack", "Player Info", "Invisibility", "NoFallDamage"},
    VEICULO = {"Boost Nitro", "Carro Voador", "Anti-Crash", "Super Jump"},
    TROLLS = {"Explodir Jogador", "Loop Kill", "Chat Spammer", "No Collision", "Invisible", "Fake Ping"},
    CONFIGURACOES = {"Mudar Tema", "Ativar Modo Stealth", "Personalizar Teclas", "Botão de Debug"}
}

local cheatFunctions = {
    AutoClick = function(isChecked) 
        if isChecked then
            print("Ativado AutoClick")
            -- Ativar AutoClick aqui
        else
            print("Desativado AutoClick")
            -- Desativar AutoClick aqui
        end
    end,
    GodMode = function(isChecked) 
        if isChecked then
            print("Ativado God Mode")
            -- Ativar God Mode aqui
        else
            print("Desativado God Mode")
            -- Desativar God Mode aqui
        end
    end,
    ["Bypass Anti-Cheat"] = function(isChecked) 
        if isChecked then
            print("Ativado Bypass Anti-Cheat")
            -- Ativar Bypass Anti-Cheat aqui
        else
            print("Desativado Bypass Anti-Cheat")
            -- Desativar Bypass Anti-Cheat aqui
        end
    end,
    ["Infinite Jump"] = function(isChecked) 
        if isChecked then
            print("Ativado Infinite Jump")
            -- Ativar Infinite Jump aqui
        else
            print("Desativado Infinite Jump")
            -- Desativar Infinite Jump aqui
        end
    end,
    ["Speed Hack"] = function(isChecked) 
        if isChecked then
            print("Ativado Speed Hack")
            -- Ativar Speed Hack aqui
        else
            print("Desativado Speed Hack")
            -- Desativar Speed Hack aqui
        end
    end,
    ["Chat Spammer"] = function(isChecked) 
        if isChecked then
            print("Ativado Chat Spammer")
            -- Ativar Chat Spammer aqui
        else
            print("Desativado Chat Spammer")
            -- Desativar Chat Spammer aqui
        end
    end,
    ["Fly Mode"] = function(isChecked) 
        if isChecked then
            print("Ativado Fly Mode")
            -- Ativar Fly Mode aqui
        else
            print("Desativado Fly Mode")
            -- Desativar Fly Mode aqui
        end
    end,
    ["Crash Server"] = function(isChecked) 
        if isChecked then
            print("Ativado Crash Server")
            -- Ativar Crash Server aqui
        else
            print("Desativado Crash Server")
            -- Desativar Crash Server aqui
        end
    end,
    NoClip = function(isChecked) 
        if isChecked then
            print("Ativado NoClip")
            -- Ativar NoClip aqui
        else
            print("Desativado NoClip")
            -- Desativar NoClip aqui
        end
    end,
}

local function addCheckboxToMenu(functionName, callback)
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
        callback(isChecked)
    end)
end

local function clearSubMenu()
    for _, child in pairs(ScrollingFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
end

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
            addCheckboxToMenu(func, cheatFunctions[func])
        end
    end)

    table.insert(Buttons, Button)
end

local buttonNames = {"GERAL", "ARMA", "JOGADORES", "VEICULO", "TROLLS", "CONFIGURACOES"}
for i, name in ipairs(buttonNames) do
    addSideButton(name, (i - 1) * 50)
end

-- Movimentação do menu
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
        local newPosX = startPos.X.Offset + delta.X
        local newPosY = startPos.Y.Offset + delta.Y
        newPosX = math.clamp(newPosX, 0, game:GetService("Players").LocalPlayer.PlayerGui.AbsoluteSize.X - MainFrame.Size.X.Offset)
        newPosY = math.clamp(newPosY, 0, game:GetService("Players").LocalPlayer.PlayerGui.AbsoluteSize.Y - MainFrame.Size.Y.Offset)
        MainFrame.Position = UDim2.new(0, newPosX, 0, newPosY)
    end
end)

MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
