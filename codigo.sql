/* logico monitoria: */

CREATE TABLE Aluno (
    Periodo int(3),
    cod_disciplina int(10),
    Codigo int(30) PRIMARY KEY,
    Nome_Completo varchar(250),
    Matricula int(10),
    E_mail varchar(50),
    situacao varchar(20)
);

CREATE TABLE Disciplina (
    Nome varchar(50),
    Codigo int(10) PRIMARY KEY,
    cod_curso int(10),
    fk_Aluno_Codigo int(30),
    fk_Administrador_Codigo int(10)
);

CREATE TABLE Curso (
    Nome varchar(50),
    Codigo int(10) PRIMARY KEY,
    fk_Administrador_Codigo int(10)

);

CREATE TABLE Administrador (
    Senha int(10),
    Login varchar(100),
    Codigo int(10) PRIMARY KEY
);

CREATE TABLE Professor (
    Nome varchar(250),
    Telefone int(15),
    Siape int(10),
    E_mail varchar(250),
    Codigo int(10) PRIMARY KEY
);

CREATE TABLE administrador_curso (
    fk_Disciplina_Codigo int(10),
    fk_Curso_Codigo int(10)
);

CREATE TABLE professor_disciplina (
    fk_Professor_Codigo int(10),
    fk_Disciplina_Codigo int(10)
);
 
ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_2
    FOREIGN KEY (fk_Aluno_Codigo)
    REFERENCES Aluno (Codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_3
    FOREIGN KEY (fk_Administrador_Codigo)
    REFERENCES Administrador (Codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Curso ADD CONSTRAINT FK_Curso_2
    FOREIGN KEY (fk_Administrador_Codigo)
    REFERENCES Administrador (Codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE administrador_curso ADD CONSTRAINT FK_administrador_curso_1
    FOREIGN KEY (fk_Disciplina_Codigo)
    REFERENCES Disciplina (Codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE administrador_curso ADD CONSTRAINT FK_administrador_curso_2
    FOREIGN KEY (fk_Curso_Codigo)
    REFERENCES Curso (Codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE professor_disciplina ADD CONSTRAINT FK_professor_disciplina_1
    FOREIGN KEY (fk_Professor_Codigo)
    REFERENCES Professor (Codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE professor_disciplina ADD CONSTRAINT FK_professor_disciplina_2
    FOREIGN KEY (fk_Disciplina_Codigo)
    REFERENCES Disciplina (Codigo)
    ON DELETE SET NULL;