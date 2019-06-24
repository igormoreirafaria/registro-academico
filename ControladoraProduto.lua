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
    novoProduto = Produto:new(menu:inputCadastroEdicao())
    flag = false
    produtos = Database:getProdutos()
    
    if produtos ~= nil then
        for key, produto in pairs(produtos) do
            if produto:getCodigo() == novoProduto:getCodigo() then
                flag = true
                break;
            end
        end
        if flag == true then
            print("\nUm produto com o mesmo codigo ja existe. Tente um codigo diferente.")
        else
            Database:addProduto(novoProduto)
        end
    else
        Database:addProduto(novoProduto)
    end
end

function ControladoraProduto:editar(menu)
    Database:editProduto(menu:inputCadastroEdicao())
end

function ControladoraProduto:remover(menu)
    Database:removeProduto(menu:inputRemover())
end

function ControladoraProduto:listar(menu)
    menu:listaItens(Database:getProdutos())
end
