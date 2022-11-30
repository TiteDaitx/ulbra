CREATE TABLE cadastros
(
  numero_matricula INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome CHAR(50) NOT NULL,
  email CHAR(50) NOT NULL UNIQUE,
  senha_login CHAR(50)
);

CREATE TABLE projetos
(
  id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome CHAR(50) NOT NULL,
  estimativa_duracao INT NOT NULL,
  descricao TEXT NOT NULL,
  numero_matricula_cadastro INT NOT NULL,
  CONSTRAINT cadastro_coordena_projeto
  FOREIGN KEY(numero_matricula_cadastro) REFERENCES cadastros(numero_matricula)
);

CREATE TABLE melhoria_de_processo
(
  departamento CHAR(50) NOT NULL,
  resultado_esperado TEXT NOT NULL,
  id_projeto INT NOT NULL,
  CONSTRAINT categoria_do_projeto_melhoria
  FOREIGN KEY (id_projeto) REFERENCES projetos(id)
);

CREATE TABLE social
(
  publico_beneficiario CHAR(50) NOT NULL,
  id_projeto INT NOT NULL,
  CONSTRAINT categoria_do_projeto_social
  FOREIGN KEY (id_projeto) REFERENCES projetos(id)
);

CREATE TABLE colaboradores_por_projeto
(
  numero_matricula_cadastro INT NOT NULL,
  id_projeto INT NOT NULL,
  CONSTRAINT colaboradores_participam_projeto
  FOREIGN KEY(numero_matricula_cadastro) REFERENCES cadastros(numero_matricula),
  CONSTRAINT projeto_possue_colaboradores
  FOREIGN KEY(id_projeto) REFERENCES projetos(id)
);

CREATE TABLE comentarios
(
  numero_matricula_cadastro INT NOT NULL,
  id_projeto INT NOT NULL,
  id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  data_comentario DATE NOT NULL,
  horario TIME NOT NULL DEFAULT CURRENT_TIME,
  CONSTRAINT comentario_do_projeto
  FOREIGN KEY(id_projeto) REFERENCES projetos(id),
  CONSTRAINT cadastro_faz_comentarios
  FOREIGN KEY(numero_matricula_cadastro) REFERENCES cadastros(numero_matricula)
);