-- empresa --------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_empresa (
	IN p_nomefantasia VARCHAR(255), 
	IN p_razaosocial VARCHAR(255), 
	IN p_cnpj VARCHAR(14), 
	IN p_inscricaoestadual VARCHAR(15)
) LANGUAGE PLpgSQL AS 
$$
BEGIN
	INSERT INTO public.empresa (
    nomefantasia, 
    razaosocial, 
    cnpj, 
    inscricaoestadual
  ) 
  VALUES (
    p_nomefantasia, 
    p_razaosocial, 
    p_cnpj, 
    p_inscricaoestadual
  );
END;
$$;

-- cargo ----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_cargo (
	IN p_nome VARCHAR(100)
) LANGUAGE PLpgSQL AS
$$
BEGIN
	INSERT INTO public.cargo (nome) VALUES (p_nome);
END;
$$;

-- pessoa ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_pessoa (
	IN p_nome VARCHAR(100),
	IN p_sobrenome VARCHAR(100),
	IN p_cpf VARCHAR(11),
	IN p_email VARCHAR(100),
	IN p_telefone VARCHAR(20)
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.pessoa (
		nome,
		sobrenome,
		cpf,
		email,
		telefone,
		datahoracriacao
	) VALUES (
		p_nome,
		p_sobrenome,
		p_cpf,
		p_email,
		p_telefone,
		CURRENT_TIMESTAMP
	);
END;
$$;

-- usuario --------------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE PROCEDURE public.cadastro_usuario (
	IN p_login VARCHAR(255),
	IN p_senha VARCHAR(255),
	IN p_pessoaid BIGINT,
	IN p_empresaid BIGINT,
	IN p_cargoid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.usuario (
		login,
		senha,
		datahoracriacao,
		pessoaid,
		empresaid,
		cargoid
	) VALUES (
		p_login,
		crypt(p_senha, gen_salt('bf')),
		CURRENT_TIMESTAMP,
		p_pessoaid,
		p_empresaid,
		p_cargoid
	);
END;
$$;

-- pais -----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_pais (
	IN p_nome VARCHAR(100)
) LANGUAGE PLpgSQL AS 
$$
	BEGIN 
		INSERT INTO public.pais (nome) VALUES (p_nome);
	END;
$$;
 
-- estado ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_estado (
	IN p_nome VARCHAR(100),
	IN p_sigla CHAR(2),
	IN p_paisid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.estado (nome, sigla, paisid) VALUES (p_nome, p_sigla, p_paisid);
END;
$$;

-- cidade ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_cidade (
	IN p_nome VARCHAR(100),
	IN p_estadoid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.cidade (nome, estadoid) VALUES (p_nome, p_estadoid);
END;
$$;

-- bairro ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_bairro (
	IN p_nome VARCHAR(100),
	IN p_cidadeid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.bairro (nome, cidadeid) VALUES (p_nome, p_cidadeid);
END;
$$;

-- logradouro -----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_logradouro (
	IN p_nome VARCHAR(100),
	IN p_cep VARCHAR(20),
	IN p_bairroid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.logradouro (nome, cep, bairroid) VALUES (p_nome, p_cep, p_bairroid);
END;
$$;

-- endereco pessoa ------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_endereco_pessoa (
	IN p_complemento VARCHAR(100),
	IN p_numero	VARCHAR(20),
	IN p_pessoaid BIGINT,
	IN p_logradouroid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.endereco (
		complemento, 
		numero, 
		pessoaid, 
		logradouroid
	) VALUES (
		p_complemento,
		p_numero,
		p_pessoaid,
		p_logradouroid
	);
END;
$$;

-- endereco empresa -----------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_endereco_empresa (
	IN p_complemento VARCHAR(100),
	IN p_numero VARCHAR(20),
	IN p_empresaid BIGINT,
	IN p_logradouroid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.endereco (
		complemento,
		numero,
		empresaid,
		logradouroid
	) VALUES (
		p_complemento,
		p_numero,
		p_empresaid,
		p_logradouroid
	);
END;
$$;

-- mesa -----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_mesa (
	IN p_identificacao VARCHAR(20),
	IN p_empresaid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.mesa (identificacao, datahoracriacao, empresaid) VALUES (p_identificacao, CURRENT_TIMESTAMP, p_empresaid);
END;
$$;
 
-- produto --------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.cadastro_produto (
	IN p_codigobarras VARCHAR(14),
	IN p_descricao VARCHAR(100),
	IN p_valor NUMERIC(15,4)) 
LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.produto (
		codigobarras,
		descricao,
		valor,
		datahoracriacao) 
	VALUES (
		p_codigobarras,
		p_descricao,
		p_valor,
		CURRENT_TIMESTAMP);
END;
$$;

-- estoque --------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.inventario_produto_estoque (
	IN p_quantidadeestoque BIGINT,
	IN p_produtoid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	IF p_produtoid IN (SELECT produtoid FROM estoque) 
		THEN UPDATE estoque SET quantidadeestoque = p_quantidadeestoque WHERE estoque.produtoid = p_produtoid;
	ELSE 
		INSERT INTO estoque (quantidadeestoque, produtoid) VALUES (p_quantidadeestoque, p_produtoid);
	END IF;
END;
$$;

-- notafiscalcompra -----------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.recebimento_nota_fiscal_compra (
	IN p_numero BIGINT,
	IN p_serie BIGINT,
	IN p_valortotal NUMERIC(15,4),
	IN p_dataemissao DATE,
	IN p_empresaid BIGINT,
	IN p_usuarioid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.notafiscalcompra (
		numero, 
		serie, 
		valortotal, 
		dataemissao, 
		datahorarecebimento, 
		empresaid, 
		usuarioid
	) VALUES (
		p_numero, 
		p_serie,
		p_valortotal,
		p_dataemissao,
		CURRENT_TIMESTAMP,
		p_empresaid,
		p_usuarioid
	);
END;
$$;

-- produtonotafiscalcompra ----------------------------------------------------
CREATE OR REPLACE PROCEDURE public.recebimento_produto_nota_fiscal_compra (
	IN p_quantidade BIGINT,
	IN p_valorunitario NUMERIC(15,4),
	IN p_desconto NUMERIC(15,4),
	IN p_valortotal NUMERIC(15,4),
	IN p_produtoid BIGINT,
	IN p_notafiscalcompraid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN
	INSERT INTO public.produtonotafiscalcompra (
		quantidade,
		valorunitario,
		desconto,
		valortotal,
		produtoid,
		notafiscalcompraid
	) VALUES (
		p_quantidade,
		p_valorunitario,
		p_desconto,
		p_valortotal,
		p_produtoid,
		p_notafiscalcompraid
	);
END;
$$;

-- venda ----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.registro_venda (
	IN p_valortotal NUMERIC(15,4),
	IN p_mesaid BIGINT,
	IN p_usuarioid BIGINT,
	IN p_pessoaid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.venda (
		valortotal, 
		datahoracriacao, 
		mesaid, 
		usuarioid, 
		pessoaid
	) VALUES (
		p_valortotal, 
		CURRENT_TIMESTAMP, 
		p_mesaid, 
		p_usuarioid, 
		p_pessoaid
	);
END;
$$;

-- produtovenda ---------------------------------------------------------------
CREATE OR REPLACE PROCEDURE public.registro_produto_venda (
	IN p_valorunitario NUMERIC(15,4),
	IN p_quantidade BIGINT,
	IN p_desconto NUMERIC(15,4),
	IN p_valortotal NUMERIC(15,4),
	IN p_vendaid BIGINT,
	IN p_produtoid BIGINT
) LANGUAGE PLpgSQL AS 
$$
BEGIN 
	INSERT INTO public.produtovenda (
		valorunitario,
		quantidade,
		desconto,
		valortotal,
		vendaid,
		produtoid
	) VALUES (
		p_valorunitario,
		p_quantidade,
		p_desconto,
		p_valortotal,
		p_vendaid,
		p_produtoid
	);
END;
$$;