local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui

-- Verificação se o PlayerGui está acessível
if not playerGui then
    warn("PlayerGui não encontrado!")
    return
end

-- Criando um ScreenGui para o Mod Menu
local modMenuGui = Instance.new("ScreenGui")
modMenuGui.Name = "ModMenu"
modMenuGui.Parent = playerGui

-- Criando um frame para o menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 400, 0, 500)  -- Tamanho do menu
menuFrame.Position = UDim2.new(0.5, -200, 0.5, -250)  -- Posição centralizada
menuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  -- Cor de fundo do menu
menuFrame.BackgroundTransparency = 0.7  -- Transparência
menuFrame.Parent = modMenuGui
menuFrame.Active = true  -- Permite que o menu seja clicado
menuFrame.Draggable = true  -- Permite que o menu seja movido

-- Criando um título para o menu
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)  -- Tamanho do título
title.Position = UDim2.new(0, 0, 0, 0)  -- Posição do título
title.Text = "Mod Menu"
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.Font = Enum.Font.SourceSans
title.TextAlign = Enum.TextXAlignment.Center
title.Parent = menuFrame

print("Menu criado com sucesso!")
