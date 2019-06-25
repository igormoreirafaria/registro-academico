require "Menu"
MenuProduto = Menu:new()

function MenuProduto:new()
    obj = Menu:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function MenuProduto:inputCadastro()
    local status, res1, res2 = pcall(
        function()
           io.write("     Digite o nome do produto: ")
           nome = io.read()
           io.write("     Digite o valor do produto: ")
           str = io.read()
           str, n = str:gsub(",",".")       -- se existir "," a troca por .
           valor = str + 0
           return nome, valor
        end
    )
    if status then
        return res1, res2
    else
        print("     Valor inválido! Por favor, informe os dados novamente!\n")
        return self:inputCadastro()
    end
end

function MenuProduto:inputEdicao()
    local status, res1 = pcall(
        function()
            io.write("\n     Digite o código do produto a ser alterado: ")
            return io.read() + 0
        end
    )
    if status then
        return res1
    else
        print("     Código inválido!\n")
        return self:inputRemover()
    end
end

function MenuProduto:inputRemover()
    local status, res1 = pcall(
        function()
            io.write("\n     Digite o código referente ao produto que deseja remover: ")
            return io.read() + 0
        end
    )
    if status then
        return res1
    else
        print("     Código inválido!\n")
        return self:inputRemover()
    end
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
