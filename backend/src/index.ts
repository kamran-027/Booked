import { Hono } from "hono";
import { getPrisma } from "./services/getPrismaFunction";

const app = new Hono<{
  Bindings: {
    DATABASE_URL: string;
  };
}>();

app.post("/addUser", async (c) => {
  try {
    console.log("DATABASE_URL::", c.env.DATABASE_URL);
    const prisma = getPrisma(c.env.DATABASE_URL);
    const { Name, Username, Password } = await c.req.json();
    const newUser = await prisma.user.create({
      data: {
        Name,
        Username,
        Password,
      },
    });
    return c.json({ newUser: newUser });
  } catch (error: any) {
    console.error("Error::", error);
    return c.json({ error: error.message }, 500);
  }
});

export default app;
