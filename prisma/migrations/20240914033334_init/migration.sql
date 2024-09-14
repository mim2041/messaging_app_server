-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('customer', 'delivery_person');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "user_type" "UserType" NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "delivery_person_id" INTEGER NOT NULL,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChatInstance" (
    "id" SERIAL NOT NULL,
    "order_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "delivery_person_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_active" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ChatInstance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChatContent" (
    "id" SERIAL NOT NULL,
    "chat_id" INTEGER NOT NULL,
    "sender_id" INTEGER NOT NULL,
    "sent_text" TEXT NOT NULL,
    "attachment" TEXT,
    "sent_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_unread" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "ChatContent_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Order_customer_id_idx" ON "Order"("customer_id");

-- CreateIndex
CREATE INDEX "Order_delivery_person_id_idx" ON "Order"("delivery_person_id");

-- CreateIndex
CREATE INDEX "ChatInstance_order_id_idx" ON "ChatInstance"("order_id");

-- CreateIndex
CREATE INDEX "ChatInstance_customer_id_idx" ON "ChatInstance"("customer_id");

-- CreateIndex
CREATE INDEX "ChatInstance_delivery_person_id_idx" ON "ChatInstance"("delivery_person_id");

-- CreateIndex
CREATE INDEX "ChatContent_chat_id_idx" ON "ChatContent"("chat_id");

-- CreateIndex
CREATE INDEX "ChatContent_sender_id_idx" ON "ChatContent"("sender_id");

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_delivery_person_id_fkey" FOREIGN KEY ("delivery_person_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatInstance" ADD CONSTRAINT "ChatInstance_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "Order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatInstance" ADD CONSTRAINT "ChatInstance_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatInstance" ADD CONSTRAINT "ChatInstance_delivery_person_id_fkey" FOREIGN KEY ("delivery_person_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatContent" ADD CONSTRAINT "ChatContent_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "ChatInstance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatContent" ADD CONSTRAINT "ChatContent_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
