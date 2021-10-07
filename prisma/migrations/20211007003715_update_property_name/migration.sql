/*
  Warnings:

  - You are about to drop the column `time_range` on the `Bug` table. All the data in the column will be lost.
  - You are about to drop the column `time_range` on the `Fish` table. All the data in the column will be lost.
  - Added the required column `timeRange` to the `Bug` table without a default value. This is not possible if the table is not empty.
  - Added the required column `timeRange` to the `Fish` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Bug" DROP COLUMN "time_range",
ADD COLUMN     "timeRange" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Fish" DROP COLUMN "time_range",
ADD COLUMN     "timeRange" TEXT NOT NULL;
