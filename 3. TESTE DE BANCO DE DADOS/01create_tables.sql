
CREATE TABLE operadoras (
    reg_ans VARCHAR(20) PRIMARY KEY,  -- Chave primária
    cnpj CHAR(14),
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(50),
    logradouro VARCHAR(255),
    numero VARCHAR(20),
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf CHAR(2),
    cep CHAR(8),
    ddd CHAR(3),
    telefone VARCHAR(20),
    fax VARCHAR(15),
    endereco_eletronico VARCHAR(255),
    representante VARCHAR(255),
    cargo_representante VARCHAR(255),
    regiao_de_comercializacao VARCHAR(255),
    data_registro_ans DATE
);

CREATE TABLE demonstracoes_contabeis (
    data DATE,
    reg_ans VARCHAR(20),
    cd_conta_contabil VARCHAR(50),
    descricao TEXT,
    vl_saldo_inicial DECIMAL(15, 2),
    vl_saldo_final DECIMAL(15, 2),
    CONSTRAINT fk_reg_ans FOREIGN KEY (reg_ans) REFERENCES operadoras(reg_ans) ON DELETE CASCADE  -- Chave estrangeira
);
