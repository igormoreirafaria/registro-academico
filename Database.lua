require "Cliente"
require "Produto"
require "Venda"

Database = {clientes, produtos, vendas}

function Database:init()                    -- todos os atributos pertencem a tabela
    self.__index = self
    self.clientes = {}
    self.produtos = {}
    self.vendas = {}
    self.produtosId = 0
    self.vendasId = 0
end

-------------- Funções de inserção ----------------

function Database:addCliente(cliente)
    table.insert(self.clientes, cliente)
end

function Database:addProduto(produto)
    self.produtosId = self.produtosId + 1
    produto:setCodigo(self.produtosId)
    table.insert(self.produtos, produto)
end

function Database:addVenda(venda)
    self.vendasId = self.vendasId + 1
    venda:setNumero(self.vendasId)
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
            return true
        end
    end
    return false
end

function Database:removeCliente(rg)
    for i = 1,#self.clientes do
        if self.clientes[i]:getRg() == rg then
            table.remove(self.clientes, i)
            return true
        end
    end
    return false
end

function Database:removeVenda(id)
    for i = 1,#self.vendas do
        if self.vendas[i]:getNumero() == id then
            table.remove(self.vendas, i)
            return true
        end
    end
    return false
end

--- Funções que editam elementos das listas ----

function Database:editProduto(id, nome, valor)
    for i = 1,#self.produtos do
        if self.produtos[i]:getCodigo() == id then
            self.produtos[i]:setNome(nome)
            self.produtos[i]:setValor(valor)
            break
        end
    end
end

function Database:editCliente(rg, nome, endereco, data)
    for i = 1,#self.clientes do
        if self.clientes[i]:getRg() == rg then
            self.clientes[i]:setNome(nome)
            self.clientes[i]:setEndereco(endereco)
            self.clientes[i]:setDataNascimento(data)
            break
        end
    end
end

function Database:editVenda(id, data, itensVenda, cliente)
    for i = 1,#self.vendas do
        if self.vendas[i]:getNumero() == id then
            self.vendas[i]:setData(data)
            self.vendas[i]:setCliente(cliente)
            self.vendas[i]:setItensVenda(itensVenda)
            break
        end
    end
end
