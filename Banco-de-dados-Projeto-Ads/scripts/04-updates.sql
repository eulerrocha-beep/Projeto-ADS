UPDATE plano
SET valor = 129.90
WHERE id_plano = 1;

/* Atualiza o valor do plano do id=1*/

UPDATE plano
SET nome_plano = 'Plano Premium',
    valor = 199.90
WHERE id_plano = 2;

/* Atualiza o nome e o valor do plano do id=2*/

UPDATE instrutor
SET especialidade = 'Musculação Avançada'
WHERE id_instrutor = 2;

/* Atualiza a especialidade do instrutor do id=2 */

UPDATE instrutor
SET horario_atendimento = '08:00 as 09:00'
WHERE especialidade = 'pilates';

/* Atualiza o horario de atendimento do instrutor de pilates */