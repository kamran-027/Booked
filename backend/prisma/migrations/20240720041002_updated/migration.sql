/*
  Warnings:

  - The primary key for the `Book` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `author` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the column `bookId` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the column `bookName` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the column `price` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the column `userid` on the `Book` table. All the data in the column will be lost.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `password` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `username` on the `User` table. All the data in the column will be lost.
  - Added the required column `Author` to the `Book` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Price` to the `Book` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Title` to the `Book` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Userid` to the `Book` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Name` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Password` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Username` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_userid_fkey";

-- AlterTable
ALTER TABLE "Book" DROP CONSTRAINT "Book_pkey",
DROP COLUMN "author",
DROP COLUMN "bookId",
DROP COLUMN "bookName",
DROP COLUMN "price",
DROP COLUMN "userid",
ADD COLUMN     "Author" TEXT NOT NULL,
ADD COLUMN     "BookId" SERIAL NOT NULL,
ADD COLUMN     "Price" INTEGER NOT NULL,
ADD COLUMN     "Title" TEXT NOT NULL,
ADD COLUMN     "Userid" INTEGER NOT NULL,
ADD CONSTRAINT "Book_pkey" PRIMARY KEY ("BookId");

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
DROP COLUMN "id",
DROP COLUMN "name",
DROP COLUMN "password",
DROP COLUMN "username",
ADD COLUMN     "Id" SERIAL NOT NULL,
ADD COLUMN     "Name" TEXT NOT NULL,
ADD COLUMN     "Password" TEXT NOT NULL,
ADD COLUMN     "Username" TEXT NOT NULL,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("Id");

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_Userid_fkey" FOREIGN KEY ("Userid") REFERENCES "User"("Id") ON DELETE RESTRICT ON UPDATE CASCADE;
