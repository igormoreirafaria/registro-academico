Menu = {}

function Menu:new()
    obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Menu:exibeMenuInicial()
    print("\nDigite:")
    print("1 para acessar o menu de Produtos")
    print("2 para acessar o menu de Clientes")
    print("3 para acessar o menu de Vendas")
    print("9 para sair")
    io.write("Sua opção: ")
    opcao = tonumber(io.read())

    if opcao ~= 1 and opcao ~= 2 and opcao ~= 3 and opcao ~= 9 then
        io.write("Opção Inválida!\n\n")
        return self:exibeMenuInicial()
    else
        return opcao
    end
end

-- Estas 7 funções devem ser sobrescritas
function Menu:printTextoListar() end
function Menu:printTextoCadastrar() end
function Menu:printTextoRemover() end
function Menu:printTextoEditar() end
function Menu:listaItens(itens) end
function Menu:inputCadastroEdicao() end
function Menu:inputRemover() end

function Menu:exibeMenuItem()
    print("\nDigite:")
    io.write("   1 para ") self:printTextoListar()
    io.write("   2 para ") self:printTextoCadastrar()
    io.write("   3 para ") self:printTextoRemover()
    io.write("   4 para ") self:printTextoEditar()
    print("   9 para voltar ao menu anterior")
    io.write("Sua opção: ")
    local opcao = tonumber(io.read())

    if opcao ~= 1 and opcao ~= 2 and opcao ~= 3 and opcao ~= 4 and opcao ~= 9 then
        io.write("Opção Inválida!\n\n")
        return self:exibeMenuItem()
    else
        return opcao
    end
end
