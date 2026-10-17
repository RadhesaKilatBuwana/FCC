export function authorizeModification(req, res, next) {
  const role = req.user?.role;
  const requesterId = String(req.user?.id ?? req.user?.userId ?? "");
  const targetId = String(req.params.userId ?? "");

  if (role === "parent" || (role === "child" && requesterId === targetId)) {
    return next();
  }

  return res.status(403).json({ error: "Access denied" });
}