Produto = {codigo, nome, valor}

function Produto:new(codigo, nome, valor)
    obj = {}
    obj.codigo = codigo or 0
    obj.nome = nome or ""
    obj.valor = valor or 0
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Produto:setCodigo(codigo)
    self.codigo = codigo
end

function Produto:setNome(nome)
    self.nome = nome
end

function Produto:setValor(valor)
    self.valor = valor
end

function Produto:getCodigo()
    return self.codigo
end

function Produto:getNome()
    return self.nome
end

function Produto:getValor()
    return self.valor
end
