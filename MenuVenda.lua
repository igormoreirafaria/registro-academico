require "Menu"
MenuVenda = Menu:new()

function MenuVenda:new()
    obj = Menu:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function MenuVenda:inputCadastro()
    local status, res1, res2, res3 = pcall(
        function()
            io.write("\n      Digite a data da venda: ")
            data = io.read()
            io.write("      Digite o RG do cliente que efetuou a compra: ")
            rg = io.read()
            io.write("      Digite a quantidade de produtos distintos envolvidos na venda: ")
            quantidade = io.read() + 0
            codigoVenda = {}
            quantidadeVenda = {}
            for i = 1, quantidade do
                io.write("        Digite o código do produto: ")
                codigoVenda[i] = io.read() + 0
                io.write("        Digite a quantidade referente à este produto: ")
                quantidadeVenda[i] = io.read() + 0
            end
           return data, codigoVenda, quantidadeVenda, rg
        end
    )
    if status then
        return res1, res2, res3
    else
        print("      Valor inválido! Por favor, informe os dados novamente!\n")
        return self:inputCadastro()
    end
end

function MenuVenda:inputEdicao()
    local status, res1 = pcall(
        function()
            io.write("\n      Digite o código da venda a ser alterada: ")
            return io.read() + 0
        end
    )
    if status then
        return res1
    else
        print("      Código inválido!\n")
        return self:inputEdicao()
    end
end

function MenuVenda:inputRemover()
    local status, res1 = pcall(
        function()
            io.write("\n      Digite o código referente à venda que deseja remover: ")
            return io.read() + 0
        end
    )
    if status then
        return res1
    else
        print("      Código inválido!\n")
        return self:inputRemover()
    end
end

function MenuVenda:printTextoListar()
    print("listar as vendas")
end

function MenuVenda:printTextoCadastrar()
    print("cadastrar uma venda")
end

function MenuVenda:printTextoRemover()
    print("remover uma venda")
end

function MenuVenda:printTextoEditar()
    print("editar uma venda")
end
