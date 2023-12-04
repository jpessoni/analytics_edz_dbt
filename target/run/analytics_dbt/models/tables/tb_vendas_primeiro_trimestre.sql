
  
    

  create  table
    "dev"."public"."tb_vendas_primeiro_trimestre__dbt_tmp"
    
    
    
  as (
    -- cria a fonte com os dados de data e converte os nomes das colunas
WITH source_date AS (
    SELECT dateid AS id_date,
           month AS mes,
           year AS ano
    FROM date
),

-- cria uma fonte de dados unindo a tabela sales com date
sales_date AS (
    SELECT sd.mes,
           SUM(s.quantidade_vendida) AS total_vendas
    FROM source_date sd
    INNER JOIN vw_sales s ON s.id_date = sd.id_date
    WHERE sd.mes IN ('JAN', 'FEB', 'MAR')
      AND sd.ano = 2008
    GROUP BY sd.mes
)

SELECT * FROM sales_date
  );
  