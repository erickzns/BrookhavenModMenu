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
    submenu.Visible = false  -- Inicialmente invisível
    submenu.Parent = mainMenu
    submenus[btn.name] = submenu
    
    -- Função para abrir o submenu ao clicar no botão lateral
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

local function ativarTeleporteAleatorio()
    local randomPos = Vector3.new(math.random(-500, 500), 50, math.random(-500, 500))
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(randomPos)
end

local function ajustarDano(multiplier)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    humanoid.Damage = humanoid.Damage * multiplier
end

local function habilitarWallhack()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 0.5
            part.CanCollide = false
        end
    end
end

local function desabilitarWallhack()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 0
            part.CanCollide = true
        end
    end
end

-- Funções de Aimbot e ESP
local function ativarAimbot()
    print("Aimbot ativado!")
end

local function ativarESP()
    print("ESP ativado!")
end

local function ativarESPAvancado()
    print("ESP Avançado ativado!")
end

local function personalizarCorESP(cor)
    print("Cor do ESP alterada para " .. cor)
end

local function ativarAimbotComSensibilidade(sensibilidade)
    print("Aimbot ativado com sensibilidade de " .. sensibilidade)
end

-- Funções para customização do modmenu
local function mudarCorMenu(cor)
    mainMenu.BackgroundColor3 = cor
end

local function mudarTamanhoMenu(tamanho)
    mainMenu.Size = UDim2.new(0, tamanho, 0, 400)
end

-- Função para adicionar opções no submenu
local function createOption(submenu, name, activateFunc, tooltip)
    local option = Instance.new("TextButton")
    option.Size = UDim2.new(0, 160, 0, 40)
    option.Position = UDim2.new(0, 10, 0, #submenu:GetChildren() * 50)
    option.Text = name
    option.Parent = submenu
    option.MouseButton1Click:Connect(activateFunc)
    
    -- Adicionar tooltip
    if tooltip then
        option.MouseEnter:Connect(function()
            -- Mostrar tooltip (exemplo básico)
            print(tooltip)
        end)
    end
end

-- Adicionando as novas opções aos submenus
createOption(submenus["Geral"], "Ativar Invisibilidade", ativarInvisibilidade, "Ativa a invisibilidade.")
createOption(submenus["Geral"], "Ativar Super Velocidade", ativarSuperVelocidade, "Aumenta a velocidade do jogador.")
createOption(submenus["Geral"], "Ativar Teleporte Rápido", ativarTeleporteRapido, "Teleporta rapidamente para uma posição.")
createOption(submenus["Geral"], "Vida Infinita", ativarVidaInfinita, "Ativa vida infinita para o jogador.")
createOption(submenus["Arma"], "Ativar Aimbot", ativarAimbot, "Ativa o aimbot.")
createOption(submenus["Arma"], "Ativar ESP", ativarESP, "Ativa o ESP simples.")
createOption(submenus["Arma"], "Ativar ESP Avançado", ativarESPAvancado, "Ativa o ESP avançado com mais recursos.")
createOption(submenus["Arma"], "Cor do ESP", function() personalizarCorESP("red") end, "Altera a cor do ESP para vermelho.")
createOption(submenus["Jogador"], "Teleporte Aleatório", ativarTeleporteAleatorio, "Teleporta para uma posição aleatória.")
createOption(submenus["Jogador"], "Ajustar Dano", function() ajustarDano(2) end, "Aumenta o dano em 2x.")
createOption(submenus["Jogador"], "Habilitar Wallhack", habilitarWallhack, "Deixa todos os objetos sem colidir e sem opacidade.")
createOption(submenus["Jogador"], "Desabilitar Wallhack", desabilitarWallhack, "Restaura o Wallhack.")
createOption(submenus["Configurações"], "Alterar Cor do Menu", function() mudarCorMenu(Color3.fromRGB(100, 100, 255)) end, "Muda a cor de fundo do menu.")
createOption(submenus["Configurações"], "Alterar Tamanho do Menu", function() mudarTamanhoMenu(500) end, "Muda o tamanho do menu.")
createOption(submenus["Avançado"], "Aimbot com Sensibilidade", function() ativarAimbotComSensibilidade(5) end, "Ativa o aimbot com sensibilidade ajustada.")
createOption(submenus["Avançado"], "Alterar Tamanho do Menu", function() mudarTamanhoMenu(600) end, "Aumenta o tamanho do menu.")
