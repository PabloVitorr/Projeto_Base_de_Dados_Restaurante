-- adiciona estoque --------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.adiciona_estoque() 
RETURNS TRIGGER AS
$$
BEGIN 
	IF NEW.produtoid IN (SELECT produtoid FROM estoque)
		THEN UPDATE estoque SET quantidadeestoque = (quantidadeestoque + NEW.quantidade) WHERE produtoid = NEW.produtoid;
	ELSE 
		INSERT INTO estoque (quantidadeestoque, produtoid) VALUES (NEW.quantidade, NEW.produtoid);
	END IF;
RETURN NULL;
END
$$ LANGUAGE PLPGSQL;

-- remove estoque ----------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.remove_estoque()
RETURNS TRIGGER AS 
$$
BEGIN 
	UPDATE estoque SET quantidadeestoque = (quantidadeestoque - NEW.quantidade) WHERE produtoid = NEW.produtoid;
RETURN NULL;
END
$$ LANGUAGE PLPGSQL;