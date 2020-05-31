
CREATE TABLE "users" (
"id" serial8 NOT NULL,
"username" varchar(20),
"email" varchar(60),
"password" varchar(255),
"role" varchar(20) DEFAULT 'user',
"display_name" varchar(60),
"created_at" timestamp(0) DEFAULT now(),
"updated_at" timestamp(0),
PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE TABLE "foods" (
"id" serial8 NOT NULL,
"name" varchar(255),
"detail" varchar(255),
"image" varchar(100),
"price" float8,
"options" json,
"status" bool DEFAULT true,
"created_at" timestamp(0) DEFAULT now(),
"updated_at" timestamp(0),
"category_id" int4,
PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE TABLE "tables" (
"id" serial8 NOT NULL,
"code" varchar(20),
"detail" varchar(255),
"status" bool,
"created_at" timestamp(0) DEFAULT now(),
"updated_at" timestamp(0),
PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE TABLE "orders" (
"id" serial8 NOT NULL,
"table_id" int,
"status" bool DEFAULT false,
"user_id" int8,
"created_at" timestamp(0) DEFAULT now(),
"updated_at" timestamp(0),
PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE TABLE "order_items" (
"id" serial8 NOT NULL,
"order_id" int,
"food_id" int,
"price" float8,
"qty" int,
"comment" varchar(255),
"sender_time" timestamp(0),
"status" int,
"user_id" int8,
"created_at" timestamp(0) DEFAULT now(),
"updated_at" timestamp(0),
PRIMARY KEY ("id") 
)
WITHOUT OIDS;
COMMENT ON COLUMN "order_items"."user_id" IS 'user order item';

CREATE TABLE "catagories" (
"id" serial8 NOT NULL,
"category_name" varchar(60) NOT NULL,
"created_at" timestamp(0) DEFAULT now(),
"updated_at" timestamp(0),
PRIMARY KEY ("id") 
)
WITHOUT OIDS;

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_tables_1" FOREIGN KEY ("table_id") REFERENCES "tables" ("id");
ALTER TABLE "order_items" ADD CONSTRAINT "fk_order_items_orders_1" FOREIGN KEY ("order_id") REFERENCES "orders" ("id");
ALTER TABLE "order_items" ADD CONSTRAINT "fk_order_items_foods_1" FOREIGN KEY ("food_id") REFERENCES "foods" ("id");
ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_users_1" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "order_items" ADD CONSTRAINT "fk_order_items_users_1" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "foods" ADD CONSTRAINT "fk_foods_catagories_1" FOREIGN KEY ("category_id") REFERENCES "catagories" ("id");

