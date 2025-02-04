-- Configuração inicial do ModMenu
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0, 300, 0, 400)
mainMenu.Position = UDim2.new(0.5, -150, 0.5, -200)
mainMenu.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainMenu.Parent = screenGui

-- Botões Laterais
local buttons = {
    {name = "Geral", position = 10},
    {name = "Arma", position = 70},
    {name = "Jogador", position = 130},
    {name = "Configurações", position = 190},
    {name = "Trapaças", position = 250},
    {name = "Avançado", position = 310}
}

local submenus = {}

for _, btn in ipairs(buttons) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 0, 50)
    button.Position = UDim2.new(0, 10, 0, btn.position)
    button.Text = btn.name
    button.Parent = mainMenu
    
    local submenu = Instance.new("Frame")
    submenu.Size = UDim2.new(0, 180, 0, 300)
    submenu.Position = UDim2.new(0, 120, 0, 10)
    submenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    submenu.Visible = false
    submenu.Parent = mainMenu
    submenus[btn.name] = submenu
    
    button.MouseButton1Click:Connect(function()
        -- Fechar todos os submenus
        for _, sm in pairs(submenus) do 
            sm.Visible = false 
        end
        -- Abrir o submenu específico
        submenu.Visible = true
    end)
end

-- Funções de Trapaça
local function ativarInvisibilidade()
    print("Invisibilidade ativada!")
end

local function desativarInvisibilidade()
    print("Invisibilidade desativada!")
end

local function ativarSuperVelocidade()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end

local function ativarTeleporteRapido()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 50, 0))
end

local function ativarVidaInfinita()
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
    game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
end

-- Funções de Aimbot e ESP
local function ativarAimbot()
    print("Aimbot ativado!")
end

local function ativarESP()
    print("ESP ativado!")
end

-- Função para Crashar Jogadores (Enredo do filme)
local function crasharJogadores()
    -- Este código é fictício e não funciona na realidade. 
    -- No enredo, ele simula causar erro de conexão em todos os jogadores do servidor.
    print("Crashando todos os jogadores... Conexões sendo interrompidas!")
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            -- Simula desconectar os jogadores (não é funcional no Roblox, mas serve para a narrativa)
            player:Kick("Erro de Conexão. Você foi desconectado do servidor.")
        end
    end
end

-- Funções de Customização do ModMenu
local function mudarCorMenu(cor)
    mainMenu.BackgroundColor3 = cor
end

local function mudarTamanhoMenu(tamanho)
    mainMenu.Size = UDim2.new(0, tamanho, 0, 400)
end

-- Função para adicionar opções no submenu com caixas de seleção
local function createCheckbox(submenu, name, onCheckedFunc, onUncheckedFunc)
    local checkbox = Instance.new("Frame")
    checkbox.Size = UDim2.new(0, 160, 0, 40)
    checkbox.Position = UDim2.new(0, 10, 0, #submenu:GetChildren() * 50)
    checkbox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    checkbox.Parent = submenu
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.Parent = checkbox
    
    local checkBoxBtn = Instance.new("TextButton")
    checkBoxBtn.Size = UDim2.new(0, 20, 0, 20)
    checkBoxBtn.Position = UDim2.new(1, -30, 0.5, -10)
    checkBoxBtn.Text = "☐"
    checkBoxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkBoxBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    checkBoxBtn.Parent = checkbox
    
    local checked = false

    checkBoxBtn.MouseButton1Click:Connect(function()
        checked = not checked
        if checked then
            checkBoxBtn.Text = "☑"
            onCheckedFunc()
        else
            checkBoxBtn.Text = "☐"
            onUncheckedFunc()
        end
    end)
end

-- Adicionando as opções aos submenus com caixas de seleção
createCheckbox(submenus["Avançado"], "Crashar Jogadores", crasharJogadores, function() print("Crashar Jogadores desativado.") end)
createCheckbox(submenus["Geral"], "Invisibilidade", ativarInvisibilidade, desativarInvisibilidade)
createCheckbox(submenus["Geral"], "Super Velocidade", ativarSuperVelocidade, function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 end)
createCheckbox(submenus["Geral"], "Teleporte Rápido", ativarTeleporteRapido, function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 0, 0)) end)
createCheckbox(submenus["Geral"], "Vida Infinita", ativarVidaInfinita, function() 
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 100
    game.Players.LocalPlayer.Character.Humanoid.Health = 100
end)
createCheckbox(submenus["Arma"], "Aimbot", ativarAimbot, function() print("Aimbot desativado.") end)
createCheckbox(submenus["Jogador"], "ESP", ativarESP, function() print("ESP desativado.") end)
