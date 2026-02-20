--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(4,1),
    total_star_in_bilions integer NOT NULL,
    total_planet_in_trilions integer NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(4,1),
    is_spherical boolean,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: other; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other (
    other_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    orbit_star boolean,
    description text
);


ALTER TABLE public.other OWNER TO freecodecamp;

--
-- Name: other_other_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_other_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_other_id_seq OWNER TO freecodecamp;

--
-- Name: other_other_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_other_id_seq OWNED BY public.other.other_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(4,1),
    has_life boolean,
    total_moon_orbit integer NOT NULL,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    total_planet_orbit integer NOT NULL,
    age_in_millions_of_years numeric(4,1),
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: other other_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other ALTER COLUMN other_id SET DEFAULT nextval('public.other_other_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.6, 200, 8, 'The galaxy that includes our solar system.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.0, 1, 15, 'The nearest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3.0, 40, 10, 'A spiral galaxy located in the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 1.0, 100, 20, 'A classic spiral galaxy with well-defined arms.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 8.0, 800, 12, 'A spiral galaxy known for its bright nucleus and dust lane.');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 22.0, 100, 30, 'A spiral galaxy located in the constellation Ursa Major.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', 4.5, true, 'The only natural satellite of Earth.');
INSERT INTO public.moon VALUES (2, 2, 'Ishtar', 4.2, true, 'A large moon with a thick atmosphere around Venus.');
INSERT INTO public.moon VALUES (3, 3, 'Europa', 4.5, true, 'A moon of Jupiter, known for its icy surface and potential ocean.');
INSERT INTO public.moon VALUES (4, 3, 'Io', 4.5, true, 'A volcanic moon of Jupiter with sulfuric surface.');
INSERT INTO public.moon VALUES (5, 1, 'Phobos', 4.4, true, 'A moon of Mars; one of the smallest moons in the solar system.');
INSERT INTO public.moon VALUES (6, 1, 'Deimos', 4.4, true, 'The second moon of Mars, smaller than Phobos.');
INSERT INTO public.moon VALUES (7, 3, 'Ganymede', 4.5, true, 'The largest moon in the solar system, also a moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 2, 'Andromeda I', 3.5, true, 'A moon hypothesized around one of the stars in Andromeda.');
INSERT INTO public.moon VALUES (9, 2, 'Andromeda II', 4.0, true, 'Another hypothetical moon around Andromeda B.');
INSERT INTO public.moon VALUES (10, 7, 'Triangulum Moon', 3.0, true, 'A possible moon found around a star in Triangulum.');
INSERT INTO public.moon VALUES (11, 4, 'Whirlpool Moon', 1.5, true, 'A moon that exhibits unusual geological features.');
INSERT INTO public.moon VALUES (12, 5, 'Sombrero Moon', 6.0, true, 'A moon with a thick atmosphere orbiting a star in the Sombrero galaxy.');
INSERT INTO public.moon VALUES (13, 6, 'Pinwheel Moon', 2.0, true, 'A large gaseous moon with an interesting orbit.');
INSERT INTO public.moon VALUES (14, 1, 'Miranda', 4.5, true, 'A unique moon of Uranus known for its diverse terrain.');
INSERT INTO public.moon VALUES (15, 2, 'Titania', 4.5, true, 'Another moon of Uranus with significant geological activity.');
INSERT INTO public.moon VALUES (16, 3, 'Callisto', 4.5, true, 'A heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (17, 4, 'Titan', 4.5, true, 'The largest moon of Saturn with a thick atmosphere.');
INSERT INTO public.moon VALUES (18, 5, 'Enceladus', 4.5, true, 'Known for its geysers and potential subsurface ocean.');
INSERT INTO public.moon VALUES (19, 6, 'Rhea', 4.5, true, 'A moon of Saturn with prominent ring systems.');
INSERT INTO public.moon VALUES (20, 7, 'Aquarius', 2.0, true, 'A hypothetical moon orbiting a star in the Pinwheel galaxy.');


--
-- Data for Name: other; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other VALUES (1, 1, 'Ceres', true, true, 'The largest asteroid in the asteroid belt, classified as a dwarf planet.');
INSERT INTO public.other VALUES (2, 1, 'Vesta', true, true, 'One of the largest asteroids in the asteroid belt, heavily cratered.');
INSERT INTO public.other VALUES (3, 2, 'Pallas', true, true, 'The second-largest asteroid in the asteroid belt, known for its size.');
INSERT INTO public.other VALUES (4, 2, 'Hygiea', true, true, 'An asteroid noted for its spherical shape and dark surface.');
INSERT INTO public.other VALUES (5, 3, 'Eros', true, true, 'A near-Earth asteroid visited by the NEAR spacecraft.');
INSERT INTO public.other VALUES (6, 3, 'Itokawa', true, true, 'A near-Earth asteroid explored by the Hayabusa mission.');
INSERT INTO public.other VALUES (7, 4, 'Trojan Asteroid', false, true, 'Asteroids that share an orbit with larger planets, such as Jupiter.');
INSERT INTO public.other VALUES (8, 5, 'Amalthea', true, true, 'A moon-like body that is the largest irregular moon of Jupiter.');
INSERT INTO public.other VALUES (9, 6, 'Mimas', true, true, 'A moon of Saturn that resembles an asteroid due to its heavily cratered surface.');
INSERT INTO public.other VALUES (10, 1, 'Bennu', true, true, 'A near-Earth asteroid targeted by the OSIRIS-REx mission.');
INSERT INTO public.other VALUES (11, 2, 'Ryugu', true, true, 'A near-Earth asteroid visited by the Hayabusa2 mission.');
INSERT INTO public.other VALUES (12, 3, 'Apophis', true, true, 'A near-Earth asteroid known for its potential to impact Earth.');
INSERT INTO public.other VALUES (13, 4, 'Gaspra', true, true, 'An asteroid first visited by the Galileo spacecraft.');
INSERT INTO public.other VALUES (14, 5, 'Dactyl', true, true, 'A moon of asteroid Ida, discovered during the Galileo mission.');
INSERT INTO public.other VALUES (15, 6, 'Kleopatra', true, true, 'An asteroid with a unique dog-bone shape.');
INSERT INTO public.other VALUES (16, 1, '243 Ida', true, true, 'An asteroid that possesses a small moon, Dactyl.');
INSERT INTO public.other VALUES (17, 2, 'Flyby Asteroid', false, true, 'Asteroids that approach near-Earth but do not enter orbit.');
INSERT INTO public.other VALUES (18, 3, 'Asteroid Belt Object', false, true, 'Any object found within the asteroid belt between Mars and Jupiter.');
INSERT INTO public.other VALUES (19, 4, 'Near-Earth Object', false, true, 'Asteroids and comets with orbits bringing them close to Earth.');
INSERT INTO public.other VALUES (20, 5, 'Stroida', true, true, 'A fictional asteroid representing the unique characteristics of asteroids found in the belt.');
INSERT INTO public.other VALUES (21, 6, 'Bouldar', false, true, 'A hypothetical rocky body resembling larger asteroids.');
INSERT INTO public.other VALUES (22, 1, 'Rockland', true, true, 'An asteroid famous for its size and orbit trajectory.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 4.6, false, 0, 'The smallest planet in our solar system.');
INSERT INTO public.planet VALUES (2, 1, 'Venus', 4.6, false, 0, 'The hottest planet in the solar system, known for its thick atmosphere.');
INSERT INTO public.planet VALUES (3, 1, 'Earth', 4.6, true, 1, 'The only planet known to support life.');
INSERT INTO public.planet VALUES (4, 1, 'Mars', 4.6, false, 2, 'Known as the Red Planet due to its iron oxide surface.');
INSERT INTO public.planet VALUES (5, 2, 'Alpheratz', 3.0, false, 0, 'A hypothetical planet around Alpha Andromedae.');
INSERT INTO public.planet VALUES (6, 2, 'Andromeda B', 4.0, false, 1, 'A gas giant orbiting in the Andromeda galaxy.');
INSERT INTO public.planet VALUES (7, 3, 'Triangulum I', 3.0, true, 3, 'A rocky planet with potential for life.');
INSERT INTO public.planet VALUES (8, 3, 'Triangulum II', 4.2, false, 0, 'A barren planet with a thin atmosphere.');
INSERT INTO public.planet VALUES (9, 4, 'Whirlpool I', 1.5, false, 1, 'A planet with a ring system located in the Whirlpool galaxy.');
INSERT INTO public.planet VALUES (10, 4, 'Whirlpool II', 1.5, false, 2, 'Known for its high winds and gaseous surface.');
INSERT INTO public.planet VALUES (11, 5, 'Sombrero I', 6.0, true, 5, 'An Earth-like planet with water sources.');
INSERT INTO public.planet VALUES (12, 6, 'Pinwheel I', 2.0, false, 0, 'A rocky planet orbiting a star in the Pinwheel galaxy.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 8, 4.6, 'The star at the center of our solar system.');
INSERT INTO public.star VALUES (2, 2, 'Alpha Andromedae', 5, 2.5, 'The brightest star in the Andromeda galaxy.');
INSERT INTO public.star VALUES (3, 3, 'Triangulum Galaxy Star', 2, 3.0, 'A representative star from the Triangulum galaxy.');
INSERT INTO public.star VALUES (4, 4, 'Whirlpool Star', 4, 1.5, 'A star located in the Whirlpool galaxy.');
INSERT INTO public.star VALUES (5, 5, 'Sombrero Star', 3, 6.0, 'A bright star in the Sombrero galaxy.');
INSERT INTO public.star VALUES (6, 6, 'Pinwheel Star', 7, 2.0, 'A significant star in the Pinwheel galaxy.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: other_other_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_other_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other other_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT other_name_key UNIQUE (name);


--
-- Name: other other_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT other_pkey PRIMARY KEY (other_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: other other_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT other_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

