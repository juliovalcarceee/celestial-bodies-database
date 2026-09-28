--
-- PostgreSQL database dump
--

\restrict smC39fXoZgcIUW8YJWhayxTTGun5UtIiDp45e28ZYaGaw222JqsYjlQem9Y3Wgc

-- Dumped from database version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)

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

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\unrestrict smC39fXoZgcIUW8YJWhayxTTGun5UtIiDp45e28ZYaGaw222JqsYjlQem9Y3Wgc
\connect universe
\restrict smC39fXoZgcIUW8YJWhayxTTGun5UtIiDp45e28ZYaGaw222JqsYjlQem9Y3Wgc

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(60) NOT NULL,
    diameter_km numeric(8,2) NOT NULL,
    is_potentially_hazardous boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(8,2),
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT false NOT NULL
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


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer NOT NULL,
    is_spherical boolean NOT NULL,
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


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    radius_km integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    has_rings boolean NOT NULL
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


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_solar numeric(7,2) NOT NULL,
    temperature_k integer NOT NULL,
    is_visible_naked_eye boolean NOT NULL
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


ALTER SEQUENCE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.40, false);
INSERT INTO public.asteroid VALUES (3, 'Apophis', 0.37, true);
INSERT INTO public.asteroid VALUES (4, 'Bennu', 0.49, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home barred spiral galaxy.', 13600, 0.00, true, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large spiral galaxy.', 10000, 2.54, false, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in the Local Group.', 10000, 2.73, false, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way.', 13000, 0.16, false, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Interacting grand-design spiral.', 400, 23.00, false, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral galaxy with a bright bulge.', 13250, 29.30, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, true, 'Earth''s only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, false, 'Larger moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, false, 'Smaller moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1822, true, 'Most volcanically active body.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1561, true, 'Ice-covered ocean moon.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, true, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, true, 'Heavily cratered surface.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 84, false, 'Reddish inner moon of Jupiter.');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 2575, true, 'Thick nitrogen atmosphere.');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 252, true, 'Water geysers at the south pole.');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 198, true, 'Known for its huge crater.');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 764, true, 'Second largest moon of Saturn.');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 735, true, 'Two-toned surface.');
INSERT INTO public.moon VALUES (14, 'Dione', 6, 561, true, 'Icy moon with bright cliffs.');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 236, true, 'Extreme and varied terrain.');
INSERT INTO public.moon VALUES (16, 'Titania', 7, 789, true, 'Largest moon of Uranus.');
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 761, true, 'Outermost major moon of Uranus.');
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 579, true, 'Brightest moon of Uranus.');
INSERT INTO public.moon VALUES (19, 'Triton', 8, 1353, true, 'Retrograde orbit around Neptune.');
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 170, false, 'Highly eccentric orbit.');
INSERT INTO public.moon VALUES (21, 'Charon', 9, 606, true, 'Largest moon of Pluto.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2440, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6052, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, 'Terrestrial', true, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3390, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911, 'Gas giant', false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232, 'Gas giant', false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25362, 'Ice giant', false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 24622, 'Ice giant', false, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 1188, 'Dwarf', false, false);
INSERT INTO public.planet VALUES (10, 'Proxima b', 4, 7160, 'Exoplanet', false, false);
INSERT INTO public.planet VALUES (11, 'Proxima c', 4, 9500, 'Exoplanet', false, false);
INSERT INTO public.planet VALUES (12, 'Proxima d', 4, 5000, 'Exoplanet', false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, 5778, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2.06, 9940, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 16.50, 3600, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 0.12, 3042, false);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 21.00, 12100, true);
INSERT INTO public.star VALUES (6, 'R136a1', 4, 196.00, 46000, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

\unrestrict smC39fXoZgcIUW8YJWhayxTTGun5UtIiDp45e28ZYaGaw222JqsYjlQem9Y3Wgc

