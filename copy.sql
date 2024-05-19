-- validacao registros ja existentes ------------------------------------------
SELECT * FROM cidade;
/*
São Paulo
Santo André
Jundiaí
Osasco
Mogi das Cruzes
Carapicuíba
São José dos Campos
*/

-- criacao tabela temporaria --------------------------------------------------
DROP TABLE IF EXISTS public.tmp_cidade;
CREATE TABLE public.tmp_cidade (
	nome VARCHAR(100)
);

-- ----------------------------------------------------------------------------
-- copiando dados de todos os municipios do estado de sao paulo.
-- obs: arquivo contem apenas coluna nome por isso nao foi utilizado
-- delimitador
COPY tmp_cidade FROM '/tmp/sp_municipios_2022.csv' WITH CSV;

SELECT * FROM tmp_cidade;
-- 645
SELECT * FROM cidade;
-- 7
-- 645 - 7 = 638

-- gerando inserts ------------------------------------------------------------
SELECT 
	'insert into cidade (nome, estadoid) values ('''||nome||''',1);'
FROM tmp_cidade
WHERE tmp_cidade.nome NOT IN (SELECT nome FROM cidade);
-- 638

SELECT * FROM cidade;
-- 645

DROP TABLE IF EXISTS tmp_cidade;