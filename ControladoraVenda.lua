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
    local rg = menu:inputRg()
    if Database:getCliente(rg) ~= nil then
        local quantidade = menu:inputQuantidadeItensDistintos()
        local codigoProduto = {}
        local quantidadeVenda = {}
        for i = 1, quantidade do
            codigoProduto[i] = menu:inputCodigoProduto()
            while Database:getProduto(codigoProduto[i]) == nil do
                menu:erroProdutoNaoCadastrado()
                codigoProduto[i] = menu:inputCodigoProduto()
            end
            quantidadeVenda[i] = menu:inputQuantidade()
        end
        local data = menu:inputData()
        local itensVenda = {}
        for i = 1, #codigoProduto do
            itensVenda[i] = ItemVenda:new(Database:getProduto(codigoProduto[i]), quantidadeVenda[i])
        end
        Database:addVenda(Venda:new(data, itensVenda, Database:getCliente(rg)))
    else
        menu:erroCodNaoCadastrado()
        self:cadastrar(menu)
    end
end

function ControladoraVenda:editar(menu)
    local cod = menu:inputEdicao()
    if Database:getVenda(cod) ~= nil then
        local rg = menu:inputRg()
        while Database:getCliente(rg) == nil do
            menu:erroCodNaoCadastrado()
            rg = menu:inputRg()
        end
        local quantidade = menu:inputQuantidadeItensDistintos()
        local codigoProduto = {}
        local quantidadeVenda = {}
        for i = 1, quantidade do
            codigoProduto[i] = menu:inputCodigoProduto()
            while Database:getProduto(codigoProduto[i]) == nil do
                menu:erroProdutoNaoCadastrado()
                codigoProduto[i] = menu:inputCodigoProduto()
            end
            quantidadeVenda[i] = menu:inputQuantidade()
        end
        local data = menu:inputData()
        local itensVenda = {}
        for i = 1, #codigoProduto do
            itensVenda[i] = ItemVenda:new(Database:getProduto(codigoProduto[i]), quantidadeVenda[i])
        end
        Database:editVenda(cod, data, itensVenda, Database:getCliente(rg))
        menu:sucesso()
    else
        menu:erro()
        self:editar(menu)
    end
end

function ControladoraVenda:remover(menu)
    local cod = menu:inputRemover()
    if Database:getVenda(cod) ~= nil then
        Database:removeVenda(cod)
        menu:sucesso()
    else
        menu:erroCodNaoCadastrado()
        self:remover(menu)
    end
end

function ControladoraVenda:listar(menu)
    menu:listaItens(Database:getVendas())
end

