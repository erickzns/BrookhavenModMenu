-- Definindo o menu
local screenGui = Instance.new("ScreenGui")
local menuFrame = Instance.new("Frame")
menuFrame.Parent = screenGui
menuFrame.Size = UDim2.new(0, 200, 0, 400)
menuFrame.Position = UDim2.new(0, 10, 0, 10)  -- Posição inicial

-- Botões laterais
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 180, 0, 50)
button.Position = UDim2.new(0, 10, 0, 10)
button.Text = "Abrir Funções"
button.Parent = menuFrame

-- Função de animação ao clicar
button.MouseButton1Click:Connect(function()
    -- Exemplo de animação simples
    menuFrame:TweenPosition(UDim2.new(0, 10, 0, 100), "Out", "Quad", 0.5, true)
end)
