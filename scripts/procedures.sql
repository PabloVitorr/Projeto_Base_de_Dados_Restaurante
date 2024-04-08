-- empresa -------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_empresa (
	IN NomeFantasia VARCHAR(255), 
	IN RazaoSocial VARCHAR(255), 
	IN Cnpj VARCHAR(14), 
	IN InscricaoEstadual VARCHAR(15)
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
    NomeFantasia, 
    RazaoSocial, 
    Cnpj, 
    InscricaoEstadual
  );
END
$$;

-- cargo -------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_cargo (
	IN Nome VARCHAR(100)
) AS
$$
BEGIN
	INSERT INTO public.cargo (nome) VALUES (Nome);
END
$$ LANGUAGE PLPGSQL;

-- pessoa -------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_pessoa (
	IN Nome VARCHAR(100),
	IN Sobrenome VARCHAR(100),
	IN Cpf VARCHAR(100),
	IN Email VARCHAR(100),
	IN Telefone VARCHAR(100),
	IN CargoId BIGINT
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
		Nome,
		Sobrenome,
		Cpf,
		Email,
		Telefone,
		CURRENT_TIMESTAMP,
		CargoId
	);
END
$$;

-- usuario ---------------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE PROCEDURE cadastro_usuario (
	IN Login VARCHAR(255),
	IN Senha VARCHAR(255),
	IN PessoaId BIGINT,
	IN EmpresaId BIGINT
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
		Login,
		crypt(Senha, gen_salt('bf')),
		CURRENT_TIMESTAMP,
		PessoaId,
		EmpresaId
	);
END
$$;

-- pais ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_pais (
	IN Nome VARCHAR(100)
) LANGUAGE PLPGSQL AS 
$$
	BEGIN 
		INSERT INTO public.pais (nome) VALUES (Nome);
	END
$$;

-- estado ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_estado (
	IN Nome VARCHAR(100),
	IN Sigla CHAR(2),
	IN PaisId BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.estado (nome, sigla, paisid) VALUES (Nome, Sigla, PaisId);
END
$$;

-- cidade ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_cidade (
	IN Nome VARCHAR(100),
	IN EstadoId BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.cidade (nome, estadoid) VALUES (Nome, EstadoId);
END
$$;

-- bairro ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_bairro (
	IN Nome VARCHAR(100),
	IN CidadeId BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.bairro (nome, cidadeid) VALUES (Nome, CidadeId);
END
$$;

-- logradouro ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_logradouro (
	IN Nome VARCHAR(100),
	IN Cep VARCHAR(20),
	IN BairroId BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.logradouro (nome, cep, bairroid) VALUES (Nome, Cep, BairroId);
END
$$;

-- endereco pessoa ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_endereco_pessoa (
	IN Complemento VARCHAR(100),
	IN Numero	VARCHAR(20),
	IN PessoaId BIGINT,
	IN LogradouroId BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.endereco (
		complemento, 
		numero, 
		pessoaid, 
		logradouroid
	) VALUES (
		Complemento,
		Numero,
		PessoaId,
		LogradouroId
	);
END
$$;

-- endereco empresa ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_endereco_empresa (
	IN Complemento VARCHAR(100),
	IN Numero VARCHAR(20),
	IN EmpresaId BIGINT,
	IN LogradouroId BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.endereco (
		complemento,
		numero,
		empresaid,
		logradouroid
	) VALUES (
		Complemento,
		Numero,
		EmpresaId,
		LogradouroId
	);
END
$$;

-- mesa ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_mesa (
	IN Identificacao BIGINT,
	IN EmpresaId BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.mesa (identificacao, datahoracriacao, empresaid) VALUES (Identificacao, CURRENT_TIMESTAMP, EmpresaId);
END
$$;