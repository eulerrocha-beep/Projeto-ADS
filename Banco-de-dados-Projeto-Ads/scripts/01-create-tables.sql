CREATE TABLE instrutor(
    id_instrutor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    especialidade TEXT,
    horario_atendimento TIME
);

CREATE TABLE treino_exercicios (
    id_treino_exercicio INTEGER PRIMARY KEY AUTOINCREMENT,
    id_treino INTEGER,
    id_exercicio INTEGER,
    FOREIGN KEY (id_treino) REFERENCES treino(id_treino),
    FOREIGN KEY (id_exercicio) REFERENCES exercicios(id_exercicios)
);


CREATE TABLE plano (
    id_plano INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_plano TEXT NOT NULL,
    valor DECIMAL (10,2),
    duracao_meses INT NOT NULL
);

CREATE TABLE pagamento (
    id_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
    valor_pagamento DECIMAL (10,2),
    data_fim_plano DATE,
    status TEXT,
    id_aluno INTEGER,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE presenca (
    id_presenca INTEGER PRIMARY KEY AUTOINCREMENT,
    data DATE,
    horario_entrada TIME,
    id_aluno INTEGER,
    FOREIGN KEY (id_aluno) REFERENCES aluno (id_aluno)
);

CREATE TABLE treino (
    id_treino INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao TEXT,
    id_aluno INTEGER,
    id_instrutor INTEGER,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor)
);

CREATE TABLE exercicios (
    id_exercicios INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    carga DECIMAL (5,2),
    repeticoes INT
);

CREATE TABLE aluno (
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL,
    telefone TEXT,
    email TEXT,
    id_plano INTEGER,
    id_instrutor INTEGER,
    FOREIGN KEY (id_plano) REFERENCES plano(id_plano),
    FOREIGN KEY (id_instrutor) REFERENCES instrutor(id_instrutor)
);