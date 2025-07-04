-- pessoa ---------------------------------------------------------------------

DROP VIEW IF EXISTS public.v_cadastro_de_pessoa;
CREATE OR REPLACE VIEW public.v_cadastro_de_pessoa AS
SELECT
	CASE pessoa.status
		WHEN 'A' THEN 'Ativo'
		WHEN 'I' THEN 'Inativo'
	END AS status,
	pessoa.codigointerno AS codigo,
  pessoa.nome || ' ' || pessoa.sobrenome AS nome,
  pessoa.email,
  pessoa.cpf,
  logradouro.nome AS logradouro,
  logradouro.cep,
	bairro.nome AS bairro,
	cidade.nome AS cidade,
	estado.sigla AS estado,
	pais.nome AS pais,
	TO_CHAR(pessoa.datahoracriacao, 'DD/MM/YYYY HH24:MI:SS') AS data_hora_cadastro
FROM pessoa 
LEFT JOIN endereco ON endereco.pessoaid = pessoa.id
LEFT JOIN logradouro ON endereco.logradouroid = logradouro.id
LEFT JOIN bairro ON logradouro.bairroid = bairro.id
LEFT JOIN cidade ON bairro.cidadeid = cidade.id
LEFT JOIN estado ON cidade.estadoid = estado.id
LEFT JOIN pais ON estado.paisid = pais.id;

-- usuario --------------------------------------------------------------------

DROP VIEW IF EXISTS public.v_cadastro_de_usuario;
CREATE OR REPLACE VIEW public.v_cadastro_de_usuario AS
SELECT
	CASE usuario.status
		WHEN 'A' THEN 'Ativo'
		WHEN 'I' THEN 'Inativo'
	END AS status,
	usuario.codigointerno AS codigo,
	usuario.login,
	pessoa.nome || ' ' || pessoa.sobrenome AS nome,
	pessoa.email,
	pessoa.cpf,
	cargo.nome AS cargo,
	logradouro.nome AS logradouro,
	logradouro.cep,
	bairro.nome AS bairro,
	cidade.nome AS cidade,
	estado.sigla AS estado,
	pais.nome AS pais,
	TO_CHAR(usuario.datahoracriacao, 'DD/MM/YYYY HH24:MI:SS') AS data_hora_cadastro
FROM usuario
LEFT JOIN cargo ON usuario.cargoid = cargo.id
LEFT JOIN pessoa ON usuario.pessoaid = pessoa.id
LEFT JOIN endereco ON endereco.pessoaid = pessoa.id
LEFT JOIN logradouro ON endereco.logradouroid = logradouro.id
LEFT JOIN bairro ON logradouro.bairroid = bairro.id
LEFT JOIN cidade ON bairro.cidadeid = cidade.id
LEFT JOIN estado ON cidade.estadoid = estado.id
LEFT JOIN pais ON estado.paisid = pais.id
	ORDER BY 3;

-- produto --------------------------------------------------------------------

DROP VIEW IF EXISTS public.v_cadastro_de_produto;
CREATE OR REPLACE VIEW public.v_cadastro_de_produto AS
SELECT
	CASE produto.status
		WHEN 'A' THEN 'Ativo'
		WHEN 'I' THEN 'Inativo'
	END AS status,
	produto.codigointerno AS codigo,
	produto.codigobarras AS codigo_barras,
	produto.descricao,
	produto.valor::numeric(15,2) AS valor,
	TO_CHAR(produto.datahoracriacao, 'DD/MM/YYYY HH24:MI:SS') AS data_hora_cadastro
FROM produto;

-- empresa ---------------------------------------------------------------------

DROP VIEW IF EXISTS public.v_cadastro_de_empresa;
CREATE OR REPLACE VIEW public.v_cadastro_de_empresa AS
SELECT
	CASE empresa.status
		WHEN 'A' THEN 'Ativo'
		WHEN 'I' THEN 'Inativo'
	END AS status,
	empresa.codigointerno AS codigo,
	empresa.razaosocial AS razao_social,
	empresa.nomefantasia AS nome_fantasia,
	empresa.cnpj,
	empresa.inscricaoestadual AS incricao_estadual,
	endereco.complemento,
	logradouro.nome AS logradouro,
	logradouro.cep,
	bairro.nome AS bairro,
	cidade.nome AS cidade,
	estado.sigla AS estado,
	pais.nome AS pais
FROM empresa
LEFT JOIN endereco ON endereco.empresaid = empresa.id
LEFT JOIN logradouro ON endereco.logradouroid = logradouro.id
LEFT JOIN bairro ON logradouro.bairroid = bairro.id
LEFT JOIN cidade ON bairro.cidadeid = cidade.id
LEFT JOIN estado ON cidade.estadoid = estado.id
LEFT JOIN pais ON estado.paisid = pais.id;
