-- CreateEnum
CREATE TYPE "MonthEnum" AS ENUM ('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');

-- CreateEnum
CREATE TYPE "HoursEnum" AS ENUM ('One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Eleven', 'Twelve');

-- CreateTable
CREATE TABLE "Bug" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "location" TEXT NOT NULL,
    "hoursAM" "HoursEnum"[],
    "hoursPM" "HoursEnum"[],
    "time_range" TEXT NOT NULL,
    "monthsNorth" "MonthEnum"[],
    "monthsSouth" "MonthEnum"[],

    CONSTRAINT "Bug_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Fish" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "shadowSize" INTEGER NOT NULL,
    "fin" BOOLEAN NOT NULL,
    "value" INTEGER NOT NULL,
    "location" TEXT NOT NULL,
    "hoursAM" "HoursEnum"[],
    "hoursPM" "HoursEnum"[],
    "time_range" TEXT NOT NULL,
    "monthsNorth" "MonthEnum"[],
    "monthsSouth" "MonthEnum"[],

    CONSTRAINT "Fish_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Bug_name_key" ON "Bug"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Bug_slug_key" ON "Bug"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Fish_name_key" ON "Fish"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Fish_slug_key" ON "Fish"("slug");
