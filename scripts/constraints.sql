-- empresa
ALTER TABLE public.empresa ADD CHECK (status = 'A' OR status = 'I' );

-- pessoa
ALTER TABLE public.pessoa
	ADD CONSTRAINT fk_pessoa_cargo FOREIGN KEY (cargoid)
	REFERENCES public.cargo (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CHECK (status = 'A' OR status = 'I' );

-- cargo
ALTER TABLE public.cargo ADD CHECK (status = 'A' OR status = 'I' );

-- usuario
ALTER TABLE public.usuario 
	ADD CONSTRAINT fk_usuario_pessoa FOREIGN KEY (pessoaid)
	REFERENCES public.pessoa (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CONSTRAINT fk_usuario_empresa FOREIGN KEY (empresaid)
	REFERENCES public.empresa (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CHECK (status = 'A' OR status = 'I' );

-- endereco
ALTER TABLE public.endereco 
	ADD CONSTRAINT fk_endereco_pessoa FOREIGN KEY (pessoaid)
	REFERENCES public.pessoa (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CONSTRAINT fk_endereco_empresa FOREIGN KEY (empresaid)
	REFERENCES public.empresa (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CONSTRAINT fk_endereco_logradouro FOREIGN KEY (logradouroid)
	REFERENCES public.logradouro (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION;	

-- logradouro
ALTER TABLE public.logradouro
	ADD CONSTRAINT fk_logradouro_bairro FOREIGN KEY (bairroid)
	REFERENCES public.bairro (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CHECK (status = 'A' OR status = 'I' );

-- bairro
ALTER TABLE public.bairro
	ADD CONSTRAINT fk_bairro_cidade FOREIGN KEY (cidadeid)
	REFERENCES public.cidade (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CHECK (status = 'A' OR status = 'I' );

-- cidade
ALTER TABLE public.cidade
	ADD CONSTRAINT fk_cidade_estado FOREIGN KEY (estadoid) 
	REFERENCES public.estado (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CHECK (status = 'A' OR status = 'I');

-- estado
ALTER TABLE public.estado
	ADD CONSTRAINT fk_estado_pais FOREIGN KEY (paisid)
	REFERENCES public.pais (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CHECK (status = 'A' OR status = 'I');

-- pais
ALTER TABLE public.pais ADD CHECK (status = 'A' OR status = 'I');

-- mesa
ALTER TABLE public.mesa 
	ADD CONSTRAINT fk_mesa_empresa FOREIGN KEY (empresaid)
	REFERENCES public.empresa (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CHECK (status = 'A' OR status = 'I');

-- venda
ALTER TABLE public.venda 
	ADD CONSTRAINT fk_venda_mesa FOREIGN KEY (mesaid)
	REFERENCES public.mesa (id) MATCH SIMPLE 
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CONSTRAINT fk_venda_usuario FOREIGN KEY (usuarioid)
	REFERENCES public.usuario (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CONSTRAINT fk_venda_pessoa FOREIGN KEY (pessoaid)
	REFERENCES public.pessoa (id) MATCH SIMPLE 
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CHECK (status = 'F' OR status = 'D');

-- itemvenda
ALTER TABLE public.itemvenda 
	ADD CONSTRAINT fk_itemvenda_venda FOREIGN KEY (vendaid)
	REFERENCES public.venda (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CONSTRAINT fk_itemvenda_produto FOREIGN KEY (produtoid)
	REFERENCES public.produto (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION;

-- comissa
ALTER TABLE public.comissao 
	ADD CONSTRAINT fk_comissao_usuario FOREIGN KEY (usuarioid)
	REFERENCES public.usuario (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CONSTRAINT fk_comissao_venda FOREIGN KEY (vendaid)
	REFERENCES public.venda (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CHECK (status = 'D' OR status = 'P');

-- produto
ALTER TABLE public.produto ADD CHECK (status = 'A' OR status = 'I');

-- estoque
ALTER TABLE public.estoque 
	ADD CONSTRAINT fk_estoque_produto FOREIGN KEY (produtoid)
	REFERENCES public.produto (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION;

-- notafiscalcompra
ALTER TABLE public.notafiscalcompra 
	ADD CONSTRAINT fk_notafiscalcompra_empresa FOREIGN KEY (empresaid)
	REFERENCES public.empresa (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CONSTRAINT fk_notafiscalcompra_usuario FOREIGN KEY (usuarioid)
	REFERENCES public.usuario (id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CHECK (status = 'R' OR status = 'D');

-- produtonotafiscalcompra
ALTER TABLE public.produtonotafiscalcompra 
	ADD CONSTRAINT fk_produtonotafiscalcompra_produto FOREIGN KEY (produtoid)
	REFERENCES public.produto (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
	ADD CONSTRAINT fk_produtonotafiscalcompra_notafiscalcompraid FOREIGN KEY (notafiscalcompraid)
	REFERENCES public.notafiscalcompra (id) MATCH SIMPLE
	ON UPDATE NO ACTION
	ON DELETE NO ACTION;