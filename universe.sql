--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(40) NOT NULL,
    distance_from_milkeyway_in_lightyears integer,
    is_dwarf_galaxy boolean,
    galaxy_type text
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
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_planet_in_miles integer,
    time_of_discovery text
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_life boolean,
    planet_type character varying(30),
    distance_from_sun_in_au numeric(10,2)
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
-- Name: ring; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.ring (
    ring_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.ring OWNER TO freecodecamp;

--
-- Name: ring_ring_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.ring_ring_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ring_ring_id_seq OWNER TO freecodecamp;

--
-- Name: ring_ring_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.ring_ring_id_seq OWNED BY public.ring.ring_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_our_sun_in_lightyears numeric(10,2),
    number_of_known_planets_in_orbit integer,
    star_type text
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: ring ring_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring ALTER COLUMN ring_id SET DEFAULT nextval('public.ring_ring_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkey Way', NULL, false, 'barred spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf Galaxy', 25000, true, 'irregular galaxy');
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Galaxy', 70000, true, 'irregular galaxy');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 163000, false, 'barred spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 200000, true, 'dwarf irregular galaxy');
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy (M33)', 2700000, false, 'spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 4, 'Phobos', 3700, '1877');
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 14580, '1877');
INSERT INTO public.moon VALUES (4, 5, 'Lo', 262000, '1610');
INSERT INTO public.moon VALUES (5, 5, 'Europa', 41600, '1610');
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 665000, '1610');
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 1168000, '1610');
INSERT INTO public.moon VALUES (8, 6, 'Mimas', 115000, '1789');
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 147000, '1789');
INSERT INTO public.moon VALUES (10, 6, 'Tethys', 183000, '1684');
INSERT INTO public.moon VALUES (11, 6, 'Dione', 234000, '1684');
INSERT INTO public.moon VALUES (12, 6, 'Rhea', 327000, '1672');
INSERT INTO public.moon VALUES (13, 6, 'Titan', 759000, '1655');
INSERT INTO public.moon VALUES (14, 6, 'Lapetus', 2213000, '1671');
INSERT INTO public.moon VALUES (15, 7, 'Ariel', 119000, '1851');
INSERT INTO public.moon VALUES (16, 7, 'Umbriel', 266000, '1851');
INSERT INTO public.moon VALUES (17, 7, 'Titania', 273000, '1787');
INSERT INTO public.moon VALUES (18, 7, 'Oberon', 364000, '1787');
INSERT INTO public.moon VALUES (19, 8, 'Triton', 220000, '1846');
INSERT INTO public.moon VALUES (20, 9, 'Pluto is a Planet', 9999999, '2023');
INSERT INTO public.moon VALUES (1, 3, 'Moon', 238855, 'prehistoric times');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', false, 'terrestrial planet', 0.39);
INSERT INTO public.planet VALUES (2, 1, 'Venus', false, 'terrestrial planet', 0.72);
INSERT INTO public.planet VALUES (4, 1, 'Mars', false, 'terrestrial planet', 1.52);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', false, 'gas giant planet', 5.20);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', false, 'gas giant planet', 9.58);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', false, 'ice giant planet', 30.07);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', false, 'dwarf planet', 39.48);
INSERT INTO public.planet VALUES (10, 1, 'Eris', false, 'dwarf planet', 67.78);
INSERT INTO public.planet VALUES (11, 1, 'Sedna', false, 'minor planet', 86.80);
INSERT INTO public.planet VALUES (12, 1, '2012VP113', false, 'minor planet', 84.00);
INSERT INTO public.planet VALUES (3, 1, 'Earth', true, 'terrestrial planet', 1.00);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', false, 'ice giant planet', 19.18);


--
-- Data for Name: ring; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.ring VALUES (1, 6, 'Saturns D Ring');
INSERT INTO public.ring VALUES (2, 7, 'Uranus Epsilon Ring');
INSERT INTO public.ring VALUES (3, 8, 'Neptunes Adams Ring');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', NULL, 8, 'yellow dwarf star');
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 4.24, 1, 'red dwarf star');
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri', 4.37, 1, 'binary star system');
INSERT INTO public.star VALUES (4, 1, 'Barnards Star', 5.96, 0, 'red dwarf star');
INSERT INTO public.star VALUES (5, 1, 'Wolf 359', 7.78, 0, 'red dwarf star');
INSERT INTO public.star VALUES (6, 1, 'Lalande 21185', 8.29, 0, 'red dwarf star');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: ring_ring_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.ring_ring_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: ring ring_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT ring_pkey PRIMARY KEY (ring_id);


--
-- Name: ring ring_ring_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT ring_ring_id_key UNIQUE (ring_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: ring ring_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.ring
    ADD CONSTRAINT ring_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

