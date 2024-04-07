-- empresa -------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_empresa (
	NomeFantasia VARCHAR(255), 
	RazaoSocial VARCHAR(255), 
	Cnpj VARCHAR(14), 
	InscricaoEstadual VARCHAR(15)
) AS 
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
END;
$$ LANGUAGE PLPGSQL;

-- cargo -------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE cadastro_cargo (
	Nome VARCHAR(100)
) AS
$$
BEGIN
	INSERT INTO public.cargo (nome) VALUES (Nome);
END
$$ LANGUAGE PLPGSQL;