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

create table softwares (
    id int not null  auto_increment primary key,
    nome varchar (100) not null,
     id_disciplina int not null,
    constraint disciplinas_usamm_softwares
    foreign key(id_disciplina) references disciplinas(id) 
);

create table disciplinas_tem_softwares(
    id_disciplina int not null,
    id_software int not null,
    constraint fk_disciplinas_disciplinas_tem_softwares
    foreign key(id_disciplina) references disciplinas(id), 
    constraint fk_software_disciplinas_tem_softwares
    foreign key(id_software) references softwares(id)
)