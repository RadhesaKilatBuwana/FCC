import express from "express";
import watchlists from "../data/watchlists.json" with { type: "json" };
import { authenticate } from "../middleware/authenticate.js";
import { authorizeModification } from "../middleware/authorize.js";

const router = express.Router();

router.use(authenticate);

router.get("/:userId", (req, res) => {
  const movies = watchlists[req.params.userId];

  if (!movies) {
    return res.status(404).json({ error: "Watchlist not found." });
  }

  return res.status(200).json(movies);
});

router.post("/:userId/movies", authorizeModification, (req, res) => {
  const movies = watchlists[req.params.userId];

  if (!movies) {
    return res.status(404).json({ error: "Watchlist not found." });
  }

  const movie = { ...req.body };
  if (movie.id == null) {
    movie.id = movies.length
      ? Math.max(...movies.map((entry) => Number(entry.id) || 0)) + 1
      : 1;
  }

  movies.push(movie);
  return res.status(201).json(movie);
});

router.put("/:userId/movies/:movieId", authorizeModification, (req, res) => {
  const movies = watchlists[req.params.userId];
  const movie = movies?.find(
    (entry) => String(entry.id) === String(req.params.movieId)
  );

  if (!movie) {
    return res.status(404).json({ error: "Movie not found." });
  }

  Object.assign(movie, req.body, { id: movie.id });
  return res.status(200).json(movie);
});

router.delete("/:userId/movies/:movieId", authorizeModification, (req, res) => {
  const movies = watchlists[req.params.userId];
  const index = movies?.findIndex(
    (entry) => String(entry.id) === String(req.params.movieId)
  );

  if (index == null || index < 0) {
    return res.status(404).json({ error: "Movie not found." });
  }

  const [removedMovie] = movies.splice(index, 1);
  return res.status(200).json(removedMovie);
});

export default router;