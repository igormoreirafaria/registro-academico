require "Cliente"
require "Produto"
require "Venda"

Database = {clientes, produtos, vendas}

function Database:init()                    -- todos os atributos pertencem a tabela
    self.__index = self
    self.clientes = {}
    self.produtos = {}
    self.vendas = {}
end

-------------- Funções de inserção ----------------

function Database:addCliente(cliente)
    table.insert(self.clientes, cliente)
end

function Database:addProduto(produto)
    table.insert(self.produtos, produto)
end

function Database:addVenda(venda)
    table.insert(self.vendas, venda)
end

--------- Funções que retornam listas ------------

function Database:getProdutos()
    return self.produtos
end

function Database:getClientes()
    return self.clientes
end

function Database:getVendas()
    return self.vendas
end

--- Funções que retornam elementos das listas ----

function Database:getProduto(id)
    for i = 1,#self.produtos do
        if self.produtos[i]:getCodigo() == id then
            return self.produtos[i]
        end
    end
    return nil
end

function Database:getCliente(rg)
    for i = 1,#self.clientes do
        if self.clientes[i]:getRg() == rg then
            return self.clientes[i]
        end
    end
    return nil
end

function Database:getVenda(id)
    for i = 1,#self.vendas do
        if self.vendas[i]:getNumero() == id then
            return self.vendas[i]
        end
    end
    return nil
end
