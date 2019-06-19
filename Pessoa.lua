Pessoa = {nome, endereco}

function Pessoa:new(nome, endereco)
    obj = {}
    setmetatable(obj, self)
    self.__index = self
    obj.nome = nome or ""
    obj.endereco = endereco or ""
    return obj
end

function Pessoa:setNome(nome)
    self.nome = nome
end

function Pessoa:setEndereco(endereco)
    self.endereco = endereco
end

function Pessoa:getNome()
    return self.nome
end

function Pessoa:getEndereco()
    return self.endereco
end
