/*
  Warnings:

  - You are about to drop the column `(avatar_url)` on the `organizations` table. All the data in the column will be lost.
  - You are about to drop the column `(created_at)` on the `organizations` table. All the data in the column will be lost.
  - You are about to drop the column `(owner_id)` on the `organizations` table. All the data in the column will be lost.
  - You are about to drop the column `(should_attach_users_by_domain)` on the `organizations` table. All the data in the column will be lost.
  - You are about to drop the column `(updated_at)` on the `organizations` table. All the data in the column will be lost.
  - You are about to drop the column `(avatar_url)` on the `projects` table. All the data in the column will be lost.
  - You are about to drop the column `(created_at)` on the `projects` table. All the data in the column will be lost.
  - You are about to drop the column `(organization_id)` on the `projects` table. All the data in the column will be lost.
  - You are about to drop the column `(owner_id)` on the `projects` table. All the data in the column will be lost.
  - You are about to drop the column `(updated_at)` on the `projects` table. All the data in the column will be lost.
  - Added the required column `owner_id` to the `organizations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `organizations` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organization_id` to the `projects` table without a default value. This is not possible if the table is not empty.
  - Added the required column `owner_id` to the `projects` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `projects` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "organizations" DROP CONSTRAINT "organizations_(owner_id)_fkey";

-- DropForeignKey
ALTER TABLE "projects" DROP CONSTRAINT "projects_(organization_id)_fkey";

-- DropForeignKey
ALTER TABLE "projects" DROP CONSTRAINT "projects_(owner_id)_fkey";

-- AlterTable
ALTER TABLE "organizations" DROP COLUMN "(avatar_url)",
DROP COLUMN "(created_at)",
DROP COLUMN "(owner_id)",
DROP COLUMN "(should_attach_users_by_domain)",
DROP COLUMN "(updated_at)",
ADD COLUMN     "avatar_url" TEXT,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "owner_id" TEXT NOT NULL,
ADD COLUMN     "should_attach_users_by_domain" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "projects" DROP COLUMN "(avatar_url)",
DROP COLUMN "(created_at)",
DROP COLUMN "(organization_id)",
DROP COLUMN "(owner_id)",
DROP COLUMN "(updated_at)",
ADD COLUMN     "avatar_url" TEXT,
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "organization_id" TEXT NOT NULL,
ADD COLUMN     "owner_id" TEXT NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL;

-- AddForeignKey
ALTER TABLE "organizations" ADD CONSTRAINT "organizations_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_organization_id_fkey" FOREIGN KEY ("organization_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
