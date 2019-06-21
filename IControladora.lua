IControladora = {}

function IControladora:new()
    obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function IControladora:cadastrar(menu) end
function IControladora:editar(menu) end
function IControladora:listar(menu) end
function IControladora:remover(menu) end

--[[ isso aqui são só exemplos de como manipular os modelos REMOVER DEPOIS

Database:addCliente( Cliente:new("Júlio", "Rua André Belo", "MG123456", "01/01/1900") )
Database:addCliente( Cliente:new("Pedro", "Rua Tal", "MG88856", "10/01/1900") )

Database:addProduto( Produto:new(1, "Biscoito", 10.50) )
Database:addProduto( Produto:new(2, "Suco", 2.50) )

itensVenda = {}
table.insert(itensVenda, ItemVenda:new(Database:getProduto(1), 3))  -- 3 biscoitos
table.insert(itensVenda, ItemVenda:new(Database:getProduto(2), 1))  -- 1 suco

-- venda de 3 biscoitos e 1 suco para Pedro
Database:addVenda(Venda:new(1, "19/06/2019", itensVenda, Database:getCliente("MG88856")))

itensVenda = {}
table.insert(itensVenda, ItemVenda:new(Database:getProduto(1), 1))  -- 1 biscoito
table.insert(itensVenda, ItemVenda:new(Database:getProduto(2), 10))  -- 10 sucos

-- venda de 1 biscoito e 10 sucos para Júlio
Database:addVenda(Venda:new(2, "20/06/2019", itensVenda, Database:getCliente("MG123456")))

print("Preço total da Venda para", Database:getVenda(1):getCliente():getNome(), ":", Database:getVenda(1):total())
print("Preço total da Venda para", Database:getVenda(2):getCliente():getNome(), ":", Database:getVenda(2):total())

--]]
