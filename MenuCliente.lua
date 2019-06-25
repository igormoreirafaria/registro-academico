require "Menu"
MenuCliente = Menu:new()

function MenuCliente:new()
    obj = Menu:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function MenuCliente:printTextoListar()
    print("listar os clientes")
end

function MenuCliente:printTextoCadastrar()
    print("cadastrar um cliente")
end

function MenuCliente:printTextoRemover()
    print("remover um cliente")
end

function MenuCliente:printTextoEditar()
    print("editar um cliente")
end

function MenuCliente:listaItens(itens)
    print("\nClientes:")
    for i = 1,#itens do
        io.write("   Nome: ", itens[i]:getNome(), ", RG: ", itens[i]:getRg(), ", Endereço: ", itens[i]:getEndereco(), ", Data de nascimento: ", itens[i]:getDataNascimento(), "\n")
    end
end

function MenuCliente:inputCadastroEdicao()
    ------ Fiz essa pra vocês verem se fazer esse tratamento fica melhor
    -------aqui no MenuCliente onde é feita os io.read() ou se fica melhor
    -------no ControladorCliente(atual)
    -- local status, nome, endereco, rg, data = pcall(
    --     function()
    --         io.write("\nDigite o RG do cliente: ")
    --         rg = io.read()
    --         io.write("Digite o nome do cliente: ")
    --         nome = io.read()
    --         io.write("Digite o endereço do cliente: ")
    --         endereco = io.read()
    --         io.write("Digite a data de nascimento do cliente: ")
    --         data = io.read()
    --         return nome, endereco, rg, data
    --     end
    -- )
    -- if status then
    --     return nome, endereco, rg, data
    -- else
    --     print("ERRO: " .. nome)
    -- end
    io.write("\nDigite o RG do cliente: ")
    rg = io.read()
    io.write("Digite o nome do cliente: ")
    nome = io.read()
    io.write("Digite o endereço do cliente: ")
    endereco = io.read()
    io.write("Digite a data de nascimento do cliente: ")
    data = io.read()
    return nome, endereco, rg, data
end

function MenuCliente:inputRemover()
    io.write("\nDigite o RG referente ao cliente que deseja remover: ")
    return io.read()
end