/*
  Warnings:

  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "User" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- CreateTable
CREATE TABLE "Book" (
    "BookId" SERIAL NOT NULL,
    "Title" TEXT NOT NULL,
    "Price" INTEGER NOT NULL,
    "Author" TEXT NOT NULL,
    "Userid" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Book_pkey" PRIMARY KEY ("BookId")
);

-- CreateIndex
CREATE INDEX "Book_Userid_idx" ON "Book"("Userid");

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_Userid_fkey" FOREIGN KEY ("Userid") REFERENCES "User"("Id") ON DELETE RESTRICT ON UPDATE CASCADE;
