INSERT INTO plano(nome_plano, valor, duracao_meses)
VALUES
('mensal', '120.00', '1 mes'),
('trimestral', '300.00', '3 meses'),
('semestral', '550.00', '6 meses');

--- insere planos de assinatura no sistema de academia


INSERT INTO aluno (nome, cpf, telefone, email)
VALUES 
('joaquin', '123564789-65', '17653678921', 'joaquin@gmail.com'),
('pereira', '167893029-23', '17652389431', 'pereira@gmail.com'),
('jasmin', '765382837-83', '65743289102', 'jasmin@gmail.com');

--- insere alunos no sistema de academia

INSERT INTO instrutor (nome, especialidade, horario_atendimento)
VALUES 
('marcos' , 'musculacao','07:00 as 18:00'),
('keila', 'crossfit', '10:00 as 17:00'),
('dandara', 'pilates', '12:00 as 19:00');

--- insere instrutores no sistema de academia

INSERT INTO exercicios (nome, carga, repeticoes)
VALUES
('Supino Reto', 40.00, 10),
('Agachamento Livre', 60.00, 12),
('Puxada Alta', 35.00, 10),
('Desenvolvimento de Ombros', 20.00, 12),
('Rosca Direta', 12.00, 15);

--- insere exercicios no sistema de academia