-- Configuração da Interface
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AimbotButton = Instance.new("TextButton")
local ESPButton = Instance.new("TextButton")
local FlyButton = Instance.new("TextButton")
local ScriptExecutorButton = Instance.new("TextButton")

-- Configuração da interface
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")  -- Adicionando no PlayerGui
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

-- Configuração dos botões
AimbotButton.Parent = MainFrame
AimbotButton.Size = UDim2.new(0, 200, 0, 50)
AimbotButton.Position = UDim2.new(0.5, -100, 0.2, -25)
AimbotButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AimbotButton.Text = "Ativar Aimbot"
AimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotButton.Font = Enum.Font.SourceSans
AimbotButton.TextSize = 18

ESPButton.Parent = MainFrame
ESPButton.Size = UDim2.new(0, 200, 0, 50)
ESPButton.Position = UDim2.new(0.5, -100, 0.4, -25)
ESPButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ESPButton.Text = "Ativar ESP"
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.Font = Enum.Font.SourceSans
ESPButton.TextSize = 18

FlyButton.Parent = MainFrame
FlyButton.Size = UDim2.new(0, 200, 0, 50)
FlyButton.Position = UDim2.new(0.5, -100, 0.6, -25)
FlyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
FlyButton.Text = "Ativar Fly"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.Font = Enum.Font.SourceSans
FlyButton.TextSize = 18

ScriptExecutorButton.Parent = MainFrame
ScriptExecutorButton.Size = UDim2.new(0, 200, 0, 50)
ScriptExecutorButton.Position = UDim2.new(0.5, -100, 0.8, -25)
ScriptExecutorButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ScriptExecutorButton.Text = "Executar Script Lua"
ScriptExecutorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptExecutorButton.Font = Enum.Font.SourceSans
ScriptExecutorButton.TextSize = 18

-- Função para ativar o Aimbot
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
            -- Ajuste a mira para o alvo
            mouse.Hit = CFrame.new(targetPos)
        end
    end)
    print("Aimbot ativado")
end)

-- Função para ativar o ESP
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

-- Função para ativar o Fly Mode
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
    print("Fly mode ativado")
end)

-- Função para executar script Lua
ScriptExecutorButton.MouseButton1Click:Connect(function()
    loadstring("print('Script Lua executado')")()
    print("Script Lua executado")
end)

-- Funções extras de segurança
local function BypassAntiCheat()
    -- Implementação fictícia de Bypass Anti-Cheat
    print("Bypass Anti-Cheat ativado")
end

local function HWIDSpoofer()
    -- Implementação fictícia de HWID Spoofer
    print("HWID Spoofer ativado")
end

local function StealthMode()
    -- Implementação fictícia de Stealth Mode
    print("Stealth Mode ativado")
end

-- Chamando funções de segurança
BypassAntiCheat()
HWIDSpoofer()
StealthMode()
