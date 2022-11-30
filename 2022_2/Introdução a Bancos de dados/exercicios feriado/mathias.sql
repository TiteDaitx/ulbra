CREATE TABLE categorias
(
  codigo INT not null AUTO_INCREMENT PRIMARY KEY,
  nome CHAR(50) NOT NULL UNIQUE
);

CREATE TABLE produtos
(
  codigo INT not null AUTO_INCREMENT PRIMARY KEY,
  descricao varchar(100),
  data_cadastro DATE NOT NULL,
  valor_unitario decimal(18,2) NOT NULL,
  codigo_categoria INT NOT NULL,
  CONSTRAINT categorias_fk_produtos
    FOREIGN KEY(codigo_categoria) REFERENCES categorias(codigo)
    ON DELETE restrict
    ON UPDATE cascade
);

CREATE TABLE fornecedores
(
  codigo INT not null AUTO_INCREMENT PRIMARY KEY,
  nome CHAR(50) NOT NULL UNIQUE
);

CREATE TABLE pedidos
(
  codigo int not null auto_increment PRIMARY KEY,
  data_pedido DATE NOT NULL,
  codigo_fornecedor INT NOT NULL,
  CONSTRAINT pedido_por_fornecedor
    FOREIGN KEY(codigo_fornecedor) REFERENCES fornecedores(codigo)
    ON DELETE restrict
    ON UPDATE cascade
);

CREATE TABLE pedido_itens
(
  id int not null auto_increment primary key,
  codigo_pedido INT NOT NULL,
  codigo_produto INT NOT NULL,
  quantidade decimal(12,3) default 0,
  valor_unitario decimal(18,2) NOT NULL default 0,
    CONSTRAINT pedidos_itens_fk_pedidos
        FOREIGN KEY(codigo_pedido) REFERENCES pedidos(codigo)
        ON DELETE restrict
        ON UPDATE cascade,
    CONSTRAINT produtos_fk_pedidos_itens
        FOREIGN KEY(codigo_produto) REFERENCES produtos(codigo)
        ON DELETE restrict
        ON UPDATE cascade
);


-- Inserir produtos 
insert into produtos (descricao, data_cadastro, valor_unitario,codigo_categoria) 
    value('shampoo','2022-11-15', 9.99,1),
         ('pasta de dente ','2022-11-15', 5.75,1),
         ('condicionador','2022-11-15', 8.99,1),
         ('pilhas','2022-11-15', 10.99,2);
         
         select * from produtos;

-- Inserir categorias 
 insert into categorias (nome) 
    value('higiene'),
         ('eletronicos'),
         ('material escolar');
         
         select * from categorias;

 -- Inserir Fornecedores  
insert into fornecedores (nome) 
    value('Distribuidora litoral'),
         ('Atacados ShopMix'),
         ('Sul Atacadista');
         
         select * from fornecedores;   

-- Inserir Pedidos  
insert into pedidos (data_pedido, codigo_fornecedor) 
    value('2022-11-05',2),
         ('2022-11-10',3),
         ('2022-11-15',1);
         
         select * from pedidos;
         
-- Inserir Pedidos_itens
 insert into pedido_itens(quantidade, valor_unitario,codigo_pedido, codigo_produto) 
    value(300,5.75,1,2),
         (250,10.99,2,4),
         (150,8.99,3,3);
         
         select * from pedido_itens;   


--Questão 1 
select *
        from produtos
               order by descricao ASC;

--Questão 2
select  p.descricao,f.nome as nome_fornecedor, pp.codigo as codigo_fornecedor
        from produtos p,pedidos pp, fornecedores f
             where p.codigo = pp.codigo = f.codigo;
--Questão 3
select  p.descricao,c.nome as nome_categoria
        from pedido_itens pi, produtos p,categorias c
             where pi.id = p.codigo = c.codigo ;

--Questão 4
select f.nome as nome_fornecedor,p.data_pedido,pd.descricao as nome_produto
        from fornecedores f, pedidos p,pedido_itens pi, produtos pd
             where p.codigo = f.codigo and pi.id = p.codigo;
-- (não consegui finalizar esta )



