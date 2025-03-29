SELECT 
    o.reg_ans,
    o.razao_social,
    SUM(dc.vl_saldo_inicial + dc.vl_saldo_final) AS total_despesas
FROM 
    demonstracoes_contabeis dc
JOIN 
    operadoras o ON dc.reg_ans = o.reg_ans
WHERE 
    dc.descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS%'  -- Descrição com variação, A descrição completa causava zero retorno, suponho que devido a acentuação
    AND dc.data = '2024-10-01'  -- Último trimestre (3 meses)
GROUP BY 
    o.reg_ans, o.razao_social
ORDER BY 
    total_despesas DESC
LIMIT 10;


SELECT 
    o.reg_ans,
    o.razao_social,
    SUM(dc.vl_saldo_inicial + dc.vl_saldo_final) AS total_despesas
FROM 
    demonstracoes_contabeis dc
JOIN 
    operadoras o ON dc.reg_ans = o.reg_ans
WHERE 
    dc.descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS%'  -- Descrição com variação, A descrição completa causava zero retorno, suponho que devido a acentuação
    AND dc.data BETWEEN '2023-10-01' AND '2024-10-01'  -- Último ano (12 meses)
GROUP BY 
    o.reg_ans, o.razao_social
ORDER BY 
    total_despesas DESC
LIMIT 10;