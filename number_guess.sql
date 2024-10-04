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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    username character varying(22),
    game_number integer NOT NULL,
    guesses_amt integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 'a', 1, 5);
INSERT INTO public.games VALUES (2, 'a', 2, 5);
INSERT INTO public.games VALUES (3, 'a', 3, 3);
INSERT INTO public.games VALUES (4, 'a', 4, 1);
INSERT INTO public.games VALUES (5, 'c', 1, 1);
INSERT INTO public.games VALUES (6, 'c', 2, 1);
INSERT INTO public.games VALUES (7, 'c', 3, 1);
INSERT INTO public.games VALUES (8, 'user_1728041086317', 1, 317);
INSERT INTO public.games VALUES (9, 'user_1728041086317', 2, 560);
INSERT INTO public.games VALUES (10, 'user_1728041086316', 1, 726);
INSERT INTO public.games VALUES (11, 'user_1728041086316', 2, 785);
INSERT INTO public.games VALUES (12, 'user_1728041086317', 3, 319);
INSERT INTO public.games VALUES (13, 'user_1728041086317', 4, 97);
INSERT INTO public.games VALUES (14, 'user_1728041086317', 5, 666);
INSERT INTO public.games VALUES (15, 'user_1728041204156', 1, 942);
INSERT INTO public.games VALUES (16, 'user_1728041204156', 2, 57);
INSERT INTO public.games VALUES (17, 'user_1728041204155', 1, 747);
INSERT INTO public.games VALUES (18, 'user_1728041204155', 2, 995);
INSERT INTO public.games VALUES (19, 'user_1728041204156', 3, 227);
INSERT INTO public.games VALUES (20, 'user_1728041204156', 4, 856);
INSERT INTO public.games VALUES (21, 'user_1728041204156', 5, 179);
INSERT INTO public.games VALUES (22, 'user_1728041863457', 1, 497);
INSERT INTO public.games VALUES (23, 'user_1728041863457', 2, 159);
INSERT INTO public.games VALUES (24, 'user_1728041863456', 1, 360);
INSERT INTO public.games VALUES (25, 'user_1728041863456', 2, 230);
INSERT INTO public.games VALUES (26, 'user_1728041863457', 3, 30);
INSERT INTO public.games VALUES (27, 'user_1728041863457', 4, 334);
INSERT INTO public.games VALUES (28, 'user_1728041863457', 5, 735);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 28, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

