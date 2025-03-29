LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, 
   @vl_saldo_inicial, @vl_saldo_final)
SET
   vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
   vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.'),
   data = '2023-01-01';  -- Define a data como 01/01/2023 para todas as linhas


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2t2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, 
   @vl_saldo_inicial, @vl_saldo_final)
SET
   vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
   vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.'),
   data = '2023-04-01';  


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, 
   @vl_saldo_inicial, @vl_saldo_final)
SET
   vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
   vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.'),
   data = '2023-07-01'; 


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2023.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, 
   @vl_saldo_inicial, @vl_saldo_final)
SET
   vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
   vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.'),
   data = '2023-10-01';  

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, 
   @vl_saldo_inicial, @vl_saldo_final)
SET
   vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
   vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.'),
   data = '2024-01-01';  


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, 
   @vl_saldo_inicial, @vl_saldo_final)
SET
   vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
   vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.'),
   data = '2024-04-01';  


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, 
   @vl_saldo_inicial, @vl_saldo_final)
SET
   vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
   vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.'),
   data = '2024-07-01'; 


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2024.csv'
INTO TABLE demonstracoes_contabeis
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, descricao, 
   @vl_saldo_inicial, @vl_saldo_final)
SET
   vl_saldo_inicial = REPLACE(@vl_saldo_inicial, ',', '.'),
   vl_saldo_final = REPLACE(@vl_saldo_final, ',', '.'),
   data = '2024-10-01';  


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv'
INTO TABLE operadoras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(reg_ans, @cnpj, razao_social, nome_fantasia, modalidade, logradouro, numero, complemento, bairro, cidade, uf, cep, ddd, telefone, fax, endereco_eletronico, representante, cargo_representante, regiao_de_comercializacao, @data_registro_ans)
SET
    cnpj = IF(CHAR_LENGTH(REPLACE(@cnpj, ',', '')) = 14, REPLACE(@cnpj, ',', ''), NULL),  -- Garantir que CNPJ seja de 14 caracteres
    uf = IF(CHAR_LENGTH(uf) <= 3, uf, NULL),  -- Verifica se o UF tem 2 ou 3 caracteres
    telefone = IF(CHAR_LENGTH(telefone) <= 15 AND telefone REGEXP '^[0-9]+$', REPLACE(telefone, '[^0-9]', ''), NULL),  -- Garante que o telefone tenha no máximo 15 caracteres e seja numérico
    -- Verificação de data, incluindo limpeza de espaços adicionais
    data_registro_ans = IF(@data_registro_ans IS NOT NULL AND TRIM(@data_registro_ans) != '',
                           IF(@data_registro_ans LIKE '%/%',
                              STR_TO_DATE(TRIM(REPLACE(@data_registro_ans, ' ', '')), '%d/%m/%Y'),
                              @data_registro_ans),
                           NULL)
