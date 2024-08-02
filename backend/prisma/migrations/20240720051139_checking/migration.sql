/*
  Warnings:

  - You are about to drop the `Book` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[Username]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_Userid_fkey";

-- DropTable
DROP TABLE "Book";

-- CreateIndex
CREATE UNIQUE INDEX "User_Username_key" ON "User"("Username");
