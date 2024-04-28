-- empresa
CALL cadastro_empresa ('RESTAURANTE BIT', 'RESTAURANTE BITE LTDA', '79707800000105', '919396900821');
CALL cadastro_empresa ('REFRESCOS FRESCOS', 'REFRESCOS FRESCOS LTDA', '00007800000105', '919390000821'); 
CALL cadastro_empresa ('TROPICAL DRINK', 'TROPICAL DRINK LTDA', '67693453000111', '964744987390'); 
-- SELECT * FROM empresa;

-- cargo
CALL cadastro_cargo ('SOMMELIER');
CALL cadastro_cargo ('GARÇOM');
CALL cadastro_cargo ('GERENTE');
CALL cadastro_cargo ('OPERADOR DE CAIXA');
CALL cadastro_cargo ('ESTOQUISTA');
-- SELECT * FROM cargo;

-- pessoa
CALL cadastro_pessoa ('Lucas', 'Santos', '12345678900', 'lucassantos@email.com', '11987654321');
CALL cadastro_pessoa ('Thiago', 'Oliveira', '98765432100', 'thiagooliveira@email.com', '11998765432');
CALL cadastro_pessoa ('Marina', 'Costa', '23456789000', 'marinacosta@email.com', '11987656789');
CALL cadastro_pessoa ('Rafael', 'Silva', '34567890100', 'rafaelsilva@email.com', '11987657890');
CALL cadastro_pessoa ('Bianca', 'Pereira', '45678901200', 'biancapereira@email.com', '11987658901');
CALL cadastro_pessoa ('Pedro', 'Souza', '56789012300', 'pedrosouza@email.com', '11987659012');
CALL cadastro_pessoa ('Isabela', 'Rodrigues', '67890123400', 'isabelarodrigues@email.com', '11987650123');
CALL cadastro_pessoa ('Bruno', 'Lima', '78901234500', 'brunolima@email.com', '11987659012');
CALL cadastro_pessoa ('Carolina', 'Castro', '89012345600', 'carolinacastro@email.com', '11987658901');
CALL cadastro_pessoa ('Diego', 'Almeida', '90123456700', 'diegoalmeida@email.com', '11987656789');
CALL cadastro_pessoa ('Laura', 'Martins', '01234567800', 'lauramartins@email.com', '11987655678');
-- SELECT * FROM pessoa;

-- usuario
CALL cadastro_usuario ('lucas-santos', 'matrix', 1, 1, 2);
CALL cadastro_usuario ('thiago-oliveira', 'matrix', 2, 1, 2);
CALL cadastro_usuario ('marina-costa', 'matrix', 3, 1, 2);
CALL cadastro_usuario ('rafael-silva', 'matrix', 4, 1, 2);
CALL cadastro_usuario ('bianca-pereira', 'matrix', 5, 1, 1);
CALL cadastro_usuario ('pedro-souza', 'matrix', 6, 1, 1);
CALL cadastro_usuario ('isabela-rodrigues', 'matrix', 7, 1, 3);
CALL cadastro_usuario ('bruno-lima', 'matrix', 8, 1, 4);
CALL cadastro_usuario ('carolina-castro', 'matrix', 9, 1, 4);
CALL cadastro_usuario ('diego-almeida', 'matrix', 10, 1, 5);
CALL cadastro_usuario ('laura-martins', 'matrix', 11, 1, 5);
-- SELECT * FROM usuario;

-- pais
CALL cadastro_pais ('Brasil');
-- SELECT * FROM pais;

-- estado
CALL cadastro_estado ('São Paulo', 'SP', 1);
-- SELECT * FROM estado;

-- cidade
CALL cadastro_cidade ('São Paulo', 1);
CALL cadastro_cidade ('Santo André', 1);
CALL cadastro_cidade ('Jundiaí', 1);
CALL cadastro_cidade ('Osasco', 1);
CALL cadastro_cidade ('Mogi das Cruzes', 1);
CALL cadastro_cidade ('Carapicuíba', 1);
CALL cadastro_cidade ('São José dos Campos', 1);
-- SELECT * FROM cidade;

-- bairro
CALL cadastro_bairro ('Mooca', 1);
CALL cadastro_bairro ('Conjunto Habitacional Brigadeiro Faria Lima', 1);
CALL cadastro_bairro ('Parque Gerassi', 2);
CALL cadastro_bairro ('Vila São Paulo', 3);
CALL cadastro_bairro ('Novo Osasco', 4);
CALL cadastro_bairro ('Villa Di Cesar', 5);
CALL cadastro_bairro ('Parque Jandaia', 6);
CALL cadastro_bairro ('Santana', 7);
-- SELECT * FROM bairro;

-- logradouro
CALL cadastro_logradouro ('Avenida Henry Ford', '03109901', 1); 
CALL cadastro_logradouro ('Rua Santo Antônio da Posse', '04840040', 2);
CALL cadastro_logradouro ('Praça Presidente Eurico Gaspar Dutra', '09120315', 3);
CALL cadastro_logradouro ('Praça Mmdc', '13203519', 4); 
CALL cadastro_logradouro ('Rua Pedro Ronda', '06142260', 5);
CALL cadastro_logradouro ('Rua Benedito Martins', '08830784', 6);
CALL cadastro_logradouro ('Rua Geraldo Soares Xavier', '06330130', 7);
CALL cadastro_logradouro ('Travessa Rodolfo Ferrianci', '12212002', 8);
-- SELECT * FROM logradouro;

-- endereco pessoa
CALL cadastro_endereco_pessoa (null, '25', 2, 2);
CALL cadastro_endereco_pessoa (NULL, '20', 3, 8);
CALL cadastro_endereco_pessoa ('Apartamento 204', '1000', 4, 7);
CALL cadastro_endereco_pessoa ('Apartamento 54', '103', 5, 6);
CALL cadastro_endereco_pessoa (NULL, '40', 6, 5);
CALL cadastro_endereco_pessoa ('Apartamento 154', '874', 9, 4);
CALL cadastro_endereco_pessoa (NULL, '100', 7, 3);
CALL cadastro_endereco_pessoa ('Casa 05', '30', 8, 2); 
CALL cadastro_endereco_pessoa (NULL, '34', 1, 5);
CALL cadastro_endereco_pessoa ('Apartamento 145', '874', 10, 4);
CALL cadastro_endereco_pessoa ('Apartamento 27', '874', 11, 4);
-- SELECT * FROM endereco;

-- endereco empresa
CALL cadastro_endereco_empresa ('Bloco 15', '200', 1, 1);
-- SELECT * FROM endereco;

-- mesa
CALL cadastro_mesa ('01', 1);
CALL cadastro_mesa ('02', 1);
CALL cadastro_mesa ('03', 1);
CALL cadastro_mesa ('04', 1);
CALL cadastro_mesa ('05', 1);
CALL cadastro_mesa ('06', 1);
CALL cadastro_mesa ('07', 1);
CALL cadastro_mesa ('08', 1);
CALL cadastro_mesa ('09', 1);
CALL cadastro_mesa ('10', 1);
CALL cadastro_mesa ('BALCÃO', 1);
CALL cadastro_mesa ('CAIXA', 1);
SELECT * FROM mesa;

-- produto
CALL cadastro_produto ('9002490243944', 'ENÉRGETICO RED BULL ENERGY DRINK 250ML', 11.99);
CALL cadastro_produto ('9002490266356', 'ENERGÉTICO RED BULL SUMMER EDITION SABOR FIGO E MAÇÃ 250ML', 11.99);
CALL cadastro_produto ('9002490247379', 'ENERGÉTICO RED BULL SUMMER EDITION SABOR MORANGO E PÊSSEGO 250ML', 11.99);
CALL cadastro_produto ('9002490243678', 'ENERGÉTICO RED BULL SUGAR FREE 250ML', 11.99);
CALL cadastro_produto ('9002490229160', 'ENERGÉTICO RED BULL TROPICAL EDITION SABOR FRUTAS TROPICAIS 250ML', 11.99);
CALL cadastro_produto ('9002490250270', 'ENERGÉTICO RED BULL SUMMER EDITION SABOR PITAYA 250ML', 11.99);
CALL cadastro_produto ('9002490240875', 'ENERGÉTICO RED BULL COCO EDITION SABOR COCO E AÇAÍ 250ML', 11.99);
CALL cadastro_produto ('9002490235192', 'ENERGÉTICO RED BULL AÇAÍ EDITION SABOR AÇAÍ 250ML', 11.99);

-- estoque 'inventario/contagem'
CALL inventario_produto_estoque(0, 1);
SELECT * FROM estoque;

-- nota fiscal compra
CALL recebimento_nota_fiscal_compra (84629, 1, 287.52, '10-01-2024', 2, 11);
SELECT * FROM notafiscalcompra;

-- nota fiscal compra
CALL recebimento_produto_nota_fiscal_compra (6, 5.99, 0.00, 35.94, 7, 1);
CALL recebimento_produto_nota_fiscal_compra (6, 5.99, 0.00, 35.94, 8, 1);
CALL recebimento_produto_nota_fiscal_compra (6, 5.99, 0.00, 35.94, 6, 1);
CALL recebimento_produto_nota_fiscal_compra (6, 5.99, 0.00, 35.94, 5, 1);
CALL recebimento_produto_nota_fiscal_compra (6, 5.99, 0.00, 35.94, 3, 1);
CALL recebimento_produto_nota_fiscal_compra (6, 5.99, 0.00, 35.94, 4, 1);
CALL recebimento_produto_nota_fiscal_compra (6, 5.99, 0.00, 35.94, 2, 1);
CALL recebimento_produto_nota_fiscal_compra (6, 5.99, 0.00, 35.94, 1, 1);
SELECT * FROM produtonotafiscalcompra;

-- venda 
CALL registro_venda (9.99, 35, 8, 12);
SELECT * FROM venda;

-- produto venda
CALL registro_produto_venda (9.99, 1, 0.00, 9.99, 1, 1);
SELECT * FROM produtovenda;