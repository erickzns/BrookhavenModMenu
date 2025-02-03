-- Cria a janela do menu
local Window = OrionLib:MakeWindow({
    Name = "Ana's Mod Menu",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "AnaMod"
})

-- Aba Principal (Main)
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Botão de Alternância (Auto Shake)
MainTab:AddToggle({
    Name = "Auto Shake",
    Default = false,
    Callback = function(Value)
        if Value then
            print("Auto Shake Ativado")
        else
            print("Auto Shake Desativado")
        end
    end
})

-- Botão de Alternância (Auto Balance Nuke)
MainTab:AddToggle({
    Name = "Auto Balance Nuke",
    Default = false,
    Callback = function(Value)
        if Value then
            print("Auto Balance Nuke Ativado")
        else
            print("Auto Balance Nuke Desativado")
        end
    end
})

-- Botão Normal (Freeze Character)
MainTab:AddButton({
    Name = "Freeze Character",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    end
})

-- Inicia o Menu
OrionLib:Init()
