-- Mod Menu Completo Fictício para Roblox

-- Classe Base
CheatFunction = {}
CheatFunction.__index = CheatFunction

function CheatFunction:new(name)
    local obj = setmetatable({}, CheatFunction)
    obj.name = name or "Cheat Function"
    obj.active = false
    return obj
end

function CheatFunction:activate()
    self.active = true
    print(self.name .. " activated.")
end

function CheatFunction:deactivate()
    self.active = false
    print(self.name .. " deactivated.")
end

-- Classe Velocidade Extra (Speed Hack)
SpeedHack = CheatFunction:new("Speed Hack")

function SpeedHack:setSpeed(value)
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.WalkSpeed = value
end

function SpeedHack:activate(value)
    CheatFunction.activate(self)
    self:setSpeed(value)
    print(self.name .. " activated with speed " .. value)
end

function SpeedHack:deactivate()
    CheatFunction.deactivate(self)
    self:setSpeed(16) -- Valor padrão de velocidade
end

-- Classe Super Salto (Super Jump)
SuperJump = CheatFunction:new("Super Jump")

function SuperJump:setJumpPower(value)
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.JumpPower = value
end

function SuperJump:activate(value)
    CheatFunction.activate(self)
    self:setJumpPower(value)
    print(self.name .. " activated with jump power " .. value)
end

function SuperJump:deactivate()
    CheatFunction.deactivate(self)
    self:setJumpPower(50) -- Valor padrão de salto
end

-- Classe Gravidade Zero (Low Gravity)
LowGravity = CheatFunction:new("Low Gravity")

function LowGravity:setGravity(value)
    game.Workspace.Gravity = value
end

function LowGravity:activate(value)
    CheatFunction.activate(self)
    self:setGravity(value)
    print(self.name .. " activated with gravity " .. value)
end

function LowGravity:deactivate()
    CheatFunction.deactivate(self)
    self:setGravity(196.2) -- Valor padrão de gravidade
end

-- Classe Invencibilidade (God Mode)
GodMode = CheatFunction:new("God Mode")

function GodMode:activate()
    CheatFunction.activate(self)
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.MaxHealth = math.huge
    player.Character.Humanoid.Health = math.huge
end

function GodMode:deactivate()
    CheatFunction.deactivate(self)
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.MaxHealth = 100
    player.Character.Humanoid.Health = 100
end

-- Classe Voo (Fly Mode)
FlyMode = CheatFunction:new("Fly Mode")

function FlyMode:fly(value)
    -- Função fictícia para voo
end

function FlyMode:activate(value)
    CheatFunction.activate(self)
    self:fly(value)
    print(self.name .. " activated with fly speed " .. value)
end

function FlyMode:deactivate()
    CheatFunction.deactivate(self)
    self:fly(0) -- Desativar voo
end

-- Classe Teleportação (Teleportation)
Teleportation = CheatFunction:new("Teleportation")

function Teleportation:teleportToPlayer(playerName)
    local player = game.Players.LocalPlayer
    local targetPlayer = game.Players:FindFirstChild(playerName)
    if targetPlayer then
        player.Character:SetPrimaryPartCFrame(targetPlayer.Character:GetPrimaryPartCFrame())
    end
end

function Teleportation:teleportToCoords(x, y, z)
    local player = game.Players.LocalPlayer
    player.Character:SetPrimaryPartCFrame(CFrame.new(x, y, z))
end

function Teleportation:activate(targetType, target)
    CheatFunction.activate(self)
    if targetType == "player" then
        self:teleportToPlayer(target)
    else
        self:teleportToCoords(target.x, target.y, target.z)
    end
end

function Teleportation:deactivate()
    CheatFunction.deactivate(self)
    print(self.name .. " deactivated.")
end

-- Classe Menu Principal
CheatMenu = {}
CheatMenu.__index = CheatMenu

function CheatMenu:new()
    local obj = setmetatable({}, CheatMenu)
    obj.functions = {}
    return obj
end

function CheatMenu:addFunction(cheatFunction)
    table.insert(self.functions, cheatFunction)
end

function CheatMenu:activateFunction(name, value)
    for _, func in ipairs(self.functions) do
        if func.name == name then
            func:activate(value)
        end
    end
end

function CheatMenu:deactivateFunction(name)
    for _, func in ipairs(self.functions) do
        if func.name == name then
            func:deactivate()
        end
    end
end

-- Criando instâncias das funções de cheats
local speedHack = SpeedHack:new()
local superJump = SuperJump:new()
local lowGravity = LowGravity:new()
local godMode = GodMode:new()
local flyMode = FlyMode:new()
local teleportation = Teleportation:new()

-- Criando o menu principal e adicionando as funções de cheats
local cheatMenu = CheatMenu:new()
cheatMenu:addFunction(speedHack)
cheatMenu:addFunction(superJump)
cheatMenu:addFunction(lowGravity)
cheatMenu:addFunction(godMode)
cheatMenu:addFunction(flyMode)
cheatMenu:addFunction(teleportation)

-- Exemplos de ativação e desativação das funções
cheatMenu:activateFunction("Speed Hack", 10)
cheatMenu:activateFunction("Super Jump", 100)
cheatMenu:activateFunction("Low Gravity", 50)
cheatMenu:activateFunction("God Mode")
cheatMenu:activateFunction("Fly Mode", 50)
cheatMenu:activateFunction("Teleportation", {x = 0, y = 10, z = 0})

-- Desativação
cheatMenu:deactivateFunction("Speed Hack")
cheatMenu:deactivateFunction("Super Jump")
cheatMenu:deactivateFunction("Low Gravity")
cheatMenu:deactivateFunction("God Mode")
cheatMenu:deactivateFunction("Fly Mode")
cheatMenu:deactivateFunction("Teleportation")
