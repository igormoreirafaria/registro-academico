require "Menu"
MenuCliente = Menu:new()

function MenuCliente:new()
    obj = Menu:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function MenuCliente:inputRg()
    io.write("      Digite o RG do cliente: ")
    local rg = io.read()
    if #rg > 0 and #rg <9 then
        return rg
    else
        print("\n      RG Inválido!\n")
        return self:inputRg()
    end
end

function MenuCliente:inputNome()
    io.write("      Digite o nome do cliente: ")
    local nome = io.read()
    if #nome > 0 and #nome < 32 then
        return nome
    else
        print("\n      Nome inválido!\n")
        return self:inputNome()
    end
end

function MenuCliente:inputEndereco()
    io.write("      Digite o endereço do cliente: ")
    local endereco = io.read()
    if #endereco > 0 and #endereco < 32 then
        return endereco
    else
        print("\n      Endereço Inválido!\n")
        return self:inputEndereco()
    end
end

function MenuCliente:inputData()
    io.write("      Digite a data de nascimento do cliente (Ex.: 01/01/1970): ")
    local nascimento = io.read()
    if #nascimento == 10 then
        if string.sub(nascimento, 3, 3) == '/' and string.sub(nascimento, 6, 6) == '/' then 
            return nascimento
        else
            print("\n      Data Inválida!\n")
            return self:inputData()
        end
    else
        print("\n      Data Inválida!\n")
        return self:inputData()
    end
end

function MenuCliente:inputCadastroEdicao()
    return self:inputNome(), self:inputEndereco(), self:inputData()
end

function MenuCliente:inputRemover()
    io.write("      Digite o RG referente ao cliente que deseja remover: ")
    return io.read()
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

function Menu:erroRgNaoCadastrado()
    print("\n      RG não Cadastrado!\n")
end

function Menu:erroRgCadastrado()
    print("\n      RG já Cadastrado!\n")
end