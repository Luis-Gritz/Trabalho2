drop database Aula;

create database Aula;
use Aula;

create table curso(
id int not null auto_increment primary key, 
nome varchar(30) not null
);

create table aluno(
id int not null auto_increment primary key, 
ra varchar(30) not null, 
cursoID int not null,
nome varchar(30) not null, 
sobrenome varchar(50) not null,
email varchar(50) not null,
nota1 decimal(4,2) default 0.0, 
nota2 decimal(4,2) default 0.0, 
nota3 decimal(4,2) default 0.0,
constraint FK_Curso FOREIGN KEY (cursoID) REFERENCES curso(id)
);  


create table professor(
id int not null auto_increment primary key, 
ra varchar(30) not null, 
nome varchar(30) not null, 
sobrenome varchar(50) not null,
email varchar(50) not null
);

create table disciplina(
id int not null auto_increment primary key, 
nome varchar(50) not null,
cursoID int,

constraint FK_CursoDisciplina FOREIGN KEY (cursoID) REFERENCES curso(id)
);

create table turma(
id int not null auto_increment primary key, 
nome varchar(15) not null,
professorID int,
disciplinaID int,
constraint FK_Professor FOREIGN KEY (professorID) REFERENCES professor(id),
constraint FK_Disciplina FOREIGN KEY (disciplinaID) REFERENCES disciplina(id)
);

create table alunosTurma(
turmaID int,
alunoID int, 
constraint FK_Turma FOREIGN KEY (turmaID) REFERENCES turma(id),
constraint FK_Aluno FOREIGN KEY (alunoID) REFERENCES aluno(id)
);

create table endereco(
id int not null primary key, 
logradouro varchar(30) not null, 
bairro varchar(30), 
cidade varchar(30), 
estado varchar(30),
cep varchar(10),
constraint FK_AlunoEndereco FOREIGN KEY (id) REFERENCES aluno(id) ON DELETE CASCADE ON UPDATE CASCADE
);

insert into curso (nome) values ('TDS');
insert into curso (nome) values ('TGI');

insert into disciplina (nome, cursoID) values ('Desenvolvimento Java', 1);
insert into disciplina (nome, cursoID) values ('Javascript', 1);
insert into disciplina (nome, cursoID) values ('Banco de Dados', 1);
insert into disciplina (nome, cursoID) values ('Gestão da Informação', 2);

insert into aluno (ra, cursoID, nome, sobrenome, email, nota1, nota2, nota3) values ('2018123', 1, 'João', 'Siqueira', 'joao@gmail.com', 7.2, 7.5, 8.9);
insert into aluno (ra, cursoID, nome, sobrenome, email, nota1, nota2, nota3) values ('2017823', 1, 'Emanoel', 'Ferreira', 'emanoel@gmail.com', 6.4, 6.7, 2.9);
insert into aluno (ra, cursoID, nome, sobrenome, email, nota1, nota2, nota3) values ('2019667', 2, 'José', 'Silva', 'silva@hotmail.com', 1.4, 6.8, 9.0);
insert into aluno (ra, cursoID, nome, sobrenome, email, nota1, nota2, nota3) values ('2015678', 1, 'Leticia', 'Freitas', 'leticia@gmail.com', 10.00, 4.7, 2.2);

insert into endereco (id, logradouro) values (1, 'Rua ABC');
insert into endereco (id, logradouro) values (2, 'Rua XYZ');
insert into endereco (id, logradouro) values (3, 'Rua Nova');
insert into endereco (id, logradouro) values (4, 'Rua Teste');

insert into professor (ra, nome, sobrenome, email) values ('ABC123', 'Batista', 'de Souza', 'batista@uni.edu.br');
insert into professor (ra, nome, sobrenome, email) values ('ABC125', 'Joaquim', 'de Souza', 'souza@uni.edu.br');
insert into professor (ra, nome, sobrenome, email) values ('ABC163', 'Rui', 'Barbosa', 'barbosa@uni.edu.br');
insert into professor (ra, nome, sobrenome, email) values ('ABC73', 'Deodoro', 'Fonseca', 'fonseca@uni.edu.br');

insert into turma (nome) values ('teste1');
insert into turma (nome) values ('teste2');
insert into turma (nome) values ('teste3');
insert into turma (nome) values ('teste4');