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

--- Funções que removem elementos das listas ----

function Database:removeProduto(id)
    for i = 1,#self.produtos do
        if self.produtos[i]:getCodigo() == id then
            table.remove(self.produtos, i)
            break
        end
    end
end

function Database:removeCliente(rg)
    for i = 1,#self.clientes do
        if self.clientes[i]:getRg() == rg then
            table.remove(self.clientes, i)
            break
        end
    end
end

function Database:removeVenda(id)
    for i = 1,#self.vendas do
        if self.vendas[i]:getNumero() == id then
            table.remove(self.vendas, i)
            break
        end
    end
end

--- Funções que editam elementos das listas ----

function Database:editProduto(id, nome, valor)
    for i = 1,#self.produtos do
        if self.produtos[i]:getCodigo() == id then
            self.produtos[i]:setNome(nome)
            self.produtos[i]:setValor(valor) 
        end
    end
end

function Database:editCliente(nome, endereco, rg, data)
    for i = 1,#self.clientes do
        if self.clientes[i]:getRg() == rg then
            self.clientes[i]:setNome(nome)
            self.clientes[i]:setEndereco(endereco)
            self.clientes[i]:setDataNascimento(data)
        end
    end
end

function Database:editVenda(id, data, itensVenda, cliente)
    for i = 1,#self.vendas do
        if self.vendas[i]:getNumero() == id then
            self.vendas[i]:setData(data)
            self.vendas[i]:setCliente(cliente)
            self.vendas[i]:setItensVenda(itensVenda)
        end
    end
end