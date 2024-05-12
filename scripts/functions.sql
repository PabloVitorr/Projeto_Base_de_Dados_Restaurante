-- adiciona estoque compra ----------------------------------------------------
CREATE OR REPLACE FUNCTION public.movivimentacao_estoque_compra() 
RETURNS TRIGGER AS
$$
BEGIN 
	IF (TG_OP = 'INSERT') THEN 
		IF NEW.produtoid IN (SELECT produtoid FROM estoque) THEN 
			UPDATE estoque SET quantidadeestoque = (quantidadeestoque + NEW.quantidade) WHERE produtoid = NEW.produtoid;
		ELSE 
				INSERT INTO estoque (quantidadeestoque, produtoid) VALUES (NEW.quantidade, NEW.produtoid);
		END IF;
		
	ELSIF (TG_OP = 'UPDATE') THEN 
		IF (NEW.quantidade > OLD.quantidade) THEN 
			UPDATE estoque SET quantidadeestoque = (quantidadeestoque + (NEW.quantidade - OLD.quantidade)) WHERE produtoid = NEW.produtoid;
		ELSIF (NEW.quantidade < OLD.quantidade) THEN 
			UPDATE estoque SET quantidadeestoque = (quantidadeestoque - (OLD.quantidade - NEW.quantidade)) WHERE produtoid = NEW.produtoid;
		END IF;
	
	ELSIF (TG_OP = 'DELETE') THEN
		UPDATE estoque SET quantidadeestoque = (quantidadeestoque - OLD.quantidade) WHERE produtoid = OLD.produtoid;
	END IF;
RETURN NULL;
END
$$ LANGUAGE PLpgSQL;

-- DROP FUNCTION public.adiciona_estoque(); 

-- remove estoque venda -------------------------------------------------------
CREATE OR REPLACE FUNCTION public.movimentacao_estoque_venda()
RETURNS TRIGGER AS 
$$
BEGIN 
	IF (TG_OP = 'INSERT') THEN
		IF NEW.produtoid IN (SELECT produtoid FROM estoque) THEN 
			UPDATE estoque SET quantidadeestoque = (quantidadeestoque - NEW.quantidade) WHERE produtoid = NEW.produtoid;
		ELSE 
			INSERT INTO estoque (quantidadeestoque, produtoid) VALUES (0, NEW.produtoid);
			UPDATE estoque SET quantidadeestoque = (quantidadeestoque - NEW.quantidade) WHERE produtoid = NEW.produtoid;
		END IF;
	
	ELSIF (TG_OP = 'UPDATE') THEN 
		IF (NEW.quantidade > OLD.quantidade) THEN 
			UPDATE estoque SET quantidadeestoque = (quantidadeestoque - (NEW.quantidade - OLD.quantidade)) WHERE produtoid = NEW.produtoid;
		ELSIF (NEW.quantidade < OLD.quantidade) THEN 
			UPDATE estoque SET quantidadeestoque = (quantidadeestoque + (OLD.quantidade - NEW.quantidade)) WHERE produtoid = NEW.produtoid;
		END IF;
	
	ELSIF (TG_OP = 'DELETE') THEN 
		UPDATE estoque SET quantidadeestoque = (quantidadeestoque + OLD.quantidade) WHERE produtoid = OLD.produtoid;
	END IF;
RETURN NULL;
END
$$ LANGUAGE PLpgSQL;

-- calculo de comissao --------------------------------------------------------
CREATE OR REPLACE FUNCTION public.calculo_comissao()
RETURNS TRIGGER AS 
$$
	INSERT INTO comissao ()
$$ LANGUAGE PLpgSQL;

SELECT * FROM comissao;

SELECT * FROM comissao;