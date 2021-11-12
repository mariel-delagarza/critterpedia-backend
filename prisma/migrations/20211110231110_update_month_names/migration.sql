/*
  Warnings:

  - The values [January,February,March,April,May,June,July,August,September,October,November,December] on the enum `MonthEnum` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "MonthEnum_new" AS ENUM ('january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december');
ALTER TABLE "Bug" ALTER COLUMN "monthsNorth" TYPE "MonthEnum_new"[] USING ("monthsNorth"::text::"MonthEnum_new"[]);
ALTER TABLE "Bug" ALTER COLUMN "monthsSouth" TYPE "MonthEnum_new"[] USING ("monthsSouth"::text::"MonthEnum_new"[]);
ALTER TABLE "Fish" ALTER COLUMN "monthsNorth" TYPE "MonthEnum_new"[] USING ("monthsNorth"::text::"MonthEnum_new"[]);
ALTER TABLE "Fish" ALTER COLUMN "monthsSouth" TYPE "MonthEnum_new"[] USING ("monthsSouth"::text::"MonthEnum_new"[]);
ALTER TYPE "MonthEnum" RENAME TO "MonthEnum_old";
ALTER TYPE "MonthEnum_new" RENAME TO "MonthEnum";
DROP TYPE "MonthEnum_old";
COMMIT;
