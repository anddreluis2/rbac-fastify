/*
  Warnings:

  - You are about to drop the column `(user_id)` on the `organizations` table. All the data in the column will be lost.
  - You are about to drop the column `(user_id)` on the `projects` table. All the data in the column will be lost.
  - Added the required column `(owner_id)` to the `organizations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `(owner_id)` to the `projects` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "organizations" DROP CONSTRAINT "organizations_(user_id)_fkey";

-- DropForeignKey
ALTER TABLE "projects" DROP CONSTRAINT "projects_(user_id)_fkey";

-- AlterTable
ALTER TABLE "organizations" DROP COLUMN "(user_id)",
ADD COLUMN     "(owner_id)" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "projects" DROP COLUMN "(user_id)",
ADD COLUMN     "(owner_id)" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "organizations" ADD CONSTRAINT "organizations_(owner_id)_fkey" FOREIGN KEY ("(owner_id)") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_(owner_id)_fkey" FOREIGN KEY ("(owner_id)") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
