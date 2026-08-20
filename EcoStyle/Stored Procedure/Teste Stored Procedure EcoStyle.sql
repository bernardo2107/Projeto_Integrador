-- TESTANDO STORED PPROCEDURES DO DB
USE EcoStyle;


CALL sp_CadastrarCustomer(
    'Brayan Oliveira',
    'Brayan',
    'Rua das Flores, 100',
    'Belo Horizonte',
    '31270-000'
);


CALL sp_CadastrarCategory(
    'Camisetas Orgânicas',
    'Camisetas produzidas utilizando algodão orgânico.'
);

CALL sp_CadastrarSupplier(
    'EcoTecidos',
    'Carlos Silva',
    'Rua Verde, 200',
    'Belo Horizonte',
    '30100-000',
    'Brasil',
    '31999999999',
    'Fornecedor de tecidos sustentáveis e materiais reciclados.'
);

CALL sp_CadastrarProduct(
    'Camiseta Eco Verde',
    1,
    1,
    'Unidade',
    79,
    'Camiseta produzida com algodão orgânico.'
);	

CALL sp_CadastrarOrder(
    1,
    1,
    NOW(),
    1,
    'PENDENTE'
);

CALL sp_CadastrarStock(
    1,
    100
);