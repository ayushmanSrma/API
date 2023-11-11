-- CreateEnum
CREATE TYPE "UPDATE_STATUS" AS ENUM ('IN_PROGRESS', 'LIVE', 'DEPRECATED', 'ARCHIVED');

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "useId" TEXT,
    "userId" TEXT,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "update" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "asset" TEXT NOT NULL,
    "productId" TEXT,

    CONSTRAINT "update_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "updatePoint" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "body" VARCHAR(255) NOT NULL,
    "updateId" TEXT,

    CONSTRAINT "updatePoint_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_name_key" ON "user"("name");

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "update" ADD CONSTRAINT "update_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "updatePoint" ADD CONSTRAINT "updatePoint_updateId_fkey" FOREIGN KEY ("updateId") REFERENCES "update"("id") ON DELETE SET NULL ON UPDATE CASCADE;
