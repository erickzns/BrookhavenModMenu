-- GUI Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Draggable = true

-- Título do Menu
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(0, 400, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Mod Menu Ilha Bela"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 24

-- Botões Laterais
local AimbotButton = Instance.new("TextButton")
AimbotButton.Parent = MainFrame
AimbotButton.Size = UDim2.new(0, 200, 0, 50)
AimbotButton.Position = UDim2.new(0, 0, 0.2, 0)
AimbotButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AimbotButton.Text = "Ativar Aimbot"
AimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotButton.Font = Enum.Font.SourceSans
AimbotButton.TextSize = 18

local ESPButton = Instance.new("TextButton")
ESPButton.Parent = MainFrame
ESPButton.Size = UDim2.new(0, 200, 0, 50)
ESPButton.Position = UDim2.new(0, 0, 0.4, 0)
ESPButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ESPButton.Text = "Ativar ESP"
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.Font = Enum.Font.SourceSans
ESPButton.TextSize = 18

local FlyButton = Instance.new("TextButton")
FlyButton.Parent = MainFrame
FlyButton.Size = UDim2.new(0, 200, 0, 50)
FlyButton.Position = UDim2.new(0, 0, 0.6, 0)
FlyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
FlyButton.Text = "Ativar Fly"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.Font = Enum.Font.SourceSans
FlyButton.TextSize = 18

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
