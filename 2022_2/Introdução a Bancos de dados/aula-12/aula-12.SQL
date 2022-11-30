create table fornecedores
(
    id int auto_increment primary key,
    codigo int not null unique, 
    nome varchar(60) not null
);

create table pedidos
(
    id int auto_increment primary key,
    quantidade int not null,
    valor_unitario float not null,
    data_pedido date not null
);

create table categorias
(
    id int auto_increment primary key,
    codigo_categoria int not null unique, 
    nome varchar(70)
);

create table produtos
(
    id int auto_increment primary key,
    codigo_produto int not null unique, 
    descricao varchar(200),
    data_cadastro date not null,
    valor_unitario float not null,
    id_categoria int not null,
        constraint categorias_fk_produtos
            foreign key(id_categoria) 
                references categorias(id)
    on delete cascade 
    on update cascade
);

create table fornecedores_tem_produtos
(
    id_fornecedor int not null,
    id_pedido int not null,
    id_produto int not null,
        constraint fornecedores_fk_fornecedores_tem_produtos
            foreign key (id_fornecedor)
                references fornecedores(id),
        constraint pedidos_fk_fornecedores_tem_produtos
            foreign key (id_pedido) 
                references pedidos(id),
        constraint produtos_fk_fornecedores_tem_produtos
            foreign key (id_produto) 
                references produtos(id)
    on delete restrict 
    on update cascade                 
);

--Atividades

alter table fornecedores 
    add column data_ultima_compra 
        date;

--ja tinha colocado data_pedido, mudei para datas_pedido
alter table pedidos 
  CHANGE COLUMN data_pedido datas_pedido 
    date;

alter table produtos 
	drop column data_cadastro;


ALTER TABLE produtos 
			ADD CONSTRAINT categorias_fk_produtos
				FOREIGN KEY(id_categoria)
					REFERENCES categorias(id)
					ON DELETE CASCADE
					ON UPDATE RESTRICT; 

--ja tinha feito com 60 caracteres alterei para no maximo 100
ALTER TABLE fornecedores
  CHANGE COLUMN nome nome
    varchar(100);

DROP TABLE fornecedores;
--Não é possível excluir ou atualizar uma linha pai: falha em uma restrição de chave estrangeira.
-- não deixa ser apagado pois é uma tabela "mae", e tem chave extrangeira em outra tabela.

ALTER TABLE pedidos 
	ADD column  numero_do_pedido varchar(40);

INSERT INTO  fornecedores ( codigo , nome )
     VALUES ( 999 , 'Monstros SA' ) ;
  
INSERT INTO  pedidos( quantidade,valor_unitario )
     VALUES (8, 7.03 );
  
ALTER TABLE produtos 
    MODIFY id int(5);


