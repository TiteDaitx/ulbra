-- Criar uma bd relacional que controla:
postagens (id, titulo, data)
mensagens(id, descricao, id_postagem)
Delete cascade 
Update restrict

-- fazer curds (insert, update, delete, select)

create table postagens(
    id_postagem int auto_increment primary key, 
    titulo varchar(30), 
    data date
);

create table mensagens(
    id_mensagem int auto_increment primary key, 
    descricao varchar(100), 
    id_postagem int not null,
        constraint postagens_fk_mensagens
            foreign key (id_postagem) references postagens(id_postagem)
            on delete cascade
            on update restrict
);

-- comandos

insert into mensagens (descricao)
	VALUES ('OLÁ EU SOU MATHIAS');
    
insert into postagens (titulo, data)
	VALUES ('TITULO 1', '2022-10-23');
     
SELECT* FROM mensagens;
SELECT* FROM postagens;

alter table mensagens drop FOREIGN key postagens_fk_mensagens;
alter table mensagens add constraint postagens_fk_mensagens
						foreign key (id_postagem) references postagens(id_postagem)
            			on delete restrict
           				on update cascade;

update postagens set titulo = 'titulo 2' where id_postagem =2; 

 delete from postagens where id_postagem = 1 ;
 
 delete from postagens;
 
 delete from mensagens;
