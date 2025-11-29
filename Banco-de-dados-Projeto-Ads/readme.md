
# Projeto ADS — Banco de Dados da Academia

## Objetivo

Este repositório contém o esquema e scripts SQL para um sistema de gestão de uma academia. O objetivo é fornecer um banco de dados simples (SQLite) que acompanhe alunos, instrutores, planos, treinos, exercícios, presenças e pagamentos — útil para fins acadêmicos e prototipagem.

## Tabelas criadas e propósito

Lista das tabelas definidas em `scripts/01-create-tables.sql` com uma breve descrição do propósito de cada uma:

- `instrutor` — Armazena os instrutores da academia.
	- Colunas principais: `id_instrutor` (PK), `nome`, `especialidade`, `horario_atendimento`.
	- Uso: associar treinos e alunos a um profissional responsável.

- `aluno` — Registra os alunos.
	- Colunas principais: `id_aluno` (PK), `nome`, `cpf`, `telefone`, `email`, `id_plano`, `id_instrutor`.
	- Uso: dados pessoais do aluno e relacionamentos com plano e instrutor.

- `plano` — Contém os planos de assinatura/oferta.
	- Colunas principais: `id_plano` (PK), `nome_plano`, `valor`, `duracao_meses`.
	- Uso: gerenciar tipos de planos (mensal, trimestral, etc.).

- `pagamento` — Registra pagamentos realizados pelos alunos.
	- Colunas principais: `id_pagamento` (PK), `valor_pagamento`, `data_fim_plano`, `status`, `id_aluno` (FK).
	- Uso: controle do status do pagamento e validade do plano de um aluno.

- `presenca` — Marca as presenças dos alunos nas aulas/treinos.
	- Colunas principais: `id_presenca` (PK), `data`, `horario_entrada`, `id_aluno` (FK).
	- Uso: registros de frequência.

- `treino` — Representa um treino atribuído a um aluno, possivelmente por um instrutor.
	- Colunas principais: `id_treino` (PK), `descricao`, `id_aluno` (FK), `id_instrutor` (FK).
	- Uso: agrupar exercícios e instruções para um aluno.

- `exercicios` — Catálogo de exercícios.
	- Colunas principais: `id_exercicios` (PK), `nome`, `carga`, `repeticoes`.
	- Uso: armazenar exercícios reutilizáveis.

- `treino_exercicios` — Tabela de relação (muitos-para-muitos) entre treinos e exercícios.
	- Colunas principais: `id_treino_exercicio` (PK), `id_treino` (FK), `id_exercicio` (FK).
	- Uso: vincular vários exercícios a um treino específico.

> Observação: as chaves estrangeiras relacionam as tabelas para manter integridade referencial (ex.: `aluno.id_plano` → `plano.id_plano`).

## Dados de exemplo

Há inserções de exemplo em `scripts/02-insert.sql` — incluem alguns `plano`, `aluno`, `instrutor` e `exercicios` iniciais úteis para testes.

## Requisitos (para executar localmente)

- Sistema operacional: Windows (instruções fornecidas para PowerShell), mas os passos também funcionam em macOS/Linux com adaptações ao caminho.
- SQLite (recomendado) — ou qualquer cliente/DB compatível com os arquivos SQL criados. Você pode instalar o cliente `sqlite3` ou usar uma interface gráfica como DB Browser for SQLite.
- (Alternativa) Python 3 (já incluído em muitos sistemas) para executar os scripts com o módulo `sqlite3` sem instalar utilitários adicionais.

## Como executar localmente (passo a passo)

1) Abra o PowerShell e vá para a pasta do projeto:

```powershell
cd 'c:\Users\euler\OneDrive\Desktop\Todos projetos\Projeto ADS\Banco-de-dados-Projeto-Ads'
```

2) Usando o cliente `sqlite3` (se instalado):

```powershell
# Cria um arquivo de banco de dados (projeto_ads.db) e executa os scripts em ordem
sqlite3 projeto_ads.db ".read .\scripts\01-create-tables.sql" ".read .\scripts\02-insert.sql"

# Alternativamente, abra o shell interativo e rode:
sqlite3 projeto_ads.db
.read .\scripts\01-create-tables.sql
.read .\scripts\02-insert.sql
.exit
```

3) Se você não tiver `sqlite3` instalado, use Python 3 para executar os arquivos SQL:

```powershell
python - <<'PY'
import sqlite3, pathlib
db = sqlite3.connect('projeto_ads.db')
cur = db.cursor()
base = pathlib.Path(r'.\scripts')
for sql in ['01-create-tables.sql','02-insert.sql','03-select.sql','04-updates.sql','05-deletes.sql']:
		p = base / sql
		if p.exists():
				cur.executescript(p.read_text(encoding='utf-8'))
				print(f'Executado: {p.name}')
db.commit()
db.close()
PY
```

4) (Opcional) Abra `projeto_ads.db` com DB Browser for SQLite para navegar nos dados e rodar queries SQL de teste.

## Ordem recomendada dos scripts

1. `scripts/01-create-tables.sql` — cria o esquema.
2. `scripts/02-insert.sql` — insere dados de exemplo.
3. `scripts/03-select.sql` — exemplos de consultas (apenas leitura).
4. `scripts/04-updates.sql` — exemplos de updates.
5. `scripts/05-deletes.sql` — exemplos de deletes.

## Contrato rápido

- Entradas: os arquivos SQL em `scripts/`.
- Saída: arquivo de banco de dados (ex.: `projeto_ads.db`) contendo as tabelas e dados de exemplo.
- Erros comuns: re-execução de `01-create-tables.sql` sem dropar tabelas pode causar erros de 'table already exists'. Se necessário, delete `projeto_ads.db` antes de reexecutar.

## Contato

Para dúvidas sobre este esquema ou pedidos de melhoria, abra uma issue neste repositório.