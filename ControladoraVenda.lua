require "IControladora"
require "Venda"
require "ItemVenda"

ControladoraVenda = IControladora:new()

function ControladoraVenda:new()
    obj = IControladora:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function ControladoraVenda:cadastrar(menu)
    local data, codigoVenda, quantidadeVenda, rg = menu:inputCadastro()
    itensVenda = {}
    for i = 1, #codigoVenda do
        itensVenda[i] = ItemVenda:new(Database:getProduto(codigoVenda[i]), quantidadeVenda[i])
    end
    Database:addVenda(Venda:new(data, itensVenda, Database:getCliente(rg)))
end

function ControladoraVenda:editar(menu)
    local cod = menu:inputEdicao()
    if Database:getVenda(cod) ~= nil then
        Database:editVenda(cod, menu:inputCadastro())
        menu:sucesso()
    else
        menu:erro()
    end
end

function ControladoraVenda:remover(menu)
    if Database:removeVenda(menu:inputRemover()) == false then
        menu:erro()
    else
        menu:sucesso()
    end
end

function ControladoraVenda:listar(menu)
    menu:listaItens(Database:getVendas())
end

