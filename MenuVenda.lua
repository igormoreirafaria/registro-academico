require "Menu"
MenuVenda = Menu:new()

function MenuVenda:new()
    obj = Menu:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
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

function MenuVenda:listaItens(itens)
    print("\nVendas:")
    for i = 1,#itens do
        io.write("   Número: ", itens[i]:getNumero(), ", Data: ", itens[i]:getData(), ", Cliente: ", itens[i]:getCliente():getNome(), ", Itens: ")
        for j = 1,#itensVenda do
            io.write(itensVenda[j]:getProduto():getNome(), "(", itensVenda[j]:getQuantidade(), ")\n")
        end
    end
end

function MenuVenda:inputCadastroEdicao()
    io.write("\nDigite o número da venda: ")
    numero = io.read()
    io.write("Digite a data da venda: ")
    data = io.read()
    io.write("Digite o RG do cliente que efetuou a compra: ")
    rg = io.read()
    io.write("Digite a quantidade de produtos distintos envolvidos na venda: ")
    quantidade = tonumber(io.read())
    itensVenda = {}
    for i = 1, quantidade do
        io.write("   Digite o código do produto: ")
        codigo = tonumber(io.read())
        io.write("   Digite a quantidade referente à este produto: ")
        quant = tonumber(io.read())
    end
    return nome, endereco, rg, data
end

function MenuVenda:inputRemover()
    io.write("\nDigite o RG referente ao cliente que deseja remover: ")
    return io.read()
end