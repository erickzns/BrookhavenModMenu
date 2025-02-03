print("🔵 Iniciando script...")

local success, err = pcall(function()
    -- Carrega a UI
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/erickzns/BrookhavenModMenu/refs/heads/main/script.lua"))()
    print("✅ Rayfield carregado com sucesso!")

    local Window = Rayfield:CreateWindow({
        Name = "Ana's Mod Menu",
        LoadingTitle = "Carregando...",
        LoadingSubtitle = "By Ana",
        ConfigurationSaving = { Enabled = false },
        KeySystem = false
    })

    local MainTab = Window:CreateTab("Main", 4483345998)
    MainTab:CreateButton({
        Name = "Testar Menu",
        Callback = function()
            print("🎯 O botão foi pressionado!")
        end
    })

    Rayfield:LoadConfiguration()
    print("✅ Menu carregado com sucesso!")
end)

if not success then
    warn("❌ Erro ao carregar o script:", err)
end
