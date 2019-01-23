CREATE DATABASE "tax";
\c "tax"
CREATE SCHEMA "income";
CREATE TABLE "income"."info" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "text" text NOT NULL, PRIMARY KEY ("id"));
CREATE TABLE "income"."income" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "amount" bigint NOT NULL, PRIMARY KEY ("id"));
CREATE TABLE "income"."tax" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "amount" bigint NOT NULL, PRIMARY KEY ("id"));
CREATE TABLE "income"."item" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "description" text NOT NULL, PRIMARY KEY ("id"));
CREATE TABLE "income"."expense" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "amount" bigint NOT NULL, "item_id" bigserial NOT NULL REFERENCES "income"."item", PRIMARY KEY ("id"));
CREATE TABLE "income"."deduction" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "amount" bigint NOT NULL, "tax_id" bigserial NOT NULL REFERENCES "income"."tax", "expense_id" bigserial NOT NULL REFERENCES "income"."expense", PRIMARY KEY ("id"));
CREATE TABLE "income"."transaction" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "item_id" bigserial NOT NULL REFERENCES "income"."item", "tax_amount" bigserial NOT NULL REFERENCES "income"."tax", "income_amount" bigserial NOT NULL REFERENCES "income"."income", "info_id" bigserial REFERENCES "income"."info", PRIMARY KEY ("id"));