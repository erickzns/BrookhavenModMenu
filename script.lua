-- Função para Gerar Dinheiro de Forma Contínua
local function gerarDinheiroContinuo(valor)
    while true do
        wait(5) -- A cada 5 segundos
        modificarDinheiro(valor)
        print("Dinheiro gerado automaticamente: " .. valor)
    end
end

-- Função para Alterar o Clima
local function alterarClima(tipo)
    if tipo == "dia" then
        game.Lighting.TimeOfDay = "14:00:00"
        print("Clima alterado para o dia!")
    elseif tipo == "noite" then
        game.Lighting.TimeOfDay = "00:00:00"
        print("Clima alterado para a noite!")
    elseif tipo == "chuva" then
        game.Lighting.Rain.Enabled = true
        print("Chuva ativada!")
    elseif tipo == "nevoeiro" then
        game.Lighting.FogEnabled = true
        print("Nevoeiro ativado!")
    end
end

-- Função para Criar Blocos ou Caminhos no Jogo
local function criarBloco(position, tamanho)
    local bloco = Instance.new("Part")
    bloco.Size = tamanho
    bloco.Position = position
    bloco.Anchored = true
    bloco.BrickColor = BrickColor.new("Bright blue")
    bloco.Parent = workspace
    print("Bloco criado na posição: " .. tostring(position))
end

-- Função para Forçar Ação de Outro Jogador
local function forcarAcaoJogador(jogador, acao)
    if acao == "dançar" then
        -- Exemplo de forçar o jogador a dançar
        jogador.Character:WaitForChild("Humanoid"):MoveTo(workspace.DanceLocation.Position)
        print(jogador.Name .. " está dançando agora!")
    elseif acao == "sentar" then
        jogador.Character:WaitForChild("Humanoid"):Sit(true)
        print(jogador.Name .. " está sentado!")
    end
end

-- Função para Rastrear a Localização de Jogadores
local function rastrearJogadores()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character then
            local position = player.Character.HumanoidRootPart.Position
            print(player.Name .. " está em: " .. tostring(position))
        end
    end
end

-- Função para Movimento Rápido da Câmera
local function movimentoRapidoCamera()
    local camera = game.Workspace.CurrentCamera
    camera.CameraType = Enum.CameraType.Scriptable
    camera.CFrame = camera.CFrame * CFrame.new(0, 0, -50)
    print("Movimento rápido de câmera ativado!")
end

-- Função para Multiplicador de XP ou Pontuação
local function multiplicadorXP(pontos)
    local player = game.Players.LocalPlayer
    if player.leaderstats and player.leaderstats.XP then
        player.leaderstats.XP.Value = player.leaderstats.XP.Value * pontos
        print("Multiplicador de XP ativado!")
    end
end

-- Função para Modificar a Voz de um Jogador
local function modificarVoz(jogador)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://123456789" -- Coloque o ID de uma voz ou som
    sound.Parent = jogador.Character
    sound:Play()
    print("Voz modificada para " .. jogador.Name)
end

-- Função para Criar Veículo ou Montaria
local function criarVeiculo(position, tipo)
    local veiculo
    if tipo == "carro" then
        veiculo = Instance.new("VehicleSeat")
        veiculo.Position = position
        veiculo.Parent = workspace
        print("Carro criado na posição: " .. tostring(position))
    elseif tipo == "montaria" then
        veiculo = Instance.new("Model") -- Simplesmente um exemplo, você pode colocar um animal real aqui
        veiculo.Name = "Montaria"
        veiculo.Parent = workspace
        print("Montaria criada na posição: " .. tostring(position))
    end
end

-- Funções para Criar Opções de Trapaça no Menu
local function criarOpcoesDeTrapaçaAvancadas()
    createOption(geralSubMenu, "Gerar Dinheiro Continuamente", function() gerarDinheiroContinuo(1000) end, 0)
    createOption(geralSubMenu, "Alterar Clima para Dia", function() alterarClima("dia") end, 1)
    createOption(geralSubMenu, "Criar Bloco", function() criarBloco(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(5, 0, 0), Vector3.new(5, 5, 5)) end, 2)
    createOption(geralSubMenu, "Forçar Jogador a Dançar", function() forcarAcaoJogador(game.Players.LocalPlayer, "dançar") end, 3)
    createOption(geralSubMenu, "Rastrear Jogadores", rastrearJogadores, 4)
    createOption(geralSubMenu, "Movimento Rápido de Câmera", movimentoRapidoCamera, 5)
    createOption(geralSubMenu, "Multiplicador de XP", function() multiplicadorXP(10) end, 6)
    createOption(geralSubMenu, "Modificar Voz", function() modificarVoz(game.Players.LocalPlayer) end, 7)
    createOption(geralSubMenu, "Criar Carro", function() criarVeiculo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, "carro") end, 8)
    createOption(geralSubMenu, "Criar Montaria", function() criarVeiculo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, "montaria") end, 9)
end

-- Chamada da função para criar as opções avançadas
criarOpcoesDeTrapaçaAvancadas()

print("ModMenu agora com funções avançadas e mais opções!")
