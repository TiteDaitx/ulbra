--1
create database execicios_BD;


create table editoras (
id_editora int auto_increment primary key,
nome varchar (40) not null
);
create table assuntos (
sigla char (1) primary key,
descricao varchar(40) not null
);

create table livros (
id_livro int auto_increment primary key,
titulo varchar(80) not null,
preco double not null,
lancamento date not null,
id_editora int,
sigla char,
constraint editoras_fk_livros
            foreign key (id_editora)
                references editoras(id_editora),
            foreign key (sigla)
                references assuntos(sigla)
on delete restrict
on update cascade
);
create table autores (
matricula int auto_increment primary key,
nome varchar(40) not null,
cpf varchar (11) not null,
endereco varchar(50) not null,
data_nascimento date,
nacionalidade varchar (30),
);

create table autores_livros (
matricula int, 
id_livro int,
constraint autores_fk_autores_livros
            foreign key (matricula)
                references autores(matricula),
constraint livros_fk_autores_livros
            foreign key (id_livro)
                references livros(id_livro)
on delete restrict
on update cascade
);

--2 
    --a) Monte comandos de inclusão das tabelas do Banco de dados Criado de acordo com os dados das tabelas abaixo:

insert into editoras (nome) 
    value('Mirandela Editora'),
         ('Editora Via-Norte '),
         ('Editora Ilhas Tijucas'),
         ('Maria José Editora');
         
select * from editoras;

insert into assuntos (sigla, descricao) 
    value('B','Banco de Dados'),
         ('P','Programação'),
         ('R','Redes'),
         ('S','Sistemas Operacionais');
         
select * from assuntos;

insert into livros (titulo,preco,lancamento,sigla,id_editora) 
    value('Bancos de dados para Web',31.20,'1999-01-10','B',1),
         ('Programando em linguagem C',30.00,'1997-10-01','P',1),
         ('Programando em linguagem C++',111.50,'1998-11-01','P',3),
         ('Bancos de dados na BioInformatica',48.00,'2000-09-10','B',2),
         ('Redes de Computadores',42.00, '1996-09-01','R',2);
         
select * from livros;

insert into autores (nome,cpf,endereco,data_nascimento,nacionalidade) 
    value('Roberto Gomes',333444555,'Rua 3, numero 4 - Porto Alegre','1989-01-10','Brasileiro'),
         ('Sergio Ramos',777888999,'Rua 5, numero 101 - Porto','1979-11-17','Portugues'),
         ('Raul Peixoto',666555444,'Rua 10, numero 200 - Lisboa', '1985-09-27','Portugues'),
         ('Silvio Dantas', 222333444,'Rua 30, numero 78 - New York', '1988-08-17','Americano');
         
select * from autores;

--3
    --a) Monte um comando para excluir da tabela livros aqueles que possuem o código maior ou igual a 2, que possuem o preço maior que R$ 50,00 e que já foram lançados.
        delete 
            from livros
                where id_livro >=2 and preco > 50,00 and lancamento < '2022-11-22';

                select*from livros

    --b) Escreva o comando que seleciona as colunas NOME, CPF e ENDERECO, da tabela AUTOR, para aqueles que possuem a palavra ‘joão’ no nome.
        select nome, cpf, endereco
            from autores
                where nome like "%João%";

    --c) Excluir o livro cujo título é ‘BANCO DE DADOS DISTRIBUÍDO’ ou ‘BANCOS DE DADOS DISTRIBUÍDOS’. Somente essas duas opções devem ser consideradas.

    --d) Selecione o nome e o CPF de todos os autores que nasceram após 01 de janeiro de 1990.
        SELECT nome,cpf 
            FROM autores 
                WHERE data_nascimento BETWEEN '1990-01-02' AND '2022-11-22';

    --e) Selecione a matrícula e o nome dos autores que possuem RIO DE JANEIRO no seu endereço.
        SELECT matricula, nome
            FROM autores 
                WHERE endereco LIKE '%Rio de Janeiro%';


    --f) Atualize para zero o preço de todos os livros onde a data de lançamento for nula ou onde seu preço atual for inferior a R$ 55,00.
        SELECT preco,preco = 00.00 AS novo_preco
                FROM livros
                    WHERE lancamento = '0000-00-00' || preco < 55.00;

    --g) Exclua todos os livros onde o assunto for diferente de ‘S’, ‘P’, ou ‘B’.

    --h) Escreva o comando para contar quantos são os autores cadastrados na tabela AUTORES.
        SELECT COUNT(*)
            FROM autores;

    --i) Escreva o comando que apresenta qual o número médio de autores de cada livro. Você deve utilizar, novamente, a tabela AUTOR_LIVRO
        SELECT avg(matricula)
            FROM autores_livros;

    --j) Apresente o comando SQL para gerar uma listagem dos códigos dos livros que possuem a menos dois autores.
        SELECT id_livro, matricula
            FROM livros, autores
                WHERE livros.id_livro > 1 and autores.matricula > 1;

    --k) Escreva o comando para apresentar o preço médio dos livros por código de editora. Considere somente aqueles que custam mais de R$ 45,00.
        SELECT avg(preco) 
            FROM livros 
                WHERE preco > 45.00;
    --l) Apresente o preço máximo, o preço mínimo e o preço médio dos livros cujos assuntos são ‘S’ ou ‘P’ ou ‘B’, para cada código de editora.
        SELECT max(preco), min(preco), avg(preco), id_assunto
            FROM livros
                WHERE id_assunto like '%P%' or id_assunto LIKE '%B%' or id_assunto like '%S%';

    --m) Altere o comando do exercício anterior para só considerar os livros que já foram lançados (data de lançamento inferior a data atual) e cujo o preço máximo é inferior a R$ 100,00.
        SELECT preco, lancamento 
            FROM livros
                WHERE lancamento < '2022-11-22' and preco < 100.00;

--4
    --a)Estão sendo estudados aumentos nos preços dos livros. 
    --Escreva o comando SQL que retorna uma listagem contendo o titulo dos livros,
    -- e mais três colunas: uma contendo os preços dos livros acrescidos de 10% (deve ser chamada de ‘Opção_1’), 
    -- a segunda contendo os preços acrescidos de 15% (deve ser chamada de ‘Opção_2’) e a terceira contendo os preços dos livros acrescidos de 20% (deve ser chamada de ‘Opção_3’).
    --Somente devem ser considerados livros que já tenham sido lançados.

    --b)Escreva o comando SQL que apresenta uma listagem contendo o código da editora,
     --o nome da editora, a sigla do assunto e o titulo dos livros que já foram lançados.
     --Os dados devem estar em ordem decrescente de preço, e ascendente de código da editora e de título do livro.

    --c)Escreva o comando que apresente uma listagem dos nomes dos autores e do seu ano e mês de 
    --nascimento, para os autores brasileiros e que tem livros ainda não lançados. A listagem deve estar
    --ordenada em ordem crescente de nome.

    --d)Escreva o comando que retorna o nome dos autores e o título dos livros de sua autoria. A listagem 
    --deve estar ordenada pelo nome do autor, mostrar somente os livros já lançados.

    --e)Monte a consulta SQL que retorna as editoras que publicaram livros escritos pela autora 'Ana da Silva'

    --f)FUS (faça um SQL) que apresente o título do livro e o nome da editora que o publica para todos os
    --livros que custam menos que 50 reais.

    --g)FUS que apresente o CPF, nome do autor e o preço máximo dos livros de sua autoria. Apresente 
    --somente as informações para os autores cujo preço máximo for superior a 50.

    
    