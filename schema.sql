-- ========================
-- TABELA ALUNOS
-- ========================
CREATE TABLE Alunos (
  id_aluno INT PRIMARY KEY,
  nome_aluno VARCHAR(100),
  data_nascimento DATE,
  genero VARCHAR(10),
  endereco VARCHAR(100),
  telefone VARCHAR(100),
  email VARCHAR(100)
);

-- ========================
-- TABELA PROFESSORES
-- ========================
CREATE TABLE Professores (
  id_professor INT PRIMARY KEY,
  nome_professor VARCHAR(100),
  data_nascimento DATE,
  genero VARCHAR(10),
  telefone VARCHAR(20),
  email VARCHAR(100)
);

-- ========================
-- TABELA DISCIPLINAS
-- ========================
CREATE TABLE Disciplinas (
  id_disciplina INT PRIMARY KEY,
  nome_disciplina VARCHAR(100),
  descricao TEXT,
  carga_horaria INT,
  id_professor INT,
  FOREIGN KEY (id_professor)
    REFERENCES Professores(id_professor)
    ON DELETE CASCADE
);

-- ========================
-- TABELA TURMAS
-- ========================
CREATE TABLE Turmas (
  id_turma INT PRIMARY KEY,
  nome_turma VARCHAR(100),
  ano_letivo INT,
  id_professor_orientador INT,
  FOREIGN KEY (id_professor_orientador)
    REFERENCES Professores(id_professor)
    ON DELETE CASCADE
);

-- ========================
-- RELACIONAMENTO TURMAS_DISCIPLINAS
-- ========================
CREATE TABLE Turmas_Disciplinas (
  id_turma INT,
  id_disciplina INT,
  PRIMARY KEY (id_turma, id_disciplina),
  FOREIGN KEY (id_turma)
    REFERENCES Turmas(id_turma)
    ON DELETE CASCADE,
  FOREIGN KEY (id_disciplina)
    REFERENCES Disciplinas(id_disciplina)
    ON DELETE CASCADE
);

-- ========================
-- RELACIONAMENTO TURMAS_ALUNOS
-- ========================
CREATE TABLE Turmas_Alunos (
  id_turma INT,
  id_aluno INT,
  PRIMARY KEY (id_turma, id_aluno),
  FOREIGN KEY (id_turma)
    REFERENCES Turmas(id_turma)
    ON DELETE CASCADE,
  FOREIGN KEY (id_aluno)
    REFERENCES Alunos(id_aluno)
    ON DELETE CASCADE
);

-- ========================
-- TABELA NOTAS
-- ========================
CREATE TABLE Notas (
  id_nota INT PRIMARY KEY,
  id_disciplina INT,
  id_aluno INT,
  valor_nota DECIMAL(4,2),
  data_avaliacao DATE,
  FOREIGN KEY (id_aluno)
    REFERENCES Alunos(id_aluno)
    ON DELETE CASCADE,
  FOREIGN KEY (id_disciplina)
    REFERENCES Disciplinas(id_disciplina)
    ON DELETE CASCADE
);