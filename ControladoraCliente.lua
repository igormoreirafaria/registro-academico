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
    local status, res1, res2, res3, res4 = pcall( 
        function() 
            res1, res2, res3, res4 = menu:inputCadastroEdicao() 
            return res1, res2, res3, res4 
        end
    )
    if status then
        novoCliente = Cliente:new(res1, res2, res3, res4)
        if Database:getCliente(novoCliente:getRg()) == nil then
            Database:addCliente(novoCliente)
        else
            print("\nUm ciente com o mesmo rg já existe. Tente inserir este ciente com um rg diferente!") 
        end
    else
        print("ERROR: " .. res1)
    end
end

function ControladoraCliente:editar(menu)
    local status, res1, res2, res3, res4 = pcall( 
        function() 
            res1, res2, res3, res4 = menu:inputCadastroEdicao() 
            return res1, res2, res3, res4 
        end
    )
    if status then
        if Database:getCliente(res3) == nil then
            print("\nEste Rg não é válido ou o cliente não foi cadastrado. Digite um Rg válido!")
        else
            Database:editCliente(res1,res2,res3,res4)
        end
    else
        print("ERROR: " .. res1)
    end
end

function ControladoraCliente:remover(menu)
    local status, res1 = pcall( 
        function() 
            res1 = menu:inputRemover() 
            return res1 
        end
    )
    if status then
        if Database:getCliente(res1) == nil then
            print("\nEste Rg não é válido ou o cliente não foi cadastrado. Digite um Rg válido!")
        else
            Database:removeCliente(res1)
        end
    else
        print("ERROR: " .. res1)
    end
end

function ControladoraCliente:listar(menu)
    menu:listaItens(Database:getClientes())
end
