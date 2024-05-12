-- adiciona estoque ------------------------------------------------------------
CREATE OR REPLACE TRIGGER t_movimentacao_estoque_compra
AFTER INSERT OR UPDATE OR DELETE ON public.produtonotafiscalcompra
FOR EACH ROW 
EXECUTE FUNCTION public.movivimentacao_estoque_compra();

DROP TRIGGER t_adiciona_estoque ON produtonotafiscalcompra

-- remove estoque -------------------------------------------------------------
CREATE OR REPLACE TRIGGER t_movimentacao_estoque_venda
AFTER INSERT OR UPDATE OR DELETE ON public.produtovenda
FOR EACH ROW 
EXECUTE FUNCTION public.movimentacao_estoque_venda();

DROP TRIGGER t_remove_estoque ON produtovenda

-- calculo de comissao --------------------------------------------------------
CREATE OR REPLACE TRIGGER t_calculo_comissao
AFTER INSERT ON public.venda  
FOR EACH ROW 
EXECUTE FUNCTION public.calculo_comissao();

