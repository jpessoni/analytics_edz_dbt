--testa se existe valores menores que zero (negativos)
select *
    from tb_top_10_compradores
    where vendas_totais < 0