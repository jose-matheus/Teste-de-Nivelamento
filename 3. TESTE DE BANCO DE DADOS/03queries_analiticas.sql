SELECT 
    o.razao_social AS operadora,
    SUM(dc.vl_saldo_final) AS total_despesas
FROM 
    demonstracoes_contabeis dc
JOIN 
    operadoras o ON dc.reg_ans = o.reg_ans
WHERE 
    dc.descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND dc.data >= CURDATE() - INTERVAL 3 MONTH
GROUP BY 
    o.razao_social
ORDER BY 
    total_despesas DESC
LIMIT 10;


SELECT 
    o.razao_social AS operadora,
    SUM(dc.vl_saldo_final) AS total_despesas
FROM 
    demonstracoes_contabeis dc
JOIN 
    operadoras o ON dc.reg_ans = o.reg_ans
WHERE 
    dc.descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND dc.data >= CURDATE() - INTERVAL 1 YEAR
GROUP BY 
    o.razao_social
ORDER BY 
    total_despesas DESC
LIMIT 10;
