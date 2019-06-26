require "Menu"
MenuVenda = Menu:new()

function MenuVenda:new()
    obj = Menu:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function MenuVenda:inputRg()
    io.write("      Digite o RG do cliente que efetuou a compra: ")
    local rg = io.read()
    if #rg > 0 and #rg <9 then
        return rg
    else
        print("\n      RG Inválido!\n")
        return self:inputRg()
    end
end

function MenuVenda:inputData()
    io.write("      Digite a data da venda (Ex.: 01/01/1970): ")
    local data = io.read()
    if #data == 10 then
        if string.sub(data, 3, 3) == '/' and string.sub(data, 6, 6) == '/' then 
            return data
        else
            print("\n      Data Inválida!\n")
            return self:inputData()
        end
    else
        print("\n      Data Inválida!\n")
        return self:inputData()
    end
end


function MenuVenda:inputQuantidadeItensDistintos()
    local status, quantidade = pcall(
        function()
            io.write("      Digite a quantidade de produtos distintos envolvidos na venda: ")
            quantidade = io.read() + 0
            return quantidade
        end
    )
    if status then
        return quantidade
    else
        print("\n       Quantidade Inválida!\n")
        return self:inputQuantidade()
    end
end

function MenuVenda:inputQuantidade()
    local status, quantidade = pcall(
        function()
            io.write("        Digite a quantidade referente à este produto: ")
            quantidade = io.read() + 0
            return quantidade
        end
    )
    if status then
        return quantidade
    else
        print("\n       Quantidade Inválida!\n")
        return self:inputQuantidade()
    end
end

function MenuVenda:inputCodigoVenda()
    local status, codigo = pcall(
        function()
            io.write("        Digite o código do produto: ")
            codigo = io.read() + 0
            return codigo
        end
    )
    if status then
        return codigo
    else
        print("\n       Código Inválida!\n")
        return self:inputCodigoVenda()
    end
end

function MenuVenda:inputCadastro()
    data = self:inputData()
    quantidade = self:inputQuantidadeItensDistintos()
    codigoVenda = {}
    quantidadeVenda = {}
    for i = 1, quantidade do
        codigoVenda[i] = self:inputCodigoVenda()
        quantidadeVenda[i] = self:inputQuantidade()
    end
    return data, codigoVenda, quantidadeVenda
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

function Menu:erroCodNaoCadastrado()
    print("\n      RG não Cadastrado!\n")
end