select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      --testa se existe valores menores que zero (negativos)
select *
    from tb_top_10_compradores
    where vendas_totais < 0
      
    ) dbt_internal_test