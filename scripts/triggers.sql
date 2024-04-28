-- adiciona estoque -------------------------------------------------------------
CREATE OR REPLACE TRIGGER t_adiciona_estoque 
AFTER INSERT ON public.produtonotafiscalcompra
FOR EACH ROW EXECUTE 
FUNCTION public.adiciona_estoque();

-- remove estoque --------------------------------------------------------------
CREATE OR REPLACE TRIGGER t_remove_estoque
AFTER INSERT ON public.produtovenda
FOR EACH ROW EXECUTE 
FUNCTION public.remove_estoque();