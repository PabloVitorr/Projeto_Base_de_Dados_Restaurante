-- empresa -------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_empresa (
	IN p_nomefantasia VARCHAR(255), 
	IN p_razaosocial VARCHAR(255), 
	IN p_cnpj VARCHAR(14), 
	IN p_inscricaoestadual VARCHAR(15)
) LANGUAGE PLPGSQL AS 
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
END
$$;

-- cargo -------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_cargo (
	IN p_nome VARCHAR(100)
) AS
$$
BEGIN
	INSERT INTO public.cargo (nome) VALUES (p_nome);
END
$$ LANGUAGE PLPGSQL;

-- pessoa -------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_pessoa (
	IN p_nome VARCHAR(100),
	IN p_sobrenome VARCHAR(100),
	IN p_cpf VARCHAR(100),
	IN p_email VARCHAR(100),
	IN p_telefone VARCHAR(100),
	IN p_cargoid BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.pessoa (
		nome,
		sobrenome,
		cpf,
		email,
		telefone,
		datahoracriacao,
		cargoid
	) VALUES (
		p_nome,
		p_sobrenome,
		p_cpf,
		p_email,
		p_telefone,
		CURRENT_TIMESTAMP,
		p_cargoid
	);
END
$$;

-- usuario ---------------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE PROCEDURE cadastro_usuario (
	IN p_login VARCHAR(255),
	IN p_senha VARCHAR(255),
	IN p_pessoaid BIGINT,
	IN p_empresaid BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.usuario (
		login,
		senha,
		datahoracriacao,
		pessoaid,
		empresaid
	) VALUES (
		p_login,
		crypt(p_senha, gen_salt('bf')),
		CURRENT_TIMESTAMP,
		p_pessoaid,
		p_empresaid
	);
END
$$;

-- pais ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_pais (
	IN p_nome VARCHAR(100)
) LANGUAGE PLPGSQL AS 
$$
	BEGIN 
		INSERT INTO public.pais (nome) VALUES (p_nome);
	END
$$;
 
-- estado ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_estado (
	IN p_nome VARCHAR(100),
	IN p_sigla CHAR(2),
	IN p_paisid BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.estado (nome, sigla, paisid) VALUES (p_nome, p_sigla, p_paisid);
END
$$;

-- cidade ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_cidade (
	IN p_nome VARCHAR(100),
	IN p_estadoid BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.cidade (nome, estadoid) VALUES (p_nome, p_estadoid);
END
$$;

-- bairro ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_bairro (
	IN p_nome VARCHAR(100),
	IN p_cidadeid BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.bairro (nome, cidadeid) VALUES (p_nome, p_cidadeid);
END
$$;

-- logradouro ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_logradouro (
	IN p_nome VARCHAR(100),
	IN p_cep VARCHAR(20),
	IN p_bairroid BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.logradouro (nome, cep, bairroid) VALUES (p_nome, p_cep, p_bairroid);
END
$$;

-- endereco pessoa ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_endereco_pessoa (
	IN p_complemento VARCHAR(100),
	IN p_numero	VARCHAR(20),
	IN p_pessoaid BIGINT,
	IN p_logradouroid BIGINT
) LANGUAGE PLPGSQL AS 
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
END
$$;

-- endereco empresa ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_endereco_empresa (
	IN p_complemento VARCHAR(100),
	IN p_numero VARCHAR(20),
	IN p_empresaid BIGINT,
	IN p_logradouroid BIGINT
) LANGUAGE PLPGSQL AS 
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
END
$$;

-- mesa ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_mesa (
	IN p_identificacao BIGINT,
	IN p_empresaid BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.mesa (identificacao, datahoracriacao, empresaid) VALUES (p_identificacao, CURRENT_TIMESTAMP, p_empresaid);
END
$$;
 
-- produto ------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_produto (
	IN p_codigobarras VARCHAR(14),
	IN p_descricao VARCHAR(100),
	IN p_valor NUMERIC(15,4)
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.produto (
		codigobarras,
		descricao,
		valor,
		datahoracriacao
	) VALUES (
		p_codigobarras,
		p_descricao,
		p_valor,
		CURRENT_TIMESTAMP
	);
END
$$;

-- estoque -----------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE inventario_item_estoque (
	IN p_quantidadeestoque BIGINT,
	IN p_produtoid BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	IF p_produtoid IN (SELECT produtoid FROM estoque) 
		THEN UPDATE estoque SET quantidadeestoque = p_quantidadeestoque WHERE estoque.produtoid = p_produtoid;
	ELSE 
		INSERT INTO estoque (quantidadeestoque, produtoid) VALUES (p_quantidadeestoque, p_produtoid);
	END IF;
END
$$;