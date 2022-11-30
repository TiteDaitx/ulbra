create table alunos (
    id int not null auto_increment primary key,
    nome varchar (100) not null
);

create table cursos (
    id int not null auto_increment primary key,
    nome varchar (100) not null,
    id_departamento int not null,
    id_aluno int not null,
    constraint alunos_cursam_cursos
    foreign key(id_aluno) references alunos(id) 
);

create table professores (
    id int not null auto_increment primary key,
    nome varchar (100) not null
);

create table disciplinas (
    id int not null auto_increment primary key,
    nome varchar (100) not null,
    id_professor int not null,
    constraint professores_ensinam_disciplinas 
    foreign key(id_professor) references professores(id) 
);

create table matriculas (
    id_disciplina int not null,
    id_aluno int not null,
    data_matricula date,
    id_disciplina int not null,
    constraint professores_ensinam_disciplinas 
    foreign key(id_disciplina) references disciplinas(id),
    id_aluno int not null,
    constraint aluno_cursan_disciplinas 
    foreign key(id_aluno) references alunos(id) 
);
