    with source_sales as (
    select *
    from sales

),



renamed as (

    select 
        SALESID AS ID_VENDAS,
        LISTID AS ID_LISTA,
        SELLERID AS ID_VENDEDOR,
        BUYERID AS ID_COMPRADOR,
        EVENTID AS ID_EVENTO,
        DATEID AS ID_DATE,
        QTYSOLD AS QUANTIDADE_VENDIDA,
        PRICEPAID AS VALOR_PAGO,
        COMMISSION AS COMISSAO,
        cast(SALETIME as date) AS DATA_VENDA,
        to_char( SALETIME, 'dd/mm/yyy hh24:mi:ss') as DATA_HORA_VENDA,
        to_char( SALETIME, 'hh24:mi:ss') as HORA_VENDA
     from source_sales

)

SELECT * FROM renamed

