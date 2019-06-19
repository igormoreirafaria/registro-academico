Totalizavel = {}

function Totalizavel:new()
    obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Totalizavel:total()              -- este método deve ser sobrescrito
    return 0
end
