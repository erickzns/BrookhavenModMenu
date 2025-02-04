local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local OpenButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -150)
MainFrame.Visible = false

OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 150, 0, 50)
OpenButton.Position = UDim2.new(0.5, -75, 0.9, 0)
OpenButton.Text = "Abrir Menu"
OpenButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

CloseButton.Parent = MainFrame
CloseButton.Size = UDim2.new(0, 100, 0, 30)
CloseButton.Position = UDim2.new(0.5, -50, 1, -40)
CloseButton.Text = "Fechar"
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)
