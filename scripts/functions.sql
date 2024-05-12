-- movimentacao estoque compra ------------------------------------------------
CREATE OR REPLACE FUNCTION public.movimentacao_estoque_compra() 
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

-- movimentacao estoque venda -------------------------------------------------
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
CREATE OR REPLACE FUNCTION public.calculo_comissao_venda()
RETURNS TRIGGER AS 
$$
DECLARE 
	v_valor NUMERIC(15,4);
	v_percentual NUMERIC(15,4);
BEGIN 
	v_percentual := 10;
	
	IF (TG_OP = 'INSERT') THEN
		v_valor := (NEW.valortotal * (v_percentual/100.0));
		
		INSERT INTO public.comissao (
			valor, 
			percentual, 
			datahoracriacao, 
			usuarioid, 
			vendaid 
		) VALUES (
			v_valor, 
			v_percentual, 
			NEW.datahoracriacao, 
			NEW.usuarioid, 
			NEW.id
		);
	
	ELSIF (TG_OP = 'UPDATE') THEN
		v_valor := (NEW.valortotal * (v_percentual/100.0));
	
		UPDATE comissao SET valor = v_valor;
	END IF;
RETURN NULL;
END
$$ LANGUAGE PLpgSQL;

SELECT * FROM venda;
SELECT * FROM comissao;