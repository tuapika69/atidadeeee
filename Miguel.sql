#1

DELIMITER $$

CREATE PROCEDURE exibirAlunosPorTurma(IN codigoTurma VARCHAR(15))
BEGIN
    SELECT a.nro_matricula, a.nome_aluno
    FROM aluno a
    WHERE a.codigo_turma = codigoTurma;
END$$

DELIMITER ;

#2

DELIMITER $$

CREATE PROCEDURE atualizarStatusAluno(
    IN nroMatricula INT,
    IN novoStatus VARCHAR(20)
)
BEGIN
    UPDATE aluno
    SET status_aluno = novoStatus
    WHERE nro_matricula = nroMatricula;
END$$

DELIMITER ;

#3

DELIMITER $$

CREATE PROCEDURE exibirProfessoresPorDisciplina(IN codigoDisciplina VARCHAR(15))
BEGIN
    SELECT p.nro_registro_professor, p.nome
    FROM professor p
    WHERE p.codigo_disciplina = codigoDisciplina;
END$$

DELIMITER ;

#4

DELIMITER $$

CREATE PROCEDURE inserirNovaTurma(
    IN qtdAlunos INT,
    IN periodoTurma VARCHAR(20),
    IN semestreTurma INT,
    IN statusTurma VARCHAR(20)
)
BEGIN
    DECLARE novoCodigoTurma VARCHAR(15);

    -- Gerar um código de turma baseado em data/hora atual
    SET novoCodigoTurma = CONCAT('TURMA_', UNIX_TIMESTAMP());

    INSERT INTO turma (codigo_turma, nro_alunos, periodo, status_turma)
    VALUES (novoCodigoTurma, qtdAlunos, periodoTurma, statusTurma);
END$$

DELIMITER ;


#5

DELIMITER $$

CREATE PROCEDURE atualizarEspecialidadeProfessor(
    IN codigoProfessor VARCHAR(15),
    IN novaEspecialidade VARCHAR(50)
)
BEGIN
    UPDATE professor
    SET especialidade = novaEspecialidade
    WHERE nro_registro_professor = codigoProfessor;
END$$

DELIMITER ;
