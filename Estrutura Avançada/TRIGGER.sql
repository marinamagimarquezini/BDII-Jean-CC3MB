CREATE TABLE IF NOT EXISTS historico_precos (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_peca INT NOT NULL,
    preco_antigo DECIMAL(10,2) NOT NULL,
    preco_novo DECIMAL(10,2) NOT NULL,
    data_alteracao DATETIME NOT NULL
);

DELIMITER $$
CREATE TRIGGER tg_AtualizaPecaPreco AFTER UPDATE
ON pecas
FOR EACH ROW
BEGIN
        INSERT INTO historico_precos (
        id_peca,          
        preco_antigo, 
        preco_novo, 
        data_alteracao
    )
    SELECT 
        i.id_peca,        
        d.preco,          
        i.preco,          
        GETDATE()         
    FROM deleted d
    INNER JOIN inserted i ON d.id_peca = i.id_peca
    WHERE d.preco <> i.preco; 
END;

select * from historico_precos;