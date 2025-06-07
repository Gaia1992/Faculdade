create database faculdades;
use faculdades;
create table tbl_aluno (
id int not null primary key auto_increment,
nome varchar (45) not null,
matricula varchar(45) not null,
data_nascimento date not null,
unique index (id)
);
create table tbl_telefone (
id int not null primary key auto_increment,
telefone varchar (15) not null,
id_aluno int not null,
constraint Fk_aluno_telefone
foreign key (id_aluno)
references tbl_aluno (id),
unique index(id)
);
create table tbl_email (
id int not null primary key auto_increment,
email varchar(245) not null,
id_aluno int not null,
constraint fk_aluno_email
foreign key (id_aluno)
references tbl_aluno (id),
unique index (id)
);
create table tbl_endereco (
id int not null primary key auto_increment,
cep varchar(8) not null,
bairro varchar (45) not null,
rua varchar (45) not null,
logradouro varchar (45) not null,
pais varchar (45) not null,
id_aluno int not null,
constraint fk_aluno_endereco
foreign key (id_aluno)
references tbl_aluno (id),
unique index (id)
);
create table tbl_professor (
id int not null primary key auto_increment,
nome varchar (45) not null,
formacao varchar(45) not null,
area_atuacao varchar (45) not null,
codigo varchar (45)not null,
unique index (id)
);
create table tbl_turma (
id int not null primary key auto_increment,
codigo varchar(45) not null,
curso varchar (45) not null,
periodo varchar(45) not null,
data_inicio date not null,
professor varchar (45) not null,
id_aluno int not null,
id_professor int not null,
constraint fk_aluno_turma
foreign key (id_aluno)
references tbl_aluno (id),
constraint fk_professor_turma
foreign key(id_professor)
references tbl_professor (id),
unique index (id)
);
create table tbl_materia (
id int not null primary key auto_increment,
nome varchar (45) not null,
codigo varchar (45) not null,
descricao varchar (45) not null,
provessor_responsavel varchar (45) not null,
carga_horaria time,
id_aluno int not null,
id_professor int not null,
id_turma int not null,
constraint fk_aluno_materia
foreign key (id_aluno)
references tbl_aluno (id),
constraint fk_professor_materia
foreign key (id_professor)
references tbl_professor (id),
constraint fk_Materia_turma
foreign key (id_turma)
references tbl_turma (id),
unique index (id)
);
create table tbl_curso (
id int not null primary key auto_increment,
nome varchar (45) not null,
codigo varchar(45) not null,
descriacao varchar (45) not null,
carga_horaria time not null,
id_aluno int not null,
id_materia int not null,
constraint fk_aluno_curso
foreign key (id_aluno)
references tbl_aluno (id),
constraint fk_materia_curso
foreign key (id_materia)
references tbl_materia (id),
unique index (id)
);
create table tbl_nota (
id int not null primary key auto_increment,
nota varchar(45) not null,
aluno varchar (45) not null,
materia varchar (45) not null,
turma varchar (45) not null,
data_avaliacao date not null,
id_aluno int not null,
id_curso int not null,
id_professor int not null,
constraint fk_aluno_nota
foreign key (id_aluno)
references tbl_aluno (id),
constraint fk_curso_nota
foreign key (id_curso)
references tbl_curso (id),
constraint fk_professor_nota
foreign key (id_professor)
references tbl_professor (id),
unique index (id)
);
show table status