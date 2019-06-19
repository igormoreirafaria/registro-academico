require "Pessoa"
Cliente = Pessoa:new()

function Cliente:new(nome, endereco, rg, dataNacimento)
    obj = Pessoa:new(nome, endereco)
    setmetatable(obj, self)
    self.__index = self
    obj.rg = rg or ""
    obj.dataNacimento = dataNacimento or ""
    return obj
end

function Cliente:setRg(rg)
    self.rg = rg
end

function Cliente:setDataNacimento(data)
    self.dataNacimento = data
end

function Cliente:getRg()
    return self.rg
end

function Cliente:getDataNacimento()
    return self.dataNacimento
end
