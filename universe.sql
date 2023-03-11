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

ALTER TABLE ONLY public.star DROP CONSTRAINT star_galaxy_id_fkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_star_id_fkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_planet_id_fkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_star_id_key1;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_star_id_key;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_name_key;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_planet_id_key;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
ALTER TABLE ONLY public.notknown DROP CONSTRAINT notknown_pkey;
ALTER TABLE ONLY public.notknown DROP CONSTRAINT notknown_notknown_id_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_name_key1;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_name_key;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.notknown ALTER COLUMN notknown_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
DROP SEQUENCE public.star_star_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.planet_planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.notknown_notknown_id_seq;
DROP TABLE public.notknown;
DROP SEQUENCE public.moon_moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_galaxy_id_seq;
DROP TABLE public.galaxy;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(50) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    galaxy_types character varying(50),
    is_spherical boolean
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
    name character varying(50),
    description text,
    moon_id integer NOT NULL,
    moon_types character varying(50),
    is_spherical boolean,
    planet_id integer NOT NULL,
    age_million_yrs numeric,
    distance_from_earth integer
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
-- Name: notknown; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.notknown (
    notknown_id integer NOT NULL,
    description text,
    name character varying(50) NOT NULL
);


ALTER TABLE public.notknown OWNER TO freecodecamp;

--
-- Name: notknown_notknown_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.notknown_notknown_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notknown_notknown_id_seq OWNER TO freecodecamp;

--
-- Name: notknown_notknown_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.notknown_notknown_id_seq OWNED BY public.notknown.notknown_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(50),
    description text,
    planet_id integer NOT NULL,
    planet_types character varying(50),
    is_spherical boolean,
    star_id integer NOT NULL,
    age_million_yrs numeric,
    distance_from_earth integer
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
    name character varying(50) NOT NULL,
    description text,
    star_id integer NOT NULL,
    star_types character varying(50),
    is_spherical boolean,
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
-- Name: notknown notknown_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.notknown ALTER COLUMN notknown_id SET DEFAULT nextval('public.notknown_notknown_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES ('ga1', 'des ga1', 1, 'type ga1', true);
INSERT INTO public.galaxy VALUES ('ga2', 'des ga2', 2, 'type ga2', false);
INSERT INTO public.galaxy VALUES ('ga3', 'des ga3', 3, 'type ga3', false);
INSERT INTO public.galaxy VALUES ('ga4', NULL, 4, NULL, NULL);
INSERT INTO public.galaxy VALUES ('ga5', NULL, 5, NULL, NULL);
INSERT INTO public.galaxy VALUES ('ga6', NULL, 6, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('1', NULL, 1, NULL, NULL, 3, NULL, NULL);
INSERT INTO public.moon VALUES ('2', NULL, 2, NULL, NULL, 10, NULL, NULL);
INSERT INTO public.moon VALUES ('3', NULL, 3, NULL, NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('4', NULL, 4, NULL, NULL, 11, NULL, NULL);
INSERT INTO public.moon VALUES ('5', NULL, 5, NULL, NULL, 12, NULL, NULL);
INSERT INTO public.moon VALUES ('6', NULL, 6, NULL, NULL, 9, NULL, NULL);
INSERT INTO public.moon VALUES ('7', NULL, 7, NULL, NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES ('8', NULL, 8, NULL, NULL, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('9', NULL, 9, NULL, NULL, 7, NULL, NULL);
INSERT INTO public.moon VALUES ('10', NULL, 10, NULL, NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES ('11', NULL, 11, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('12', NULL, 12, NULL, NULL, 9, NULL, NULL);
INSERT INTO public.moon VALUES ('13', NULL, 13, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('14', NULL, 14, NULL, NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES ('15', NULL, 15, NULL, NULL, 8, NULL, NULL);
INSERT INTO public.moon VALUES ('16', NULL, 16, NULL, NULL, 10, NULL, NULL);
INSERT INTO public.moon VALUES ('17', NULL, 17, NULL, NULL, 11, NULL, NULL);
INSERT INTO public.moon VALUES ('18', NULL, 18, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('19', NULL, 19, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.moon VALUES ('20', NULL, 20, NULL, NULL, 3, NULL, NULL);


--
-- Data for Name: notknown; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.notknown VALUES (1, NULL, '1');
INSERT INTO public.notknown VALUES (2, NULL, '2');
INSERT INTO public.notknown VALUES (3, NULL, '3');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('star1', NULL, 1, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('item2', NULL, 2, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.planet VALUES ('item3', NULL, 3, NULL, NULL, 3, NULL, NULL);
INSERT INTO public.planet VALUES ('item4', NULL, 4, NULL, NULL, 6, NULL, NULL);
INSERT INTO public.planet VALUES ('item5', NULL, 5, NULL, NULL, 4, NULL, NULL);
INSERT INTO public.planet VALUES ('item6', NULL, 6, NULL, NULL, 4, NULL, NULL);
INSERT INTO public.planet VALUES ('item7', NULL, 7, NULL, NULL, 4, NULL, NULL);
INSERT INTO public.planet VALUES ('item8', NULL, 8, NULL, NULL, 3, NULL, NULL);
INSERT INTO public.planet VALUES ('item9', NULL, 9, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES ('item10', NULL, 10, NULL, NULL, 5, NULL, NULL);
INSERT INTO public.planet VALUES ('item11', NULL, 11, NULL, NULL, 4, NULL, NULL);
INSERT INTO public.planet VALUES ('item12', NULL, 12, NULL, NULL, 3, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('star1', 'des star1', 1, 'type star1', true, 1);
INSERT INTO public.star VALUES ('star2', NULL, 2, NULL, NULL, 1);
INSERT INTO public.star VALUES ('star3', NULL, 3, NULL, NULL, 6);
INSERT INTO public.star VALUES ('star4', NULL, 4, NULL, NULL, 5);
INSERT INTO public.star VALUES ('star5', NULL, 5, NULL, NULL, 4);
INSERT INTO public.star VALUES ('star6', NULL, 6, NULL, NULL, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: notknown_notknown_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.notknown_notknown_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


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
-- Name: notknown notknown_notknown_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.notknown
    ADD CONSTRAINT notknown_notknown_id_key UNIQUE (notknown_id);


--
-- Name: notknown notknown_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.notknown
    ADD CONSTRAINT notknown_pkey PRIMARY KEY (notknown_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star star_star_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key1 UNIQUE (star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

