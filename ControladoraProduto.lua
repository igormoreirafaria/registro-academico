require "IControladora"
ControladoraProduto = IControladora:new()

function ControladoraProduto:new()
    obj = IControladora:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function ControladoraProduto:cadastrar(menu)

end

function ControladoraProduto:editar(menu)

end

function ControladoraProduto:remover(menu)

end

function ControladoraProduto:listar(menu)
    
end
