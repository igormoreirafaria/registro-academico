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

function MenuProduto:listaItens(itens)
    print("\nProdutos:")
    for i = 1,#itens do
        io.write("   Nome: ", itens[i]:getNome(), ", Código: ", itens[i]:getCodigo(), ", Valor: R$", itens[i]:getValor(), "\n")
    end
end

function MenuProduto:inputCadastroEdicao()
    io.write("\nDigite o código do produto: ")
    codigo = tonumber(io.read())
    io.write("Digite o nome do produto: ")
    nome = io.read()
    io.write("Digite o valor do produto: ")
    valor = tonumber(io.read())
    return codigo, nome, valor
end

function MenuProduto:inputRemover()
    io.write("\nDigite o código referente ao produto que deseja remover: ")
    return tonumber(io.read())
end