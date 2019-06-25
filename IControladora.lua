IControladora = {}

function IControladora:new()
    obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function IControladora:cadastrar(menu) end
function IControladora:editar(menu) end
function IControladora:listar(menu) end
function IControladora:remover(menu) end
