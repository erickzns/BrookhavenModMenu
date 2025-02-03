local _a = game.Players.LocalPlayer
local _b = _a.PlayerGui

local modMenuGui = Instance.new("ScreenGui")
modMenuGui.Name = "ModMenu"
modMenuGui.Parent = _b
modMenuGui.ZIndex = 1000

local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 400, 0, 500)
menuFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
menuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
menuFrame.BackgroundTransparency = 0.7
menuFrame.Parent = modMenuGui
menuFrame.Active = true
menuFrame.Draggable = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Mod Menu"
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 24
title.Font = Enum.Font.SourceSans
title.TextAlign = Enum.TextXAlignment.Center
title.Parent = menuFrame
