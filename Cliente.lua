require "Pessoa"
Cliente = Pessoa:new()

function Cliente:new(nome, endereco, rg, dataNascimento)
    obj = Pessoa:new(nome, endereco)
    setmetatable(obj, self)
    self.__index = self
    obj.rg = rg or ""
    obj.dataNascimento = dataNascimento or ""
    return obj
end

function Cliente:setRg(rg)
    self.rg = rg
end

function Cliente:setDataNascimento(data)
    self.dataNascimento = data
end

function Cliente:getRg()
    return self.rg
end

function Cliente:getDataNascimento()
    return self.dataNascimento
end

function Cliente:toString()
    return "RG: " .. self.rg .. ", Nome: " .. self.nome .. ", Endereço: " .. self.endereco .. ", Nascimento: " .. self.dataNascimento
end
