require "Cliente"
require "Produto"
require "ItemVenda"
require "Venda"

julio = Cliente:new("Júlio", "Rua André Belo", "MG123456", "01/01/1900")
pedro = Cliente:new("Pedro", "Rua Tal", "MG88856", "10/01/1900")
biscoito = Produto:new(1, "Biscoito", 10.50)
suco = Produto:new(2, "Suco", 2.50)

itensVenda = {}
itensVenda[1] = ItemVenda:new(biscoito, 4)
itensVenda[2] = ItemVenda:new(suco, 1)

venda = Venda:new(1, "19/06/2019", itensVenda, julio)

print("Preço total da Venda para", venda:getCliente():getNome(), ":", venda:total())
