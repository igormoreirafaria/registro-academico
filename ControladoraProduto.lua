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
    local cod = menu:inputEdicao()
    if Database:getProduto(cod) ~= nil then
        Database:editProduto(cod, menu:inputCadastro())
        menu:sucesso()
    else
        menu:erro()
    end
end

function ControladoraProduto:remover(menu)
    if Database:removeProduto(menu:inputRemover()) == false then
        menu:erro()
    else
        menu:sucesso()
    end
end

function ControladoraProduto:listar(menu)
    menu:listaItens(Database:getProdutos())
end
