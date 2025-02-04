-- Fly Mode
local function activateFly(isChecked)
    if isChecked then
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
        -- Desativa o voo
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.PlatformStand = false
    end
end

-- ESP (wallhack básico)
local function activateESP(isChecked)
    if isChecked then
        print("ESP Ativado")
        -- Criar ESP simples (caixa ao redor do jogador)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local box = Instance.new("BillboardGui")
        box.Parent = character
        box.Size = UDim2.new(0, 100, 0, 100)
        box.StudsOffset = Vector3.new(0, 5, 0)  -- Ajuste a posição da caixa
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        frame.BackgroundTransparency = 0.5
        frame.Parent = box
    else
        print("ESP Desativado")
        -- Remover o ESP
        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("BillboardGui") then
                v:Destroy()
            end
        end
    end
end

-- Aimbot (simples, apenas apontando para o jogador mais próximo)
local function activateAimbot(isChecked)
    if isChecked then
        print("Aimbot Ativado")
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local mouse = player:GetMouse()
        
        -- Função simples de aimbot
        game:GetService("RunService").Heartbeat:Connect(function()
            if isChecked then
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
    else
        print("Aimbot Desativado")
    end
end

-- Funções já implementadas para as outras funcionalidades, como SpeedBoost, NoClip, etc.

-- Continuar com o resto das funções de cheats como Speed Boost, God Mode, NoClip, etc.
