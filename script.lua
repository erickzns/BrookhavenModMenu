-- Configuração da Interface
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AimbotButton = Instance.new("TextButton")
local ESPButton = Instance.new("TextButton")
local FlyButton = Instance.new("TextButton")
local GERALButton = Instance.new("TextButton")
local ARMAButton = Instance.new("TextButton")
local JOGADORButton = Instance.new("TextButton")
local VEICULOSButton = Instance.new("TextButton")
local TROLLSButton = Instance.new("TextButton")
local CONFIGURACAOButton = Instance.new("TextButton")

-- Configuração da interface
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui

MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Mod Menu"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 24

-- Configuração dos botões laterais
AimbotButton.Parent = MainFrame
AimbotButton.Size = UDim2.new(0, 200, 0, 50)
AimbotButton.Position = UDim2.new(0, 0, 0.2, 0)
AimbotButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AimbotButton.Text = "Ativar Aimbot"
AimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotButton.Font = Enum.Font.SourceSans
AimbotButton.TextSize = 18

ESPButton.Parent = MainFrame
ESPButton.Size = UDim2.new(0, 200, 0, 50)
ESPButton.Position = UDim2.new(0, 0, 0.4, 0)
ESPButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ESPButton.Text = "Ativar ESP"
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.Font = Enum.Font.SourceSans
ESPButton.TextSize = 18

FlyButton.Parent = MainFrame
FlyButton.Size = UDim2.new(0, 200, 0, 50)
FlyButton.Position = UDim2.new(0, 0, 0.6, 0)
FlyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
FlyButton.Text = "Ativar Fly"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.Font = Enum.Font.SourceSans
FlyButton.TextSize = 18

-- Adicionando os novos botões laterais
GERALButton.Parent = MainFrame
GERALButton.Size = UDim2.new(0, 200, 0, 50)
GERALButton.Position = UDim2.new(0, 0, 0.8, 0)
GERALButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
GERALButton.Text = "Geral"
GERALButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GERALButton.Font = Enum.Font.SourceSans
GERALButton.TextSize = 18

ARMAButton.Parent = MainFrame
ARMAButton.Size = UDim2.new(0, 200, 0, 50)
ARMAButton.Position = UDim2.new(0, 0, 1.0, 0)
ARMAButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ARMAButton.Text = "Arma"
ARMAButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ARMAButton.Font = Enum.Font.SourceSans
ARMAButton.TextSize = 18

JOGADORButton.Parent = MainFrame
JOGADORButton.Size = UDim2.new(0, 200, 0, 50)
JOGADORButton.Position = UDim2.new(0, 0, 1.2, 0)
JOGADORButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
JOGADORButton.Text = "Jogador"
JOGADORButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JOGADORButton.Font = Enum.Font.SourceSans
JOGADORButton.TextSize = 18

VEICULOSButton.Parent = MainFrame
VEICULOSButton.Size = UDim2.new(0, 200, 0, 50)
VEICULOSButton.Position = UDim2.new(0, 0, 1.4, 0)
VEICULOSButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
VEICULOSButton.Text = "Veículos"
VEICULOSButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VEICULOSButton.Font = Enum.Font.SourceSans
VEICULOSButton.TextSize = 18

TROLLSButton.Parent = MainFrame
TROLLSButton.Size = UDim2.new(0, 200, 0, 50)
TROLLSButton.Position = UDim2.new(0, 0, 1.6, 0)
TROLLSButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TROLLSButton.Text = "Trolls"
TROLLSButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TROLLSButton.Font = Enum.Font.SourceSans
TROLLSButton.TextSize = 18

CONFIGURACAOButton.Parent = MainFrame
CONFIGURACAOButton.Size = UDim2.new(0, 200, 0, 50)
CONFIGURACAOButton.Position = UDim2.new(0, 0, 1.8, 0)
CONFIGURACAOButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CONFIGURACAOButton.Text = "Configuração"
CONFIGURACAOButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CONFIGURACAOButton.Font = Enum.Font.SourceSans
CONFIGURACAOButton.TextSize = 18

-- Função para ativar o Aimbot
local aimbotActive = false
AimbotButton.MouseButton1Click:Connect(function()
    aimbotActive = not aimbotActive
    if aimbotActive then
        print("Aimbot Ativado")
    else
        print("Aimbot Desativado")
    end
end)

-- Função para ativar o ESP
local espActive = false
ESPButton.MouseButton1Click:Connect(function()
    espActive = not espActive
    if espActive then
        print("ESP Ativado")
    else
        print("ESP Desativado")
    end
end)

-- Função para ativar o Fly Mode
local flyActive = false
FlyButton.MouseButton1Click:Connect(function()
    flyActive = not flyActive
    if flyActive then
        print("Fly Mode Ativado")
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        
        -- Permitindo o voo
        humanoid.PlatformStand = true
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.new(0, 50, 0)  -- Ajuste a velocidade do voo
        bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
        
        -- Função de sair do voo
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.Space then
                bodyVelocity:Destroy()  -- Interrompe o voo
                humanoid.PlatformStand = false
            end
        end)
    else
        print("Fly Mode Desativado")
        -- Remover o voo
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.PlatformStand = false
    end
end)

-- Função para aplicar Aimbot
game:GetService("RunService").Heartbeat:Connect(function()
    if aimbotActive then
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local mouse = player:GetMouse()
        
        local closestPlayer
        local closestDistance = math.huge
        for _, targetPlayer in pairs(game.Players:GetPlayers()) do
            if targetPlayer ~= player then
                local targetCharacter = targetPlayer.Character
                if targetCharacter and targetCharacter:FindFirstChild("Head") then
                    local distance = (targetCharacter.Head.Position - character.HumanoidRootPart.Position).magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = targetPlayer
                    end
                end
            end
        end
        if closestPlayer then
            mouse.Hit = closestPlayer.Character.Head.CFrame
        end
    end
end)

-- Função para aplicar ESP
game:GetService("RunService").Heartbeat:Connect(function()
    if espActive then
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local character = player.Character
                if character and character:FindFirstChild("Head") then
                    local espBox = Instance.new("BillboardGui")
                    espBox.Size = UDim2.new(0, 100, 0, 100)
                    espBox.StudsOffset = Vector3.new(0, 5, 0)  -- Ajuste a posição da caixa
                    espBox.Parent = character
                    local frame = Instance.new("Frame")
                    frame.Size = UDim2.new(1, 0, 1, 0)
                    frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                    frame.BackgroundTransparency = 0.5
                    frame.Parent = espBox
                end
            end
        end
    end
end)

-- Função de ativação para os novos botões laterais
GERALButton.MouseButton1Click:Connect(function()
    print("Geral Menu Ativado")
end)

ARMAButton.MouseButton1Click:Connect(function()
    print("Menu de Armas Ativado")
end)

JOGADORButton.MouseButton1Click:Connect(function()
    print("Menu de Jogador Ativado")
end)

VEICULOSButton.MouseButton1Click:Connect(function()
    print("Menu de Veículos Ativado")
end)

TROLLSButton.MouseButton1Click:Connect(function()
    print("Menu de Trolls Ativado")
end)

CONFIGURACAOButton.MouseButton1Click:Connect(function()
    print("Menu de Configuração Ativado")
end)
