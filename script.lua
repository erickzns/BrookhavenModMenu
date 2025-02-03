-- Cria a janela do menu
local Window = Rayfield:CreateWindow({
    Name = "Ana's Mod Menu",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "By Ana",
    ConfigurationSaving = {
        Enabled = false,
    },
    KeySystem = false
})

-- Cria a aba principal
local MainTab = Window:CreateTab("Main", 4483345998) -- Ícone de aba

-- Botões do menu
MainTab:CreateToggle({
    Name = "Auto Shake",
    CurrentValue = false,
    Flag = "AutoShake",
    Callback = function(Value)
        if Value then
            print("Auto Shake Ativado")
        else
            print("Auto Shake Desativado")
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto Balance Nuke",
    CurrentValue = false,
    Flag = "AutoBalanceNuke",
    Callback = function(Value)
        if Value then
            print("Auto Balance Nuke Ativado")
        else
            print("Auto Balance Nuke Desativado")
        end
    end
})

MainTab:CreateButton({
    Name = "Freeze Character",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    end
})

-- Inicia o menu
Rayfield:LoadConfiguration()
