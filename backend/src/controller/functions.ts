import { User } from "../models/Interfaces";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const addUser = async ({ Name, Username, Password }: User) => {
  if (!Name || !Password || !Username) {
    return console.error("Please provide appropriate user details");
  }

  const res = await prisma.user.create({
    data: {
      Name,
      Username,
      Password,
    },
  });
  console.log("Added USer::", res);

  return res;
};
