import { Hono } from "hono";
import { PrismaClient } from "@prisma/client";
import { addUser } from "./controller/functions";
import { User } from "./models/Interfaces";

const prisma = new PrismaClient();

const app = new Hono();

app.post("/addUser", async (c) => {
  try {
    // const newUserDetails: User = {
    //   Name: "Bunkayo Sanka",
    //   Username: "LittleChilli",
    //   Password: "AFCRocks",
    // };
    // await addUser(newUserDetails);
    // debugger;

    console.log("Before create call");
    const res = await prisma.user.createMany({
      data: {
        Name: "Sample",
        Username: "Samp",
        Password: "Pass",
      },
    });
    console.log("Resposne::", res);

    return c.json({ newUser: "NEw user" });
  } catch (error) {
    console.error(error);
    return c.text("Error while adding new User", 500);
  }
});

export default app;
