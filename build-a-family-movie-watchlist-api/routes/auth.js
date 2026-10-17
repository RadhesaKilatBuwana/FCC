import express from "express";
import jwt from "jsonwebtoken";
import users from "../data/users.json" with { type: "json" };

const router = express.Router();

router.post("/login", (req, res) => {
  const { username, password } = req.body ?? {};

  if (!username || !password) {
    return res.status(400).json({ error: "Username and password are required." });
  }

  const user = users.find((entry) => entry.username === username);

  if (!user || user._password !== password) {
    return res.status(401).json({ error: "Invalid username or password." });
  }

  const token = jwt.sign(
    { id: user.id, role: user.role },
    process.env.JWT_SECRET
  );

  return res.status(200).json({ token });
});

export default router;
