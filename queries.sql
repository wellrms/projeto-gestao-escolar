-- ========================
-- CONTAGEM DE REGISTROS
-- ========================
SELECT COUNT(*) FROM Alunos;
SELECT COUNT(*) FROM Professores;
SELECT COUNT(*) FROM Disciplinas;
SELECT COUNT(*) FROM Turmas;
SELECT COUNT(*) FROM Turmas_Disciplinas;
SELECT COUNT(*) FROM Turmas_Alunos;
SELECT COUNT(*) FROM Notas;

-- ========================
-- LISTAGEM ORDENADA
-- ========================

SELECT * FROM Alunos ORDER BY nome_aluno ASC;

-- ========================
-- DISCIPLINAS > 40H
-- ========================

SELECT * FROM Disciplinas WHERE carga_horaria > 40;

-- ========================
-- NOTAS ENTRE 6 E 8
-- ========================

SELECT * FROM Notas 
WHERE valor_nota > 6 AND valor_nota < 8;

-- ========================
-- MÉDIA POR ALUNO
-- ========================

SELECT 
    a.nome_aluno,
    ROUND(AVG(n.valor_nota), 2) AS media
FROM Notas n
JOIN Alunos a ON n.id_aluno = a.id_aluno
GROUP BY a.nome_aluno
ORDER BY media DESC;

-- ========================
-- MÉDIA POR DISCIPLINA
-- ========================

SELECT 
    d.nome_disciplina,
    ROUND(AVG(n.valor_nota), 2) AS media_disciplina
FROM Notas n
JOIN Disciplinas d ON n.id_disciplina = d.id_disciplina
GROUP BY d.nome_disciplina
ORDER BY media_disciplina DESC;

-- ========================
-- ALUNOS REPROVADOS (<6)
-- ========================

SELECT 
    a.nome_aluno,
    ROUND(AVG(n.valor_nota), 2) AS media
FROM Notas n
JOIN Alunos a ON n.id_aluno = a.id_aluno
GROUP BY a.nome_aluno
HAVING AVG(n.valor_nota) < 6;

-- ========================
-- MÉDIA POR PROFESSOR
-- ========================

SELECT 
    p.nome_professor,
    ROUND(AVG(n.valor_nota), 2) AS media_geral
FROM Notas n
JOIN Disciplinas d ON n.id_disciplina = d.id_disciplina
JOIN Professores p ON d.id_professor = p.id_professor
GROUP BY p.nome_professor
ORDER BY media_geral DESC;