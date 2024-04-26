-- empresa
CREATE TABLE IF NOT EXISTS public.empresa (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'A',
	nomefantasia VARCHAR(255) NOT NULL,
	razaosocial VARCHAR(255) NOT NULL,
	cnpj VARCHAR(14) NOT NULL,
	inscricaoestadual VARCHAR(15)
);
-- SELECT * FROM empresa;

-- pessoa
CREATE TABLE IF NOT EXISTS public.pessoa (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL,
	sobrenome VARCHAR(100),
	cpf VARCHAR(11),
	email VARCHAR(100),
	telefone VARCHAR(20),
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL
);
-- SELECT * FROM pessoa;

-- cargo
CREATE TABLE IF NOT EXISTS public.cargo (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL
);
-- SELECT * FROM cargo;

-- usuario
CREATE TABLE IF NOT EXISTS public.usuario (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'A' NOT NULL,
	login VARCHAR(255) NOT NULL,
	senha VARCHAR(255) NOT NULL,
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL,
	pessoaid BIGINT UNIQUE NOT NULL,
	empresaid BIGINT NOT NULL,
	cargoid BIGINT NOT NULL
);
-- SELECT * FROM usuario;

-- endereco
CREATE TABLE IF NOT EXISTS public.endereco (
	id BIGSERIAL PRIMARY KEY,
	complemento VARCHAR(100),
	numero VARCHAR(20),
	pessoaid BIGINT UNIQUE,
	empresaid BIGINT UNIQUE,
	logradouroid BIGINT NOT NULL
);
-- SELECT * FROM endereco;

-- logradouro	
CREATE TABLE IF NOT EXISTS public.logradouro (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL,
	cep VARCHAR(8) NOT NULL,
	bairroid BIGINT NOT NULL
);
-- SELECT * FROM logradouro;

-- bairro
CREATE TABLE IF NOT EXISTS public.bairro (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL,
	cidadeid BIGINT NOT NULL
);
-- SELECT * FROM bairro;

-- cidade
CREATE TABLE IF NOT EXISTS public.cidade (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL,
	estadoid BIGINT NOT null
);
-- SELECT * FROM cidade;

-- estado
CREATE TABLE IF NOT EXISTS public.estado (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL,
	sigla CHAR(2) NOT NULL,
	paisid BIGINT NOT NULL
);
-- SELECT * FROM estado;

-- pais
CREATE TABLE IF NOT EXISTS public.pais (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL
);
-- SELECT * FROM pais;

-- mesa
CREATE TABLE IF NOT EXISTS public.mesa (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	identificacao VARCHAR(20) NOT NULL, 
	status CHAR(1) DEFAULT 'A' NOT NULL,
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL,
	empresaid BIGINT NOT NULL
);
-- SELECT * FROM mesa;

-- venda
CREATE TABLE IF NOT EXISTS public.venda (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'F' NOT NULL,
	valortotal NUMERIC(15,4) NOT NULL,
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL,
	mesaid BIGINT NOT NULL,
	usuarioid BIGINT NOT NULL,
	pessoaid BIGINT
);
-- SELECT * FROM venda;

-- produtovenda
CREATE TABLE IF NOT EXISTS public.produtovenda (
	id BIGSERIAL PRIMARY KEY,
	valorunitario NUMERIC(15,4) NOT NULL,
	quantidade BIGINT NOT NULL,
	desconto NUMERIC(15,4) NOT NULL,
	valortotal NUMERIC(15,4) NOT NULL,
	vendaid BIGINT NOT NULL,
	produtoid BIGINT NOT NULL
);
-- SELECT * FROM produtovenda;

-- comissao
CREATE TABLE IF NOT EXISTS public.comissao (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'D' NOT NULL,
	valor NUMERIC(15,4) NOT NULL,
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL,
	usuarioid BIGINT NOT NULL,
	vendaid BIGINT UNIQUE NOT NULL 
);
SELECT * FROM comissao;

-- produto
CREATE TABLE IF NOT EXISTS public.produto (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'A' NOT NULL,
	codigobarras VARCHAR(14),
	descricao VARCHAR(100) NOT NULL,
	valorvenda NUMERIC(15,4) NOT NULL,
	valorcusto NUMERIC(15,4) NOT NULL,
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL
);
-- SELECT * FROM produto;

-- estoque	
CREATE TABLE IF NOT EXISTS public.estoque (
	id BIGSERIAL PRIMARY KEY,
	quantidadeestoque BIGINT NOT NULL,
	produtoid BIGINT UNIQUE NOT NULL
);
-- SELECT * FROM estoque;

-- notafiscalcompra
CREATE TABLE IF NOT EXISTS public.notafiscalcompra (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'R' NOT NULL,
	numero BIGINT NOT NULL,
	serie INT NOT NULL,
	valortotal NUMERIC(15,4) NOT NULL,
	dataemissao DATE NOT NULL,
	datahorarecebimento TIMESTAMP WITH TIME ZONE NOT NULL,
	empresaid BIGINT NOT NULL,
	usuarioid BIGINT NOT NULL
);
-- SELECT * FROM notafiscalcompra;

-- produtonotafiscalcompra	
CREATE TABLE IF NOT EXISTS public.produtonotafiscalcompra (
	id BIGSERIAL PRIMARY KEY,
	quantidade BIGINT NOT NULL,
	valorunitario NUMERIC(15,4) NOT NULL,
	desconto NUMERIC(15,4) NOT NULL,
	valortotal NUMERIC(15,4) NOT NULL,
	produtoid BIGINT NOT NULL,
	notafiscalcompraid BIGINT NOT null
);