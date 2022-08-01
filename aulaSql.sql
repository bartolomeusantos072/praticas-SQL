CREATE TABLE products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	description TEXT,
	"imagemURL" TEXT,
	"barCode" TEXT,
	stork INTEGER,
	price INTEGER,
	"discountPercentage" NUMERIC,
	active BOOLEAN,
	"dateAdded" DATE,
	"availableAfter" TIMESTAMP
);
CREATE DATABASE drivengram

CREATE TABLE "users" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"cpf" TEXT UNIQUE NOT NULL,
	"email" TEXT UNIQUE NOT NULL,
	"password" TEXT NOT NULL
);
CREATE TABLE posts(
	id SERIAL PRIMARY KEY,
	description TEXT,
	"imagemURL" TEXT,
	"userId" INTEGER NOT NULL REFERENCES "users"("id"),--por causa disso a tabela users deve ser criado antes de posts.
	"datePosted" DATE NOT NULL DEFAULT NOW(),
	active BOOLEAN
);
INSERT INTO products ("description","barCode")