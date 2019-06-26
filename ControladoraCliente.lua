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
    rg = menu:inputRg()
    if Database:getCliente(rg) == nil then
        Database:addCliente(Cliente:new(rg, menu:inputCadastroEdicao()))
        menu:sucesso()
    else
        menu:erroRgCadastrado()
        self:cadastrar(menu)
    end
end

function ControladoraCliente:editar(menu)
    rg = menu:inputRg()
    if Database:getCliente(rg) ~= nil then
        Database:editCliente(rg,menu:inputCadastroEdicao())
        menu:sucesso()
    else
        menu:erroRgNaoCadastrado()
        self:editar(menu)
    end
end

function ControladoraCliente:remover(menu)
    rg = menu:inputRemover()
    if Database:getCliente(rg) ~= nil then
        Database:removeCliente(rg)
        menu:sucesso()
    else
        menu:erroRg()
        self:remover(menu)
    end
end

function ControladoraCliente:listar(menu)
    menu:listaItens(Database:getClientes())
end
