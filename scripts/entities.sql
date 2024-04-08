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
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL,
	cargoid BIGINT
);

-- cargo
CREATE TABLE IF NOT EXISTS public.cargo (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL
);

-- usuario
CREATE TABLE IF NOT EXISTS public.usuario (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'A' NOT NULL,
	login VARCHAR(255) NOT NULL,
	senha VARCHAR(255) NOT NULL,
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL,
	pessoaid BIGINT UNIQUE,
	empresaid BIGINT
);

-- endereco
CREATE TABLE IF NOT EXISTS public.endereco (
	id BIGSERIAL PRIMARY KEY,
	complemento VARCHAR(100),
	numero VARCHAR(20),
	pessoaid BIGINT UNIQUE,
	empresaid BIGINT UNIQUE,
	logradouroid BIGINT
);

-- logradouro	
CREATE TABLE IF NOT EXISTS public.logradouro (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL,
	cep VARCHAR(8) NOT NULL,
	bairroid BIGINT
);

-- bairro
CREATE TABLE IF NOT EXISTS public.bairro (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL,
	cidadeid BIGINT
);

-- cidade
CREATE TABLE IF NOT EXISTS public.cidade (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL,
	estadoid BIGINT
);

-- estado
CREATE TABLE IF NOT EXISTS public.estado (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL,
	sigla CHAR(2) NOT NULL,
	paisid BIGINT
);

-- pais
CREATE TABLE IF NOT EXISTS public.pais (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'A' NOT NULL,
	nome VARCHAR(100) NOT NULL
);

-- mesa
CREATE TABLE IF NOT EXISTS public.mesa (
	id BIGSERIAL PRIMARY KEY,
	identificacao VARCHAR(20) NOT NULL, 
	status CHAR(1) DEFAULT 'A' NOT NULL,
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL,
	empresaid BIGINT
);

-- venda
CREATE TABLE IF NOT EXISTS public.venda (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'F' NOT NULL,
	valortotal NUMERIC(15,4) NOT NULL,
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL,
	mesaid BIGINT,
	usuarioid BIGINT,
	pessoaid BIGINT
);

-- itemvenda
CREATE TABLE IF NOT EXISTS public.itemvenda (
	id BIGSERIAL PRIMARY KEY,
	valorunitario NUMERIC(15,4) NOT NULL,
	quantidade BIGINT NOT NULL,
	desconto NUMERIC(15,4) NOT NULL,
	valortotal NUMERIC(15,4) NOT NULL,
	vendaid BIGINT,
	produtoid BIGINT
);

-- comissao
CREATE TABLE IF NOT EXISTS public.comissao (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'D' NOT NULL,
	valor NUMERIC(15,4) NOT NULL,
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL,
	usuarioid BIGINT,
	vendaid BIGINT UNIQUE
);

-- produto
CREATE TABLE IF NOT EXISTS public.produto (
	id BIGSERIAL PRIMARY KEY,
	codigointerno BIGINT DEFAULT nextval('codigointerno_seq'),
	status CHAR(1) DEFAULT 'A' NOT NULL,
	codigobarras VARCHAR(14) NOT NULL,
	descricao VARCHAR(100) NOT NULL,
	valor NUMERIC(15,2) NOT NULL,
	datahoracriacao TIMESTAMP WITH TIME ZONE NOT NULL
);

-- estoque	
CREATE TABLE IF NOT EXISTS public.estoque (
	id BIGSERIAL PRIMARY KEY,
	quantidadeestoque BIGINT NOT NULL,
	produtoid BIGINT UNIQUE
);

-- notafiscalcompra
CREATE TABLE IF NOT EXISTS public.notafiscalcompra (
	id BIGSERIAL PRIMARY KEY,
	status CHAR(1) DEFAULT 'R' NOT NULL,
	numero BIGINT NOT NULL,
	serie INT NOT NULL,
	valortotal NUMERIC(15,4) NOT NULL,
	dataemissao DATE NOT NULL,
	datahorarecebimento TIMESTAMP WITH TIME ZONE NOT NULL,
	empresaid BIGINT,
	usuarioid BIGINT
);

-- produtonotafiscalcompra	
CREATE TABLE IF NOT EXISTS public.produtonotafiscalcompra (
	id BIGSERIAL PRIMARY KEY,
	quantidade BIGINT NOT NULL,
	valorunitario NUMERIC(15,4) NOT NULL,
	desconto NUMERIC(15,4) NOT NULL,
	valortotal NUMERIC(15,4) NOT NULL,
	produtoid BIGINT,
	notafiscalcompraid BIGINT
);