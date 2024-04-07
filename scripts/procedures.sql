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
	IN Cargoid BIGINT
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
		Cargoid
	);
END
$$;

-- usuario ---------------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE PROCEDURE cadastro_usuario (
	IN Login VARCHAR(255),
	IN Senha VARCHAR(255),
	IN Pessoaid BIGINT,
	IN Empresaid BIGINT
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
		crypt(Senha, gen_salt('bf'::TEXT)),
		CURRENT_TIMESTAMP,
		Pessoaid,
		Empresaid
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
	IN Paisid BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.estado (nome, sigla) VALUES (Nome, Sigla);
END
$$;

-- cidade ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_cidade (
	IN Nome VARCHAR(100),
	IN Estadoid BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.cidade (nome, estadoid) VALUES (Nome, Estadoid);
END
$$;

-- bairro ---------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_bairro (
	IN Nome VARCHAR(100),
	IN Cidadeid BIGINT
) LANGUAGE PLPGSQL AS 
$$
BEGIN 
	INSERT INTO public.bairro (nome, cidadeid) VALUES (Nome, Cidadeid);
END
$$;