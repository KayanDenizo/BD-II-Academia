CREATE DATABASE academia;
USE academia;

-- ===========================
-- TABELA ALUNOS
-- ===========================
CREATE TABLE ALUNOS (
    Matricula      INT(11) NOT NULL,
    Nome           VARCHAR(40) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Idade          INT(4) NOT NULL,
    CPF            VARCHAR(14),
    RG_Identidade  VARCHAR(20),
    Nome_Pai       VARCHAR(40) NOT NULL,
    Nome_Mae       VARCHAR(40) NOT NULL,
    Endereco       VARCHAR(50) NOT NULL,
    Numero         INT(4) NOT NULL,
    Cidade         VARCHAR(35) NOT NULL,
    Estado         CHAR(2) NOT NULL,
    Bairro         VARCHAR(40) NOT NULL,
    Telefone       VARCHAR(30),
    Celular        VARCHAR(30),
    Chamarpor      VARCHAR(30),
    Alergia        VARCHAR(10),
    Grupo_Sangue   VARCHAR(10),
    Doador         INT(4),
    PRIMARY KEY (Matricula)
);

-- ===========================
-- TABELA PROFESSORES
-- ===========================
CREATE TABLE PROFESSORES (
    Codigo          INT(4) NOT NULL,
    Nome            VARCHAR(40) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Idade           INT(4) NOT NULL,
    CPF             VARCHAR(14) NOT NULL,
    RG_Identidade   VARCHAR(20) NOT NULL,
    CTPS            VARCHAR(30) NOT NULL,
    Graduacao       VARCHAR(25) NOT NULL,
    Estado_Civil    VARCHAR(50) NOT NULL,
    Filhos          INT(4) NOT NULL,
    Endereco        VARCHAR(35) NOT NULL,
    Numero          INT(4) NOT NULL,
    Cidade          VARCHAR(30) NOT NULL,
    Estado          CHAR(2) NOT NULL,
    Bairro          VARCHAR(25),
    Telefone        VARCHAR(25),
    Celular         VARCHAR(10),
    Grupo_Sangue    VARCHAR(10),
    Doador          INT(4),
    PRIMARY KEY (Codigo)
);

-- ===========================
-- TABELA TURMAS
-- ===========================
CREATE TABLE TURMAS (
    Codigo_Turma  INT(4) NOT NULL,
    Descricao     VARCHAR(30) NOT NULL,
    Grau          INT(4) NOT NULL,
    Serie         INT(4) NOT NULL,
    Turno         CHAR(1) NOT NULL,
    PRIMARY KEY (Codigo_Turma)
);

-- ===========================
-- TABELA MATRICULAS
-- ===========================
CREATE TABLE MATRICULAS (
    Mat_Aluno  INT(11) NOT NULL,
    Cod_Turma  INT(4) NOT NULL,
    Valor      FLOAT(9,2) NOT NULL,
    Data       DATE NOT NULL,
    PRIMARY KEY (Mat_Aluno, Cod_Turma),
    FOREIGN KEY (Mat_Aluno) REFERENCES ALUNOS(Matricula),
    FOREIGN KEY (Cod_Turma) REFERENCES TURMAS(Codigo_Turma)
);

-- ===========================
-- TABELA ALOCACOES
-- ===========================
CREATE TABLE ALOCACOES (
    Codigo_Professor_Aloca INT(4) NOT NULL,
    Codigo_Turma_Aloca     INT(4) NOT NULL,
    PRIMARY KEY (Codigo_Professor_Aloca, Codigo_Turma_Aloca),
    FOREIGN KEY (Codigo_Professor_Aloca) REFERENCES PROFESSORES(Codigo),
    FOREIGN KEY (Codigo_Turma_Aloca) REFERENCES TURMAS(Codigo_Turma)
);
