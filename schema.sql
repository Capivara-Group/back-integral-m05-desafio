DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
	id SERIAL PRIMARY KEY,
  	nome varchar(250),
  	email  varchar(150) UNIQUE,
  	cpf integer  DEFAULT NULL,
  	telefone varchar(100)  DEFAULT NULL,
  	senha text NOT NULL,
  
	created_at timestamptz default NOW()
);

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	id SERIAL PRIMARY KEY,
  	id_usuario integer,
  	nome varchar(250) NOT NULL,
  	email varchar(150) NOT NULL UNIQUE,
  	telefone varchar(100) NOT NULL,
    cpf integer  NOT NULL,
  
  	created_at timestamptz default NOW(),
  
  	foreign key (id_usuario) references usuarios (id) on delete cascade
);

DROP TABLE IF EXISTS enderecos;

CREATE TABLE enderecos (
	id SERIAL PRIMARY KEY,
  	id_cliente integer,
  	cep integer DEFAULT NULL,
  	bairro text DEFAULT NULL,
	logradouro text DEFAULT NULL,
  	complemento text DEFAULT NULL,
  	cidade text DEFAULT NULL,
  	uf varchar(2) DEFAULT NULL,
  	
 	created_at timestamptz default NOW(),

  	foreign key (id_cliente) references clientes (id) on delete cascade

);
