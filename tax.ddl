CREATE DATABASE "tax";
\c "tax"
CREATE SCHEMA "income";
CREATE TABLE "income"."exchange" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "name" text NOT NULL, PRIMARY KEY ("id"));
CREATE TABLE "income"."exchange_transaction" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "exchange_transaction_id" text NOT NULL, "exchange_id" bigserial NOT NULL REFERENCES "income"."exchange", PRIMARY KEY ("id"));
CREATE TABLE "income"."info" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "text" text NOT NULL, PRIMARY KEY ("id"));
CREATE TABLE "income"."income" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "amount" bigint NOT NULL, PRIMARY KEY ("id"));
CREATE TABLE "income"."tax" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "amount" bigint NOT NULL, PRIMARY KEY ("id"));
CREATE TABLE "income"."translation" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "tax_amount" bigint NOT NULL, "cash_amount" bigint NOT NULL, "tax_id" bigserial NOT NULL REFERENCES "income"."tax", "exchange_transaction_id" bigserial NOT NULL REFERENCES "income"."exchange_transaction", PRIMARY KEY ("id"));
CREATE TABLE "income"."item" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "description" text NOT NULL, PRIMARY KEY ("id"));
CREATE TABLE "income"."expense" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "amount" bigint NOT NULL, "item_id" bigserial NOT NULL REFERENCES "income"."item", PRIMARY KEY ("id"));
CREATE TABLE "income"."deduction" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "amount" bigint NOT NULL, "tax_id" bigserial NOT NULL REFERENCES "income"."tax", "expense_id" bigserial NOT NULL REFERENCES "income"."expense", PRIMARY KEY ("id"));
CREATE TABLE "income"."transaction" ("id" bigserial, "insert_at" timestamp DEFAULT now() NOT NULL, "item_id" bigserial NOT NULL REFERENCES "income"."item", "tax_amount" bigserial NOT NULL REFERENCES "income"."tax", "income_amount" bigserial NOT NULL REFERENCES "income"."income", "info_id" bigserial REFERENCES "income"."info", PRIMARY KEY ("id"));
