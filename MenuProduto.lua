require "Menu"
MenuProduto = Menu:new()

function MenuProduto:new()
    obj = Menu:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function MenuProduto:printTextoListar()
    print("listar os produtos")
end

function MenuProduto:printTextoCadastrar()
    print("cadastrar um produto")
end

function MenuProduto:printTextoRemover()
    print("remover um produto")
end

function MenuProduto:printTextoEditar()
    print("editar um produto")
end
