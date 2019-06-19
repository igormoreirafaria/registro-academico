require "Produto"
require "Totalizavel"
ItemVenda = Totalizavel:new()

function ItemVenda:new(produto, quantidade)
    obj = Totalizavel:new()
    setmetatable(obj, self)
    self.__index = self
    obj.produto = produto or Produto:new()
    obj.quantidade = quantidade or 0
    obj.valor = produto:getValor()
    return obj
end

function ItemVenda:total()                             -- este método sobrescreve de Totalizavel
    return self.valor * self.quantidade
end
