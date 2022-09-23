import { PrismaClient } from "@prisma/client";
import bcrypt from "bcryptjs";

const prisma = new PrismaClient();

async function seed() {
  const username = "admin@talokuntoon.fi";

  // cleanup the existing database
  await prisma.user.delete({ where: { username } }).catch(() => {
    // no worries if it doesn't exist yet
  });

  const hashedPassword = await bcrypt.hash("defaultPasswordsAreNotCool", 10);

  const user = await prisma.user.create({
    data: {
      username,
      password: hashedPassword,
      role_id: 1,
    },
  });

  console.log(`Database has been seeded. 🌱`);
}

seed()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
