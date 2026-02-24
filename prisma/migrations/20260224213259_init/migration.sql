-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('PLAYER', 'MASTER');

-- CreateEnum
CREATE TYPE "AbilityType" AS ENUM ('PASSIVE', 'ACTIVE', 'RISK');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" "UserRole" NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Campaign" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdBy" TEXT NOT NULL,

    CONSTRAINT "Campaign_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Character" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "userId" TEXT,
    "campaignId" TEXT,
    "forca" INTEGER NOT NULL,
    "agilidade" INTEGER NOT NULL,
    "intelecto" INTEGER NOT NULL,
    "presenca" INTEGER NOT NULL,
    "vontade" INTEGER NOT NULL,
    "vidaAtual" INTEGER NOT NULL,
    "eterAtual" INTEGER NOT NULL,
    "corrupcao" INTEGER NOT NULL,
    "combate" INTEGER NOT NULL,
    "atletismo" INTEGER NOT NULL,
    "intimidacaoFisica" INTEGER NOT NULL,
    "mira" INTEGER NOT NULL,
    "furtividade" INTEGER NOT NULL,
    "reflexos" INTEGER NOT NULL,
    "investigacao" INTEGER NOT NULL,
    "manutencao" INTEGER NOT NULL,
    "conhecimento" INTEGER NOT NULL,
    "persuasao" INTEGER NOT NULL,
    "enganacao" INTEGER NOT NULL,
    "intimidacaoVerbal" INTEGER NOT NULL,
    "resistencia" INTEGER NOT NULL,
    "determinacao" INTEGER NOT NULL,
    "intuicao" INTEGER NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SpecialAbility" (
    "id" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "type" "AbilityType" NOT NULL,
    "eterCost" INTEGER NOT NULL,
    "corrCost" INTEGER NOT NULL,

    CONSTRAINT "SpecialAbility_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Note" (
    "id" TEXT NOT NULL,
    "characterId" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Note_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Campaign" ADD CONSTRAINT "Campaign_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_campaignId_fkey" FOREIGN KEY ("campaignId") REFERENCES "Campaign"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpecialAbility" ADD CONSTRAINT "SpecialAbility_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Note" ADD CONSTRAINT "Note_characterId_fkey" FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
