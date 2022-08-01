CREATE TABLE "public.Categories" (
	"idCategory" serial NOT NULL,
	"description" varchar(255) NOT NULL,
	CONSTRAINT "Categories_pk" PRIMARY KEY ("idCategory")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Sales" (
	"idSales" serial NOT NULL,
	"data" DATE NOT NULL,
	"formPayment" varchar(200) NOT NULL,
	"parcel" integer NOT NULL,
	"note" varchar(2000) NOT NULL,
	"sellerId" integer NOT NULL,
	"clientId" integer NOT NULL,
	CONSTRAINT "Sales_pk" PRIMARY KEY ("idSales")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Clothes" (
	"idClothes" serial NOT NULL,
	"nome" varchar(255) NOT NULL,
	"qtdStock" integer NOT NULL,
	"tamanho" varchar(255) NOT NULL,
	"custo" money NOT NULL,
	"preco" money NOT NULL,
	"providerId" integer NOT NULL,
	CONSTRAINT "Clothes_pk" PRIMARY KEY ("idClothes")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Sellers" (
	"idSeller" serial NOT NULL,
	"name" varchar(200) NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"phone" varchar(50) NOT NULL UNIQUE,
	"email" varchar(200) NOT NULL UNIQUE,
	CONSTRAINT "Sellers_pk" PRIMARY KEY ("idSeller")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Clients" (
	"idClient" serial NOT NULL,
	"name" varchar(200) NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"phone" varchar(50) NOT NULL UNIQUE,
	"email" varchar(200) NOT NULL UNIQUE,
	CONSTRAINT "Clients_pk" PRIMARY KEY ("idClient")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Providers" (
	"idProvider" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE,
	"phone" varchar(50) NOT NULL UNIQUE,
	"email" varchar(200) NOT NULL UNIQUE,
	"site" varchar(200) NOT NULL UNIQUE,
	CONSTRAINT "Providers_pk" PRIMARY KEY ("idProvider")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Sales_Clothes" (
	"idSalesClothes" serial NOT NULL,
	"salesId" integer NOT NULL,
	"clothesId" integer NOT NULL,
	CONSTRAINT "Sales_Clothes_pk" PRIMARY KEY ("idSalesClothes")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Clothes_Categories" (
	"idClothesCategories" serial NOT NULL,
	"clotheId" integer NOT NULL,
	"categoryId" integer NOT NULL,
	CONSTRAINT "Clothes_Categories_pk" PRIMARY KEY ("idClothesCategories")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Sales" ADD CONSTRAINT "Sales_fk0" FOREIGN KEY ("sellerId") REFERENCES "Sellers"("idSeller");
ALTER TABLE "Sales" ADD CONSTRAINT "Sales_fk1" FOREIGN KEY ("clientId") REFERENCES "Clients"("idClient");

ALTER TABLE "Clothes" ADD CONSTRAINT "Clothes_fk0" FOREIGN KEY ("providerId") REFERENCES "Providers"("idProvider");




ALTER TABLE "Sales_Clothes" ADD CONSTRAINT "Sales_Clothes_fk0" FOREIGN KEY ("salesId") REFERENCES "Sales"("idSales");
ALTER TABLE "Sales_Clothes" ADD CONSTRAINT "Sales_Clothes_fk1" FOREIGN KEY ("clothesId") REFERENCES "Clothes"("idClothes");

ALTER TABLE "Clothes_Categories" ADD CONSTRAINT "Clothes_Categories_fk0" FOREIGN KEY ("clotheId") REFERENCES "Clothes"("idClothes");
ALTER TABLE "Clothes_Categories" ADD CONSTRAINT "Clothes_Categories_fk1" FOREIGN KEY ("categoryId") REFERENCES "Categories"("idCategory");









