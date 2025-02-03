-- Confirma se o script carregou
print("Carregando menu...")

-- Carrega a UI
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/erickzns/BrookhavenModMenu/refs/heads/main/script.lua"))()

-- Cria a janela
local Window = Rayfield:CreateWindow({
    Name = "Ana's Mod Menu",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "By Ana",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false
})

-- Cria a aba principal
local MainTab = Window:CreateTab("Main", 4483345998)

-- Adiciona um botão de teste
MainTab:CreateButton({
    Name = "Testar Menu",
    Callback = function()
        print("O menu está funcionando!")
    end
})

-- Exibe a UI
Rayfield:LoadConfiguration()
print("Menu carregado com sucesso!")
