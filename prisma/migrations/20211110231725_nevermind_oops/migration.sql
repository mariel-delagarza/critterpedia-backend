/*
  Warnings:

  - The values [one,two,three,four,five,six,seven,eight,nine,ten,eleven,twelve] on the enum `HoursEnum` will be removed. If these variants are still used in the database, this will fail.
  - The values [january,february,march,april,may,june,july,august,september,october,november,december] on the enum `MonthEnum` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "HoursEnum_new" AS ENUM ('One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Eleven', 'Twelve');
ALTER TABLE "Bug" ALTER COLUMN "hoursAM" TYPE "HoursEnum_new"[] USING ("hoursAM"::text::"HoursEnum_new"[]);
ALTER TABLE "Bug" ALTER COLUMN "hoursPM" TYPE "HoursEnum_new"[] USING ("hoursPM"::text::"HoursEnum_new"[]);
ALTER TABLE "Fish" ALTER COLUMN "hoursAM" TYPE "HoursEnum_new"[] USING ("hoursAM"::text::"HoursEnum_new"[]);
ALTER TABLE "Fish" ALTER COLUMN "hoursPM" TYPE "HoursEnum_new"[] USING ("hoursPM"::text::"HoursEnum_new"[]);
ALTER TYPE "HoursEnum" RENAME TO "HoursEnum_old";
ALTER TYPE "HoursEnum_new" RENAME TO "HoursEnum";
DROP TYPE "HoursEnum_old";
COMMIT;

-- AlterEnum
BEGIN;
CREATE TYPE "MonthEnum_new" AS ENUM ('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
ALTER TABLE "Bug" ALTER COLUMN "monthsNorth" TYPE "MonthEnum_new"[] USING ("monthsNorth"::text::"MonthEnum_new"[]);
ALTER TABLE "Bug" ALTER COLUMN "monthsSouth" TYPE "MonthEnum_new"[] USING ("monthsSouth"::text::"MonthEnum_new"[]);
ALTER TABLE "Fish" ALTER COLUMN "monthsNorth" TYPE "MonthEnum_new"[] USING ("monthsNorth"::text::"MonthEnum_new"[]);
ALTER TABLE "Fish" ALTER COLUMN "monthsSouth" TYPE "MonthEnum_new"[] USING ("monthsSouth"::text::"MonthEnum_new"[]);
ALTER TYPE "MonthEnum" RENAME TO "MonthEnum_old";
ALTER TYPE "MonthEnum_new" RENAME TO "MonthEnum";
DROP TYPE "MonthEnum_old";
COMMIT;
