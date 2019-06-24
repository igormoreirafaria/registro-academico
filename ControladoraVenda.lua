require "IControladora"
require "Venda"

ControladoraVenda = IControladora:new()

function ControladoraVenda:new()
    obj = IControladora:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function ControladoraVenda:cadastrar(menu)
    Database:addVenda(Venda:new(menu:inputCadastroEdicao()))
end

function ControladoraVenda:editar(menu)
    Database:editVenda(menu:inputCadastroEdicao())
end

function ControladoraVenda:remover(menu)
    Database:removeVenda(menu:inputRemover())
end

function ControladoraVenda:listar(menu)
    menu:listaItens(Database:getVendas())
end
