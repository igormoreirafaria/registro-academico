require "IControladora"
require "Produto"

ControladoraProduto = IControladora:new()

function ControladoraProduto:new()
    obj = IControladora:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function ControladoraProduto:cadastrar(menu)
    Database:addProduto(Produto:new(menu:inputCadastro()))
end

function ControladoraProduto:editar(menu)
    Database:editProduto(menu:inputEdicao())
end

function ControladoraProduto:remover(menu)
    Database:removeProduto(menu:inputRemover())
end

function ControladoraProduto:listar(menu)
    menu:listaItens(Database:getProdutos())
end
