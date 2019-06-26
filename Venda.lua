require "Cliente"
require "ItemVenda"
require "Totalizavel"

Venda = Totalizavel:new()

function Venda:new(data, itensVenda, cliente, numero)
    local obj = Totalizavel:new()
    setmetatable(obj, self)
    self.__index = self
    obj.numero = numero or 0
    obj.data = data or ""
    obj.itensVenda = itensVenda or {}
    obj.cliente = cliente or Cliente:new()
    return obj
end

function Venda:total()              -- este método sobrescreve de Totalizavel
    soma = 0
    for i = 1, #self.itensVenda do
        soma = soma + self.itensVenda[i]:total()
    end
    return soma
end

function Venda:setCliente(cliente)
    self.cliente = cliente
end

function Venda:getCliente()
    return self.cliente
end

function Venda:setNumero(numero)
    self.numero = numero
end

function Venda:getNumero()
    return self.numero
end

function Venda:setItensVenda(ItensVenda)
    self.itensVenda = ItensVenda
end

function Venda:getItensVenda()
    return self.itensVenda
end

function Venda:setData(data)
    self.data = data
end

function Venda:getData()
    return self.data
end

function Venda:getProdutos()
    local produtos = ""
    for i, itemVenda in pairs(self.itensVenda) do
        produtos = produtos .. itemVenda:getQuantidade() .. " x " .. itemVenda:getProduto():getNome() .. " de R$" .. itemVenda:getValor()  ..", "
    end
    return produtos
end

function Venda:toString()
    return "Código: " .. self.numero .. ", Cliente: " .. self.cliente:getNome() .. ", Valor: R$" .. self:total() .. ", Data: " .. self.data .. ", Itens: " .. self:getProdutos()
end

