require "Cliente"
require "Produto"
require "ItemVenda"
require "Venda"
require "Database"
require "MenuCliente"
require "MenuProduto"
require "MenuVenda"
require "ControladoraCliente"
require "ControladoraProduto"
require "ControladoraVenda"

function manipulaMenuItem(menuItem, controladora)
    local opcao = 1
    while opcao ~= 9 do
        opcao = menuItem:exibeMenuItem()
        if opcao == 1 then
            controladora:listar(menuItem)
        elseif opcao == 2 then
            controladora:cadastrar(menuItem)
        elseif opcao == 3 then
            controladora:remover(menuItem)
        elseif opcao == 4 then
            controladora:editar(menuItem)
        end
    end
end

Database:init()                                    -- chamar isso apenas uma vez
menuPrincipal = Menu:new()
menuCliente = MenuCliente:new()
menuProduto = MenuProduto:new()
menuVenda = MenuVenda:new()
controladoraCliente = ControladoraCliente:new()
controladoraProduto = ControladoraProduto:new()
controladoraVenda = ControladoraVenda:new()

opcao = 1
while opcao ~= 9 do
    opcao = menuPrincipal:exibeMenuInicial()
    if opcao == 1 then
        manipulaMenuItem(menuProduto, controladoraProduto)
    elseif opcao == 2 then
        manipulaMenuItem(menuCliente, controladoraCliente)
    elseif opcao == 3 then
        manipulaMenuItem(menuVenda, controladoraVenda)
    end
end

