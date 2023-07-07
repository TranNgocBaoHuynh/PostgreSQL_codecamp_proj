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
    name character varying(30) NOT NULL,
    num_star text,
    num_planet text,
    num_system integer
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
    name character varying(30),
    planet_id integer NOT NULL,
    size numeric,
    distance_from_planet numeric
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
    name character varying(30),
    has_life boolean,
    num_moon integer,
    star_id integer NOT NULL,
    system_id integer
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
    name character varying(30) NOT NULL,
    has_planet boolean,
    num_planet integer,
    galaxy_id integer,
    radius numeric,
    system_id integer
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
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(30) NOT NULL,
    num_star integer,
    num_planet integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', '100e9', '100e9', 3400);
INSERT INTO public.galaxy VALUES (2, 'Cygnus A', '200e9', '350e9', 3000);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', '150e9', '100e9', 100);
INSERT INTO public.galaxy VALUES (4, 'Needle', '50a9', '10e9', 10);
INSERT INTO public.galaxy VALUES (5, 'Peekaboo', '510e9', '450e9', 2000);
INSERT INTO public.galaxy VALUES (6, 'Malin1', '100e9', '150e9', 2500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth Moon', 1, 1080, 238855);
INSERT INTO public.moon VALUES (2, 'Charon', 2, 37655, 12200);
INSERT INTO public.moon VALUES (3, 'Nix', 2, 70, 48694);
INSERT INTO public.moon VALUES (4, 'Titan', 3, 1600, 759000);
INSERT INTO public.moon VALUES (5, 'Dione', 3, 349, 234500);
INSERT INTO public.moon VALUES (6, 'Mimas', 3, 123, 115000);
INSERT INTO public.moon VALUES (7, 'Europa', 6, 3100, 390400000);
INSERT INTO public.moon VALUES (8, 'Io', 6, 3642, 390400000);
INSERT INTO public.moon VALUES (9, 'Titania', 7, 1578, 435840);
INSERT INTO public.moon VALUES (10, 'Oberon', 7, 206, 582600);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 1680, 354800);
INSERT INTO public.moon VALUES (12, 'Proteus', 8, 420, 117647);
INSERT INTO public.moon VALUES (13, 'Larissa', 8, 60273, 48800);
INSERT INTO public.moon VALUES (14, 'Natsu', 9, 19200, 9801);
INSERT INTO public.moon VALUES (15, 'Totoro', 10, 2700, 2010);
INSERT INTO public.moon VALUES (16, 'Caffein', 10, 800, 10000);
INSERT INTO public.moon VALUES (17, 'Carbo', 12, 9876, 1090);
INSERT INTO public.moon VALUES (18, 'Asa', 11, 3553, 6220);
INSERT INTO public.moon VALUES (19, 'Hyperion', 3, 83885, 135);
INSERT INTO public.moon VALUES (20, 'Himalia', 6, 52817, 7100000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Pluto', false, 5, 6, 6);
INSERT INTO public.planet VALUES (3, 'Saturn', false, 145, 1, 1);
INSERT INTO public.planet VALUES (4, 'Venus', true, 0, 1, 1);
INSERT INTO public.planet VALUES (5, 'Mecury', false, 0, 1, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', false, 85, 1, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 27, 1, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 14, 1, 1);
INSERT INTO public.planet VALUES (9, 'Magnolia', true, 3, 4, 2);
INSERT INTO public.planet VALUES (10, 'Kokori', true, 2, 4, 4);
INSERT INTO public.planet VALUES (1, 'Earth', true, 1, 1, 1);
INSERT INTO public.planet VALUES (11, 'Kohi', true, 10, 2, 4);
INSERT INTO public.planet VALUES (12, 'Coku', false, 30, 6, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Taurus', true, 19, 1, 98.5, NULL);
INSERT INTO public.star VALUES (4, 'Lion', true, 27, 1, 70.1, NULL);
INSERT INTO public.star VALUES (5, 'ABC', false, 0, 3, 199, NULL);
INSERT INTO public.star VALUES (6, 'Some Star', false, 0, 6, 300, NULL);
INSERT INTO public.star VALUES (1, 'Sun', true, 8, 1, 432.690, 1);
INSERT INTO public.star VALUES (2, 'Aquarius', false, 0, 1, 100.5, 4);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'Solar', 1, 8, 1);
INSERT INTO public.system VALUES (2, '55 Cancri', 2, 5, 1);
INSERT INTO public.system VALUES (3, 'LHS 1234', 5, 3, 5);
INSERT INTO public.system VALUES (4, 'Gilese 876', 965, 800, 1);
INSERT INTO public.system VALUES (5, 'Gliese 433', 10, 7, 4);
INSERT INTO public.system VALUES (6, 'L 98-60', 135, 279, 6);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 6, true);


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
-- Name: system system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_name_key UNIQUE (name);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


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
-- Name: planet planet_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_system_id_fkey FOREIGN KEY (system_id) REFERENCES public.system(system_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_system_id_fkey FOREIGN KEY (system_id) REFERENCES public.system(system_id);


--
-- Name: system system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

