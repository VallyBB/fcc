--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer NOT NULL
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
    name character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    planet_id integer
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
    name character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    star_id integer
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
-- Name: planetary_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetary_system (
    number numeric,
    description text,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    planetary_system_id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE public.planetary_system OWNER TO freecodecamp;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetary_system_planetary_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetary_system_planetary_system_id_seq OWNER TO freecodecamp;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetary_system_planetary_system_id_seq OWNED BY public.planetary_system.planetary_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    galaxy_id integer
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
-- Name: planetary_system planetary_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system ALTER COLUMN planetary_system_id SET DEFAULT nextval('public.planetary_system_planetary_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, true, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, true, 10100, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, true, 10000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', false, true, 13610, 163000);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', false, true, 13630, 200000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', false, true, 400, 23000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Moon', false, true, 4588, 0, 1);
INSERT INTO public.moon VALUES (4, 'Phobos', false, true, 4590, 0, 2);
INSERT INTO public.moon VALUES (5, 'Deimos', false, true, 4520, 0, 2);
INSERT INTO public.moon VALUES (6, 'Proxima b Moon', false, true, 4501, 4, 3);
INSERT INTO public.moon VALUES (7, 'Sirius b Moon', false, true, 120, 8, 4);
INSERT INTO public.moon VALUES (8, 'Betelgeuse b Moon', false, true, 800, 642, 5);
INSERT INTO public.moon VALUES (9, 'Moonus', false, true, 6500, 8000, 1);
INSERT INTO public.moon VALUES (10, 'Lunaris', true, false, 7000, 12000, 2);
INSERT INTO public.moon VALUES (11, 'Solara', false, true, 8000, 15000, 3);
INSERT INTO public.moon VALUES (12, 'Aetheria', true, true, 9000, 16000, 4);
INSERT INTO public.moon VALUES (13, 'Stellara', false, false, 10000, 17000, 5);
INSERT INTO public.moon VALUES (14, 'Galaxia', true, true, 11000, 18000, 6);
INSERT INTO public.moon VALUES (15, 'Nebulon', false, true, 12000, 19000, 1);
INSERT INTO public.moon VALUES (16, 'Celestia', true, false, 13000, 14000, 2);
INSERT INTO public.moon VALUES (17, 'Astralis', false, true, 14000, 13000, 3);
INSERT INTO public.moon VALUES (18, 'Orbis', true, true, 15000, 12000, 4);
INSERT INTO public.moon VALUES (19, 'Vespera', false, false, 16000, 11000, 5);
INSERT INTO public.moon VALUES (20, 'Elysium', true, true, 17000, 10000, 6);
INSERT INTO public.moon VALUES (21, 'Horizon', false, true, 18000, 9000, 1);
INSERT INTO public.moon VALUES (22, 'Equinox', true, false, 19000, 8000, 2);
INSERT INTO public.moon VALUES (23, 'Zenith', false, true, 20000, 7000, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 4510, 0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 4502, 0, 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', false, true, 4503, 4, 2);
INSERT INTO public.planet VALUES (4, 'Sirius b', false, true, 120, 8, 3);
INSERT INTO public.planet VALUES (5, 'Betelgeuse b', false, true, 800, 642, 4);
INSERT INTO public.planet VALUES (6, 'Aldebaran b', true, true, 200, 65, 1);
INSERT INTO public.planet VALUES (7, 'Procyon b', false, true, 100, 15, 2);
INSERT INTO public.planet VALUES (8, 'Betelgeuse c', true, false, 151, 200, 3);
INSERT INTO public.planet VALUES (9, 'Rigel d', false, true, 300, 400, 4);
INSERT INTO public.planet VALUES (10, 'Antares e', true, true, 127, 50, 5);
INSERT INTO public.planet VALUES (11, 'Vega f', false, true, 250, 30, 6);
INSERT INTO public.planet VALUES (12, 'Altair g', true, false, 180, 120, 1);
INSERT INTO public.planet VALUES (13, 'Fomalhaut h', false, true, 220, 90, 2);
INSERT INTO public.planet VALUES (14, 'Deneb i', true, true, 160, 111, 3);
INSERT INTO public.planet VALUES (15, 'Spica j', false, true, 140, 80, 4);
INSERT INTO public.planet VALUES (16, 'Castor k', true, false, 130, 60, 5);
INSERT INTO public.planet VALUES (17, 'Pollux l', false, true, 170, 70, 6);
INSERT INTO public.planet VALUES (18, 'Sirius m', true, true, 110, 40, 1);
INSERT INTO public.planet VALUES (19, 'Canopus n', false, true, 190, 20, 2);
INSERT INTO public.planet VALUES (20, 'Bellatrix o', true, false, 152, 150, 3);
INSERT INTO public.planet VALUES (21, 'Rigel b', false, true, 820, 860, 5);


--
-- Data for Name: planetary_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetary_system VALUES (1, NULL, 1, 1, 1, NULL);
INSERT INTO public.planetary_system VALUES (2, NULL, 1, 2, 2, NULL);
INSERT INTO public.planetary_system VALUES (3, NULL, 2, 3, 3, NULL);
INSERT INTO public.planetary_system VALUES (4, NULL, 3, 4, 4, NULL);
INSERT INTO public.planetary_system VALUES (5, NULL, 4, 5, 5, NULL);
INSERT INTO public.planetary_system VALUES (6, NULL, 5, 6, 6, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, true, 4600, 0, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', false, true, 4500, 4, 2);
INSERT INTO public.star VALUES (3, 'Sirius', false, true, 300, 8, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', false, true, 8000, 642, 1);
INSERT INTO public.star VALUES (5, 'Rigel', false, true, 8030, 860, 1);
INSERT INTO public.star VALUES (6, 'Vega', false, true, 455, 25, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetary_system_planetary_system_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: planetary_system description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT description UNIQUE (description);


--
-- Name: galaxy galaxy_age_in_millions_of_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_age_in_millions_of_years_key UNIQUE (age_in_millions_of_years);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_age_in_millions_of_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_age_in_millions_of_years_key UNIQUE (age_in_millions_of_years);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_age_in_millions_of_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_age_in_millions_of_years_key UNIQUE (age_in_millions_of_years);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planetary_system planetary_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_pkey PRIMARY KEY (planetary_system_id);


--
-- Name: star star_age_in_millions_of_years_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_age_in_millions_of_years_key UNIQUE (age_in_millions_of_years);


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
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planetary_system planetary_system_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planetary_system planetary_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

