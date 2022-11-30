create table socios (
    id_socio int auto_increment primary key, 
    codigo_socio varchar (10) not null,
    nome varchar (50) not null,
    telefone varchar (20) not null,
    endereco varchar (100) not null
);

create table servicos (
    id_servico int auto_increment primary key, 
    codigo_servico varchar (10) not null,
    descricao varchar (200) not null,
    valor_servico decimal (18.2) not null
);

create table pedidos_servicos (
    id_pedido int auto_increment primary key,
    valor_pedido decimal (18.2) not null,
    data_pedido date not null,
    id_socio int,
    id_servico int,
    constraint socios_fk_pedidos_servicos
        foreign key (id_socio) references socios(id_socio)
        on delete restrict
        on update cascade,
    constraint servicos_fk_pedidos_servicos
        foreign key (id_servico) references servicos(id_servico)
        on delete restrict
        on update cascade
);

-- inserts tabela socios

insert into socios(codigo_socio, nome, telefone, endereco)
     values(345, 'Marcos', '36672030','Rua Barão do Rio Branco');

insert into socios(codigo_socio, nome, telefone, endereco)
     values(678, 'Marcio', '36673040','Av Castelo Branco');

insert into socios(codigo_socio, nome, telefone, endereco)
     values(91011, 'Marcia', '36673050','Av Ipiranga');

select* from socios;

-- inserts tabela serviços

insert into servicos(codigo_servico, descricao, valor_servico )
     values(123, 'serviço instalação eletrica', 300);

insert into servicos(codigo_servico, descricao, valor_servico )
     values(456, 'serviço de hidraulica', 2500);

insert into servicos(codigo_servico, descricao, valor_servico)
     values(789, 'serviço de marcenaria', 1500);

select* from servicos;

-- inserts tabela pedidos_serviços

insert into pedidos_servicos(valor_pedido, data_pedido)
     values(1500.00, '2020-01-20');
insert into pedidos_servicos(valor_pedido, data_pedido)
     values(3500.00, '2020-08-10');
insert into pedidos_servicos(valor_pedido, data_pedido)
     values(5500.00, '2021-10-25');

select* from pedidos_servicos;

-- comandos

--Listar os serviços onde o valor pago é maior que 500

SELECT*from servicos WHERE valor_servico > 500;

--Listar os pedidos onde o mês de referência é janeiro de 2020

SELECT*from pedidos_servicos WHERE data_pedido = '2020-01-20';

--Listar os sócios que moram na rua que tem o nome Barão do Rio Branco

SELECT* from socios WHERE endereco = 'Rua Barão do Rio Branco';

