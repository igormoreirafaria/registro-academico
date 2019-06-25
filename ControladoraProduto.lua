require "IControladora"
require "Produto"

ControladoraProduto = IControladora:new()

function ControladoraProduto:new()
    obj = IControladora:new()
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function ControladoraProduto:cadastrar(menu)
    local status, res1, res2, res3 = pcall(
        function()
           res1, res2, res3 = menu:inputCadastro()
            return res1, res2, res3
        end
    )
    if status then
        Database:addProduto(Produto:new(res1, res2, res3))
    else
        print("ERRO: " .. res1)
    end
end

function ControladoraProduto:editar(menu)
    local status, res1, res2, res3 = pcall(
        function()
           res1, res2, res3 = menu:inputEdicao()
            return res1, res2, res3
        end
    )
    if status then
        if Database:getProduto(res1) == nil then
            print("\nCódigo de produto inválido. Produto não cadastrado.")
        else
            Database:editProduto(res1, res2, res3)
        end
    else
        print("ERRO: " .. res1)
    end
end

function ControladoraProduto:remover(menu)
    local status, res1 = pcall(
        function()
            res1 = menu:inputRemover()
            return res1
        end
    )
    if status then
        if Database:getProduto(res1) == nil then
            print("\nCódigo de produto inválido. Produto não cadastrado.")
        else  
            Database:removeProduto(res1)
        end
    else
        print("ERRO: " .. res1)
    end
end

function ControladoraProduto:listar(menu)
    menu:listaItens(Database:getProdutos())
end
