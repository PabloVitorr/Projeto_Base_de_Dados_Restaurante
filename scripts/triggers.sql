-- adiciona estoque ------------------------------------------------------------
CREATE OR REPLACE TRIGGER t_movimentacao_estoque_compra
AFTER INSERT OR UPDATE OR DELETE ON public.produtonotafiscalcompra
FOR EACH ROW 
EXECUTE FUNCTION public.movimentacao_estoque_compra();

-- remove estoque -------------------------------------------------------------
CREATE OR REPLACE TRIGGER t_movimentacao_estoque_venda
AFTER INSERT OR UPDATE OR DELETE ON public.produtovenda
FOR EACH ROW 
EXECUTE FUNCTION public.movimentacao_estoque_venda();

-- calculo de comissao --------------------------------------------------------
CREATE OR REPLACE TRIGGER t_calculo_comissao_venda
AFTER INSERT OR UPDATE ON public.venda 
FOR EACH ROW 
EXECUTE FUNCTION public.calculo_comissao_venda();