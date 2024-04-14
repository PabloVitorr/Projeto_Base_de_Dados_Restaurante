-- empresa
CALL cadastro_empresa ('RESTAURANTE BIT', 'RESTAURANTE BITE LTDA', '79707800000105', '919396900821');

-- cargo
CALL cadastro_cargo ('SOMMELIER');

-- pessoa
CALL cadastro_pessoa ('Thomas', 'Anderson', '48067614865', 'thomas.anderson@email.com', '14921751047', 1);

-- usuario
CALL cadastro_usuario ('neo', 'matrix', 1, 1);

-- pais
CALL cadastro_pais ('Brasil');

-- estado
CALL cadastro_estado ('São Paulo', 'SP', 1);

-- cidade
CALL cadastro_cidade ('São Paulo', 1)

-- bairro
CALL cadastro_bairro ('Horizon Heights', 1);

-- logradouro
CALL cadastro_logradouro ('Rua das Amoreiras', '54786239', 1); 

-- endereco pessoa
CALL cadastro_endereco_pessoa ('Casa 01', '45', 1, 1);

-- endereco empresa
CALL cadastro_endereco_empresa ('Bloco 15', '200', 1, 1);

-- mesa
CALL cadastro_mesa ('01', 1);

-- produto
CALL cadastro_produto('9002490243944', 'ENERGETICO RED BULL ENERGY DRINK 250ML', 7.99);

-- estoque 'inventario/contagem'
CALL inventario_produto_estoque(0, 1);

-- nota fiscal compra
CALL recebimento_nota_fiscal_compra (84629, 1, 63.92, '01-10-2024', 2, 2);

-- produto nota fiscal compra
CALL recebimento_produto_nota_fiscal_compra (1, 7.99, 0.00, 7.99, 1, 1);

-- venda 
