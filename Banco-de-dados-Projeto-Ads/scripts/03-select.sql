SELECT * FROM plano;

-- Puxa todos os planos cadastrados no sistema de academia

SELECT * FROM instrutor

-- Puxa todos os instrutores cadastrados no sistema de academia

SELECT 
    c.id_aluno,
    c.nome AS nome_aluno,
    c.id_aluno AS aluno_cadastrado,
    a.id_instrutor AS nome_instrutor
FROM aluno c
lEFT JOIN treino a
    ON a.id_treino = c.id_aluno
LEFT JOIN instrutor b
    ON b.id_instrutor = c.telefone
WHERE c.id_aluno = 1;

-- Puxa os dados do aluno cadastrado com id 1, relacionando com o instrutor e o treino

/*  INNER JOIN

Traz somente os registros que existem nas duas tabelas.


 Se uma tabela não tiver correspondência, não aparece no resultado.

Exemplo:

Tabela aluno
Tabela treino

Se o aluno não tiver treino, o INNER JOIN esconde ele.


 LEFT JOIN

Traz todos os registros da tabela da esquerda (LEFT = esquerda),
mesmo que não exista correspondência na tabela da direita.


 Se faltar alguma correspondência, os campos da outra tabela vêm como NULL.

Exemplo:

Tabela aluno (LEFT)
Tabela treino (RIGHT)

Se o aluno não tiver treino, o LEFT JOIN mostra o aluno
e o treino vem assim:

id_treino
NULL */ 

SELECT 
    c.id_aluno,
    c.nome AS nome_aluno,
    c.id_aluno AS aluno_cadastrado,
    b.nome AS nome_instrutor
FROM aluno c
LEFT JOIN treino a
    ON a.id_aluno = c.id_aluno
LEFT JOIN instrutor b
    ON b.id_instrutor = c.id_instrutor
WHERE c.id_aluno = 1
LIMIT 1;

/* LIMIT 1 garante que somente um registro será retornado, mesmo que a junção gere duplicatas. */

SELECT 
    c.id_aluno,
    c.nome AS nome_aluno,
    c.id_aluno AS aluno_cadastrado,
    b.nome AS nome_instrutor
FROM aluno c
LEFT JOIN treino a
    ON a.id_aluno = c.id_aluno
LEFT JOIN instrutor b
    ON b.id_instrutor = c.id_instrutor
WHERE c.id_aluno = 1
ORDER BY c.id_aluno ASC
LIMIT 1;

/*  ORDER BY retorna os resultados ordenados por um ou mais campos.
    ASC = ordem crescente (padrão)
    DESC = ordem decrescente */