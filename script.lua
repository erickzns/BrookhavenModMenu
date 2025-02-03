-- Mod Menu Simplificado com uma Função (Speed Hack)

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

print("Classe base criada")

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

print("Speed Hack criado")

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

print("Menu principal criado")

-- Criando instância da função de Speed Hack
local speedHack = SpeedHack:new()

-- Criando o menu principal e adicionando a função de Speed Hack
local cheatMenu = CheatMenu:new()
cheatMenu:addFunction(speedHack)

print("Função adicionada ao menu")

-- Exemplos de ativação e desativação da função de Speed Hack
cheatMenu:activateFunction("Speed Hack", 10)
print("Função Speed Hack ativada")
cheatMenu:deactivateFunction("Speed Hack")
print("Função Speed Hack desativada")
