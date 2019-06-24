require "IControladora"
require "Cliente"

ControladoraCliente = IControladora:new()

function ControladoraCliente:new()
    obj = IControladora:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function ControladoraCliente:cadastrar(menu)
    novoCliente = Cliente:new(menu:inputCadastroEdicao())   
    if Database:getCliente(novoCliente:getRg()) == nil then
        Database:addCliente(novoCliente)
    else
        print("\nUm ciente com o mesmo rg já existe. Tente inserir este ciente com um rg diferente!")
    end
end

function ControladoraCliente:editar(menu)
    Database:editCliente(menu:inputCadastroEdicao())
end

function ControladoraCliente:remover(menu)
    Database:removeCliente(menu:inputRemover())
end

function ControladoraCliente:listar(menu)
    menu:listaItens(Database:getClientes())
end
