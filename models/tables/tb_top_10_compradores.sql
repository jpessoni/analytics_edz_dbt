with sales as(
	select * from vw_sales
	--{{ref('vw_sales')}}
),

compradores as (
	select
		(firstname||' '|| lastname) as Nome_Completo, userid
	from users
),

top_10_compradores as(
	select 
	  compradores.Nome_completo as Nome_completo,
	  sum(sales.quantidade_vendida) as Vendas_totais,
	  sales.comissao as Comissao
	from sales inner join compradores
    on sales.id_comprador = compradores.userid
    group by compradores.userid, compradores.Nome_completo, sales.comissao
    order by Vendas_totais desc
    limit 10
)

select * from top_10_compradores