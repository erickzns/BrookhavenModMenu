-- Criando a Interface
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

-- Botões de Funcionalidade
local TeleportButton = Instance.new("TextButton")
local SpeedButton = Instance.new("TextButton")
local AimbotButton = Instance.new("TextButton")
local ESPButton = Instance.new("TextButton")
local FlyButton = Instance.new("TextButton")
local GodModeButton = Instance.new("TextButton")

-- Configuração do GUI
ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 600)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -300)
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Mod Menu - Ilha Bela"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 24

-- Botões de Funcionalidade
TeleportButton.Parent = MainFrame
TeleportButton.Size = UDim2.new(0, 200, 0, 50)
TeleportButton.Position = UDim2.new(0.5, -100, 0.2, -25)
TeleportButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TeleportButton.Text = "Teletransportar"
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.Font = Enum.Font.SourceSans
TeleportButton.TextSize = 18

SpeedButton.Parent = MainFrame
SpeedButton.Size = UDim2.new(0, 200, 0, 50)
SpeedButton.Position = UDim2.new(0.5, -100, 0.3, -25)
SpeedButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SpeedButton.Text = "Alterar Velocidade"
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.Font = Enum.Font.SourceSans
SpeedButton.TextSize = 18

AimbotButton.Parent = MainFrame
AimbotButton.Size = UDim2.new(0, 200, 0, 50)
AimbotButton.Position = UDim2.new(0.5, -100, 0.4, -25)
AimbotButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AimbotButton.Text = "Ativar Aimbot"
AimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotButton.Font = Enum.Font.SourceSans
AimbotButton.TextSize = 18

ESPButton.Parent = MainFrame
ESPButton.Size = UDim2.new(0, 200, 0, 50)
ESPButton.Position = UDim2.new(0.5, -100, 0.5, -25)
ESPButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ESPButton.Text = "Ativar ESP"
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.Font = Enum.Font.SourceSans
ESPButton.TextSize = 18

FlyButton.Parent = MainFrame
FlyButton.Size = UDim2.new(0, 200, 0, 50)
FlyButton.Position = UDim2.new(0.5, -100, 0.6, -25)
FlyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
FlyButton.Text = "Ativar Voo"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.Font = Enum.Font.SourceSans
FlyButton.TextSize = 18

GodModeButton.Parent = MainFrame
GodModeButton.Size = UDim2.new(0, 200, 0, 50)
GodModeButton.Position = UDim2.new(0.5, -100, 0.7, -25)
GodModeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
GodModeButton.Text = "Ativar God Mode"
GodModeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GodModeButton.Font = Enum.Font.SourceSans
GodModeButton.TextSize = 18

-- Função para Teletransportar
TeleportButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    -- Altere a posição para onde você quer teleportar
    local teleportPosition = Vector3.new(0, 10, 0) -- Substitua com as coordenadas desejadas
    humanoidRootPart.CFrame = CFrame.new(teleportPosition)
    print("Teletransportado para a posição!")
end)

-- Função para Alterar Velocidade
SpeedButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    humanoid.WalkSpeed = 50
    print("Velocidade alterada para: " .. humanoid.WalkSpeed)
end)

-- Função para Ativar Aimbot
AimbotButton.MouseButton1Click:Connect(function()
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    local mouse = localPlayer:GetMouse()

    local function getClosestPlayer()
        local closestDistance = math.huge
        local closestPlayer = nil

        for _, player in pairs(players:GetPlayers()) do
            if player ~= localPlayer and player.Team ~= localPlayer.Team then
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local distance = (character.HumanoidRootPart.Position - localPlayer.Character.HumanoidRootPart.Position).magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end

        return closestPlayer
    end

    mouse.Button2Down:Connect(function()
        local target = getClosestPlayer()
        if target then
            local targetPos = target.Character.HumanoidRootPart.Position
            mouse.Hit = CFrame.new(targetPos)
        end
    end)
    print("Aimbot ativado")
end)

-- Função para Ativar ESP
ESPButton.MouseButton1Click:Connect(function()
    local RunService = game:GetService("RunService")
    local players = game:GetService("Players")
    
    local function createESP(player)
        local espBox = Drawing.new("Square")
        espBox.Thickness = 3
        espBox.Color = Color3.fromRGB(255, 0, 0)
        espBox.Filled = false

        RunService.RenderStepped:Connect(function()
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local rootPart = player.Character.HumanoidRootPart
                local screenPos = workspace.CurrentCamera:WorldToViewportPoint(rootPart.Position)

                if screenPos.Z > 0 then
                    espBox.Visible = true
                    espBox.Size = Vector2.new(50, 50)
                    espBox.Position = Vector2.new(screenPos.X - 25, screenPos.Y - 25)
                else
                    espBox.Visible = false
                end
            else
                espBox.Visible = false
            end
        end)
    end

    for _, player in pairs(players:GetPlayers()) do
        if player ~= players.LocalPlayer then
            createESP(player)
        end
    end

    players.PlayerAdded:Connect(function(player)
        createESP(player)
    end)
    print("ESP ativado")
end)

-- Função para Ativar Fly Mode
FlyButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    humanoid.PlatformStand = true

    local flySpeed = 50

    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode == Enum.KeyCode.W then
                humanoid:Move(Vector3.new(0, 0, -flySpeed))
            elseif input.KeyCode == Enum.KeyCode.S then
                humanoid:Move(Vector3.new(0, 0, flySpeed))
            elseif input.KeyCode == Enum.KeyCode.A then
                humanoid:Move(Vector3.new(-flySpeed, 0, 0))
            elseif input.KeyCode == Enum.KeyCode.D then
                humanoid:Move(Vector3.new(flySpeed, 0, 0))
            elseif input.KeyCode == Enum.KeyCode.Space then
                humanoid:Move(Vector3.new(0, flySpeed, 0))
            elseif input.KeyCode == Enum.KeyCode.LeftShift then
                humanoid:Move(Vector3.new(0, -flySpeed, 0))
            end
        end
    end)
    print("Modo de Voo ativado")
end)

-- Função para Ativar God Mode
GodModeButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    humanoid.Health = humanoid.MaxHealth
    humanoid.HealthChanged:Connect(function()
        humanoid.Health = humanoid.MaxHealth -- Restaura a saúde constantemente
    end)
    print("God Mode ativado - Personagem invencível!")
end)
