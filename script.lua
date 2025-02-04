-- Criando o ScreenGui e a estrutura do Menu
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local menuFrame = Instance.new("Frame")
menuFrame.Parent = screenGui
menuFrame.Size = UDim2.new(0, 200, 0, 400)
menuFrame.Position = UDim2.new(0, 10, 0, 10)  -- Posição inicial do menu
menuFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
menuFrame.BorderSizePixel = 0
menuFrame.ClipsDescendants = true  -- Garante que elementos fora da área do menu não apareçam
menuFrame.Visible = false -- Começa invisível

-- Criando o botão principal (para abrir o menu)
local openMenuButton = Instance.new("TextButton")
openMenuButton.Size = UDim2.new(0, 180, 0, 50)
openMenuButton.Position = UDim2.new(0, 10, 0, 10)
openMenuButton.Text = "Abrir Funções"
openMenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openMenuButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
openMenuButton.Parent = menuFrame

-- Função de animação para abrir/fechar o menu
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local menuOpenPosition = UDim2.new(0, 10, 0, 70)
local menuClosedPosition = UDim2.new(0, 10, 0, 10)

local function openCloseMenu()
    if menuFrame.Visible == false then
        menuFrame.Visible = true
        local openTween = TweenService:Create(menuFrame, tweenInfo, {Position = menuOpenPosition})
        openTween:Play()
    else
        local closeTween = TweenService:Create(menuFrame, tweenInfo, {Position = menuClosedPosition})
        closeTween:Play()
        closeTween.Completed:Connect(function()
            menuFrame.Visible = false
        end)
    end
end

openMenuButton.MouseButton1Click:Connect(openCloseMenu)

-- Criando um submenu com botões
local submenuFrame = Instance.new("Frame")
submenuFrame.Parent = menuFrame
submenuFrame.Size = UDim2.new(0, 200, 0, 300)
submenuFrame.Position = UDim2.new(0, 0, 0, 70)  -- Submenu fica logo abaixo do botão
submenuFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
submenuFrame.Visible = false  -- Começa invisível

-- Criando botões do submenu
local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0, 180, 0, 50)
button1.Position = UDim2.new(0, 10, 0, 10)
button1.Text = "Ativar Aimbot"
button1.TextColor3 = Color3.fromRGB(255, 255, 255)
button1.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
button1.Parent = submenuFrame

local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0, 180, 0, 50)
button2.Position = UDim2.new(0, 10, 0, 70)
button2.Text = "Ativar ESP"
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
button2.Parent = submenuFrame

-- Função para abrir o submenu
local function openSubmenu()
    submenuFrame.Visible = not submenuFrame.Visible
end

button1.MouseButton1Click:Connect(openSubmenu)
button2.MouseButton1Click:Connect(openSubmenu)

-- Botão de Fechar Submenu
local closeSubMenuButton = Instance.new("TextButton")
closeSubMenuButton.Size = UDim2.new(0, 180, 0, 50)
closeSubMenuButton.Position = UDim2.new(0, 10, 0, 130)
closeSubMenuButton.Text = "Fechar Submenu"
closeSubMenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeSubMenuButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
closeSubMenuButton.Parent = submenuFrame

closeSubMenuButton.MouseButton1Click:Connect(function()
    submenuFrame.Visible = false
end)
