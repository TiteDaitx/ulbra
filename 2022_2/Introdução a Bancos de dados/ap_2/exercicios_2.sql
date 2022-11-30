create table pesquisadores
(
    id int not null auto_increment primary key,
    nome varchar(20) not null,
    sobrenome varchar(60) not null
);

create table artigos
(
    id int not null auto_increment primary key,
    codigo int not null unique,
    nome varchar(100) not null,
    pagina_inicial int not null,
    pagina_final int not null
);

create table publicacoes
(
    id int not null auto_increment primary key,
    titulo varchar(50) not null,
    editora varchar(50) not null
);

create table pesquisadores_artigos
(
    id int not null auto_increment primary key,
    id_pesquisadores int not null,
    id_artigos int not null,
    constraint pesquisadores_artigos_fk_pesquisadores
    foreign key(id_pesquisadores) references pesquisadores(id)
        ON DELETE restrict
        ON UPDATE cascade,
    constraint pesquisadores_artigos_fk_artigos
    foreign key(id_artigos) references artigos(id)
        ON DELETE restrict
        ON UPDATE cascade
);

create table pesquisadores_artigos_publicacoes
(
    id int not null auto_increment primary key,
    id_pesquisadores_artigos int not null,
    id_publicacoes int not null,
    constraint pesquisadores_artigos_publicacoes_fk_pesquisadores_artigos
    foreign key(id_pesquisadores_artigos) references pesquisadores_artigos(id)
        ON DELETE restrict
        ON UPDATE cascade,
    constraint pesquisadores_artigos_publicacoes_fk_feriodicos
    foreign key(id_publicacoes) references publicacoes(id)
        ON DELETE restrict
        ON UPDATE cascade
)

-- Popular tabelas
insert INTO pesquisadores (nome, sobrenome)
VALUES ('João', 'Silva'), ('Pedro', 'Oliveira'), ('Carlos', 'Santos'), ('João', 'Cardoso'), ('Daniel', 'Silva');

insert INTO artigos (codigo, nome, pagina_inicial, pagina_final)
VALUES (1230, 'Tecnologia e Escola', 11, 12), (1231, 'TI e Mercado de Trabalho', 13, 13), (1232, 'Banco de Dados', 18, 21), (1233, 'Introdução a Computação', 22, 22), (1234, 'Programação Web', 23, 27), (1235, 'Engenharia de Software', 15, 16), (1236, 'Segurança nas Redes', 35, 39);

insert INTO publicacoes (titulo, editora)
VALUES ('Publicação 1', 'Atlas'), ('Publicação 2', 'Saraiva'), ('Publicação 3', 'Moderna'), ('Publicação 4', 'Abril');

insert INTO pesquisadores_artigos (id_pesquisadores, id_artigos)
VALUES (1, 2), (2, 1), (3, 4), (1, 1), (4, 3), (2, 5), (4, 5);

insert INTO pesquisadores_artigos_publicacoes (id_pesquisadores_artigos, id_publicacoes)
VALUES (1, 1), (2, 1), (2, 4), (2, 3), (4, 2), (5, 2), (2, 2), (1, 4), (2, 3);

-- listar o artigo com código 1234
SELECT * from artigos
WHERE codigo = 1234

-- Listar os artigos da editora Saraiva.
SELECT * from publicacoes
WHERE editora = 'Saraiva'

-- Listar os pesquisadores onde o nome inicia com João.
SELECT * FROM pesquisadores
WHERE nome = 'João'