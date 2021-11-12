/*
  Warnings:

  - The values [One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten,Eleven,Twelve] on the enum `HoursEnum` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "HoursEnum_new" AS ENUM ('one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve');
ALTER TABLE "Bug" ALTER COLUMN "hoursAM" TYPE "HoursEnum_new"[] USING ("hoursAM"::text::"HoursEnum_new"[]);
ALTER TABLE "Bug" ALTER COLUMN "hoursPM" TYPE "HoursEnum_new"[] USING ("hoursPM"::text::"HoursEnum_new"[]);
ALTER TABLE "Fish" ALTER COLUMN "hoursAM" TYPE "HoursEnum_new"[] USING ("hoursAM"::text::"HoursEnum_new"[]);
ALTER TABLE "Fish" ALTER COLUMN "hoursPM" TYPE "HoursEnum_new"[] USING ("hoursPM"::text::"HoursEnum_new"[]);
ALTER TYPE "HoursEnum" RENAME TO "HoursEnum_old";
ALTER TYPE "HoursEnum_new" RENAME TO "HoursEnum";
DROP TYPE "HoursEnum_old";
COMMIT;
