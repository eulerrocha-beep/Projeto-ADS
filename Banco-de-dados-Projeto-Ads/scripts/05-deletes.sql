DELETE FROM instrutor
WHERE id_instrutor = 3;

/* Deleta o instrutor que tem o id_3*/

DELETE FROM aluno
WHERE id_plano IS NULL;

/* Deleta todos alunos que não tem um plano cadastrado*/

DELETE FROM exercicio
WHERE repeticoes LIKE '2%'      -- exercícios com 2 séries
   OR repeticoes LIKE '1%';     -- exercícios com 1 série

/* Deleta todos os exercícios que possuem 1 ou 2 séries */